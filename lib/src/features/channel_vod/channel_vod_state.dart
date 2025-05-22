import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show VideoSortType;
import '../vod/model/vod.dart';
import 'controller/channel_vod_all_controller.dart';

mixin class ChannelVodState {
  AsyncValue<List<Vod>?> getAsyncChannelVodsSortBy(
    WidgetRef ref, {
    required String channelId,
    required VideoSortType sortType,
  }) =>
      ref.watch(
        channelVodAllControllerProvider(
          channelId: channelId,
          sortType: sortType,
        ),
      );
}
