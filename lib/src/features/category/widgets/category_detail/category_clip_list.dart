import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/video_grid_view_screen.dart';
import '../../../clip/controller/clip_controller.dart';
import '../../../clip/model/clip.dart';
import '../../../clip/widgets/clip_container.dart';
import '../../model/category.dart';
import '../../repository/category_repository.dart';

class CategoryClipList extends ConsumerWidget {
  const CategoryClipList({
    super.key,
    required this.category,
    required this.sortType,
    required this.sidebarFSN,
    required this.gridViewFSN,
    required this.followingButtonFSN,
  });

  final Category category;
  final CategorySortType sortType;
  final FocusScopeNode sidebarFSN;
  final FocusScopeNode gridViewFSN;
  final FocusScopeNode followingButtonFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCategoryClips = ref.watch(categoryClipControllerProvider(
      category: category,
      sortType: sortType.value,
    ));

    return Stack(
      children: [
        VideoGridViewWithAsyncValue<NaverClip>(
          asyncValue: asyncCategoryClips,
          sidebarFSN: sidebarFSN,
          gridViewFSN: gridViewFSN,
          followingButtonFSN: followingButtonFSN,
          emptyText: '카테고리에 클립이 없습니다',
          errorText: '카테고리 클립을 불러올 수 없습니다',
          fetchMore: () async {
            await ref
                .read(categoryClipControllerProvider(
                  category: category,
                  sortType: sortType.value,
                ).notifier)
                .fetchMore();
          },
          itemBuilder: (context, index, object) {
            return ClipContainer(
              autofocus: index == 0 ? true : false,
              clip: object,
            );
          },
        ),
      ],
    );
  }
}
