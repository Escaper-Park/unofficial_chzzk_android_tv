import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:unofficial_chzzk_android_tv/src/app/app_theme.dart';
import 'package:unofficial_chzzk_android_tv/src/app/router/app_routes.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/entities/naver_session_cookie.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/repositories/auth_session_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/bloc/auth_session_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/domain/entities/home_live.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/domain/repositories/home_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/home_screen.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/home_screen_design.dart';
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

import '../../../test_fakes/fake_feature_repository_scope.dart';

void main() {
  testWidgets('refreshes Home after returning from live player', (
    tester,
  ) async {
    _setTvViewport(tester);
    final homeRepository = _CountingHomeRepository();

    await tester.pumpWidget(
      _HomePlayerRefreshHarness(
        homeRepository: homeRepository,
        liveRepository: const _HomeLiveRepository(lives: [_liveItem]),
        vodRepository: const _HomeVodRepository(),
      ),
    );
    await _pumpAsync(tester);

    expect(homeRepository.getTopLivesCallCount, 1);

    final scrollOffset = await _openCardAndClosePlayer(
      tester,
      cardTitle: _liveTitle,
      playerTitle: _livePlayerTitle,
    );

    expect(homeRepository.getTopLivesCallCount, 2);

    await tester.pump(HomeScreenDesign.verticalScrollDuration);
    expect(_homeScrollOffset(tester), scrollOffset);
  });

  testWidgets('refreshes Home after returning from VOD player', (
    tester,
  ) async {
    _setTvViewport(tester);
    final homeRepository = _CountingHomeRepository();

    await tester.pumpWidget(
      _HomePlayerRefreshHarness(
        homeRepository: homeRepository,
        liveRepository: const _HomeLiveRepository(),
        vodRepository: const _HomeVodRepository(vods: [_vodItem]),
      ),
    );
    await _pumpAsync(tester);

    expect(homeRepository.getTopLivesCallCount, 1);

    final scrollOffset = await _openCardAndClosePlayer(
      tester,
      cardTitle: _vodTitle,
      playerTitle: _vodPlayerTitle,
    );

    expect(homeRepository.getTopLivesCallCount, 2);

    await tester.pump(HomeScreenDesign.verticalScrollDuration);
    expect(_homeScrollOffset(tester), scrollOffset);
  });
}

Future<double> _openCardAndClosePlayer(
  WidgetTester tester, {
  required String cardTitle,
  required String playerTitle,
}) async {
  await tester.ensureVisible(find.text(cardTitle));
  await tester.pump();
  final scrollOffset = _homeScrollOffset(tester);

  await tester.tap(find.text(cardTitle));
  await _pumpAsync(tester);

  expect(find.text(playerTitle), findsOneWidget);

  await tester.tap(find.text(_closePlayerLabel));
  await _pumpAsync(tester);

  return scrollOffset;
}

double _homeScrollOffset(WidgetTester tester) {
  final scrollView = tester
      .widgetList<SingleChildScrollView>(find.byType(SingleChildScrollView))
      .singleWhere((widget) {
        return widget.controller != null &&
            widget.scrollDirection == Axis.vertical;
      });

  return scrollView.controller!.offset;
}

Future<void> _pumpAsync(WidgetTester tester) async {
  await tester.pump();
  await tester.pump();
  await tester.pump();
}

void _setTvViewport(WidgetTester tester) {
  tester.view.physicalSize = const Size(960, 540);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

class _HomePlayerRefreshHarness extends StatelessWidget {
  const _HomePlayerRefreshHarness({
    required this.homeRepository,
    required this.liveRepository,
    required this.vodRepository,
  });

  final HomeRepository homeRepository;
  final LiveRepository liveRepository;
  final VodRepository vodRepository;

  @override
  Widget build(BuildContext context) {
    return FakeFeatureRepositoryScope(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<HomeRepository>.value(value: homeRepository),
          RepositoryProvider<LiveRepository>.value(value: liveRepository),
          RepositoryProvider<VodRepository>.value(value: vodRepository),
        ],
        child: BlocProvider(
          create: (_) => AuthSessionBloc(const _FakeAuthSessionRepository()),
          child: MaterialApp.router(
            theme: AppTheme.dark(),
            routerConfig: GoRouter(
              initialLocation: AppRoute.home.path,
              routes: [
                GoRoute(
                  name: AppRoute.home.name,
                  path: AppRoute.home.path,
                  builder: (_, _) => const HomeScreen(),
                ),
                GoRoute(
                  name: AppRoute.livePlayer.name,
                  path: AppRoute.livePlayer.path,
                  builder: (_, _) => const _PlayerStub(title: _livePlayerTitle),
                ),
                GoRoute(
                  name: AppRoute.vodPlayer.name,
                  path: AppRoute.vodPlayer.path,
                  builder: (_, _) => const _PlayerStub(title: _vodPlayerTitle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayerStub extends StatelessWidget {
  const _PlayerStub({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            TextButton(
              onPressed: () => context.pop(),
              child: const Text(_closePlayerLabel),
            ),
          ],
        ),
      ),
    );
  }
}

final class _CountingHomeRepository implements HomeRepository {
  int getTopLivesCallCount = 0;

  @override
  Future<List<HomeLive>> getTopLives({int? slotSize}) async {
    getTopLivesCallCount += 1;
    return const [];
  }
}

final class _HomeLiveRepository implements LiveRepository {
  const _HomeLiveRepository({
    this.lives = const [],
  });

  final List<Live> lives;

  @override
  Future<LivePage> getLives({
    int? size,
    LiveSort? sortType,
    LiveCursor? cursor,
  }) async {
    return LivePage(items: lives);
  }

  @override
  Future<LiveStatus> getLiveStatus({
    required String channelId,
    bool? includePlayerRecommendContent,
  }) async {
    return LiveStatus(
      title: _liveTitle,
      status: 'OPEN',
      concurrentUserCount: 7,
      adult: false,
      channelId: channelId,
    );
  }

  @override
  Future<LiveDetail> getLiveDetail({required String channelId}) {
    return _unsupportedFakeOperation('LiveRepository.getLiveDetail');
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

final class _HomeVodRepository implements VodRepository {
  const _HomeVodRepository({
    this.vods = const [],
  });

  final List<Vod> vods;

  @override
  Future<VodPage> getVods({
    int? size,
    VodSort? sortType,
    VodCursor? cursor,
  }) async {
    return VodPage(items: vods);
  }

  @override
  Future<FollowingVodPage> getFollowingVods({
    int? size,
    FollowingVodCursor? cursor,
  }) async {
    return const FollowingVodPage();
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

final class _FakeAuthSessionRepository implements AuthSessionRepository {
  const _FakeAuthSessionRepository();

  @override
  Future<NaverSessionCookie?> readRequiredSessionCookie() async {
    return null;
  }

  @override
  Future<bool> clearAllCookies() async {
    return true;
  }
}

const _liveTitle = 'Refresh Live';
const _vodTitle = 'Refresh VOD';
const _livePlayerTitle = 'Live Player';
const _vodPlayerTitle = 'VOD Player';
const _closePlayerLabel = 'Close player';

const _liveItem = Live(
  liveId: 100,
  title: _liveTitle,
  concurrentUserCount: 7,
  adult: false,
  channel: LiveChannel(
    channelId: 'live-channel',
    channelName: 'Live Channel',
    verifiedMark: false,
  ),
);

const _vodItem = Vod(
  videoNo: 200,
  videoId: 'vod-video-id',
  title: _vodTitle,
  videoType: 'REPLAY',
  publishDate: '2026-06-18',
  duration: 120,
  readCount: 42,
  publishDateAt: 1781712000000,
  adult: false,
  livePv: 0,
  channel: VodChannel(
    channelId: 'vod-channel',
    channelName: 'VOD Channel',
    verifiedMark: false,
  ),
);

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
