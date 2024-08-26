import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../../common/widgets/dpad_widgets.dart';
import '../../../../../live/model/live.dart';
import '../../../controller/live_player_controller.dart';
import '../../../controller/live_stream_navigator_controller.dart';
import 'live_stream_container.dart';
import 'video_navigator_overlay.dart';

class LiveStreamCategoryLivesOverlay extends ConsumerWidget {
  const LiveStreamCategoryLivesOverlay({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
    required this.channelId,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;
  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLiveStreamCategoryLives = ref
        .watch(liveStreamCategoryLivesControllerProvider(channelId: channelId));

    return VideoNavigatorOverlay(
      videoFocusNode: videoFocusNode,
      headerText: '카테고리 채널 라이브',
      overlayType: LiveOverlayType.category,
      aboveType: LiveOverlayType.following,
      belowType: LiveOverlayType.popular,
      contents: DpadHorizontalListViewContainer<LiveInfo>(
        asyncValue: asyncLiveStreamCategoryLives,
        emptyText: '카테고리에 방송 중인 채널이 없습니다.',
        errorText: '카테고리가 설정되지 않았습니다',
        useFetchMore: true,
        useExceptionFallbackWidget: true,
        fetchMore: () async {
          await ref
              .watch(liveStreamCategoryLivesControllerProvider(
                      channelId: channelId)
                  .notifier)
              .fetchMore();
        },
        fallback: () {},
        listFSN: controlsFSN,
        scrollPadding: 20.0,
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
