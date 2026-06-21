import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_item.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_live.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_page.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/repositories/category_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/entities/following_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/repositories/following_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/domain/entities/home_live.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/domain/repositories/home_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/repositories/live_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_preferences_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_playback.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/repositories/vod_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/watching_history/domain/entities/watching_history.dart';
import 'package:unofficial_chzzk_android_tv/src/features/watching_history/domain/repositories/watching_history_repository.dart';

void main() {
  test('starts visible home section loads concurrently', () async {
    final calls = <String>[];
    final gates = {
      'immersive': Completer<void>(),
      'followingLive': Completer<void>(),
      'popularLive': Completer<void>(),
      'watchingHistory': Completer<void>(),
      'followingCategory': Completer<void>(),
    };
    final bloc = _homeBloc(
      calls: calls,
      gates: gates,
      preferences: const SettingsPreferences(),
    );
    addTearDown(bloc.close);

    bloc.add(const HomeEvent.started(isSignedIn: true));
    await pumpEventQueue();

    expect(bloc.state.loadStatus, HomeLoadStatus.loading);
    expect(calls, [
      'immersive',
      'followingLive',
      'popularLive',
      'watchingHistory',
      'followingCategory',
    ]);

    for (final gate in gates.values) {
      gate.complete();
    }
    await pumpEventQueue();

    expect(bloc.state.loadStatus, HomeLoadStatus.ready);
    expect(bloc.state.immersive.status, HomeSectionLoadStatus.ready);
    expect(bloc.state.followingLive.status, HomeSectionLoadStatus.ready);
    expect(bloc.state.popularLive.status, HomeSectionLoadStatus.ready);
    expect(bloc.state.watchingHistory.status, HomeSectionLoadStatus.ready);
    expect(bloc.state.followingCategory.status, HomeSectionLoadStatus.ready);
  });

  test('ignores stale refresh completion after a newer refresh wins', () async {
    final firstImmersiveGate = Completer<void>();
    final homeRepository = _FakeHomeRepository(
      calls: <String>[],
      gates: {'immersive': firstImmersiveGate},
      topLivesForCall: (callIndex) => [_homeLive(callIndex)],
    );
    final bloc = _homeBloc(
      homeRepository: homeRepository,
      preferences: const SettingsPreferences(
        generalSetting: GeneralSetting(
          showImmersive: 1,
          showFollowingLive: 0,
          showPopularLive: 0,
          showWatchingHistory: 0,
          showPopularVod: 0,
          showFollowingCategory: 0,
          showTrendingCategory: 0,
        ),
      ),
    );
    addTearDown(bloc.close);

    bloc.add(const HomeEvent.started(isSignedIn: true));
    await pumpEventQueue();
    expect(bloc.state.loadStatus, HomeLoadStatus.loading);

    homeRepository.gates.clear();
    bloc.add(const HomeEvent.refreshRequested(isSignedIn: true));
    await pumpEventQueue();

    expect(bloc.state.loadStatus, HomeLoadStatus.ready);
    expect(bloc.state.immersive.items.single.liveId, 2);

    firstImmersiveGate.complete();
    await pumpEventQueue();

    expect(bloc.state.loadStatus, HomeLoadStatus.ready);
    expect(bloc.state.immersive.items.single.liveId, 2);
  });

  test('shows section loading placeholders while refreshing', () async {
    final gates = <String, Completer<void>>{};
    final bloc = _homeBloc(gates: gates);
    addTearDown(bloc.close);

    bloc.add(const HomeEvent.started(isSignedIn: false));
    await pumpEventQueue();

    expect(bloc.state.loadStatus, HomeLoadStatus.ready);
    expect(bloc.state.popularLive.items.single.title, 'Live 1');
    expect(bloc.state.popularVod.items.single.title, 'VOD 1');

    gates['immersive'] = Completer<void>();
    bloc.add(const HomeEvent.refreshRequested(isSignedIn: false));
    await pumpEventQueue();

    expect(bloc.state.loadStatus, HomeLoadStatus.loading);
    expect(bloc.state.popularLive.status, HomeSectionLoadStatus.loading);
    expect(bloc.state.popularLive.items, isEmpty);
    expect(bloc.state.popularVod.status, HomeSectionLoadStatus.loading);
    expect(bloc.state.popularVod.items, isEmpty);

    gates['immersive']!.complete();
    await pumpEventQueue();

    expect(bloc.state.loadStatus, HomeLoadStatus.ready);
  });
}

HomeBloc _homeBloc({
  List<String>? calls,
  Map<String, Completer<void>> gates = const {},
  SettingsPreferences preferences = const SettingsPreferences(),
  HomeRepository? homeRepository,
}) {
  final sharedCalls = calls ?? <String>[];
  return HomeBloc(
    homeRepository:
        homeRepository ?? _FakeHomeRepository(calls: sharedCalls, gates: gates),
    liveRepository: _FakeLiveRepository(calls: sharedCalls, gates: gates),
    followingRepository: _FakeFollowingRepository(
      calls: sharedCalls,
      gates: gates,
    ),
    vodRepository: _FakeVodRepository(calls: sharedCalls, gates: gates),
    watchingHistoryRepository: _FakeWatchingHistoryRepository(
      calls: sharedCalls,
      gates: gates,
    ),
    categoryRepository: _FakeCategoryRepository(
      calls: sharedCalls,
      gates: gates,
    ),
    settingsPreferencesRepository: _FakeSettingsPreferencesRepository(
      preferences: preferences,
    ),
  );
}

final class _FakeHomeRepository implements HomeRepository {
  _FakeHomeRepository({
    required this.calls,
    required this.gates,
    this.topLivesForCall,
  });

  final List<String> calls;
  final Map<String, Completer<void>> gates;
  final List<HomeLive> Function(int callIndex)? topLivesForCall;
  var _topLivesCallCount = 0;

  @override
  Future<List<HomeLive>> getTopLives({int? slotSize}) async {
    calls.add('immersive');
    _topLivesCallCount += 1;
    await _waitFor(gates, 'immersive');
    return topLivesForCall?.call(_topLivesCallCount) ?? [_homeLive(1)];
  }
}

final class _FakeLiveRepository implements LiveRepository {
  _FakeLiveRepository({
    required this.calls,
    required this.gates,
  });

  final List<String> calls;
  final Map<String, Completer<void>> gates;

  @override
  Future<LivePage> getLives({
    int? size,
    LiveSort? sortType,
    LiveCursor? cursor,
  }) async {
    calls.add('popularLive');
    await _waitFor(gates, 'popularLive');
    return LivePage(items: [_live(1)]);
  }

  @override
  Future<LiveDetail> getLiveDetail({required String channelId}) {
    throw StateError('getLiveDetail is not used by HomeBloc.');
  }

  @override
  Future<LiveStatus> getLiveStatus({
    required String channelId,
    bool? includePlayerRecommendContent,
  }) {
    throw StateError('getLiveStatus is not used by HomeBloc.');
  }

  @override
  Future<void> postLiveWatchEvent({
    required String channelId,
    required int liveId,
    required String watchEventType,
    required String sessionId,
    required int eventDurationSeconds,
    required int positionSeconds,
    required int? awtSeconds,
    List<String> liveTokens = const <String>[],
    bool autoPlay = false,
    bool radioMode = false,
  }) {
    throw StateError('postLiveWatchEvent is not used by HomeBloc.');
  }
}

final class _FakeFollowingRepository implements FollowingRepository {
  _FakeFollowingRepository({
    required this.calls,
    required this.gates,
  });

  final List<String> calls;
  final Map<String, Completer<void>> gates;

  @override
  Future<FollowingChannelPage> fetchFollowingChannels({
    int? page,
    int? size,
    FollowingChannelSort? sortType,
  }) {
    throw StateError('fetchFollowingChannels is not used by HomeBloc.');
  }

  @override
  Future<FollowingLivePage> fetchFollowingLives({
    FollowingLiveSort? sortType,
  }) async {
    calls.add('followingLive');
    await _waitFor(gates, 'followingLive');
    return FollowingLivePage(items: [_followingChannel(1)]);
  }
}

final class _FakeVodRepository implements VodRepository {
  _FakeVodRepository({
    required this.calls,
    required this.gates,
  });

  final List<String> calls;
  final Map<String, Completer<void>> gates;

  @override
  Future<VodPage> getVods({
    int? size,
    VodSort? sortType,
    VodCursor? cursor,
  }) async {
    calls.add('popularVod');
    await _waitFor(gates, 'popularVod');
    return VodPage(items: [_vod(1)]);
  }

  @override
  Future<FollowingVodPage> getFollowingVods({
    int? size,
    FollowingVodCursor? cursor,
  }) {
    throw StateError('getFollowingVods is not used by HomeBloc.');
  }

  @override
  Future<VodDetail> getVodDetail({required int videoNo}) {
    throw StateError('getVodDetail is not used by HomeBloc.');
  }

  @override
  Future<VodPlayback> getPlayback({
    required String videoId,
    required String key,
  }) {
    throw StateError('getPlayback is not used by HomeBloc.');
  }

  @override
  Future<void> postVideoWatchEvent({
    required String channelId,
    required int videoNo,
    required String watchEventType,
    required int? awtSeconds,
    required int positionSeconds,
    required String sessionId,
    required int eventDurationSeconds,
    required int totalLengthSeconds,
  }) {
    throw StateError('postVideoWatchEvent is not used by HomeBloc.');
  }
}

final class _FakeWatchingHistoryRepository
    implements WatchingHistoryRepository {
  _FakeWatchingHistoryRepository({
    required this.calls,
    required this.gates,
  });

  final List<String> calls;
  final Map<String, Completer<void>> gates;

  @override
  Future<WatchingHistoryPage> fetchWatchingHistory({
    int? size,
    WatchingHistoryCursor? cursor,
  }) async {
    calls.add('watchingHistory');
    await _waitFor(gates, 'watchingHistory');
    return WatchingHistoryPage(items: [_watchingHistoryItem(1)]);
  }
}

final class _FakeCategoryRepository implements CategoryRepository {
  _FakeCategoryRepository({
    required this.calls,
    required this.gates,
  });

  final List<String> calls;
  final Map<String, Completer<void>> gates;

  @override
  Future<CategoryPage> fetchCategories({CategoryPageCursor? cursor}) async {
    calls.add('trendingCategory');
    await _waitFor(gates, 'trendingCategory');
    return CategoryPage(items: [_categoryItem('trending')]);
  }

  @override
  Future<List<CategoryItem>> fetchFollowingCategories() async {
    calls.add('followingCategory');
    await _waitFor(gates, 'followingCategory');
    return [_categoryItem('following')];
  }

  @override
  Future<CategoryInfo> fetchCategoryInfo({
    required String categoryType,
    required String categoryId,
  }) {
    throw StateError('fetchCategoryInfo is not used by HomeBloc.');
  }

  @override
  Future<CategoryLivePage> fetchCategoryLives({
    required String categoryType,
    required String categoryId,
    CategoryLiveCursor? cursor,
  }) {
    throw StateError('fetchCategoryLives is not used by HomeBloc.');
  }

  @override
  Future<CategoryVideoPage> fetchCategoryVideos({
    required String categoryType,
    required String categoryId,
    CategoryVideoCursor? cursor,
  }) {
    throw StateError('fetchCategoryVideos is not used by HomeBloc.');
  }

  @override
  Future<void> followCategory({
    required String categoryType,
    required String categoryId,
  }) {
    throw StateError('followCategory is not used by HomeBloc.');
  }

  @override
  Future<void> unfollowCategory({
    required String categoryType,
    required String categoryId,
  }) {
    throw StateError('unfollowCategory is not used by HomeBloc.');
  }
}

final class _FakeSettingsPreferencesRepository
    implements SettingsPreferencesRepository {
  const _FakeSettingsPreferencesRepository({
    required this.preferences,
  });

  final SettingsPreferences preferences;

  @override
  Future<SettingsPreferences> read() async {
    return preferences;
  }

  @override
  Future<void> save(SettingsPreferences preferences) async {}
}

Future<void> _waitFor(
  Map<String, Completer<void>> gates,
  String key,
) async {
  final gate = gates[key];
  if (gate == null) {
    return;
  }

  await gate.future;
}

HomeLive _homeLive(int id) {
  return HomeLive(
    liveId: id,
    title: 'Home live $id',
    concurrentUserCount: id,
    adult: false,
  );
}

Live _live(int id) {
  return Live(
    liveId: id,
    title: 'Live $id',
    concurrentUserCount: id,
    adult: false,
  );
}

FollowingChannel _followingChannel(int id) {
  return FollowingChannel(
    channelId: 'channel-$id',
    channelName: 'Channel $id',
    verifiedMark: false,
    openLive: true,
    liveInfo: FollowingLiveInfo(
      liveId: id,
      title: 'Following live $id',
      concurrentUserCount: id,
      adult: false,
    ),
  );
}

Vod _vod(int id) {
  return Vod(
    videoNo: id,
    videoId: 'video-$id',
    title: 'VOD $id',
    videoType: 'REPLAY',
    publishDate: '2026-06-20',
    duration: 60,
    readCount: id,
    publishDateAt: id,
    adult: false,
    livePv: 0,
  );
}

WatchingHistoryItem _watchingHistoryItem(int id) {
  return WatchingHistoryItem(
    historyNo: 'history-$id',
    channelId: 'channel-$id',
    videoNo: id,
    timeline: 10,
    contentType: 'VIDEO',
    video: WatchingHistoryVideo(
      videoNo: id,
      videoId: 'video-$id',
      title: 'History VOD $id',
      videoType: 'REPLAY',
      publishDate: '2026-06-20',
      duration: 60,
      readCount: id,
      publishDateAt: id,
      adult: false,
      livePv: 0,
    ),
  );
}

CategoryItem _categoryItem(String id) {
  return CategoryItem(
    categoryId: id,
    categoryType: 'GAME',
    title: 'Category $id',
    openLiveCount: 1,
    concurrentUserCount: 1,
  );
}
