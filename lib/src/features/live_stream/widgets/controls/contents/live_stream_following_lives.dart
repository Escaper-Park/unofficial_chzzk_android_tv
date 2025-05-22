import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/enums.dart'
    show LiveMode, LiveStreamOverlayType;
import '../../../../streaming/widgets/navigator/stream_navigator.dart';
import '../../../live_stream_event.dart';
import '../../../live_stream_state.dart';
import 'live_stream_live_container.dart';

class LiveStreamFollowingLives extends ConsumerWidget
    with LiveStreamState, LiveStreamEvent {
  const LiveStreamFollowingLives({
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
    return StreamNavigatorWithContents(
      headerText: '팔로잉 채널 라이브',
      resetOverlayTimer: () =>
          resetOverlayTimer(ref, videoFocusNode: videoFocusNode),
      asyncValue: getFollowingLives(ref),
      useFetchMore: false,
      changeToAboveContents: () => changeOverlay(
        ref,
        overlayType: LiveStreamOverlayType.popular,
        videoFocusNode: videoFocusNode,
      ),
      changeToBelowContents: () => changeOverlay(
        ref,
        overlayType: showGroupInNavigators
            ? LiveStreamOverlayType.group
            : LiveStreamOverlayType.category,
        videoFocusNode: videoFocusNode,
      ),
      listViewFSN: contentsFSN,
      emptyText: '방송 중인 팔로잉 채널이 없습니다',
      errorText: '로그인을 하지 않았거나, 팔로잉 채널을 불러올 수 없습니다',
      itemBuilder: (index, node, item) {
        return LiveStreamLiveContainer(
          autofocus: index == 0,
          focusNode: node,
          videoFocusNode: videoFocusNode,
          liveInfo: item.liveInfo,
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
