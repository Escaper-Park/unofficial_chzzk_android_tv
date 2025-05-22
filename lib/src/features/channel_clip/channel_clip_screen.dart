import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/common/widgets/ui/header_text.dart';

import '../../common/constants/dimensions.dart';
import '../../common/constants/enums.dart'
    show AppRoute, FilterType, VideoSortType;
import '../../common/widgets/screen/screen_widgets.dart'
    show VideoGridSection, VideoGridViewScreen;
import '../../common/widgets/screen/video_grid_view/video_grid_view_filter.dart';
import '../clip/model/clip.dart';
import '../clip/widgets/clip_container.dart';

import 'channel_clip_event.dart';
import 'channel_clip_state.dart';

class ChannelClipScreen extends HookConsumerWidget
    with ChannelClipEvent, ChannelClipState {
  const ChannelClipScreen({
    super.key,
    required this.channelId,
    required this.channelName,
  });

  final String channelId;
  final String channelName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sidebarFSN = useFocusScopeNode();
    final gridViewFSN = useFocusScopeNode();
    final filterFSN = useFocusScopeNode();

    final gridViewSidebarData = [
      ('인기순', VideoSortType.popularClip),
      ('최신순', VideoSortType.recentClip),
    ];

    // [Sidebar] orderIndex, [Top Filter] filterIndex;
    final sortState = useState<(int, int)>((0, 0));
    final filterIndex = sortState.value.$2;

    const List<FilterType> filterList = [
      FilterType.all,
      FilterType.dayStr,
      FilterType.weekStr,
      FilterType.month,
    ];

    final baseSection = VideoGridSection<NaverClip>(
      crossAxisCount: 5,
      getAsyncValue: (orderType) => getAsyncChannelClips(
        ref,
        channelId: channelId,
        orderType: orderType,
        filterType: filterList[filterIndex],
      ),
      fetchMore: (orderType) async => await channelClipFetchMore(
        ref,
        channelId: channelId,
        orderType: orderType,
        filterType: filterList[filterIndex],
      ),
      itemHeight: Dimensions.clipContainerHeight,
      emptyText: '$channelName 채널에 클립이 없습니다',
      errorText: '$channelName 채널 클립을 불러올 수 없습니다',
      itemBuilder: (context, index, node, item) {
        return ClipContainer(
          appRoute: AppRoute.channelClip,
          autofocus: index == 0,
          focusNode: node,
          clip: item,
          channelName: channelName,
        );
      },
    );

    return VideoGridViewScreen<NaverClip>(
      currentSortState: sortState,
      baseRoute: AppRoute.channelClip,
      gridViewSidebarData: gridViewSidebarData,
      headerFSN: filterFSN,
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      sectionBuilder: (_) => baseSection,
      headerWidget: Stack(
        children: [
          HeaderText(text: '$channelName 채널 클립', horizontalPadding: 16.0),
          Align(
            alignment: Alignment.centerRight,
            child: VideoGridViewFilter(
              belowFSN: gridViewFSN,
              sidebarFSN: sidebarFSN,
              filterList: filterList,
              currentIndex: filterIndex,
              filterFSN: filterFSN,
              onPressed: (index) =>
                  sortState.value = (sortState.value.$1, index),
            ),
          ),
        ],
      ),
      popAction: () => pop(context),
    );
  }
}
