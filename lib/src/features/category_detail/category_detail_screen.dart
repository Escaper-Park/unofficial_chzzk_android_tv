import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/dimensions.dart';
import '../../common/constants/enums.dart';
import '../../common/widgets/screen/screen_widgets.dart'
    show VideoGridSection, VideoGridViewScreen;
import '../../common/widgets/screen/video_grid_view/video_grid_view_filter.dart'
    show VideoGridViewFilter;
import '../category/model/category.dart';

import '../clip/model/clip.dart';
import '../clip/widgets/clip_container.dart' show ClipContainer;
import '../live/model/live_info.dart';
import '../live/widgets/live_widgets.dart' show LiveContainer;
import '../vod/model/vod.dart';
import '../vod/widgets/vod_widgets.dart' show VodContainer;
import 'category_detail_event.dart';
import 'category_detail_state.dart';
import 'widgets/category_detail_widgets.dart' show CategoryDetailHeader;

class CategoryDetailScreen extends HookConsumerWidget
    with CategoryDetailEvent, CategoryDetailState {
  const CategoryDetailScreen({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = getAuth(ref);
    final sidebarFSN = useFocusScopeNode();
    final gridViewFSN = useFocusScopeNode();
    final filterFSN = useFocusScopeNode();
    final followingButtonFSN = useFocusScopeNode();

    final gridViewSidebarData = [
      ('라이브', VideoSortType.live),
      ('동영상', VideoSortType.vod),
      ('클립 (인기순)', VideoSortType.popularClip),
      ('클립 (최신순)', VideoSortType.recentClip),
    ];

    // [Sidebar] orderIndex, [Top Filter] filterIndex;
    final sortState = useState<(int, int)>((0, 0));

    final bool isClipSection =
        sortState.value.$1 == 2 || sortState.value.$1 == 3;

    const List<FilterType> filterList = [
      FilterType.all,
      FilterType.month,
      FilterType.weekStr,
      FilterType.dayStr,
    ];

    final filterIndex = sortState.value.$2;
    final asyncCategoryFollowingList = getAsyncCategoryFollowingList(ref);

    final baseVideoSection = VideoGridSection<Object>(
      getAsyncValue: (_) => getAsyncCategoryLives(ref, category: category),
      fetchMore: (_) async =>
          await categoryLiveFetchMore(ref, category: category),
      emptyText: '카테고리에 진행 중인 라이브가 없습니다',
      errorText: '라이브를 불러올 수 없습니다',
      itemBuilder: (context, index, node, item) {
        final liveInfo = item as LiveInfo;

        return LiveContainer(
          appRoute: AppRoute.categoryDetail,
          autofocus: index == 0,
          focusNode: node,
          channel: liveInfo.channel!,
          liveInfo: liveInfo,
        );
      },
    );

    final baseClipSection = VideoGridSection<Object>(
      crossAxisCount: 5,
      getAsyncValue: (orderType) => getAsyncCategoryClips(
        ref,
        category: category,
        orderType: orderType,
        filterType: filterList[filterIndex],
      ),
      fetchMore: (orderType) async => await categoryClipFetchMore(
        ref,
        category: category,
        orderType: orderType,
        filterType: filterList[filterIndex],
      ),
      emptyText: '카테고리에 클립이 없습니다',
      errorText: '카테고리 클립을 불러올 수 없습니다',
      itemHeight: Dimensions.clipContainerHeight,
      itemBuilder: (context, index, node, item) {
        final clip = item as NaverClip;

        return ClipContainer(
          appRoute: AppRoute.categoryDetail,
          autofocus: index == 0,
          focusNode: node,
          clip: clip,
          channelName: clip.ownerChannel!.channelName,
        );
      },
    );

    return authState.when(
      data: (auth) {
        final headerFSN = isClipSection
            ? filterFSN
            : (auth != null ? followingButtonFSN : null);

        return VideoGridViewScreen<Object>(
          currentSortState: sortState,
          baseRoute: AppRoute.categoryDetail,
          gridViewSidebarData: gridViewSidebarData,
          sidebarFSN: sidebarFSN,
          gridViewFSN: gridViewFSN,
          headerFSN: headerFSN,
          sectionBuilder: (sortType) => switch (sortType) {
            VideoSortType.live => baseVideoSection,
            VideoSortType.vod => baseVideoSection.copyWith(
                getAsyncValue: (_) =>
                    getAsyncCategoryVods(ref, category: category),
                fetchMore: (_) async =>
                    await categoryVodFetchMore(ref, category: category),
                emptyText: '카테고리에 동영상이 없습니다',
                errorText: '카테고리 동영상을 불러올 수 없습니다',
                itemBuilder: (context, index, node, item) {
                  final vod = item as Vod;

                  return VodContainer(
                    appRoute: AppRoute.categoryDetail,
                    autofocus: index == 0,
                    focusNode: node,
                    vod: vod,
                  );
                },
              ),
            VideoSortType.popularClip => baseClipSection,
            VideoSortType.recentClip => baseClipSection.copyWith(),
            _ => throw UnimplementedError(),
          },
          headerWidget: Column(
            children: [
              CategoryDetailHeader(
                category: category,
                itemNode: followingButtonFSN,
                sidebarFSN: isClipSection ? null : sidebarFSN,
                belowFSN: isClipSection ? filterFSN : gridViewFSN,
                asyncCategoryFollowingList: asyncCategoryFollowingList,
                toggleFollow: (bool isFollowing, Category category) async =>
                    await toggleFollow(
                  ref,
                  isFollowing: isFollowing,
                  category: category,
                ),
              ),
              Divider(),
              if (isClipSection)
                VideoGridViewFilter(
                  aboveFSN: followingButtonFSN,
                  belowFSN: gridViewFSN,
                  sidebarFSN: sidebarFSN,
                  filterList: filterList,
                  currentIndex: filterIndex,
                  filterFSN: filterFSN,
                  onPressed: (index) =>
                      sortState.value = (sortState.value.$1, index),
                ),
            ],
          ),
          popAction: () => pop(context),
        );
      },
      error: (_, __) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
