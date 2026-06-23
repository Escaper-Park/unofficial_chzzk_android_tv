import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../category/domain/entities/category_live.dart';
import '../../../category/domain/repositories/category_repository.dart';
import '../../../channel/domain/entities/channel_my_info.dart';
import '../../../channel/domain/repositories/channel_repository.dart';
import '../../../following/domain/entities/following_feed.dart';
import '../../../following/domain/repositories/following_repository.dart';
import '../../../group/domain/entities/group_collection.dart';
import '../../../group/domain/repositories/group_repository.dart';
import '../../../live/domain/entities/live_detail.dart';
import '../../../live/domain/entities/live_feed.dart';
import '../../../live/domain/entities/live_status.dart';
import '../../../live/domain/repositories/live_repository.dart';
import '../../../live/domain/use_cases/check_live_player_entry.dart';
import '../../../player_entry_viewer_benefits.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../../../settings/domain/repositories/settings_preferences_repository.dart';
import '../../domain/use_cases/resolve_live_playback_uri.dart';
import '../live_player_route_target.dart';

part 'live_player_bloc.freezed.dart';
part 'live_player_browse_loader.dart';
part 'live_player_bloc_browse_fetch_helpers.dart';
part 'live_player_bloc_browse_helpers.dart';
part 'live_player_bloc_browse_load_helpers.dart';
part 'live_player_bloc_browse_selection_helpers.dart';
part 'live_player_bloc_controls_helpers.dart';
part 'live_player_bloc_entry_helpers.dart';
part 'live_player_bloc_lifecycle_helpers.dart';
part 'live_player_bloc_multiview_helpers.dart';
part 'live_player_bloc_playback_event_helpers.dart';
part 'live_player_bloc_playback_source_helpers.dart';
part 'live_player_bloc_preferences_helpers.dart';
part 'live_player_bloc_social_helpers.dart';
part 'live_player_bloc_recent_live_helpers.dart';
part 'live_player_bloc_slot_helpers.dart';
part 'live_player_bloc_slot_identity_helpers.dart';
part 'live_player_bloc_slot_resolution_helpers.dart';
part 'live_player_bloc_status_helpers.dart';
part 'live_player_bloc_target_helpers.dart';
part 'live_player_bloc_watch_event_helpers.dart';
part 'live_player_ended_status_check_tracker.dart';
part 'live_player_playback_source_loader.dart';
part 'live_player_status_reader.dart';
part 'live_player_social_commands.dart';
part 'live_player_target_loader.dart';
part 'live_player_event.dart';
part 'live_player_slot_state.dart';
part 'live_player_state.dart';
part 'live_player_state_enums.dart';

final class LivePlayerBloc extends Bloc<LivePlayerEvent, LivePlayerState> {
  LivePlayerBloc({
    LivePlayerInitialTarget? initialTarget,
    required LiveRepository liveRepository,
    required this.channelRepository,
    required this.followingRepository,
    required this.categoryRepository,
    required this.groupRepository,
    required LoadLivePlaybackPlaylistText loadLivePlaybackPlaylistText,
    required this.settingsPreferencesRepository,
  }) : // Keep the public constructor parameter name stable while storing it privately.
       // ignore: prefer_initializing_formals
       _liveRepository = liveRepository,
       _browseLoader = LivePlayerBrowseLoader(
         liveRepository: liveRepository,
         followingRepository: followingRepository,
         categoryRepository: categoryRepository,
       ),
       _socialCommands = LivePlayerSocialCommands(
         channelRepository: channelRepository,
         groupRepository: groupRepository,
       ),
       super(LivePlayerState.initial(initialTarget: initialTarget)) {
    _playbackSourceLoader = LivePlayerPlaybackSourceLoader(
      loadPlaylistText: loadLivePlaybackPlaylistText,
    );
    _statusReader = LivePlayerStatusReader(
      liveRepository: liveRepository,
      channelRepository: channelRepository,
    );
    _targetLoader = LivePlayerTargetLoader(
      liveRepository: liveRepository,
      statusReader: _statusReader,
      playbackSourceLoader: _playbackSourceLoader,
    );

    on<_Started>(_onStarted);
    on<_RetryRequested>(_onRetryRequested);
    on<_JumpToRealtimeRequested>(_onJumpToRealtimeRequested);
    on<_ControlsRequested>(_onControlsRequested);
    on<_ControlsClosed>(_onControlsClosed);
    on<_BrowseRequested>(_onBrowseRequested);
    on<_BrowseClosed>(_onBrowseClosed);
    on<_BrowseNextSectionRequested>(_onBrowseNextSectionRequested);
    on<_BrowsePreviousSectionRequested>(_onBrowsePreviousSectionRequested);
    on<_BrowseFallbackPressed>(_onBrowseFallbackPressed);
    on<_BrowseLoadMoreRequested>(_onBrowseLoadMoreRequested);
    on<_BrowseLiveSelected>(_onBrowseLiveSelected);
    on<_BrowseReplacementClosed>(_onBrowseReplacementClosed);
    on<_BrowseReplacementSlotSelected>(_onBrowseReplacementSlotSelected);
    on<_PreferencesChanged>(_onPreferencesChanged);
    on<_ViewModeSelected>(_onViewModeSelected);
    on<_MultiviewLayoutModeSelected>(_onMultiviewLayoutModeSelected);
    on<_ActiveSlotShiftRequested>(_onActiveSlotShiftRequested);
    on<_ActiveSlotSelected>(_onActiveSlotSelected);
    on<_SlotAudioToggled>(_onSlotAudioToggled);
    on<_SlotResolutionSelected>(_onSlotResolutionSelected);
    on<_SlotCloseConfirmed>(_onSlotCloseConfirmed);
    on<_LiveStatusRefreshRequested>(_onLiveStatusRefreshRequested);
    on<_FollowingToggled>(_onFollowingToggled);
    on<_GroupAddRequested>(_onGroupAddRequested);
    on<_GroupActivated>(_onGroupActivated);
    on<_FeedbackCleared>(_onFeedbackCleared);
    on<_PlaybackReady>(_onPlaybackReady);
    on<_PlaybackEnded>(_onPlaybackEnded);
    on<_PlaybackFailed>(_onPlaybackFailed);
  }

  final ChannelRepository channelRepository;
  final FollowingRepository followingRepository;
  final CategoryRepository categoryRepository;
  final GroupRepository groupRepository;
  final SettingsPreferencesRepository settingsPreferencesRepository;
  final LiveRepository _liveRepository;
  final LivePlayerBrowseLoader _browseLoader;
  final LivePlayerSocialCommands _socialCommands;
  late final LivePlayerPlaybackSourceLoader _playbackSourceLoader;
  late final LivePlayerStatusReader _statusReader;
  late final LivePlayerTargetLoader _targetLoader;
  final LivePlayerEndedStatusCheckTracker _endedStatusChecks =
      LivePlayerEndedStatusCheckTracker();

  SettingsPreferences _persistedSettingsPreferences =
      defaultSettingsPreferences;
  int _statusRefreshSerial = 0;
  int _browseRequestSerial = 0;
  int _generatedSlotSerial = 1;
  final List<String> _recentLiveChannelIds = [];
  final Map<String, int> _slotTargetRequestSerials = {};
  final Map<String, int> _slotStatusRefreshSerials = {};
  final Map<String, ({String channelId, int requestSerial})>
  _slotStatusRefreshesInFlight = {};
}
