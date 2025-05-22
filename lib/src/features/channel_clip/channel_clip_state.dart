import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart'
    show FilterType, ClipOrderType, VideoSortType;
import '../clip/model/clip.dart';
import 'controller/channel_clip_all_controller.dart';

mixin class ChannelClipState {
  AsyncValue<List<NaverClip>?> getAsyncChannelClips(
    WidgetRef ref, {
    required String channelId,
    required VideoSortType orderType,
    required FilterType filterType,
  }) {
    ClipOrderType clipOrderType = orderType == VideoSortType.popularClip
        ? ClipOrderType.popular
        : ClipOrderType.recent;

    return ref.watch(
      channelClipAllControllerProvider(
        channelId: channelId,
        filterType: filterType,
        orderType: clipOrderType,
      ),
    );
  }
}
