part of 'app_dependencies.dart';

Future<AppDependencies> createAppDependencies() async {
  final authSessionRepository = WebViewAuthSessionRepository();
  final authSessionBloc = AuthSessionBloc(authSessionRepository);
  final serviceDio = ChzzkDioFactory.service()
    ..interceptors.add(
      AuthCookieInterceptor(
        readCookieHeader: () => authSessionBloc.cookieHeader,
      ),
    );
  final commDio = ChzzkDioFactory.comm()
    ..interceptors.add(
      AuthCookieInterceptor(
        readCookieHeader: () => authSessionBloc.cookieHeader,
      ),
    );
  final playerDio = ChzzkDioFactory.player()
    ..interceptors.add(
      AuthCookieInterceptor(
        readCookieHeader: () => authSessionBloc.cookieHeader,
      ),
    );
  final userRepository = ChzzkUserRepository(api: UserApi(commDio));
  final homeRepository = ChzzkHomeRepository(api: HomeApi(serviceDio));
  final liveRepository = ChzzkLiveRepository(api: LiveApi(serviceDio));
  final chatRepository = ChzzkChatRepository(
    accessTokenApi: ChatAccessTokenApi(commDio),
    videoChatApi: VideoChatApi(serviceDio),
  );
  final livePlaybackRepository = ChzzkLivePlaybackRepository(dio: playerDio);
  final loadLivePlaybackPlaylistText = livePlaybackRepository.getPlaylistText;
  final loadVodPlaybackPlaylistText = livePlaybackRepository.getPlaylistText;
  final followingRepository = ChzzkFollowingRepository(
    api: FollowingApi(serviceDio),
  );
  final channelRepository = ChzzkChannelRepository(api: ChannelApi(serviceDio));
  final vodRepository = ChzzkVodRepository(
    api: VodApi(serviceDio),
    playbackApi: VodPlaybackApi(playerDio),
  );
  final watchingHistoryRepository = ChzzkWatchingHistoryRepository(
    api: WatchingHistoryApi(serviceDio),
  );
  final categoryRepository = ChzzkCategoryRepository(
    api: CategoryApi(serviceDio),
  );
  final searchRepository = ChzzkSearchRepository(
    api: SearchApi(serviceDio),
    categoryApi: SearchCategoryApi(commDio),
  );
  final searchResultsRepository = ChzzkSearchResultsRepository(
    api: SearchResultsApi(serviceDio),
  );
  final searchTagResultsRepository = ChzzkSearchTagResultsRepository(
    api: SearchTagResultsApi(serviceDio),
  );
  final settingsPreferences = await SharedPreferences.getInstance();
  final groupRepository = SharedPreferencesGroupRepository(
    preferences: settingsPreferences,
  );
  final settingsPreferencesRepository = SharedPreferencesSettingsRepository(
    preferences: settingsPreferences,
  );
  final settingsUpdateRepository = GithubSettingsUpdateRepository(
    api: SettingsUpdateApi(ChzzkDioFactory.github()),
  );

  return AppDependencies(
    authSessionRepository: authSessionRepository,
    authSessionBloc: authSessionBloc,
    userRepository: userRepository,
    homeRepository: homeRepository,
    liveRepository: liveRepository,
    chatRepository: chatRepository,
    loadLivePlaybackPlaylistText: loadLivePlaybackPlaylistText,
    loadVodPlaybackPlaylistText: loadVodPlaybackPlaylistText,
    followingRepository: followingRepository,
    groupRepository: groupRepository,
    channelRepository: channelRepository,
    vodRepository: vodRepository,
    watchingHistoryRepository: watchingHistoryRepository,
    categoryRepository: categoryRepository,
    searchRepository: searchRepository,
    searchResultsRepository: searchResultsRepository,
    searchTagResultsRepository: searchTagResultsRepository,
    settingsPreferencesRepository: settingsPreferencesRepository,
    settingsUpdateRepository: settingsUpdateRepository,
    disposeCallbacks: [
      () => serviceDio.close(force: true),
      () => commDio.close(force: true),
      () => playerDio.close(force: true),
    ],
  );
}
