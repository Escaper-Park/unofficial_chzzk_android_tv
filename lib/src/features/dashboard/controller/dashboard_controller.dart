import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/router/app_router.dart';

part 'dashboard_controller.g.dart';

@Riverpod(keepAlive: true)
class DashboardController extends _$DashboardController {
  @override
  int build() {
    // Current screen index value;
    return AppRoute.home.screenIndex;
  }

  // ignore: avoid_build_context_in_providers
  void changeScreen(BuildContext context, AppRoute appRoute) {
    /* 
     - Search
     - Home
     - following
     - multiview
     - settings
     - Id -- Password
    */

    if (context.mounted) {
      if (appRoute.screenIndex != state) {
        setState(appRoute.screenIndex);
        context.goNamed(appRoute.routeName);
      }
    }
  }

  void setState(int index) {
    state = index;
  }
}
