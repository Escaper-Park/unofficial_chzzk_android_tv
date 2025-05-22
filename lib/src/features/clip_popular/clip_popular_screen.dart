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
import 'clip_popular_event.dart';
import 'clip_popular_state.dart';

class ClipPopularScreen extends HookConsumerWidget
    with ClipPopularEvent, ClipPopularState {
  const ClipPopularScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sidebarFSN = useFocusScopeNode();
    final gridViewFSN = useFocusScopeNode();
    final filterFSN = useFocusScopeNode();

    final gridViewSidebarData = [
      ('인기순', VideoSortType.popularClip),
      ('추천순', VideoSortType.recommendClip),
    ];

    // [Sidebar] orderIndex, [Top Filter] filterIndex;
    final sortState = useState<(int, int)>((0, 0));
    final filterIndex = sortState.value.$2;

    const List<FilterType> filterList = [
      FilterType.dayNum,
      FilterType.weekNum,
    ];

    final baseSection = VideoGridSection<NaverClip>(
      crossAxisCount: 5,
      getAsyncValue: (orderType) => getAsyncPopularClips(
        ref,
        orderType: orderType,
        filterType: filterList[filterIndex],
      ),
      fetchMore: (orderType) async => await popularClipFetchMore(
        ref,
        orderType: orderType,
        filterType: filterList[filterIndex],
      ),
      itemHeight: Dimensions.clipContainerHeight,
      emptyText: '인기 클립을 불러올 수 없습니다',
      errorText: '인기 클립을 불러올 수 없습니다',
      itemBuilder: (context, index, node, item) {
        return ClipContainer(
          appRoute: AppRoute.popularClips,
          autofocus: index == 0,
          focusNode: node,
          clip: item,
          channelName: item.ownerChannel!.channelName,
        );
      },
    );

    return VideoGridViewScreen<NaverClip>(
      currentSortState: sortState,
      baseRoute: AppRoute.popularClips,
      gridViewSidebarData: gridViewSidebarData,
      headerFSN: filterFSN,
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      sectionBuilder: (_) => baseSection,
      headerWidget: Stack(
        children: [
          HeaderText(text: '인기 클립', horizontalPadding: 16.0),
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
      popAction: () => goHome(ref, context),
    );
  }
}
