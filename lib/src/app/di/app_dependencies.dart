import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/network.dart';
import '../../features/auth/data/network/auth_cookie_interceptor.dart';
import '../../features/auth/data/repositories/webview_auth_session_repository.dart';
import '../../features/auth/domain/repositories/auth_session_repository.dart';
import '../../features/auth/presentation/bloc/auth_session_bloc.dart';
import '../../features/category/data/data_sources/category_api.dart';
import '../../features/category/data/repositories/chzzk_category_repository.dart';
import '../../features/category/domain/repositories/category_repository.dart';
import '../../features/channel/data/data_sources/channel_api.dart';
import '../../features/channel/data/repositories/chzzk_channel_repository.dart';
import '../../features/channel/domain/repositories/channel_repository.dart';
import '../../features/chat/data/data_sources/chat_api.dart';
import '../../features/chat/data/repositories/chzzk_chat_repository.dart';
import '../../features/chat/domain/repositories/chat_repository.dart';
import '../../features/following/data/data_sources/following_api.dart';
import '../../features/following/data/repositories/chzzk_following_repository.dart';
import '../../features/following/domain/repositories/following_repository.dart';
import '../../features/group/data/repositories/shared_preferences_group_repository.dart';
import '../../features/group/domain/repositories/group_repository.dart';
import '../../features/home/data/data_sources/home_api.dart';
import '../../features/home/data/repositories/chzzk_home_repository.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/live/data/data_sources/live_api.dart';
import '../../features/live/data/repositories/chzzk_live_repository.dart';
import '../../features/live/domain/repositories/live_repository.dart';
import '../../features/live_player/data/repositories/chzzk_live_playback_repository.dart';
import '../../features/live_player/domain/use_cases/resolve_live_playback_uri.dart';
import '../../features/search/data/data_sources/search_api.dart';
import '../../features/search/data/repositories/chzzk_search_repository.dart';
import '../../features/search/domain/repositories/search_repository.dart';
import '../../features/search_results/data/data_sources/search_results_api.dart';
import '../../features/search_results/data/repositories/chzzk_search_results_repository.dart';
import '../../features/search_results/domain/repositories/search_results_repository.dart';
import '../../features/search_tag_results/data/data_sources/search_tag_results_api.dart';
import '../../features/search_tag_results/data/repositories/chzzk_search_tag_results_repository.dart';
import '../../features/search_tag_results/domain/repositories/search_tag_results_repository.dart';
import '../../features/settings/data/data_sources/settings_update_api.dart';
import '../../features/settings/data/repositories/github_settings_update_repository.dart';
import '../../features/settings/data/repositories/shared_preferences_settings_repository.dart';
import '../../features/settings/domain/repositories/settings_preferences_repository.dart';
import '../../features/settings/domain/repositories/settings_update_repository.dart';
import '../../features/user/data/data_sources/user_api.dart';
import '../../features/user/data/repositories/chzzk_user_repository.dart';
import '../../features/user/domain/repositories/user_repository.dart';
import '../../features/vod/data/data_sources/vod_api.dart';
import '../../features/vod/data/repositories/chzzk_vod_repository.dart';
import '../../features/vod/domain/repositories/vod_repository.dart';
import '../../features/vod_player/domain/use_cases/resolve_vod_playback_uri.dart';
import '../../features/watching_history/data/data_sources/watching_history_api.dart';
import '../../features/watching_history/data/repositories/chzzk_watching_history_repository.dart';
import '../../features/watching_history/domain/repositories/watching_history_repository.dart';

part 'app_dependencies_factory.dart';
part 'app_dependency_scope.dart';

final class AppDependencies {
  AppDependencies({
    required this.authSessionRepository,
    required this.authSessionBloc,
    required this.userRepository,
    required this.homeRepository,
    required this.liveRepository,
    required this.chatRepository,
    required this.loadLivePlaybackPlaylistText,
    required this.loadVodPlaybackPlaylistText,
    required this.followingRepository,
    required this.groupRepository,
    required this.channelRepository,
    required this.vodRepository,
    required this.watchingHistoryRepository,
    required this.categoryRepository,
    required this.searchRepository,
    required this.searchResultsRepository,
    required this.searchTagResultsRepository,
    required this.settingsPreferencesRepository,
    required this.settingsUpdateRepository,
    List<FutureOr<void> Function()> disposeCallbacks = const [],
    // ignore: prefer_initializing_formals
  }) : _disposeCallbacks = disposeCallbacks;

  final AuthSessionRepository authSessionRepository;
  final AuthSessionBloc authSessionBloc;
  final UserRepository userRepository;
  final HomeRepository homeRepository;
  final LiveRepository liveRepository;
  final ChatRepository chatRepository;
  final LoadLivePlaybackPlaylistText loadLivePlaybackPlaylistText;
  final LoadVodPlaybackPlaylistText loadVodPlaybackPlaylistText;
  final FollowingRepository followingRepository;
  final GroupRepository groupRepository;
  final ChannelRepository channelRepository;
  final VodRepository vodRepository;
  final WatchingHistoryRepository watchingHistoryRepository;
  final CategoryRepository categoryRepository;
  final SearchRepository searchRepository;
  final SearchResultsRepository searchResultsRepository;
  final SearchTagResultsRepository searchTagResultsRepository;
  final SettingsPreferencesRepository settingsPreferencesRepository;
  final SettingsUpdateRepository settingsUpdateRepository;
  final List<FutureOr<void> Function()> _disposeCallbacks;
  bool _disposed = false;

  Future<bool> startAuthSessionRestore() {
    return authSessionBloc.restoreSessionFromCookies();
  }

  Future<void> dispose() async {
    if (_disposed) {
      return;
    }
    _disposed = true;

    for (final disposeCallback in _disposeCallbacks.reversed) {
      await disposeCallback();
    }
    await authSessionBloc.close();
  }
}
