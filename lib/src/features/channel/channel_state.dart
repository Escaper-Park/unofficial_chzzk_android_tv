import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../clip/model/clip.dart';
import '../following/model/following.dart';
import '../group/controller/group_controller.dart';
import '../group/model/group.dart';
import '../live/model/live_detail.dart';
import '../vod/model/vod.dart';

import '../following/controller/following_controller.dart';
import 'controller/channel_live_controller.dart';
import 'controller/channel_vod_controller.dart';
import 'controller/channel_clip_controller.dart';

mixin class ChannelState {
  AsyncValue<List<Following>?> getAsyncFollowingList(WidgetRef ref) =>
      ref.watch(followingControllerProvider);

  AsyncValue<LiveDetail?> getAsyncLiveDetail(
    WidgetRef ref, {
    required String channelId,
  }) =>
      ref.watch(channelLiveControllerProvider(channelId: channelId));

  AsyncValue<List<Vod>?> getAsyncVodsSortByLatest(
    WidgetRef ref, {
    required String channelId,
  }) =>
      ref.watch(
        channelVodControllerProvider(channelId: channelId),
      );

  AsyncValue<List<NaverClip>?> getAsyncClipsSortByLatest(
    WidgetRef ref, {
    required String channelId,
  }) =>
      ref.watch(
        channelClipControllerProvider(channelId: channelId),
      );

  Groups getGroups(WidgetRef ref) => ref.watch(groupControllerProvider);
}
