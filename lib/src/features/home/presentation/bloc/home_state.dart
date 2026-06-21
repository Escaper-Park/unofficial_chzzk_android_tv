part of 'home_bloc.dart';

enum HomeLoadStatus {
  initial,
  loading,
  ready,
}

enum HomeSectionLoadStatus {
  initial,
  loading,
  ready,
  failure,
}

enum HomeVariant {
  login,
  nonLogin,
}

enum HomeSectionId {
  immersive,
  followingLive,
  popularLive,
  watchingHistory,
  popularVod,
  followingCategory,
  trendingCategory,
}

@freezed
abstract class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    required HomeLoadStatus loadStatus,
    required bool isSignedIn,
    required GeneralSetting generalSetting,
    required List<HomeSectionId> visibleSections,
    required HomeSectionData<Live> immersive,
    required HomeSectionData<Live> followingLive,
    required HomeSectionData<Live> popularLive,
    required HomeSectionData<Vod> watchingHistory,
    required HomeSectionData<Vod> popularVod,
    required HomeSectionData<CategoryItem> followingCategory,
    required HomeSectionData<CategoryItem> trendingCategory,
  }) = _HomeState;

  factory HomeState.initial() {
    final visibleSections = visibleHomeSections(
      isSignedIn: false,
      generalSetting: defaultGeneralSetting,
    );

    return HomeState(
      loadStatus: HomeLoadStatus.initial,
      isSignedIn: false,
      generalSetting: defaultGeneralSetting,
      visibleSections: visibleSections,
      immersive: homeSectionInitial<Live>(),
      followingLive: homeSectionInitial<Live>(),
      popularLive: homeSectionInitial<Live>(),
      watchingHistory: homeSectionInitial<Vod>(),
      popularVod: homeSectionInitial<Vod>(),
      followingCategory: homeSectionInitial<CategoryItem>(),
      trendingCategory: homeSectionInitial<CategoryItem>(),
    );
  }

  HomeVariant get variant {
    return isSignedIn ? HomeVariant.login : HomeVariant.nonLogin;
  }
}

@freezed
abstract class HomeSectionData<T> with _$HomeSectionData<T> {
  const HomeSectionData._();

  const factory HomeSectionData({
    required HomeSectionLoadStatus status,
    required List<T> items,
  }) = _HomeSectionData<T>;

  bool get hasItems => items.isNotEmpty;
}

List<HomeSectionId> visibleHomeSections({
  required bool isSignedIn,
  required GeneralSetting generalSetting,
}) {
  if (!isSignedIn) {
    return const [
      HomeSectionId.immersive,
      HomeSectionId.popularLive,
      HomeSectionId.popularVod,
      HomeSectionId.trendingCategory,
    ];
  }

  final sections = [
    if (_enabled(generalSetting.showImmersive)) HomeSectionId.immersive,
    if (_enabled(generalSetting.showFollowingLive)) HomeSectionId.followingLive,
    if (_enabled(generalSetting.showPopularLive)) HomeSectionId.popularLive,
    if (_enabled(generalSetting.showWatchingHistory))
      HomeSectionId.watchingHistory,
    if (_enabled(generalSetting.showPopularVod)) HomeSectionId.popularVod,
    if (_enabled(generalSetting.showFollowingCategory))
      HomeSectionId.followingCategory,
    if (_enabled(generalSetting.showTrendingCategory))
      HomeSectionId.trendingCategory,
  ];

  if (sections.isEmpty) {
    return const [HomeSectionId.popularLive];
  }

  return sections;
}

HomeSectionData<T> homeSectionInitial<T>() {
  return HomeSectionData<T>(
    status: HomeSectionLoadStatus.initial,
    items: <T>[],
  );
}

HomeSectionData<T> homeSectionLoading<T>() {
  return HomeSectionData<T>(
    status: HomeSectionLoadStatus.loading,
    items: <T>[],
  );
}

HomeSectionData<T> homeSectionReady<T>(List<T> items) {
  return HomeSectionData<T>(
    status: HomeSectionLoadStatus.ready,
    items: items,
  );
}

HomeSectionData<T> homeSectionFailure<T>() {
  return HomeSectionData<T>(
    status: HomeSectionLoadStatus.failure,
    items: <T>[],
  );
}

bool _enabled(int value) {
  return value != 0;
}
