import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../auth/controller/auth_controller.dart';
import '../../utils/extensions/custom_extensions.dart';
import '../../common/constants/enums.dart' show AppRoute;
import '../home/controller/home_refresh_controller.dart';

mixin class DashboardEvent {
  void goTo(
    BuildContext context, {
    required String currentLocationName,
    required AppRoute appRoute,
  }) {
    final currentAppRoute = AppRouteX.fromRouteName(currentLocationName);

    context.goTo(
      context: context,
      currentLocation: currentAppRoute ?? AppRoute.home,
      appRoute: appRoute,
    );
  }

  void goHome(
    WidgetRef ref,
    BuildContext context, {
    required String currentLocationName,
  }) {
    final currentAppRoute = AppRouteX.fromRouteName(currentLocationName);

    context.goTo(
      context: context,
      currentLocation: currentAppRoute ?? AppRoute.search,
      appRoute: AppRoute.home,
    );

    if (currentAppRoute != AppRoute.home) {
      ref.read(homeRefreshControllerProvider.notifier).refresh();
    }
  }

  void pushSearch(BuildContext context) {
    context.pushTo(
      context: context,
      currentLocation: AppRoute.home,
      appRoute: AppRoute.search,
      extra: {'fromHome': true},
    );
  }

  Future<void> signOut({
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    if (context.mounted) {
      await ref.read(authControllerProvider.notifier).signOut();
    }
  }
}
