import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/video_grid_view_screen.dart';
import '../../../live/model/live.dart';
import '../../../live/widgets/live_container/live_container.dart';
import '../../controller/category_controller.dart';
import '../../model/category.dart';

class CategoryLiveList extends ConsumerWidget {
  const CategoryLiveList({
    super.key,
    required this.category,
    required this.sidebarFSN,
    required this.gridViewFSN,
    required this.followingButtonFSN,
  });

  final Category category;
  final FocusScopeNode sidebarFSN;
  final FocusScopeNode gridViewFSN;
  final FocusScopeNode followingButtonFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCategoryLives =
        ref.watch(categoryLivesControllerProvider(category: category));

    return VideoGridViewWithAsyncValue<LiveInfo>(
      asyncValue: asyncCategoryLives,
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      followingButtonFSN: followingButtonFSN,
      emptyText: '카테고리에 생방송 채널이 없습니다',
      errorText: '카테고리 라이브를 불러올 수 없습니다',
      fetchMore: () async {
        await ref
            .read(categoryLivesControllerProvider(category: category).notifier)
            .fetchMore();
      },
      itemBuilder: (context, index, object) {
        return LiveContainer(
          autofocus: index == 0 ? true : false,
          liveInfo: object,
          channel: object.channel!,
        );
      },
    );
  }
}
