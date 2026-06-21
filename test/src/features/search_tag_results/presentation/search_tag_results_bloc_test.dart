import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/domain/entities/search_tag_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/domain/repositories/search_tag_results_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/presentation/bloc/search_tag_results_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';

void main() {
  test('started normalizes tag and loads popular live results', () async {
    final repository = _FakeSearchTagResultsRepository(
      livePage: const SearchTagLivePage(
        items: [
          SearchTagLive(
            liveId: 1,
            title: 'Live',
            concurrentUserCount: 10,
            adult: false,
          ),
        ],
        cursor: SearchTagLiveCursor(liveId: 1),
      ),
    );
    final bloc = SearchTagResultsBloc(repository: repository)
      ..add(const SearchTagResultsEvent.started(tag: '#game'));
    await pumpEventQueue();

    expect(bloc.state.tag, 'game');
    expect(bloc.state.live.status, SearchTagResultsLoadStatus.ready);
    expect(bloc.state.live.items, hasLength(1));
    expect(repository.liveRequests, [
      (tag: 'game', sortType: LiveSort.popular),
    ]);

    await bloc.close();
  });

  test('VOD latest sort loads latest VOD results', () async {
    final repository = _FakeSearchTagResultsRepository(
      videoPage: const SearchTagVideoPage(
        items: [
          SearchTagVideo(
            videoNo: 1,
            title: 'Video',
            videoType: 'REPLAY',
            publishDate: '2026-06-13',
            duration: 30,
            readCount: 1,
            publishDateAt: 1,
            adult: false,
            livePv: 0,
          ),
        ],
      ),
    );
    final bloc = SearchTagResultsBloc(repository: repository)
      ..add(const SearchTagResultsEvent.started(tag: 'game'));
    await pumpEventQueue();
    bloc.add(
      const SearchTagResultsEvent.vodSortSelected(
        SearchTagResultsVodSortOption.latest,
      ),
    );
    await pumpEventQueue();

    expect(bloc.state.selectedTab, SearchTagResultsTab.vod);
    expect(bloc.state.vodSortOption, SearchTagResultsVodSortOption.latest);
    expect(bloc.state.vod.status, SearchTagResultsLoadStatus.ready);
    expect(repository.videoRequests, [
      (tag: 'game', sortType: VodSort.latest),
    ]);

    await bloc.close();
  });

  test(
    'ignores stale live sort completion after a newer sort starts',
    () async {
      final popularGate = Completer<void>();
      final repository = _FakeSearchTagResultsRepository(
        waitForLiveSort: (sortType) {
          if (sortType == LiveSort.popular) {
            return popularGate.future;
          }

          return Future<void>.value();
        },
        livePageForSort: (sortType) => _livePage(
          sortType == LiveSort.latest ? 2 : 1,
        ),
      );
      final bloc = SearchTagResultsBloc(repository: repository);
      addTearDown(bloc.close);

      bloc.add(const SearchTagResultsEvent.started(tag: '#game'));
      await pumpEventQueue();
      expect(bloc.state.live.status, SearchTagResultsLoadStatus.loading);

      bloc.add(
        const SearchTagResultsEvent.liveSortSelected(
          SearchTagResultsLiveSortOption.latest,
        ),
      );
      await pumpEventQueue();
      expect(bloc.state.liveSortOption, SearchTagResultsLiveSortOption.latest);
      expect(bloc.state.live.status, SearchTagResultsLoadStatus.ready);
      expect(bloc.state.live.items.single.liveId, 2);

      popularGate.complete();
      await pumpEventQueue();

      expect(bloc.state.liveSortOption, SearchTagResultsLiveSortOption.latest);
      expect(bloc.state.live.status, SearchTagResultsLoadStatus.ready);
      expect(bloc.state.live.items.single.liveId, 2);
    },
  );
}

final class _FakeSearchTagResultsRepository
    implements SearchTagResultsRepository {
  _FakeSearchTagResultsRepository({
    this.livePage = const SearchTagLivePage(),
    this.videoPage = const SearchTagVideoPage(),
    this.waitForLiveSort,
    this.livePageForSort,
  });

  final SearchTagLivePage livePage;
  final SearchTagVideoPage videoPage;
  final Future<void> Function(LiveSort? sortType)? waitForLiveSort;
  final SearchTagLivePage Function(LiveSort? sortType)? livePageForSort;
  final liveRequests = <({String tag, LiveSort? sortType})>[];
  final videoRequests = <({String tag, VodSort? sortType})>[];

  @override
  Future<SearchTagLivePage> searchTagLives({
    required String tag,
    int? size,
    LiveSort? sortType,
    SearchTagLiveCursor? cursor,
  }) async {
    liveRequests.add((tag: tag, sortType: sortType));
    final wait = waitForLiveSort;
    if (wait != null) {
      await wait(sortType);
    }

    return livePageForSort?.call(sortType) ?? livePage;
  }

  @override
  Future<SearchTagVideoPage> searchTagVideos({
    required String tag,
    int? size,
    VodSort? sortType,
    SearchTagVideoCursor? cursor,
  }) async {
    videoRequests.add((tag: tag, sortType: sortType));
    return videoPage;
  }
}

SearchTagLivePage _livePage(int liveId) {
  return SearchTagLivePage(
    items: [
      SearchTagLive(
        liveId: liveId,
        title: 'Live $liveId',
        concurrentUserCount: 10,
        adult: false,
      ),
    ],
  );
}
