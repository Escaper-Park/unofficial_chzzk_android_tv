import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../common/constants/enums.dart'
    show ChatWindowMode, PlaybackDirection, VideoSortType, VodStreamOverlayType;
import '../channel/model/channel.dart';
import '../channel_vod/controller/channel_vod_all_controller.dart';
import '../settings/controller/chat_setting_controller.dart';
import '../settings/controller/stream_setting_controller.dart';
import '../settings/model/chat_settings.dart';
import '../settings/model/stream_settings.dart';
import '../vod/model/vod.dart';
import '../vod/model/vod_chat.dart';
import 'controller/vod_chat_controller.dart';
import 'controller/vod_overlay_controller.dart';
import 'controller/vod_playlist_controller.dart';
import 'controller/vod_seek_indicator_controller.dart';
import 'controller/vod_player_controller.dart';
import 'controller/vod_window_controller.dart';

mixin class VodStreamState {
  /* vod  */
  VodPlay? getVodPlay(WidgetRef ref) =>
      ref.watch(vodPlaylistControllerProvider);

  /* vod chat */
  AsyncValue<List<VodChat>> getChatStream(
    WidgetRef ref, {
    required VideoPlayerController controller,
    required int videoNo,
  }) =>
      ref.watch(
        vodChatControllerProvider(
          controller: controller,
          videoNo: videoNo,
        ),
      );

  /* video player */
  AsyncValue<VideoPlayerController?> getAsyncVideoPlayerController(
    WidgetRef ref,
  ) =>
      ref.watch(vodPlayerControllerProvider);

  VideoPlayerController? getVideoPlayerController(WidgetRef ref) =>
      ref.watch(vodPlayerControllerProvider).value;

  Vod? getVod(WidgetRef ref) => ref.read(vodPlaylistControllerProvider)?.$1;

  int getCurrentResolutionIndex(WidgetRef ref) => ref
      .read(vodPlayerControllerProvider.notifier)
      .getCurrentResolutionIndex();

  /* channel */
  AsyncValue<List<Vod>?> getChannelVod(
    WidgetRef ref, {
    required Channel channel,
  }) =>
      ref.watch(
        channelVodAllControllerProvider(
          channelId: channel.channelId,
          sortType: VideoSortType.latest,
        ),
      );

  Future<void> channelVodFetchMore(
    WidgetRef ref, {
    required Channel channel,
  }) async {
    ref
        .read(
          channelVodAllControllerProvider(
            channelId: channel.channelId,
            sortType: VideoSortType.latest,
          ).notifier,
        )
        .fetchMore();
  }

  /* overlay */
  VodStreamOverlayType getOverlayType(WidgetRef ref) =>
      ref.watch(vodOverlayControllerProvider);

  ChatWindowMode getChatWindowMode(WidgetRef ref) =>
      ref.watch(vodWindowControllerProvider);

  /* settings */
  StreamSettings getStreamSettings(WidgetRef ref) =>
      ref.watch(streamSettingsControllerProvider);

  ChatSettings getChatSettings(WidgetRef ref) =>
      ref.watch(chatSettingsControllerProvider);

  /* vod seek indicator */
  bool getShowSeekIndicatorState(WidgetRef ref) =>
      ref.watch(vodSeekIndicatorControllerProvider);

  int getPlaybackIntervalIndex(WidgetRef ref) => ref.read(
        streamSettingsControllerProvider.select(
          (value) => value.vodPlaybackIntervalIndex,
        ),
      );
  PlaybackDirection? getPlaybackDirection(WidgetRef ref) => ref
      .read(vodSeekIndicatorControllerProvider.notifier)
      .getCurrentDirection();
}
