import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/enums.dart' show LiveStreamOverlayType;
import '../../../../streaming/widgets/streaming_widgets.dart';

import 'live_stream_single_view_control_buttons.dart';
import 'live_stream_single_info.dart';

import '../../../live_stream_state.dart';
import '../../../live_stream_event.dart';

class LiveStreamSingleViewControl extends ConsumerWidget
    with LiveStreamEvent, LiveStreamState {
  const LiveStreamSingleViewControl({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoPlayerController = getSingleLivePlayer(ref, index: 0).value;
    final streamSettings = getStreamSettings(ref);
    final liveDetail = getLivePlaylist(ref)[0];

    return Stack(
      children: [
        // main
        StreamOverlayContainer(
          width: double.infinity,
          height: Dimensions.liveStreamMainControlsHeight,
          useTopBorder: true,
          borderRadius: 12.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: videoPlayerController == null
              ? const SizedBox.shrink()
              : FittedBox(
                  fit: BoxFit.scaleDown,
                  child: LiveStreamSingleViewControlButtons(
                    liveDetail: liveDetail,
                    streamSettings: streamSettings,
                    controller: videoPlayerController,
                    videoFocusNode: videoFocusNode,
                    resetOverlayTimer: () => resetOverlayTimer(
                      ref,
                      videoFocusNode: videoFocusNode,
                    ),
                    playOrPause: () async => await singleLivePlayOrPause(ref),
                    playInRealTime: () async => await playInRealTime(
                      ref,
                      videoFocusNode: videoFocusNode,
                    ),
                    toggleOverlayChat: () async => await toggleOverlayChat(ref),
                    toggleViewMode: () async => await toggleViewMode(ref),
                    showChatSettings: () => changeOverlay(
                      ref,
                      overlayType: LiveStreamOverlayType.chatSettings,
                      videoFocusNode: videoFocusNode,
                    ),
                    showSoundSettings: () => changeOverlay(
                      ref,
                      overlayType: LiveStreamOverlayType.soundSettings,
                      videoFocusNode: videoFocusNode,
                    ),
                    showResolutionSettings: () => changeOverlay(
                      ref,
                      overlayType: LiveStreamOverlayType.resolutionSettings,
                      videoFocusNode: videoFocusNode,
                    ),
                    showGroupSettings: () => changeOverlay(
                      ref,
                      overlayType: LiveStreamOverlayType.groupSettings,
                      videoFocusNode: videoFocusNode,
                    ),
                    changeToMultiviewMode: () => changeToMultiviewMode(ref),
                  ),
                ),
        ),
        // info
        LiveStreamSingleInfo(liveDetail: liveDetail),
      ],
    );
  }
}
