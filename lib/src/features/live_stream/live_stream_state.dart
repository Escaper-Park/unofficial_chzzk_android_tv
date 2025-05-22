import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../common/constants/enums.dart'
    show ChatWindowMode, LiveMode, LiveStreamOverlayType;
import '../channel/model/channel.dart';
import '../following/model/following.dart';
import '../group/controller/group_controller.dart';
import '../group/model/group.dart';
import '../live/model/live_detail.dart';
import '../live/model/live_info.dart';
import '../live/model/live_status.dart';
import '../settings/controller/chat_setting_controller.dart';
import '../settings/controller/stream_setting_controller.dart';
import '../settings/model/chat_settings.dart';
import '../settings/model/stream_settings.dart';
import 'controller/live_mode_controller.dart';
import 'controller/live_overlay_controller.dart';
import 'controller/live_player_controller.dart';
import 'controller/live_playlist_controller.dart';
import 'controller/live_stream_navigator_controller.dart';
import 'controller/live_stream_status_controller.dart';
import 'controller/live_window_controller.dart';
import 'controller/live_chat_controller.dart';

mixin class LiveStreamState {
  /* groups */
  Groups getGroups(WidgetRef ref) => ref.watch(groupControllerProvider);

  /* live chat */
  AsyncValue<List<dynamic>> getChatStream(
    WidgetRef ref, {
    required String channelId,
    required String chatChannelId,
  }) =>
      ref.watch(
        liveChatControllerProvider(
          channelId: channelId,
          chatChannelId: chatChannelId,
        ),
      );

  LiveMode getLiveMode(WidgetRef ref) => ref.watch(liveModeControllerProvider);

  /* live status */
  AsyncValue<List<LiveStatus?>?> getLiveStatusList(WidgetRef ref) =>
      ref.watch(liveStreamStatusControllerProvider);

  /* playlist */
  List<LiveDetail> getLivePlaylist(WidgetRef ref) =>
      ref.watch(livePlaylistControllerProvider);

  int? getCurrentActivatedLiveIndex(WidgetRef ref) =>
      ref.watch(currentActivatedLiveControllerProvider);

  /* player */
  AsyncValue<VideoPlayerController?> getSingleLivePlayer(
    WidgetRef ref, {
    required int index,
  }) =>
      ref.watch(livePlayerControllerProvider(index: index));

  int getCurrentResolutionIndex(
    WidgetRef ref, {
    required int controllerIndex,
  }) =>
      ref
          .read(livePlayerControllerProvider(index: controllerIndex).notifier)
          .getCurrentResolutionIndex();

  VideoPlayerController? getSingleVideoPlayerController(
    WidgetRef ref, {
    required int index,
  }) =>
      ref.watch(livePlayerControllerProvider(index: index)).value;

  /* overlay */
  ChatWindowMode getChatWindowMode(WidgetRef ref) =>
      ref.watch(liveWindowControllerProvider);

  LiveStreamOverlayType getOverlayType(WidgetRef ref) =>
      ref.watch(liveOverlayControllerProvider);

  /* settings */
  StreamSettings getStreamSettings(WidgetRef ref) =>
      ref.watch(streamSettingsControllerProvider);

  ChatSettings getChatSettings(WidgetRef ref) =>
      ref.watch(chatSettingsControllerProvider);

  bool getShowGroupSettings(WidgetRef ref) {
    final showGroupIndex = ref.watch(
      streamSettingsControllerProvider.select(
        (value) => value.showGroupInVideoPlayer,
      ),
    );

    return showGroupIndex == 1;
  }

  /* contents */
  AsyncValue<List<Following>?> getFollowingLives(WidgetRef ref) =>
      ref.watch(liveStreamFollowingLivesControllerProvider);

  AsyncValue<List<LiveInfo>?> getCategoryLives(
    WidgetRef ref, {
    required String channelId,
  }) =>
      ref.watch(
        liveStreamCategoryLivesControllerProvider(channelId: channelId),
      );

  Channel getCurrentActivatedChannel(WidgetRef ref) {
    final currentActivatedAudio =
        ref.watch(currentActivatedAudioControllerProvider);

    final liveDetails = getLivePlaylist(ref);

    final activatedChannel = liveDetails[currentActivatedAudio].channel;

    return activatedChannel;
  }

  AsyncValue<List<LiveInfo>?> getPopularLives(WidgetRef ref) => ref.watch(
        liveStreamPopularLivesControllerProvider,
      );

  Groups getCurrentGroups(WidgetRef ref) => ref.watch(groupControllerProvider);
  Group? getCurrentActivatedGroup(WidgetRef ref) =>
      ref.read(groupControllerProvider.notifier).getCurrentActivatedGroup();

  AsyncValue<List<LiveDetail>?> getGroupLives(WidgetRef ref) => ref.watch(
        liveStreamGroupLivesControllerProvider,
      );
}
