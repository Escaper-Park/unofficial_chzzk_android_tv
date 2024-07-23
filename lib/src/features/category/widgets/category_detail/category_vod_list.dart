import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/video_grid_view_screen.dart';
import '../../../vod/model/vod.dart';
import '../../../vod/widgets/vod_container/vod_container.dart';
import '../../../vod/widgets/vod_container/vod_info.dart';
import '../../controller/category_controller.dart';
import '../../model/category.dart';

class CategoryVodList extends ConsumerWidget {
  const CategoryVodList({
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
    final asyncCategoryVods =
        ref.watch(categoryVodsControllerProvider(category: category));

    return VideoGridViewWithAsyncValue<Vod>(
      asyncValue: asyncCategoryVods,
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      followingButtonFSN: followingButtonFSN,
      emptyText: '카테고리에 동영상이 없습니다',
      errorText: '카테고리 동영상을 불러올 수 없습니다',
      fetchMore: () async {
        await ref
            .read(categoryVodsControllerProvider(category: category).notifier)
            .fetchMore();
      },
      itemBuilder: (context, index, object) {
        return VodContainer(
          autofocus: index == 0 ? true : false,
          vod: object,
          infoWidget: VodInfoWithChannel(vod: object),
        );
      },
    );
  }
}
