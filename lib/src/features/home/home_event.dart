import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/extensions/custom_extensions.dart';
import '../../common/constants/enums.dart' show AppRoute;
import '../category/model/category.dart';
import 'controller/home_refresh_controller.dart';

mixin class HomeEvent {
  AppRoute get _currentLocation => AppRoute.home;

  Future<void> refresh(WidgetRef ref) async {
    await ref.read(homeRefreshControllerProvider.notifier).refresh();
  }

  void pushLiveAll(BuildContext context) {
    context.pushTo(
      context: context,
      currentLocation: _currentLocation,
      appRoute: AppRoute.liveAll,
    );
  }

  void pushVodAll(BuildContext context) {
    context.pushTo(
      context: context,
      currentLocation: _currentLocation,
      appRoute: AppRoute.vodAll,
    );
  }

  void pushPopularClips(BuildContext context) {
    context.pushTo(
      context: context,
      currentLocation: _currentLocation,
      appRoute: AppRoute.popularClips,
    );
  }

  void pushSearchTag(BuildContext context) {
    context.pushTo(
      context: context,
      currentLocation: _currentLocation,
      appRoute: AppRoute.searchTag,
    );
  }

  void pushGroup(BuildContext context) {
    context.pushTo(
      context: context,
      currentLocation: _currentLocation,
      appRoute: AppRoute.group,
    );
  }

  void pushCategoryDetail(
    BuildContext context, {
    required Category category,
  }) {
    context.pushTo(
      context: context,
      currentLocation: _currentLocation,
      appRoute: AppRoute.categoryDetail,
      extra: {'baseRoute': _currentLocation},
      pathParameters: {'categoryId': category.categoryId},
    );
  }

  void goFollowing(BuildContext context) {
    context.goTo(
      context: context,
      currentLocation: _currentLocation,
      appRoute: AppRoute.following,
    );
  }
}
