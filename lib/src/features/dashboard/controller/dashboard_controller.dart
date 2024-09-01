import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/router/app_router.dart';

part 'dashboard_controller.g.dart';

// Set keepAlive to true to keep changed index when change the screen.
@Riverpod(keepAlive: true)
class DashboardController extends _$DashboardController {
  /// Current screen's index
  @override
  int build() {
    return AppRoute.home.screenIndex;
  }

  // ignore: avoid_build_context_in_providers
  void changeScreen(BuildContext context, AppRoute appRoute) {
    if (context.mounted && appRoute.screenIndex != state) {
      setState(appRoute.screenIndex);
      context.goNamed(appRoute.routeName);
    }
  }

  void setState(int index) {
    state = index;
  }
}
