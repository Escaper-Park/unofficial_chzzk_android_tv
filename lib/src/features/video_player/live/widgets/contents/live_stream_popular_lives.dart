import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/widgets/dpad_widgets.dart';
import '../../../../live/model/live.dart';
import '../../controller/live_overlay_controller.dart';
import '../../controller/live_stream_navigator_controller.dart';
import 'live_stream_container.dart';
import 'video_navigator_overlay.dart';

class LiveStreamPopularLivesOverlay extends ConsumerWidget {
  const LiveStreamPopularLivesOverlay({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLiveStreamPopularLives =
        ref.watch(liveStreamPopularLivesControllerProvider);

    return VideoNavigatorOverlay(
      videoFocusNode: videoFocusNode,
      headerText: '인기 채널 라이브',
      overlayType: LiveOverlayType.popular,
      aboveType: LiveOverlayType.category,
      belowType: LiveOverlayType.following,
      contents: DpadHorizontalListViewContainer<LiveInfo>(
        asyncValue: asyncLiveStreamPopularLives,
        emptyText: '인기 채널을 불러올 수 없습니다.',
        errorText: '인기 채널을 불러올 수 없습니다.',
        useFetchMore: true,
        fetchMore: () async {
          await ref
              .read(liveStreamPopularLivesControllerProvider.notifier)
              .fetchMore();
        },
        useExceptionFallbackWidget: true,
        fallback: () {},
        listFSN: controlsFSN,
        containerWidth: Dimensions.liveStreamThumbnailWidth,
        containerHeight: Dimensions.liveStreamContentsContainerHeight,
        itemBuilder: (index, focusNode, object) {
          return LiveStreamContainer(
            autofocus: index == 0 ? true : false,
            focusNode: focusNode,
            videoFocusNode: videoFocusNode,
            liveInfo: object,
            channel: object.channel!,
          );
        },
      ),
    );
  }
}
