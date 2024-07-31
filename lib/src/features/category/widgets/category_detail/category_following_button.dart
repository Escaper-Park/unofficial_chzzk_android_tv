import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/dpad_widgets.dart';
import '../../../following/widgets/following_button.dart';
import '../../controller/category_controller.dart';
import '../../model/category.dart';

class CategoryFollowingButton extends HookConsumerWidget {
  const CategoryFollowingButton({
    super.key,
    required this.category,
    required this.followingButtonFSN,
    required this.sidebarFSN,
    required this.gridViewFSN,
  });

  final Category category;
  final FocusScopeNode followingButtonFSN;
  final FocusScopeNode sidebarFSN;
  final FocusScopeNode gridViewFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // To highlight
    final focusNode = useFocusNode();

    // To check already followed
    final asyncFollowingCategories =
        ref.watch(followingCategoriesControllerProvider);

    return DpadFocusScopeNavigator(
      node: followingButtonFSN,
      dpadKeyFocusScopeNodeMap: {
        DpadAction.arrowDown: gridViewFSN,
        DpadAction.arrowLeft: sidebarFSN,
      },
      onFocusChange: (value) {
        if (value) focusNode.requestFocus();
      },
      child: FollowingButtonWithAsyncValue<Category>(
        focusNode: focusNode,
        asyncValue: asyncFollowingCategories,
        checkIsFollowing: (following) =>
            following.categoryId == category.categoryId,
        unfollowWarning: '[${category.categoryValue}] 카테고리 팔로우를 취소하시겠습니까?',
        onPressed: (isFollowing) async {
          bool result = false;

          // unfollow
          if (isFollowing) {
            result = await ref
                .read(followingCategoriesControllerProvider.notifier)
                .unfollow(category);
          }

          // follow
          else {
            result = await ref
                .read(followingCategoriesControllerProvider.notifier)
                .follow(category);
          }

          // refresh following list
          if (result) {
            ref.invalidate(followingCategoriesControllerProvider);
          }
        },
      ),
    );
  }
}
