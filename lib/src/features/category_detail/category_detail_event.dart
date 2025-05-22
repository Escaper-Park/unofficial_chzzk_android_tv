import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart'
    show VideoSortType, FilterType, ClipOrderType;
import '../category/model/category.dart';

import '../following/controller/following_category_controller.dart';
import 'controller/category_live_controller.dart';
import 'controller/category_vod_controller.dart';
import 'controller/category_clip_controller.dart';

mixin class CategoryDetailEvent {
  void pop(BuildContext context) {
    context.pop();
  }

  Future<void> categoryLiveFetchMore(
    WidgetRef ref, {
    required Category category,
  }) async {
    await ref
        .read(categoryLiveControllerProvider(category: category).notifier)
        .fetchMore();
  }

  Future<void> categoryVodFetchMore(
    WidgetRef ref, {
    required Category category,
  }) async {
    await ref
        .read(categoryVodControllerProvider(category: category).notifier)
        .fetchMore();
  }

  Future<void> categoryClipFetchMore(
    WidgetRef ref, {
    required Category category,
    required VideoSortType orderType,
    required FilterType filterType,
  }) async {
    ClipOrderType clipOrderType = orderType == VideoSortType.popularClip
        ? ClipOrderType.popular
        : ClipOrderType.recent;

    await ref
        .read(
          categoryClipControllerProvider(
            category: category,
            filterType: filterType,
            orderType: clipOrderType,
          ).notifier,
        )
        .fetchMore();
  }

  Future<void> toggleFollow(
    WidgetRef ref, {
    required bool isFollowing,
    required Category category,
  }) async {
    await ref.read(followingCategoryControllerProvider.notifier).toggleFollow(
          isFollowing: isFollowing,
          category: category,
        );
  }
}
