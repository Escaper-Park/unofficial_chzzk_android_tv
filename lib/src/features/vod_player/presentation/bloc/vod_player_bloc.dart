import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../channel/domain/entities/channel_my_info.dart';
import '../../../channel/domain/entities/channel_video.dart';
import '../../../channel/domain/repositories/channel_repository.dart';
import '../../../group/domain/entities/group_collection.dart';
import '../../../group/domain/repositories/group_repository.dart';
import '../../../player_entry_viewer_benefits.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../../../settings/domain/repositories/settings_preferences_repository.dart';
import '../../../vod/domain/entities/vod_detail.dart';
import '../../../vod/domain/entities/vod_feed.dart';
import '../../../vod/domain/entities/vod_playback.dart';
import '../../../vod/domain/repositories/vod_repository.dart';
import '../../../vod/domain/use_cases/check_vod_player_entry.dart';
import '../../domain/use_cases/resolve_vod_playback_uri.dart';
import '../../domain/use_cases/vod_playback_cache.dart';
import '../vod_player_route_target.dart';

part 'vod_player_bloc.freezed.dart';
part 'vod_player_bloc_browse_helpers.dart';
part 'vod_player_bloc_browse_page_helpers.dart';
part 'vod_player_bloc_controls_helpers.dart';
part 'vod_player_bloc_entry_helpers.dart';
part 'vod_player_bloc_lifecycle_helpers.dart';
part 'vod_player_bloc_playback_event_helpers.dart';
part 'vod_player_bloc_playback_source_helpers.dart';
part 'vod_player_bloc_preferences_helpers.dart';
part 'vod_player_bloc_social_helpers.dart';
part 'vod_player_bloc_slot_helpers.dart';
part 'vod_player_bloc_target_helpers.dart';
part 'vod_player_event.dart';
part 'vod_player_state.dart';

final class VodPlayerBloc extends Bloc<VodPlayerEvent, VodPlayerState> {
  VodPlayerBloc({
    required VodRepository vodRepository,
    required this.channelRepository,
    required this.groupRepository,
    required this.settingsPreferencesRepository,
    required this.loadVodPlaybackPlaylistText,
  }) : // Keep the public constructor parameter name stable while storing it privately.
       // ignore: prefer_initializing_formals
       _vodRepository = vodRepository,
       super(VodPlayerState.initial()) {
    on<_Started>(_onStarted);
    on<_TargetSelected>(_onTargetSelected);
    on<_RetryRequested>(_onRetryRequested);
    on<_ControlsRequested>(_onControlsRequested);
    on<_ControlsClosed>(_onControlsClosed);
    on<_BrowseRequested>(_onBrowseRequested);
    on<_BrowseClosed>(_onBrowseClosed);
    on<_BrowseFallbackPressed>(_onBrowseFallbackPressed);
    on<_BrowseLoadMoreRequested>(_onBrowseLoadMoreRequested);
    on<_BrowseVodSelected>(_onBrowseVodSelected);
    on<_PreferencesChanged>(_onPreferencesChanged);
    on<_FollowingToggled>(_onFollowingToggled);
    on<_GroupAddRequested>(_onGroupAddRequested);
    on<_FeedbackCleared>(_onFeedbackCleared);
    on<_PlaybackSpeedSelected>(_onPlaybackSpeedSelected);
    on<_PlaybackReady>(_onPlaybackReady);
    on<_PlaybackFailed>(_onPlaybackFailed);
    on<_PlaybackPositionChanged>(_onPlaybackPositionChanged);
    on<_PlaybackEnded>(_onPlaybackEnded);
  }

  final ChannelRepository channelRepository;
  final GroupRepository groupRepository;
  final SettingsPreferencesRepository settingsPreferencesRepository;
  final LoadVodPlaybackPlaylistText loadVodPlaybackPlaylistText;
  final VodRepository _vodRepository;

  SettingsPreferences _persistedSettingsPreferences =
      defaultSettingsPreferences;
  int _targetRequestSerial = 0;
  int _statusRefreshSerial = 0;
  int _browseRequestSerial = 0;

  Future<void> postWatchEventForSlot({
    required String slotId,
    required String channelId,
    required int videoNo,
    required String watchEventType,
    required int? awtSeconds,
    required int positionSeconds,
    required String sessionId,
    required int eventDurationSeconds,
    required int totalLengthSeconds,
    bool allowStaleSlotTarget = false,
  }) {
    final slot = state.slotById(slotId);
    if (slot == null) {
      return Future<void>.value();
    }

    if (!allowStaleSlotTarget &&
        (slot.channelId != channelId || slot.videoNo != videoNo)) {
      return Future<void>.value();
    }

    return _vodRepository.postVideoWatchEvent(
      channelId: channelId,
      videoNo: videoNo,
      watchEventType: watchEventType,
      awtSeconds: awtSeconds,
      positionSeconds: positionSeconds,
      sessionId: sessionId,
      eventDurationSeconds: eventDurationSeconds,
      totalLengthSeconds: totalLengthSeconds,
    );
  }

  @override
  Future<void> close() async {
    final playbackCaches = [
      for (final slot in state.slots) ?slot.playbackCache,
    ];
    await Future.wait([
      for (final playbackCache in playbackCaches)
        _deletePlaybackCache(playbackCache),
    ]);
    return super.close();
  }
}
