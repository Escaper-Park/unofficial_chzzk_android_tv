import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show VideoSortType;
import '../channel_vod/controller/channel_vod_all_controller.dart';

mixin class ChannelVodEvent {
  void pop(BuildContext context) {
    context.pop();
  }

  Future<void> channelVodFetchMore(
    WidgetRef ref, {
    required String channelId,
    required VideoSortType sortType,
  }) async {
    await ref
        .read(
          channelVodAllControllerProvider(
            channelId: channelId,
            sortType: sortType,
          ).notifier,
        )
        .fetchMore();
  }
}
