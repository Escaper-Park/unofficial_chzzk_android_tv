import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/domain/entities/search_results.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/domain/repositories/search_results_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/presentation/bloc/search_results_bloc.dart';

void main() {
  test(
    'started trims query and loads channel, live, and VOD results',
    () async {
      final repository = _FakeSearchResultsRepository(
        channelPage: const SearchChannelResultsPage(
          items: [
            SearchChannelResult(
              channel: SearchChannel(
                channelId: 'channel',
                channelName: 'Channel',
                verifiedMark: false,
                followerCount: 1,
                description: '',
                openLive: false,
              ),
              content: SearchChannelContent(
                live: SearchLive(
                  liveId: 1,
                  title: 'Embedded Live',
                  concurrentUserCount: 1,
                  adult: false,
                ),
                videos: [
                  SearchVideo(
                    videoNo: 1,
                    title: 'Embedded Video',
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
            ),
          ],
        ),
        livePage: const SearchLiveResultsPage(
          items: [
            SearchLiveResult(
              live: SearchLive(
                liveId: 1,
                title: 'Live',
                concurrentUserCount: 1,
                adult: false,
              ),
            ),
            SearchLiveResult(
              live: SearchLive(
                liveId: 2,
                title: 'Live',
                concurrentUserCount: 1,
                adult: false,
              ),
            ),
          ],
        ),
        videoPage: const SearchVideoResultsPage(
          items: [
            SearchVideoResult(
              video: SearchVideo(
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
            ),
            SearchVideoResult(
              video: SearchVideo(
                videoNo: 2,
                title: 'Video',
                videoType: 'REPLAY',
                publishDate: '2026-06-13',
                duration: 30,
                readCount: 1,
                publishDateAt: 1,
                adult: false,
                livePv: 0,
              ),
            ),
          ],
        ),
      );
      final bloc = SearchResultsBloc(repository: repository)
        ..add(const SearchResultsEvent.started(query: ' game '));
      await pumpEventQueue();

      expect(bloc.state.query, 'game');
      expect(bloc.state.status, SearchResultsLoadStatus.ready);
      expect(bloc.state.channels, hasLength(1));
      expect(bloc.state.lives.map((item) => item.live?.liveId), [1, 2]);
      expect(bloc.state.videos.map((item) => item.video?.videoNo), [1, 2]);
      expect(repository.requests, [
        (
          kind: 'channels',
          keyword: 'game',
          size: 18,
          withFirstChannelContent: true,
        ),
        (
          kind: 'lives',
          keyword: 'game',
          size: 18,
          withFirstChannelContent: null,
        ),
        (
          kind: 'videos',
          keyword: 'game',
          size: 18,
          withFirstChannelContent: null,
        ),
      ]);

      await bloc.close();
    },
  );

  test('empty query becomes ready without repository requests', () async {
    final repository = _FakeSearchResultsRepository();
    final bloc = SearchResultsBloc(repository: repository)
      ..add(const SearchResultsEvent.started(query: '   '));
    await pumpEventQueue();

    expect(bloc.state.status, SearchResultsLoadStatus.ready);
    expect(bloc.state.isEmpty, isTrue);
    expect(repository.requests, isEmpty);

    await bloc.close();
  });

  test('ignores stale load completion after a newer query starts', () async {
    final oldQueryGate = Completer<void>();
    final repository = _FakeSearchResultsRepository(
      waitForKeyword: (keyword) {
        if (keyword == 'old') {
          return oldQueryGate.future;
        }

        return Future<void>.value();
      },
      channelPageForKeyword: _channelPageForKeyword,
    );
    final bloc = SearchResultsBloc(repository: repository);
    addTearDown(bloc.close);

    bloc.add(const SearchResultsEvent.started(query: 'old'));
    await pumpEventQueue();
    expect(bloc.state.query, 'old');
    expect(bloc.state.status, SearchResultsLoadStatus.loading);

    bloc.add(const SearchResultsEvent.started(query: 'new'));
    await pumpEventQueue();
    expect(bloc.state.query, 'new');
    expect(bloc.state.status, SearchResultsLoadStatus.ready);
    expect(bloc.state.channels.single.channel?.channelId, 'new');

    oldQueryGate.complete();
    await pumpEventQueue();

    expect(bloc.state.query, 'new');
    expect(bloc.state.status, SearchResultsLoadStatus.ready);
    expect(bloc.state.channels.single.channel?.channelId, 'new');
  });

  test('single section failure keeps successful result sections', () async {
    final repository = _FakeSearchResultsRepository(
      throwOnChannels: true,
      livePage: const SearchLiveResultsPage(
        items: [
          SearchLiveResult(
            live: SearchLive(
              liveId: 2,
              title: 'Live',
              concurrentUserCount: 1,
              adult: false,
            ),
          ),
        ],
      ),
      videoPage: const SearchVideoResultsPage(
        items: [
          SearchVideoResult(
            video: SearchVideo(
              videoNo: 3,
              title: 'Video',
              videoType: 'REPLAY',
              publishDate: '2026-06-13',
              duration: 30,
              readCount: 1,
              publishDateAt: 1,
              adult: false,
              livePv: 0,
            ),
          ),
        ],
      ),
    );
    final bloc = SearchResultsBloc(repository: repository)
      ..add(const SearchResultsEvent.started(query: 'game'));
    await pumpEventQueue();

    expect(bloc.state.status, SearchResultsLoadStatus.ready);
    expect(bloc.state.channels, isEmpty);
    expect(bloc.state.lives.map((item) => item.live?.liveId), [2]);
    expect(bloc.state.videos.map((item) => item.video?.videoNo), [3]);
    expect(repository.requests.map((request) => request.kind), [
      'channels',
      'lives',
      'videos',
    ]);

    await bloc.close();
  });

  test('load failure exposes failure status when all sections fail', () async {
    final repository = _FakeSearchResultsRepository(
      throwOnChannels: true,
      throwOnLives: true,
      throwOnVideos: true,
    );
    final bloc = SearchResultsBloc(repository: repository)
      ..add(const SearchResultsEvent.started(query: 'game'));
    await pumpEventQueue();

    expect(bloc.state.status, SearchResultsLoadStatus.failure);
    expect(bloc.state.isEmpty, isTrue);

    await bloc.close();
  });
}

final class _FakeSearchResultsRepository implements SearchResultsRepository {
  _FakeSearchResultsRepository({
    this.channelPage = const SearchChannelResultsPage(),
    this.livePage = const SearchLiveResultsPage(),
    this.videoPage = const SearchVideoResultsPage(),
    this.throwOnChannels = false,
    this.throwOnLives = false,
    this.throwOnVideos = false,
    this.waitForKeyword,
    this.channelPageForKeyword,
  });

  final SearchChannelResultsPage channelPage;
  final SearchLiveResultsPage livePage;
  final SearchVideoResultsPage videoPage;
  final bool throwOnChannels;
  final bool throwOnLives;
  final bool throwOnVideos;
  final Future<void> Function(String keyword)? waitForKeyword;
  final SearchChannelResultsPage Function(String keyword)?
  channelPageForKeyword;
  final requests =
      <
        ({
          String kind,
          String keyword,
          int? size,
          bool? withFirstChannelContent,
        })
      >[];

  @override
  Future<SearchChannelResultsPage> searchChannels({
    required String keyword,
    int? size,
    bool? withFirstChannelContent,
    SearchCursor? cursor,
  }) async {
    requests.add(
      (
        kind: 'channels',
        keyword: keyword,
        size: size,
        withFirstChannelContent: withFirstChannelContent,
      ),
    );
    if (throwOnChannels) {
      throw StateError('channels failed');
    }

    await _waitForKeyword(keyword);
    return channelPageForKeyword?.call(keyword) ?? channelPage;
  }

  @override
  Future<SearchLiveResultsPage> searchLives({
    required String keyword,
    int? size,
    SearchCursor? cursor,
  }) async {
    requests.add(
      (
        kind: 'lives',
        keyword: keyword,
        size: size,
        withFirstChannelContent: null,
      ),
    );
    if (throwOnLives) {
      throw StateError('lives failed');
    }

    await _waitForKeyword(keyword);
    return livePage;
  }

  @override
  Future<SearchVideoResultsPage> searchVideos({
    required String keyword,
    int? size,
    SearchCursor? cursor,
  }) async {
    requests.add(
      (
        kind: 'videos',
        keyword: keyword,
        size: size,
        withFirstChannelContent: null,
      ),
    );
    if (throwOnVideos) {
      throw StateError('videos failed');
    }

    await _waitForKeyword(keyword);
    return videoPage;
  }

  Future<void> _waitForKeyword(String keyword) async {
    final wait = waitForKeyword;
    if (wait == null) {
      return;
    }

    await wait(keyword);
  }
}

SearchChannelResultsPage _channelPageForKeyword(String keyword) {
  return SearchChannelResultsPage(
    items: [
      SearchChannelResult(
        channel: SearchChannel(
          channelId: keyword,
          channelName: keyword,
          verifiedMark: false,
          followerCount: 1,
          description: '',
          openLive: false,
        ),
      ),
    ],
  );
}
