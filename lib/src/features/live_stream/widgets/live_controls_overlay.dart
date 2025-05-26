import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/enums.dart'
    show DpadAction, LiveMode, LiveStreamOverlayType;
import '../../streaming/widgets/streaming_widgets.dart';
import '../live_stream_event.dart';
import '../live_stream_state.dart';
import 'controls/live_stream_controls.dart';

class LiveControlsOverlay extends HookConsumerWidget
    with LiveStreamState, LiveStreamEvent {
  const LiveControlsOverlay({super.key, this.fromHome = false});

  final bool fromHome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoFocusNode = useFocusNode();
    final controlsFSN = useFocusScopeNode();
    final contentsFSN = useFocusScopeNode();
    final liveStreamOverlayType = getOverlayType(ref);
    final liveMode = getLiveMode(ref);
    final showGroupInNavigators = getShowGroupSettings(ref);
    final currentActivatedAudioIndex = getCurrentActivatedAudioIndex(ref);
    final currentActivatedLiveIndex = getCurrentActivatedLiveIndex(ref);

    final controlWidget = switch (liveStreamOverlayType) {
      LiveStreamOverlayType.none => const SizedBox.shrink(),
      LiveStreamOverlayType.main => LiveStreamMainControl(
          videoFocusNode: videoFocusNode,
          liveMode: liveMode,
        ),
      LiveStreamOverlayType.following => LiveStreamFollowingLives(
          liveMode: liveMode,
          showGroupInNavigators: showGroupInNavigators,
          videoFocusNode: videoFocusNode,
          contentsFSN: contentsFSN,
        ),
      LiveStreamOverlayType.popular => LiveStreamPopularLives(
          liveMode: liveMode,
          showGroupInNavigators: showGroupInNavigators,
          videoFocusNode: videoFocusNode,
          contentsFSN: contentsFSN,
        ),
      LiveStreamOverlayType.category => LiveStreamCategoryLives(
          currentActivatedIndex: currentActivatedAudioIndex,
          liveMode: liveMode,
          showGroupInNavigators: showGroupInNavigators,
          videoFocusNode: videoFocusNode,
          contentsFSN: contentsFSN,
        ),
      LiveStreamOverlayType.group => LiveStreamGroupLives(
          liveMode: liveMode,
          videoFocusNode: videoFocusNode,
          contentsFSN: contentsFSN,
        ),
      LiveStreamOverlayType.chatSettings => LiveStreamChatSettingControl(
          videoFocusNode: videoFocusNode,
        ),
      LiveStreamOverlayType.soundSettings => LiveStreamSoundControl(
          videoFocusNode: videoFocusNode,
        ),
      LiveStreamOverlayType.resolutionSettings => LiveStreamResolutionControl(
          videoFocusNode: videoFocusNode,
        ),
      LiveStreamOverlayType.groupSettings => LiveStreamGroupControl(
          showGroupInNavigators: showGroupInNavigators,
          videoFocusNode: videoFocusNode,
        ),
      LiveStreamOverlayType.multiviewInfo => LiveStreamMultiViewInfo(),
      LiveStreamOverlayType.multiviewScreenSettings =>
        LiveStreamMultiViewScreenControl(
          currentActivatedLiveIndex: currentActivatedLiveIndex,
          videoFocusNode: videoFocusNode,
        ),
    };

    return StreamOverlayBase(
      isOverlayHidden: liveStreamOverlayType == LiveStreamOverlayType.none,
      hideOverlay: () {
        videoFocusNode.requestFocus();
        changeOverlay(
          ref,
          overlayType: LiveStreamOverlayType.none,
          videoFocusNode: videoFocusNode,
        );
      },
      disposeController: () async {
        await disposeAll(ref);
      },
      wakelockDisable: () async {
        await toggleWakelock(ref, enable: false);
      },
      refreshHome: fromHome ? () => refreshHome(ref) : null,
      overlayFocusNode: videoFocusNode,
      controlsFSN: controlsFSN,
      useKeyReapeatEvent: false,
      dpadActionCallbacks: {
        DpadAction.select: () {
          videoFocusNode.unfocus();
          changeOverlay(
            ref,
            overlayType: LiveStreamOverlayType.main,
            videoFocusNode: videoFocusNode,
          );
        },
        DpadAction.arrowUp: () {
          videoFocusNode.unfocus();
          changeOverlay(
            ref,
            overlayType: showGroupInNavigators
                ? LiveStreamOverlayType.group
                : LiveStreamOverlayType.following,
            videoFocusNode: videoFocusNode,
          );
        },
        DpadAction.arrowDown: () {
          // single view
          if (liveMode == LiveMode.single) {
            toggleOverlayChat(ref);
          }
          // multi
          else {
            focusScreenInMultiview(ref);
          }
        },
        DpadAction.arrowLeft: () async {
          // single view
          if (liveMode == LiveMode.single) {
            setChatPosition(ref, DpadAction.arrowLeft);
          }
          // multiview
          else {
            changeActivatedScreenOrAudio(
              ref,
              context,
              action: DpadAction.arrowLeft,
              currentActivatedAudioIndex: currentActivatedAudioIndex,
              currentActivatedLiveIndex: currentActivatedLiveIndex,
            );
          }
        },
        DpadAction.arrowRight: () async {
          // single view
          if (liveMode == LiveMode.single) {
            setChatPosition(ref, DpadAction.arrowRight);
          }
          // multiview
          else {
            changeActivatedScreenOrAudio(
              ref,
              context,
              action: DpadAction.arrowRight,
              currentActivatedAudioIndex: currentActivatedAudioIndex,
              currentActivatedLiveIndex: currentActivatedLiveIndex,
            );
          }
        },
      },
      controlWidget: controlWidget,
    );
  }
}
