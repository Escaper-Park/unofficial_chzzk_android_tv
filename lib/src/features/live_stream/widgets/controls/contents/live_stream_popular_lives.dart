import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/enums.dart'
    show LiveMode, LiveStreamOverlayType;
import '../../../../streaming/widgets/navigator/stream_navigator.dart';
import '../../../live_stream_event.dart';
import '../../../live_stream_state.dart';
import 'live_stream_live_container.dart';

class LiveStreamPopularLives extends ConsumerWidget
    with LiveStreamState, LiveStreamEvent {
  const LiveStreamPopularLives({
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
      headerText: '인기 라이브',
      resetOverlayTimer: () =>
          resetOverlayTimer(ref, videoFocusNode: videoFocusNode),
      asyncValue: getPopularLives(ref),
      useFetchMore: true,
      fetchMore: () async =>
          await popularLivesFetchMore(ref),
      changeToAboveContents: () => changeOverlay(
        ref,
        overlayType: LiveStreamOverlayType.category,
        videoFocusNode: videoFocusNode,
      ),
      changeToBelowContents: () => changeOverlay(
        ref,
        overlayType: LiveStreamOverlayType.following,
        videoFocusNode: videoFocusNode,
      ),
      listViewFSN: contentsFSN,
      emptyText: '라이브를 불러올 수 없습니다',
      errorText: '라이브를 불러올 수 없습니다',
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
