import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/model/live_info.dart';

import '../../../../../common/constants/enums.dart'
    show LiveMode, LiveStreamOverlayType;
import '../../../../streaming/widgets/navigator/stream_navigator.dart';
import '../../../live_stream_event.dart';
import '../../../live_stream_state.dart';
import 'live_stream_live_container.dart';

class LiveStreamGroupLives extends ConsumerWidget
    with LiveStreamState, LiveStreamEvent {
  const LiveStreamGroupLives({
    super.key,
    required this.liveMode,
    required this.videoFocusNode,
    required this.contentsFSN,
  });

  final LiveMode liveMode;
  final FocusNode videoFocusNode;
  final FocusScopeNode contentsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final group = getCurrentActivatedGroup(ref);

    return StreamNavigatorWithContents(
      headerText: group == null ? '그룹' : '${group.groupName} 그룹 라이브',
      resetOverlayTimer: () =>
          resetOverlayTimer(ref, videoFocusNode: videoFocusNode),
      asyncValue: getGroupLives(ref),
      useFetchMore: false,
      changeToAboveContents: () => changeOverlay(
        ref,
        overlayType: LiveStreamOverlayType.following,
        videoFocusNode: videoFocusNode,
      ),
      changeToBelowContents: () => changeOverlay(
        ref,
        overlayType: LiveStreamOverlayType.category,
        videoFocusNode: videoFocusNode,
      ),
      listViewFSN: contentsFSN,
      emptyText: '그룹에 방송 중인 채널이 없습니다',
      errorText: '그룹에 멤버가 없거나, 그룹 라이브를 불러올 수 없습니다',
      itemBuilder: (index, node, item) {
        return LiveStreamLiveContainer(
          autofocus: index == 0,
          focusNode: node,
          videoFocusNode: videoFocusNode,
          liveInfo: LiveInfo(
            liveId: item.liveId,
            liveImageUrl: item.liveImageUrl,
            defaultThumbnailImageUrl: item.defaultThumbnailImageUrl,
            liveTitle: item.liveTitle,
            concurrentUserCount: item.concurrentUserCount,
            categoryType: item.categoryType,
            liveCategory: item.liveCategory,
            liveCategoryValue: item.liveCategoryValue,
            adult: item.adult,
            tags: item.tags,
            openDate: item.openDate,
            accumulateCount: item.accumulateCount,
            blindType: item.blindType,
            channel: item.channel,
          ),
          channel: item.channel,
          play: (liveInfo, channel) async => await play(
            ref,
            context,
            liveMode: liveMode,
            liveInfo: liveInfo,
            channel: channel,
          ),
        );
      },
    );
  }
}
