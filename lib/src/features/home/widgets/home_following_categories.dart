import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../../utils/router/app_router.dart';
import '../../category/controller/category_controller.dart';
import '../../category/model/category.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import 'home_category_container.dart';
import 'home_list_view_container.dart';

class HomeFollowingCategories extends ConsumerWidget {
  const HomeFollowingCategories({
    super.key,
    required this.listFSN,
    required this.sidebarFSN,
    required this.aboveFSN,
  });

  final FocusScopeNode listFSN;
  final FocusScopeNode sidebarFSN;
  final FocusScopeNode aboveFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowingCategories =
        ref.watch(followingCategoriesControllerProvider);

    return HomeListViewContainer<Category>(
      headerText: '팔로잉 카테고리',
      containerWidth: Dimensions.followingCategoryContainerSize.width,
      containerHeight: Dimensions.followingCategoryContainerSize.height,
      asyncValue: asyncFollowingCategories,
      emptyText: '팔로잉 카테고리가 없습니다',
      errorText: '팔로잉 카테고리를 불러올 수 없습니다',
      exceptionWidgetAutofocus: false,
      listFSN: listFSN,
      sidebarFSN: sidebarFSN,
      aboveFSN: aboveFSN,
      fallback: () {
        ref
            .read(dashboardControllerProvider.notifier)
            .changeScreen(context, AppRoute.category);
      },
      itemBuilder: (index, focusNode, object) {
        return HomeCategoryContainer(
          autofocus: false,
          focusNode: focusNode,
          category: object,
        );
      },
    );
  }
}
