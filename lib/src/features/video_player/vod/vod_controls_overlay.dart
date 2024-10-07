import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/dpad_widgets.dart';

import '../../../utils/popup/popup_utils.dart';
import '../common/chat/chat_settings_controls_overlay.dart';
import './widgets/controls/main/vod_stream_main_controls.dart';
import './widgets/status/vod_stream_info.dart';
import './widgets/controls/channel/vod_stream_channel_data_controls.dart';
import './controller/vod_overlay_controller.dart';
import 'controller/vod_mode_controller.dart';
import 'controller/vod_player_controller.dart';
import 'widgets/controls/resolution/vod_resolution_settings_controls_overlay.dart';

class VodControlsOverlay extends HookConsumerWidget {
  const VodControlsOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // snackbar
    const int snackbarDisplaySeconds = 2;
    DateTime? lastPressedBackButtonAt;

    final videoFocusNode = useFocusNode();
    final mainControlsFSN = useFocusScopeNode();
    final contentsFSN = useFocusScopeNode();

    final vodOverlayType = ref.watch(vodOverlayControllerProvider);

    final Widget currentControls = switch (vodOverlayType) {
      VodOverlayType.none => const SizedBox.shrink(),
      VodOverlayType.main => FocusScope(
          node: mainControlsFSN,
          child: Stack(
            children: [
              const VodStreamInfo(),
              VodStreamMainControls(videoFocusNode: videoFocusNode),
            ],
          ),
        ),
      VodOverlayType.channelData => FocusScope(
          node: contentsFSN,
          child: VodStreamChannelDataControls(videoFocusNode: videoFocusNode),
        ),
      VodOverlayType.chatSettings => ChatSettingsControlsOverlay(
          videoFocusNode: videoFocusNode,
          controlsFSN: contentsFSN,
        ),
      VodOverlayType.resolutionSettings => VodResolutionSettingsControlsOverlay(
          videoFocusNode: videoFocusNode,
          controlsFSN: contentsFSN,
        ),
    };

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          // if overlay is hidden, pop
          if (vodOverlayType == VodOverlayType.none) {
            final currentTime = DateTime.now();

            // Before [Snackbar] is visible
            if (lastPressedBackButtonAt == null ||
                currentTime.difference(lastPressedBackButtonAt!) >
                    const Duration(seconds: snackbarDisplaySeconds)) {
              lastPressedBackButtonAt = currentTime;

              if (context.mounted) {
                // Show Snackbar
                const String msg = '뒤로 가기를 한 번 더 누르면 종료됩니다';
                PopupUtils.showSnackbar(context, msg, milliseconds: 1000);
              }
            }
            // While [Snackbar] is Visible
            else {
              await ref.read(vodPlayerControllerProvider.notifier).dispose();

              if (context.mounted) context.pop();
            }
          }
          // hide overlay
          else {
            ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
                  overlayType: VodOverlayType.none,
                  videoFocusNode: videoFocusNode,
                );
          }
        }
      },
      child: Stack(
        children: [
          // Dpad Controller
          DpadActionWidget(
            autofocus: true,
            focusNode: videoFocusNode,
            useFocusedBorder: false,
            useKeyRepeatEvent: false,
            borderRadius: 0.0,
            customOnKeyEvent: (event, dpadActionCallbacks) {
              final String keyLabel = event.logicalKey.keyLabel;
              // Seek To
              if (keyLabel == "Arrow Left" || keyLabel == "Arrow Right") {
                if (event is KeyRepeatEvent) {
                  _onKey(keyLabel, dpadActionCallbacks);
                }

                if (event is KeyDownEvent) {
                  _onKey(keyLabel, dpadActionCallbacks);
                }
              }
              // Others
              else {
                if (event is KeyDownEvent) {
                  _onKey(keyLabel, dpadActionCallbacks);
                }
              }
            },
            dpadActionCallbacks: {
              DpadAction.select: () {
                videoFocusNode.unfocus();
                mainControlsFSN.requestFocus();

                ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: VodOverlayType.main,
                      videoFocusNode: videoFocusNode,
                    );
              },
              DpadAction.arrowUp: () {
                videoFocusNode.unfocus();
                contentsFSN.requestFocus();

                ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
                      overlayType: VodOverlayType.channelData,
                      videoFocusNode: videoFocusNode,
                    );
              },
              DpadAction.arrowDown: () {
                ref
                    .read(vodChatWindowModeControllerProvider.notifier)
                    .toggleOverlayChat();
              },
              DpadAction.arrowLeft: () async {
                await ref
                    .read(vodPlayerControllerProvider.notifier)
                    .seekToByButton(
                        videoFocusNode: videoFocusNode,
                        direction: PlaybackDirection.backword);
              },
              DpadAction.arrowRight: () async {
                await ref
                    .read(vodPlayerControllerProvider.notifier)
                    .seekToByButton(
                        videoFocusNode: videoFocusNode,
                        direction: PlaybackDirection.forward);
              },
            },
            child: const SizedBox.shrink(),
          ),
          // Controls
          currentControls,
        ],
      ),
    );
  }

  void _onKey(String keyLabel, DpadActionCallbacks dpadActionCallbacks) {
    switch (keyLabel) {
      case "Arrow Left": // left
        dpadActionCallbacks[DpadAction.arrowLeft]?.call();
        break;
      case "Arrow Right": // right
        dpadActionCallbacks[DpadAction.arrowRight]?.call();
        break;
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
