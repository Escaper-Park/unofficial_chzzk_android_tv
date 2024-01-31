import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/router/app_router.dart';

part 'dashboard_controller.g.dart';

@Riverpod(keepAlive: true)
class DashboardController extends _$DashboardController {
  // screen index
  @override
  int build() {
    return 0;
  }

  void setState(int screenIndex) {
    state = screenIndex;
  }

  // ignore: avoid_build_context_in_providers
  void changeScreen(BuildContext context, int screenIndex) {
    String routePath = switch (screenIndex) {
      0 => AppRoute.home.routePath,
      1 => AppRoute.following.routePath,
      2 => AppRoute.search.routePath,
      3 => AppRoute.multiView.routePath,
      4 => AppRoute.setting.routePath,
      5 => AppRoute.auth.routePath,
      _ => AppRoute.home.routePath,
    };

    if (screenIndex != state && context.mounted) {
      if (screenIndex == 5) {
        context.push(routePath);
      } else {
        context.go(routePath);
        setState(screenIndex);
      }
    }
  }
}
