import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show VideoSortType;
import '../home/controller/home_refresh_controller.dart';
import '../watching_history/controller/watching_history_controller.dart';
import 'controller/following_vod_controller.dart';
import 'controller/vod_all_controller.dart';

mixin class VodAllEvent {
  void goHome(WidgetRef ref, BuildContext context) {
    context.pop();
    ref.read(homeRefreshControllerProvider.notifier).refresh();
  }

  Future<void> vodAllFetchMore(
    WidgetRef ref, {
    required VideoSortType sortType,
  }) async {
    await ref
        .read(vodAllControllerProvider(sortType: sortType).notifier)
        .fetchMore();
  }

  Future<void> followingVodFetchMore(WidgetRef ref) async {
    await ref.read(followingVodControllerProvider.notifier).fetchMore();
  }

  Future<void> watchingHistoryFetchMore(WidgetRef ref) async {
    await ref.read(watchingHistoryControllerProvider.notifier).fetchMore();
  }
}
