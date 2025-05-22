import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/enums.dart' show DpadAction;
import '../../../common/widgets/dpad/dpad_widgets.dart'
    show DpadFocusScopeNavigator;
import '../../category/model/category.dart';
import '../../following/widgets/following_button.dart'
    show FollowingButtonWithAsyncValue;

class CategoryFollowingButton extends HookWidget {
  const CategoryFollowingButton({
    super.key,
    required this.category,
    required this.asyncCategoryFollowingList,
    required this.followingButtonFSN,
    this.sidebarFSN,
    required this.belowFSN,
    required this.toggleFollow,
  });

  final Category category;
  final AsyncValue<List<Category>?> asyncCategoryFollowingList;
  final FocusScopeNode followingButtonFSN;
  final FocusScopeNode? sidebarFSN;
  final FocusScopeNode belowFSN;
  final Future<void> Function(bool isFollowing, Category category) toggleFollow;

  @override
  Widget build(BuildContext context) {
    // to highlight button
    final focusNode = useFocusNode();

    return Align(
      alignment: Alignment.topRight,
      child: DpadFocusScopeNavigator(
        node: followingButtonFSN,
        dpadKeyNodeMap: {
          DpadAction.arrowDown: belowFSN,
          DpadAction.arrowLeft: sidebarFSN,
        },
        onFocusChange: (value) {
          if (value) focusNode.requestFocus();
        },
        child: FollowingButtonWithAsyncValue<Category>(
          focusNode: focusNode,
          asyncFollowingList: asyncCategoryFollowingList,
          containsFollowing: (following) =>
              following.categoryId == category.categoryId,
          unFollowWarning: '[${category.categoryValue}] 카테고리의 팔로우를 취소하시겠습니까?',
          onPressed: (isFollowing) async {
            await toggleFollow(isFollowing, category);
          },
        ),
      ),
    );
  }
}
