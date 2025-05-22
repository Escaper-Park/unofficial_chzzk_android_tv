import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show VideoSortType;
import '../vod/model/vod.dart';
import '../watching_history/controller/watching_history_controller.dart';
import '../watching_history/model/watching_history.dart';
import 'controller/following_vod_controller.dart';
import 'controller/vod_all_controller.dart';

mixin class VodAllState {
  AsyncValue<List<Vod>?> getAsyncVodsSortBy(
    WidgetRef ref, {
    required VideoSortType sortType,
  }) =>
      ref.watch(vodAllControllerProvider(sortType: sortType));

  AsyncValue<List<Vod>?> getAsyncFollowingVods(WidgetRef ref) =>
      ref.watch(followingVodControllerProvider);

  AsyncValue<List<WatchingHistory>?> getAsyncWatchingHistories(WidgetRef ref) =>
      ref.watch(watchingHistoryControllerProvider);
}
