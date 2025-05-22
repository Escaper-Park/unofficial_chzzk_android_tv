import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/enums.dart'
    show DpadAction, PlaybackDirection, VodStreamOverlayType;
import '../../../common/widgets/dpad/dpad_action_widget.dart';
import '../../streaming/widgets/screen/stream_overlay_base.dart';
import '../vod_stream_event.dart';
import '../vod_stream_state.dart';
import 'vod_stream_widgets.dart';

class VodControlsOverlay extends HookConsumerWidget
    with VodStreamState, VodStreamEvent {
  const VodControlsOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoFocusNode = useFocusNode();
    final controlsFSN = useFocusScopeNode();
    final contentsFSN = useFocusScopeNode();
    final vodStreamOverlayType = getOverlayType(ref);
    final vod = getVod(ref);

    final controlWidget = switch (vodStreamOverlayType) {
      VodStreamOverlayType.none => const SizedBox.shrink(),
      VodStreamOverlayType.main => VodStreamMainControl(
          vod: vod,
          videoFocusNode: videoFocusNode,
        ),
      VodStreamOverlayType.channel => VodStreamChannelDataControl(
          vod: vod,
          videoFocusNode: videoFocusNode,
          contentsFSN: contentsFSN,
        ),
      VodStreamOverlayType.chatSettings =>
        VodStreamChatSettingControl(videoFocusNode: videoFocusNode),
      VodStreamOverlayType.resolutionSettings => VodStreamResolutionControl(
          vod: vod,
          videoFocusNode: videoFocusNode,
        )
    };

    return StreamOverlayBase(
      isOverlayHidden: vodStreamOverlayType == VodStreamOverlayType.none,
      hideOverlay: () {
        videoFocusNode.requestFocus();
        changeOverlay(
          ref,
          overlayType: VodStreamOverlayType.none,
          videoFocusNode: videoFocusNode,
        );
      },
      disposeController: () async {
        disposeChatQueue(ref, videoNo: vod!.videoNo);
        await disposeController(ref);
      },
      wakelockDisable: () async {
        await toggleWakelock(ref, enable: false);
      },
      overlayFocusNode: videoFocusNode,
      controlsFSN: controlsFSN,
      useKeyReapeatEvent: true,
      customOnKeyEvent: (event, dpadActionCallbacks) {
        final String keyLabel = event.logicalKey.keyLabel;

        if (keyLabel == "Arrow Left" || keyLabel == "Arrow Right") {
          if (event is KeyUpEvent) {
            seekToByButton(
              ref,
              endSeek: true,
              direction: keyLabel == "Arrow Left"
                  ? PlaybackDirection.backward
                  : PlaybackDirection.forward,
            );
          }

          if (event is KeyRepeatEvent) {
            seekToByButton(
              ref,
              endSeek: false,
              direction: keyLabel == "Arrow Left"
                  ? PlaybackDirection.backward
                  : PlaybackDirection.forward,
            );
          }
        } else {
          if (event is KeyDownEvent) {
            _onKey(keyLabel, dpadActionCallbacks);
          }
        }
      },
      dpadActionCallbacks: {
        DpadAction.select: () {
          videoFocusNode.unfocus();
          changeOverlay(
            ref,
            overlayType: VodStreamOverlayType.main,
            videoFocusNode: videoFocusNode,
          );
        },
        DpadAction.arrowUp: () {
          videoFocusNode.unfocus();
          changeOverlay(
            ref,
            overlayType: VodStreamOverlayType.channel,
            videoFocusNode: videoFocusNode,
          );
        },
        DpadAction.arrowDown: () {
          toggleOverlayChat(ref);
        },
      },
      controlWidget: controlWidget,
    );
  }

  void _onKey(String keyLabel, DpadActionCallbacks dpadActionCallbacks) {
    switch (keyLabel) {
      case "Arrow Up": // up
        dpadActionCallbacks[DpadAction.arrowUp]?.call();
        break;
      case "Arrow Down": // down
        dpadActionCallbacks[DpadAction.arrowDown]?.call();
        break;
      case "Select": // select
        dpadActionCallbacks[DpadAction.select]?.call();
        break;
      default:
        break;
    }
  }
}
