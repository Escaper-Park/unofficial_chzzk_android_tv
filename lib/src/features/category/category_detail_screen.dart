import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/video_grid_view_screen.dart';
import './repository/category_repository.dart';

import './model/category.dart';
import './controller/category_controller.dart';
import './widgets/category_detail/category_header.dart';
import './widgets/category_detail/category_live_list.dart';
import './widgets/category_detail/category_vod_list.dart';
import 'widgets/category_detail/category_clip_list.dart';

class CategoryDetailScreen extends HookConsumerWidget {
  const CategoryDetailScreen({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sidebarFSN = useFocusScopeNode();
    final gridViewFSN = useFocusScopeNode();
    final followingButtonFSN = useFocusScopeNode();

    final categorySortType = useState<CategorySortType>(CategorySortType.live);

    final List<VideoScreenSidebarItem> sidebarItems = [
      (
        '라이브',
        () {
          if (categorySortType.value != CategorySortType.live) {
            categorySortType.value = CategorySortType.live;
          }
        }
      ),
      (
        '동영상',
        () {
          if (categorySortType.value != CategorySortType.vod) {
            categorySortType.value = CategorySortType.vod;
          }
        }
      ),
      (
        '클립 (최신순)',
        () {
          if (categorySortType.value != CategorySortType.recentClip) {
            categorySortType.value = CategorySortType.recentClip;
          }
        }
      ),
      (
        '클립 (인기순)',
        () {
          if (categorySortType.value != CategorySortType.popularClip) {
            categorySortType.value = CategorySortType.popularClip;
          }
        }
      ),
    ];

    final Widget videoGridView = switch (categorySortType.value) {
      CategorySortType.live => CategoryLiveList(
          category: category,
          sidebarFSN: sidebarFSN,
          gridViewFSN: gridViewFSN,
          followingButtonFSN: followingButtonFSN,
        ),
      CategorySortType.vod => CategoryVodList(
          category: category,
          sidebarFSN: sidebarFSN,
          gridViewFSN: gridViewFSN,
          followingButtonFSN: followingButtonFSN,
        ),
      CategorySortType.recentClip => CategoryClipList(
          category: category,
          sortType: categorySortType.value,
          sidebarFSN: sidebarFSN,
          gridViewFSN: gridViewFSN,
          followingButtonFSN: followingButtonFSN,
        ),
      CategorySortType.popularClip => CategoryClipList(
          category: category,
          sortType: categorySortType.value,
          sidebarFSN: sidebarFSN,
          gridViewFSN: gridViewFSN,
          followingButtonFSN: followingButtonFSN,
        ),
    };

    return VideoGridViewScreen(
      onPopInvoked: (didPop) {
        if (!didPop) {
          if (sidebarFSN.hasFocus) {
            context.pop();
          } else {
            sidebarFSN.requestFocus();
          }
        }
      },
      // Category poster, status and follow button.
      headerWidget: CategoryHeader(
        category: category,
        followingButtonFSN: followingButtonFSN,
        sidebarFSN: sidebarFSN,
        gridViewFSN: gridViewFSN,
      ),
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      sidebarItems: sidebarItems,
      followingButtonFSN: followingButtonFSN,
      loadingStateProvider: categoryFetchMoreLoadingStateProvider,
      videoGridView: videoGridView,
    );
  }
}
