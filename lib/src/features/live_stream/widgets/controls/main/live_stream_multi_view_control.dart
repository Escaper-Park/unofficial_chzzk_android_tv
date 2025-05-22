import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/enums.dart' show LiveStreamOverlayType;
import '../../../../streaming/widgets/streaming_widgets.dart';
import '../../../live_stream_event.dart';
import '../../../live_stream_state.dart';
import 'live_stream_multi_view_control_buttons.dart';
import 'live_stream_multi_view_indicator.dart';

class LiveStreamMultiViewControl extends ConsumerWidget
    with LiveStreamEvent, LiveStreamState {
  const LiveStreamMultiViewControl({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveCount = getLivePlaylist(ref).length;

    return Stack(
      children: [
        StreamOverlayContainer(
          width: double.infinity,
          height: Dimensions.liveStreamMainControlsHeight,
          useTopBorder: true,
          borderRadius: 12.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: LiveStreamMultiViewControlButtons(
              liveCount: liveCount,
              videoFocusNode: videoFocusNode,
              resetOverlayTimer: () => resetOverlayTimer(
                ref,
                videoFocusNode: videoFocusNode,
              ),
              showMultiviewScreenSetting: () => changeOverlay(
                ref,
                overlayType: LiveStreamOverlayType.multiviewScreenSettings,
                videoFocusNode: videoFocusNode,
              ),
              removeLastLive: () => removeLastLive(ref),
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
              showMultiviewInfo: () => changeOverlay(
                ref,
                overlayType: LiveStreamOverlayType.multiviewInfo,
                videoFocusNode: videoFocusNode,
              ),
              changeToSingleView: () => changeToSingleviewMode(ref),
            ),
          ),
        ),
        // multiview indicator
        LiveStreamMultiViewIndicator(),
      ],
    );
  }
}
