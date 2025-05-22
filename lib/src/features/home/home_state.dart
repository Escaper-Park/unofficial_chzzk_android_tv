import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/dimensions.dart';
import '../../utils/hooks/custom_hooks.dart';
import '../auth/controller/auth_controller.dart';
import '../auth/model/auth.dart';

import '../category/model/category.dart';
import '../following/controller/following_category_controller.dart';
import '../following/model/following.dart';
import '../live/model/live_info.dart';
import 'controller/home_controller.dart';

mixin class HomeState {
  AsyncValue<Auth?> getAuth(WidgetRef ref) => ref.watch(authControllerProvider);

  AsyncValue<List<Following>?> getAsyncFollowingLives(WidgetRef ref) =>
      ref.watch(homeFollowingLivesControllerProvider);

  AsyncValue<List<LiveInfo>?> getAsyncPopularLives(WidgetRef ref) =>
      ref.watch(homePopularLivesControllerProvider);

  AsyncValue<List<Category>?> getAsyncFollowingCategories(WidgetRef ref) =>
      ref.watch(followingCategoryControllerProvider);

  void useAutoScroll({
    required Auth? auth,
    required ScrollController scrollController,
    required List<FocusScopeNode> nodes,
  }) {
    const double damping = 80.0; // to show bottom list;

    useVerticalFocusedAutoScroll(
      scrollController: scrollController,
      focusNodes: nodes,
      offsetBuilder: (double maxScrollExtent) {
        final pos = auth == null
            ? 0.0
            : maxScrollExtent -
                Dimensions.homeCategoryContainerHeight +
                damping;

        return [0.0, 0.0, pos, maxScrollExtent];
      },
    );
  }
}
