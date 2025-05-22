import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/extensions/custom_extensions.dart';
import '../../common/constants/enums.dart'
    show AppRoute, ClipOrderType, FilterType, VideoSortType;
import '../clip/controller/clip_controller.dart';
import '../clip/model/clip.dart';
import '../home/controller/home_refresh_controller.dart';
import 'controller/clip_popular_controller.dart';

mixin class ClipPopularEvent {
  void goHome(WidgetRef ref, BuildContext context) {
    context.pop();
    ref.read(homeRefreshControllerProvider.notifier).refresh();
  }

  void playClip(
    WidgetRef ref,
    BuildContext context, {
    required NaverClip clip,
  }) {
    final String clipEmbedUrl =
        ref.read(clipControllerProvider.notifier).getPlayUrl(clip: clip);

    context.pushTo(
      context: context,
      currentLocation: AppRoute.popularClips,
      appRoute: AppRoute.clipPlayer,
      extra: {'clipEmbedUrl': clipEmbedUrl},
    );
  }

  Future<void> popularClipFetchMore(
    WidgetRef ref, {
    required VideoSortType orderType,
    required FilterType filterType,
  }) async {
    ClipOrderType clipOrderType = orderType == VideoSortType.popularClip
        ? ClipOrderType.popular
        : ClipOrderType.recommend;

    await ref
        .read(
          clipPopularControllerProvider(
            filterType: filterType,
            orderType: clipOrderType,
          ).notifier,
        )
        .fetchMore();
  }
}
