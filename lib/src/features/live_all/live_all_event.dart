import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show VideoSortType;
import '../home/controller/home_refresh_controller.dart';
import 'controller/live_all_controller.dart';

mixin class LiveAllEvent {
  void goHome(WidgetRef ref, BuildContext context) {
    context.pop();
    ref.read(homeRefreshControllerProvider.notifier).refresh();
  }

  Future<void> fetchMore(
    WidgetRef ref, {
    required VideoSortType sortType,
  }) async {
    ref
        .read(liveAllControllerProvider(sortType: sortType).notifier)
        .fetchMore();
  }
}
