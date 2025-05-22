import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show FilterType;
import 'controller/search_tag_result_live_controller.dart';
import 'controller/search_tag_result_vod_controller.dart';

mixin class SearchTagResultEvent {
  void pop(BuildContext context) {
    context.pop();
  }

  Future<void> liveFetchMore(
    WidgetRef ref, {
    required String tag,
    required FilterType sortType,
  }) async {
    await ref
        .read(
          searchTagResultLiveControllerProvider(sortType: sortType, tag: tag)
              .notifier,
        )
        .fetchMore();
  }

  Future<void> vodFetchMore(
    WidgetRef ref, {
    required String tag,
    required FilterType sortType,
  }) async {
    await ref
        .read(
          searchTagResultVodControllerProvider(sortType: sortType, tag: tag)
              .notifier,
        )
        .fetchMore();
  }
}
