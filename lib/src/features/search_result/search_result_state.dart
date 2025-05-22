import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../channel/model/channel.dart';

import '../live/model/live_info.dart';
import '../vod/model/vod.dart';
import 'controller/search_channel_controller.dart';
import 'controller/search_vod_controller.dart';
import 'controller/search_live_controller.dart';

mixin class SearchResultState {
  AsyncValue<List<Channel>?> getSearchChannelResponse(
    WidgetRef ref, {
    required String keyword,
  }) =>
      ref.watch(
        searchChannelControllerProvider(
          keyword: keyword,
        ),
      );

  AsyncValue<List<Vod>?> getSearchVodResponse(
    WidgetRef ref, {
    required String keyword,
  }) =>
      ref.watch(
        searchVodControllerProvider(keyword: keyword),
      );

  AsyncValue<List<LiveInfo>?> getSearchLiveResponse(
    WidgetRef ref, {
    required String keyword,
  }) =>
      ref.watch(
        searchLiveControllerProvider(keyword: keyword),
      );
}
