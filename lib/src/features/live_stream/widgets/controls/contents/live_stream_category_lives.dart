import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/enums.dart'
    show LiveMode, LiveStreamOverlayType;
import '../../../../streaming/widgets/navigator/stream_navigator.dart';
import '../../../live_stream_event.dart';
import '../../../live_stream_state.dart';
import 'live_stream_live_container.dart';

class LiveStreamCategoryLives extends ConsumerWidget
    with LiveStreamState, LiveStreamEvent {
  const LiveStreamCategoryLives({
    super.key,
    required this.liveMode,
    required this.showGroupInNavigators,
    required this.videoFocusNode,
    required this.contentsFSN,
  });

  final LiveMode liveMode;
  final bool showGroupInNavigators;
  final FocusNode videoFocusNode;
  final FocusScopeNode contentsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentActivatedChannel = getCurrentActivatedChannel(ref);
    final String channelId = currentActivatedChannel.channelId;

    return StreamNavigatorWithContents(
      headerText: '카테고리 라이브',
      resetOverlayTimer: () =>
          resetOverlayTimer(ref, videoFocusNode: videoFocusNode),
      asyncValue: getCategoryLives(ref, channelId: channelId),
      useFetchMore: true,
      fetchMore: () async =>
          await categoryLivesFetchMore(ref, channelId: channelId),
      changeToAboveContents: () => changeOverlay(
        ref,
        overlayType: showGroupInNavigators
            ? LiveStreamOverlayType.group
            : LiveStreamOverlayType.following,
        videoFocusNode: videoFocusNode,
      ),
      changeToBelowContents: () => changeOverlay(
        ref,
        overlayType: LiveStreamOverlayType.popular,
        videoFocusNode: videoFocusNode,
      ),
      listViewFSN: contentsFSN,
      emptyText: '카테고리에 방송 중인 채널이 없습니다',
      errorText: '카테고리가 설정되지 않았습니다다',
      itemBuilder: (index, node, item) {
        return LiveStreamLiveContainer(
          autofocus: index == 0,
          focusNode: node,
          videoFocusNode: videoFocusNode,
          liveInfo: item,
          channel: item.channel!,
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
