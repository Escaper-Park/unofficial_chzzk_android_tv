import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show VideoSortType;
import '../live/model/live_info.dart';
import 'controller/live_all_controller.dart';

mixin class LiveAllState {
  AsyncValue<List<LiveInfo>?> getAsyncLivesSortBy(
    WidgetRef ref, {
    required VideoSortType sortType,
  }) =>
      ref.watch(liveAllControllerProvider(sortType: sortType));
}
