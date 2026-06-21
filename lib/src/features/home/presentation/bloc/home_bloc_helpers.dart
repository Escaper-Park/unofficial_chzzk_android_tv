part of 'home_bloc.dart';

extension _HomeBlocHelpers on HomeBloc {
  bool _isCurrentLoad(Emitter<HomeState> emit, int requestSerial) {
    return !emit.isDone && _loadSerial == requestSerial;
  }

  Future<GeneralSetting> _readGeneralSetting() async {
    try {
      final preferences = await settingsPreferencesRepository.read();
      return preferences.generalSetting;
    } on Object {
      return defaultGeneralSetting;
    }
  }

  HomeState _loadingState({
    required bool isSignedIn,
    required GeneralSetting generalSetting,
    required List<HomeSectionId> visibleSections,
  }) {
    return HomeState(
      loadStatus: HomeLoadStatus.loading,
      isSignedIn: isSignedIn,
      generalSetting: generalSetting,
      visibleSections: visibleSections,
      immersive: _initialOrLoading<Live>(
        visibleSections,
        HomeSectionId.immersive,
      ),
      followingLive: _initialOrLoading<Live>(
        visibleSections,
        HomeSectionId.followingLive,
      ),
      popularLive: _initialOrLoading<Live>(
        visibleSections,
        HomeSectionId.popularLive,
      ),
      watchingHistory: _initialOrLoading<Vod>(
        visibleSections,
        HomeSectionId.watchingHistory,
      ),
      popularVod: _initialOrLoading<Vod>(
        visibleSections,
        HomeSectionId.popularVod,
      ),
      followingCategory: _initialOrLoading<CategoryItem>(
        visibleSections,
        HomeSectionId.followingCategory,
      ),
      trendingCategory: _initialOrLoading<CategoryItem>(
        visibleSections,
        HomeSectionId.trendingCategory,
      ),
    );
  }

  HomeSectionData<T> _initialOrLoading<T>(
    List<HomeSectionId> visibleSections,
    HomeSectionId sectionId,
  ) {
    if (visibleSections.contains(sectionId)) {
      return homeSectionLoading<T>();
    }

    return homeSectionInitial<T>();
  }

  Future<HomeSectionData<T>> _loadIfVisible<T>({
    required List<HomeSectionId> visibleSections,
    required HomeSectionId sectionId,
    required Future<List<T>> Function() load,
  }) {
    if (!visibleSections.contains(sectionId)) {
      return Future.value(homeSectionInitial<T>());
    }

    return _loadSection(load);
  }

  Future<HomeSectionData<T>> _loadSection<T>(
    Future<List<T>> Function() load,
  ) async {
    try {
      final items = await load();
      return homeSectionReady(items);
    } on Object {
      return homeSectionFailure<T>();
    }
  }

  Future<List<Live>> _loadImmersiveLives() async {
    final topLives = await homeRepository.getTopLives();
    return [
      for (final item in topLives) _liveFromHomeLive(item),
    ];
  }

  Future<List<Live>> _loadPopularLives() async {
    final page = await liveRepository.getLives(size: HomeBloc._homeRailSize);
    return page.items;
  }

  Future<List<Live>> _loadFollowingLives() async {
    final page = await followingRepository.fetchFollowingLives();
    return [
      for (final item in page.items) ?_liveFromFollowingChannel(item),
    ];
  }

  Future<List<Vod>> _loadWatchingHistoryVods() async {
    final page = await watchingHistoryRepository.fetchWatchingHistory(
      size: HomeBloc._homeRailSize,
    );
    return [
      for (final item in page.items) ?vodFromWatchingHistoryItem(item),
    ];
  }

  Future<List<Vod>> _loadPopularVods() async {
    final page = await vodRepository.getVods(size: HomeBloc._homeRailSize);
    return page.items;
  }

  Future<List<CategoryItem>> _loadFollowingCategories() {
    return categoryRepository.fetchFollowingCategories();
  }

  Future<List<CategoryItem>> _loadTrendingCategories() async {
    final page = await categoryRepository.fetchCategories();
    return page.items;
  }
}

Live _liveFromHomeLive(HomeLive item) {
  return Live(
    liveId: item.liveId,
    title: item.title,
    thumbnailImageUrl: item.thumbnailImageUrl,
    defaultThumbnailImageUrl: item.defaultThumbnailImageUrl,
    concurrentUserCount: item.concurrentUserCount,
    openDate: item.openDate,
    adult: item.adult,
    tags: item.tags,
    categoryValue: item.categoryValue,
    channel: item.channel == null
        ? null
        : LiveChannel(
            channelId: item.channel!.channelId,
            channelName: item.channel!.channelName,
            channelImageUrl: item.channel!.channelImageUrl,
            verifiedMark: item.channel!.verifiedMark,
          ),
    blindType: item.blindType,
    watchPartyTag: item.watchPartyTag,
    watchPartyType: item.watchPartyType,
    membershipBenefitType: item.membershipBenefitType,
  );
}

Live? _liveFromFollowingChannel(FollowingChannel item) {
  final liveInfo = item.liveInfo;
  final liveId = liveInfo?.liveId;
  final title = liveInfo?.title;

  if (liveInfo == null || liveId == null || title == null || title.isEmpty) {
    return null;
  }

  return Live(
    liveId: liveId,
    title: title,
    thumbnailImageUrl: liveInfo.thumbnailImageUrl,
    defaultThumbnailImageUrl: liveInfo.defaultThumbnailImageUrl,
    concurrentUserCount: liveInfo.concurrentUserCount,
    adult: liveInfo.adult,
    tags: liveInfo.tags,
    categoryValue: liveInfo.categoryValue,
    channel: LiveChannel(
      channelId: item.channelId,
      channelName: item.channelName,
      channelImageUrl: item.channelImageUrl,
      verifiedMark: item.verifiedMark,
    ),
    blindType: liveInfo.blindType,
    watchPartyTag: liveInfo.watchPartyTag,
    watchPartyType: liveInfo.watchPartyType,
  );
}
