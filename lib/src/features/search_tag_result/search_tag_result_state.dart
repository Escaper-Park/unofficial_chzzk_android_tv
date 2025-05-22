import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show FilterType;

import '../live/model/live_info.dart';
import '../vod/model/vod.dart';

import 'controller/search_tag_result_live_controller.dart';
import 'controller/search_tag_result_vod_controller.dart';

mixin class SearchTagResultState {
  AsyncValue<List<LiveInfo>?> getAsyncTagLives(
    WidgetRef ref, {
    required String tag,
    required FilterType sortType,
  }) =>
      ref.watch(
        searchTagResultLiveControllerProvider(sortType: sortType, tag: tag),
      );

  AsyncValue<List<Vod>?> getAsyncTagVods(
    WidgetRef ref, {
    required String tag,
    required FilterType sortType,
  }) =>
      ref.watch(
        searchTagResultVodControllerProvider(sortType: sortType, tag: tag),
      );
}
