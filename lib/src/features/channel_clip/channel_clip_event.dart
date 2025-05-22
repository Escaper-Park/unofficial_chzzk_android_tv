import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart'
    show ClipOrderType, FilterType, VideoSortType;

import 'controller/channel_clip_all_controller.dart';

mixin class ChannelClipEvent {
  void pop(BuildContext context) {
    context.pop();
  }


  Future<void> channelClipFetchMore(
    WidgetRef ref, {
    required String channelId,
    required VideoSortType orderType,
    required FilterType filterType,
  }) async {
    ClipOrderType clipOrderType = orderType == VideoSortType.popularClip
        ? ClipOrderType.popular
        : ClipOrderType.recent;

    await ref
        .read(
          channelClipAllControllerProvider(
            channelId: channelId,
            filterType: filterType,
            orderType: clipOrderType,
          ).notifier,
        )
        .fetchMore();
  }
}
