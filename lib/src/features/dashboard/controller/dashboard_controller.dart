import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/router/app_router.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  // ShellRoute index. 0 is home.
  @override
  int build() {
    return 0;
  }

  void updateState(int index) {
    state = index;
  }

  // ignore: avoid_build_context_in_providers
  void onTapTitleMenu(BuildContext context, int index) {
    if (state != index && context.mounted) {
      String routePath = switch (index) {
        0 => AppRoute.home.routePath,
        1 => AppRoute.following.routePath,
        2 => AppRoute.search.routePath,
        _ => AppRoute.home.routePath,
      };
      context.go(routePath);

      updateState(index);
    }
  }
}

// // TODO : Make this to list to use it for all title menu.
// @riverpod
// Raw<FocusNode> dashboardFocusNode(DashboardFocusNodeRef ref) {
//   return FocusNode();
// }
