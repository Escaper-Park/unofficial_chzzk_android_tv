import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/widgets/dpad_widgets.dart';
import '../../../../following/model/following.dart';
import '../../controller/live_overlay_controller.dart';
import '../../controller/live_stream_navigator_controller.dart';
import 'live_stream_container.dart';
import 'video_navigator_overlay.dart';

class LiveStreamFollowingLivesOverlay extends ConsumerWidget {
  const LiveStreamFollowingLivesOverlay({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLiveStreamFollowingLives =
        ref.watch(liveStreamFollowingLivesControllerProvider);

    return VideoNavigatorOverlay(
      videoFocusNode: videoFocusNode,
      headerText: '팔로잉 채널 라이브',
      overlayType: LiveOverlayType.following,
      aboveType: LiveOverlayType.popular,
      belowType: LiveOverlayType.category,
      contents: DpadHorizontalListViewContainer<Following>(
        asyncValue: asyncLiveStreamFollowingLives,
        emptyText: '방송 중인 팔로잉 채널이 없습니다',
        errorText: '로그인을 하지 않았거나 팔로잉 채널을 불러올 수 없습니다',
        useFetchMore: false,
        useExceptionFallbackWidget: true,
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
            liveInfo: object.liveInfo,
            channel: object.channel,
          );
        },
      ),
    );
  }
}
