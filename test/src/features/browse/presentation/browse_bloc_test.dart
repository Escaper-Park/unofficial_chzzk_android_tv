import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/browse/presentation/bloc/browse_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/repositories/live_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_playback.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/repositories/vod_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/watching_history/domain/entities/watching_history.dart';
import 'package:unofficial_chzzk_android_tv/src/features/watching_history/domain/repositories/watching_history_repository.dart';

void main() {
  test(
    'started loads Live tab with POPULAR sort for signed-out users',
    () async {
      final liveRepository = _FakeLiveRepository(
        livePages: [
          LivePage(items: [_live(1)]),
        ],
      );
      final bloc = _createBloc(liveRepository: liveRepository)
        ..add(const BrowseEvent.started(isSignedIn: false));
      await pumpEventQueue();

      expect(bloc.state.isSignedIn, false);
      expect(bloc.state.selectedTab, BrowseTab.live);
      expect(bloc.state.live.status, BrowseLoadStatus.ready);
      expect(bloc.state.live.items.single.title, 'Live 1');
      expect(liveRepository.calls.single.sortType, LiveSort.popular);

      await bloc.close();
    },
  );

  test('live sort reloads with LATEST sort', () async {
    final liveRepository = _FakeLiveRepository(
      livePages: [
        LivePage(items: [_live(1)]),
        LivePage(items: [_live(2)]),
      ],
    );
    final bloc = _createBloc(liveRepository: liveRepository)
      ..add(const BrowseEvent.started(isSignedIn: true));
    await pumpEventQueue();

    bloc.add(
      const BrowseEvent.liveSortSelected(BrowseLiveSortOption.latest),
    );
    await pumpEventQueue();

    expect(bloc.state.liveSortOption, BrowseLiveSortOption.latest);
    expect(bloc.state.live.items.single.title, 'Live 2');
    expect(
      [for (final call in liveRepository.calls) call.sortType],
      [
        LiveSort.popular,
        LiveSort.latest,
      ],
    );

    await bloc.close();
  });

  test(
    'signed-out following VOD filter shows auth guidance without loading',
    () async {
      final vodRepository = _FakeVodRepository();
      final bloc = _createBloc(vodRepository: vodRepository)
        ..add(const BrowseEvent.started(isSignedIn: false));
      await pumpEventQueue();

      bloc.add(
        const BrowseEvent.vodSortSelected(BrowseVodSortOption.following),
      );
      await pumpEventQueue();

      expect(bloc.state.selectedTab, BrowseTab.vod);
      expect(bloc.state.selectedContentRequiresAuth, true);
      expect(bloc.state.vod.status, BrowseLoadStatus.initial);
      expect(vodRepository.followingCalls, isEmpty);

      await bloc.close();
    },
  );

  test(
    'signed-in following VOD filter loads following repository data',
    () async {
      final vodRepository = _FakeVodRepository(
        followingPages: [
          FollowingVodPage(items: [_vod(1)]),
        ],
      );
      final bloc = _createBloc(vodRepository: vodRepository)
        ..add(const BrowseEvent.started(isSignedIn: true));
      await pumpEventQueue();

      bloc.add(
        const BrowseEvent.vodSortSelected(BrowseVodSortOption.following),
      );
      await pumpEventQueue();

      expect(bloc.state.vod.status, BrowseLoadStatus.ready);
      expect(bloc.state.vod.items.single.title, 'Vod 1');
      expect(vodRepository.followingCalls.single.size, 18);

      await bloc.close();
    },
  );

  test('watching history filter maps history items to VOD cards', () async {
    final watchingHistoryRepository = _FakeWatchingHistoryRepository(
      pages: [
        WatchingHistoryPage(
          items: [
            WatchingHistoryItem(
              historyNo: 'history',
              channelId: 'channel',
              videoNo: 1,
              timeline: 42,
              contentType: 'VIDEO',
              video: _historyVideo(1),
            ),
          ],
        ),
      ],
    );
    final bloc = _createBloc(
      watchingHistoryRepository: watchingHistoryRepository,
    )..add(const BrowseEvent.started(isSignedIn: true));
    await pumpEventQueue();

    bloc.add(
      const BrowseEvent.vodSortSelected(BrowseVodSortOption.watchingHistory),
    );
    await pumpEventQueue();

    expect(bloc.state.vod.status, BrowseLoadStatus.ready);
    expect(bloc.state.vod.items.single.title, 'History Vod 1');
    expect(bloc.state.vod.items.single.watchTimeline, 42);
    expect(watchingHistoryRepository.calls.single.size, 18);

    await bloc.close();
  });

  test(
    'load more appends Live items and emits no-more feedback at the end',
    () async {
      const cursor = LiveCursor(concurrentUserCount: 10, liveId: 1);
      final liveRepository = _FakeLiveRepository(
        livePages: [
          LivePage(items: [_live(1)], cursor: cursor),
          LivePage(items: [_live(2)]),
        ],
      );
      final bloc = _createBloc(liveRepository: liveRepository)
        ..add(const BrowseEvent.started(isSignedIn: true));
      await pumpEventQueue();

      bloc.add(const BrowseEvent.loadMoreRequested());
      await pumpEventQueue();

      expect(
        [for (final item in bloc.state.live.items) item.title],
        [
          'Live 1',
          'Live 2',
        ],
      );
      expect(liveRepository.calls.last.cursor, cursor);
      expect(
        bloc.state.live.paginationStatus,
        BrowsePaginationStatus.exhausted,
      );
      expect(bloc.state.feedbackType, BrowseFeedbackType.noMoreData);

      await bloc.close();
    },
  );
}

BrowseBloc _createBloc({
  _FakeLiveRepository? liveRepository,
  _FakeVodRepository? vodRepository,
  _FakeWatchingHistoryRepository? watchingHistoryRepository,
}) {
  return BrowseBloc(
    liveRepository: liveRepository ?? _FakeLiveRepository(),
    vodRepository: vodRepository ?? _FakeVodRepository(),
    watchingHistoryRepository:
        watchingHistoryRepository ?? _FakeWatchingHistoryRepository(),
  );
}

Live _live(int id) {
  return Live(
    liveId: id,
    title: 'Live $id',
    concurrentUserCount: id,
    adult: false,
    channel: LiveChannel(
      channelId: 'live-channel-$id',
      channelName: 'Live Channel $id',
      verifiedMark: false,
    ),
  );
}

Vod _vod(int id) {
  return Vod(
    videoNo: id,
    title: 'Vod $id',
    videoType: 'REPLAY',
    publishDate: '2026-06-13',
    duration: 60,
    readCount: id,
    publishDateAt: id,
    adult: false,
    livePv: 0,
  );
}

WatchingHistoryVideo _historyVideo(int id) {
  return WatchingHistoryVideo(
    videoNo: id,
    title: 'History Vod $id',
    videoType: 'REPLAY',
    publishDate: '2026-06-13',
    duration: 60,
    readCount: id,
    publishDateAt: id,
    adult: false,
    livePv: 0,
  );
}

final class _FakeLiveRepository implements LiveRepository {
  _FakeLiveRepository({
    this.livePages = const [LivePage()],
  });

  final List<LivePage> livePages;
  final calls = <_LiveCall>[];
  int _callIndex = 0;

  @override
  Future<LivePage> getLives({
    int? size,
    LiveSort? sortType,
    LiveCursor? cursor,
  }) async {
    calls.add(_LiveCall(size: size, sortType: sortType, cursor: cursor));
    return livePages[_callIndex++ % livePages.length];
  }

  @override
  Future<LiveDetail> getLiveDetail({required String channelId}) {
    return _unsupportedFakeOperation('LiveRepository.getLiveDetail');
  }

  @override
  Future<LiveStatus> getLiveStatus({
    required String channelId,
    bool? includePlayerRecommendContent,
  }) {
    return _unsupportedFakeOperation('LiveRepository.getLiveStatus');
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
  }) async {}
}

final class _FakeVodRepository implements VodRepository {
  _FakeVodRepository({
    this.followingPages = const [FollowingVodPage()],
  });

  final List<VodPage> vodPages = const [VodPage()];
  final List<FollowingVodPage> followingPages;
  final vodCalls = <_VodCall>[];
  final followingCalls = <_FollowingVodCall>[];
  int _vodCallIndex = 0;
  int _followingCallIndex = 0;

  @override
  Future<VodPage> getVods({
    int? size,
    VodSort? sortType,
    VodCursor? cursor,
  }) async {
    vodCalls.add(_VodCall(size: size, sortType: sortType, cursor: cursor));
    return vodPages[_vodCallIndex++ % vodPages.length];
  }

  @override
  Future<FollowingVodPage> getFollowingVods({
    int? size,
    FollowingVodCursor? cursor,
  }) async {
    followingCalls.add(_FollowingVodCall(size: size, cursor: cursor));
    return followingPages[_followingCallIndex++ % followingPages.length];
  }

  @override
  Future<VodDetail> getVodDetail({required int videoNo}) {
    return _unsupportedFakeOperation('VodRepository.getVodDetail');
  }

  @override
  Future<VodPlayback> getPlayback({
    required String videoId,
    required String key,
  }) {
    return _unsupportedFakeOperation('VodRepository.getPlayback');
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
  }) async {}
}

final class _FakeWatchingHistoryRepository
    implements WatchingHistoryRepository {
  _FakeWatchingHistoryRepository({
    this.pages = const [WatchingHistoryPage()],
  });

  final List<WatchingHistoryPage> pages;
  final calls = <_WatchingHistoryCall>[];
  int _callIndex = 0;

  @override
  Future<WatchingHistoryPage> fetchWatchingHistory({
    int? size,
    WatchingHistoryCursor? cursor,
  }) async {
    calls.add(_WatchingHistoryCall(size: size, cursor: cursor));
    return pages[_callIndex++ % pages.length];
  }
}

final class _LiveCall {
  const _LiveCall({
    required this.size,
    required this.sortType,
    required this.cursor,
  });

  final int? size;
  final LiveSort? sortType;
  final LiveCursor? cursor;
}

final class _VodCall {
  const _VodCall({
    required this.size,
    required this.sortType,
    required this.cursor,
  });

  final int? size;
  final VodSort? sortType;
  final VodCursor? cursor;
}

final class _FollowingVodCall {
  const _FollowingVodCall({
    required this.size,
    required this.cursor,
  });

  final int? size;
  final FollowingVodCursor? cursor;
}

final class _WatchingHistoryCall {
  const _WatchingHistoryCall({
    required this.size,
    required this.cursor,
  });

  final int? size;
  final WatchingHistoryCursor? cursor;
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
