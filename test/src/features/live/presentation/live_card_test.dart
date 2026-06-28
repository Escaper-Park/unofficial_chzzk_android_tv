import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/repositories/live_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/live_card_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/view/shared/live_card.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/view/shared/live_card_thumbnail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/view/shared/live_preview.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/view/shared/live_preview_settings.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/domain/use_cases/resolve_live_playback_uri.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';

void main() {
  test('live preview blocks adult blind and membership feeds', () {
    expect(canAttemptLivePreviewFromFeed(_previewableLive), isTrue);
    expect(
      canAttemptLivePreviewFromFeed(_previewableLive.copyWith(adult: true)),
      isFalse,
    );
    expect(
      canAttemptLivePreviewFromFeed(
        _previewableLive.copyWith(blindType: 'SOME_BLIND'),
      ),
      isFalse,
    );
    expect(
      canAttemptLivePreviewFromFeed(
        _previewableLive.copyWith(membershipBenefitType: 'MEMBER_ONLY'),
      ),
      isFalse,
    );
  });

  testWidgets('live card renders feed metadata and calls action', (
    tester,
  ) async {
    var pressed = 0;

    await tester.pumpWidget(
      _CardHarness(
        child: LiveCard(
          item: const Live(
            liveId: 10,
            title: 'Live title',
            concurrentUserCount: 1234,
            adult: false,
            tags: ['tag'],
            categoryValue: 'Game',
            watchPartyTag: 'party',
            watchPartyType: 'Normal',
            channel: LiveChannel(
              channelId: 'channel-id',
              channelName: 'Channel',
              verifiedMark: false,
            ),
          ),
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.text('Live title'));

    expect(pressed, 1);
    expect(find.text(LiveCardString.live), findsOneWidget);
    expect(find.text(LiveCardString.watchingCount('1,234')), findsOneWidget);
    expect(find.text('Channel'), findsOneWidget);
    expect(find.text('Game'), findsOneWidget);
    expect(find.text(LiveCardString.watchParty), findsOneWidget);
    expect(find.text('party'), findsOneWidget);

    final thumbnail = tester.widget<TvMediaThumbnail>(
      find.byType(TvMediaThumbnail),
    );
    expect(thumbnail.restrictionAssetPath, isNull);
  });

  testWidgets(
    'live uptime badge keeps initial elapsed while card remains mounted',
    (
      tester,
    ) async {
      var now = DateTime(2026, 6, 20, 12, 0, 5);
      final openDate = now
          .subtract(const Duration(seconds: 5))
          .toIso8601String();

      await tester.pumpWidget(
        _CardHarness(
          child: LiveCardThumbnail(
            item: _liveWithOpenDate(openDate),
            now: () => now,
          ),
        ),
      );
      await tester.pump();

      final initialElapsed = _elapsedDuration(_singleElapsedText(tester));
      now = now.add(const Duration(seconds: 1));

      await tester.pump(const Duration(milliseconds: 1100));

      expect(
        _elapsedDuration(_singleElapsedText(tester)),
        initialElapsed,
      );

      await tester.pumpWidget(const SizedBox.shrink());
    },
  );

  testWidgets('live card uses abroad restriction asset only for ABROAD blind', (
    tester,
  ) async {
    await tester.pumpWidget(
      _CardHarness(
        child: LiveCard(
          item: const Live(
            liveId: 10,
            title: 'Live title',
            concurrentUserCount: 1234,
            adult: true,
            blindType: 'ABROAD',
          ),
          onPressed: () {},
        ),
      ),
    );

    final thumbnail = tester.widget<TvMediaThumbnail>(
      find.byType(TvMediaThumbnail),
    );
    expect(
      thumbnail.restrictionAssetPath,
      TvMediaCardDesign.abroadRestrictionAsset,
    );
  });

  testWidgets(
    'live card uses age restriction overlay when adult image exists',
    (
      tester,
    ) async {
      await tester.pumpWidget(
        _CardHarness(
          child: LiveCard(
            item: const Live(
              liveId: 10,
              title: 'Live title',
              thumbnailImageUrl: 'https://example.com/live.png',
              concurrentUserCount: 1234,
              adult: true,
            ),
            onPressed: () {},
          ),
        ),
      );

      final thumbnail = tester.widget<TvMediaThumbnail>(
        find.byType(TvMediaThumbnail),
      );
      final thumbnailUrl = Uri.parse(thumbnail.imageUrl!);
      expect(
        '${thumbnailUrl.origin}${thumbnailUrl.path}',
        'https://example.com/live.png',
      );
      expect(
        int.parse(thumbnailUrl.queryParameters['date']!) % 30000,
        0,
      );
      expect(thumbnail.restrictionAssetPath, isNull);
      expect(thumbnail.showAgeRestrictionOverlay, isTrue);
    },
  );

  testWidgets(
    'live card uses age restriction asset when adult image is missing',
    (
      tester,
    ) async {
      await tester.pumpWidget(
        _CardHarness(
          child: LiveCard(
            item: const Live(
              liveId: 10,
              title: 'Live title',
              concurrentUserCount: 1234,
              adult: true,
            ),
            onPressed: () {},
          ),
        ),
      );

      final thumbnail = tester.widget<TvMediaThumbnail>(
        find.byType(TvMediaThumbnail),
      );
      expect(
        thumbnail.restrictionAssetPath,
        TvMediaCardDesign.ageRestrictionAsset,
      );
      expect(thumbnail.showAgeRestrictionOverlay, isTrue);
    },
  );

  testWidgets('live card renders watch party plus for non-normal type', (
    tester,
  ) async {
    await tester.pumpWidget(
      _CardHarness(
        child: LiveCard(
          item: const Live(
            liveId: 10,
            title: 'Live title',
            concurrentUserCount: 1234,
            adult: false,
            watchPartyTag: 'party',
            watchPartyType: 'RS',
          ),
          onPressed: () {},
        ),
      ),
    );

    expect(find.text(LiveCardString.watchPartyPlus), findsOneWidget);
    expect(find.text(LiveCardString.watchParty), findsNothing);
    expect(find.text('party'), findsOneWidget);
  });

  testWidgets(
    'live card de-duplicates watch party tag with watch party style',
    (
      tester,
    ) async {
      await tester.pumpWidget(
        _CardHarness(
          child: LiveCard(
            item: const Live(
              liveId: 10,
              title: 'Live title',
              concurrentUserCount: 1234,
              adult: false,
              tags: ['party', 'tag'],
              watchPartyTag: 'party',
              watchPartyType: 'RS',
            ),
            onPressed: () {},
          ),
        ),
      );

      expect(find.text('party'), findsOneWidget);
      expect(find.text('tag'), findsOneWidget);

      final partyBadge = tester.widget<TvMediaBadge>(
        find.ancestor(
          of: find.text('party'),
          matching: find.byType(TvMediaBadge),
        ),
      );
      expect(partyBadge.outlined, isTrue);
      expect(partyBadge.borderColor, AppColorTokens.brandColor);
      expect(partyBadge.textColor, AppColorTokens.brandColor);
    },
  );

  testWidgets('live card hides watch party when type is missing', (
    tester,
  ) async {
    await tester.pumpWidget(
      _CardHarness(
        child: LiveCard(
          item: const Live(
            liveId: 10,
            title: 'Live title',
            concurrentUserCount: 1234,
            adult: false,
            watchPartyTag: 'party',
          ),
          onPressed: () {},
        ),
      ),
    );

    expect(find.text(LiveCardString.watchParty), findsNothing);
    expect(find.text(LiveCardString.watchPartyPlus), findsNothing);
    expect(find.text('party'), findsNothing);
  });

  testWidgets('focused live card shows preview wait progress', (tester) async {
    await tester.pumpWidget(
      _CardHarness(
        child: LiveCard(
          item: _previewableLive,
          autofocus: true,
          previewSettings: _previewSettings,
          onPressed: () {},
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(TvProgressBar), findsOneWidget);

    final progress = tester.widget<TvProgressBar>(find.byType(TvProgressBar));
    expect(progress.value, greaterThan(0));
    expect(progress.value, lessThan(1));
  });

  testWidgets('live card preview does not post watch events', (tester) async {
    final repository = _TrackingLiveRepository();

    await tester.pumpWidget(
      _PreviewRepositoryHarness(
        liveRepository: repository,
        child: _CardHarness(
          child: LiveCard(
            item: _previewableLive,
            autofocus: true,
            previewSettings: _immediatePreviewSettings,
            onPressed: () {},
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(repository.liveDetailCallCount, 1);
    expect(repository.watchEventCallCount, 0);
  });

  testWidgets(
    'focused restricted live card does not start preview wait progress',
    (tester) async {
      await tester.pumpWidget(
        _CardHarness(
          child: LiveCard(
            item: _previewableLive.copyWith(
              membershipBenefitType: 'MEMBER_ONLY',
            ),
            autofocus: true,
            previewSettings: _previewSettings,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(TvProgressBar), findsNothing);
    },
  );

  testWidgets('live preview listenable isolates progress rebuilds', (
    tester,
  ) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    var previewBuilderCalls = 0;
    var progressBuilderCalls = 0;
    double? latestProgress;

    await tester.pumpWidget(
      _CardHarness(
        child: LivePreviewListenable(
          item: _previewableLive,
          focusNode: focusNode,
          settings: _previewSettings,
          builder: (context, previewState) {
            previewBuilderCalls += 1;

            return Focus(
              focusNode: focusNode,
              child: ValueListenableBuilder(
                valueListenable: previewState,
                builder: (context, state, _) {
                  progressBuilderCalls += 1;
                  latestProgress = state.waitProgress;
                  return const SizedBox.shrink();
                },
              ),
            );
          },
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump();

    final previewCallsAfterFocus = previewBuilderCalls;
    final progressCallsAfterFocus = progressBuilderCalls;
    final progressAfterFocus = latestProgress;

    await tester.pump(const Duration(milliseconds: 60));

    expect(previewBuilderCalls, previewCallsAfterFocus);
    expect(progressBuilderCalls, greaterThan(progressCallsAfterFocus));
    expect(latestProgress, greaterThan(progressAfterFocus ?? 0));

    await tester.pumpWidget(const SizedBox.shrink());
  });
}

const _previewableLive = Live(
  liveId: 10,
  title: 'Live title',
  concurrentUserCount: 1234,
  adult: false,
  channel: LiveChannel(
    channelId: 'channel-id',
    channelName: 'Channel',
    verifiedMark: false,
  ),
);

const _previewSettings = LivePreviewSettings(
  enabled: true,
  audioEnabled: false,
  waitDuration: Duration(seconds: 5),
  playbackDuration: Duration(seconds: 10),
  resolutionIndex: 0,
  videoViewType: PlayerVideoViewType.textureView,
);

const _immediatePreviewSettings = LivePreviewSettings(
  enabled: true,
  audioEnabled: false,
  waitDuration: Duration.zero,
  playbackDuration: Duration(seconds: 10),
  resolutionIndex: 0,
  videoViewType: PlayerVideoViewType.textureView,
);

Live _liveWithOpenDate(String openDate) {
  return Live(
    liveId: 10,
    title: 'Live title',
    openDate: openDate,
    concurrentUserCount: 1234,
    adult: false,
    tags: const ['tag'],
    categoryValue: 'Game',
    channel: const LiveChannel(
      channelId: 'channel-id',
      channelName: 'Channel',
      verifiedMark: false,
    ),
  );
}

class _PreviewRepositoryHarness extends StatelessWidget {
  const _PreviewRepositoryHarness({
    required this.liveRepository,
    required this.child,
  });

  final LiveRepository liveRepository;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LiveRepository>.value(value: liveRepository),
        RepositoryProvider<LoadLivePlaybackPlaylistText>.value(
          value: _emptyPlaylist,
        ),
      ],
      child: child,
    );
  }
}

class _CardHarness extends StatelessWidget {
  const _CardHarness({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColorTokens.brandColor,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        body: Center(child: child),
      ),
    );
  }
}

final class _TrackingLiveRepository implements LiveRepository {
  int liveDetailCallCount = 0;
  int watchEventCallCount = 0;

  @override
  Future<LiveDetail> getLiveDetail({required String channelId}) async {
    liveDetailCallCount += 1;
    return LiveDetail(
      liveId: _previewableLive.liveId,
      title: _previewableLive.title,
      status: 'OPEN',
      concurrentUserCount: _previewableLive.concurrentUserCount,
      adult: false,
      channel: _previewableLive.channel,
    );
  }

  @override
  Future<LivePage> getLives({
    int? size,
    LiveSort? sortType,
    LiveCursor? cursor,
  }) async {
    return const LivePage();
  }

  @override
  Future<LiveStatus> getLiveStatus({
    required String channelId,
    bool? includePlayerRecommendContent,
  }) {
    throw UnsupportedError('_TrackingLiveRepository.getLiveStatus');
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
  }) async {
    watchEventCallCount += 1;
  }
}

Future<String> _emptyPlaylist({required Uri playlistUri}) async {
  return '';
}

String _singleElapsedText(WidgetTester tester) {
  final elapsedTexts = tester
      .widgetList<Text>(find.byType(Text))
      .map((text) => text.data)
      .whereType<String>()
      .where((value) => RegExp(r'^\d{2}:\d{2}:\d{2}$').hasMatch(value))
      .toList();

  expect(elapsedTexts, hasLength(1));
  return elapsedTexts.single;
}

Duration _elapsedDuration(String value) {
  final parts = value.split(':').map(int.parse).toList();
  return Duration(
    hours: parts[0],
    minutes: parts[1],
    seconds: parts[2],
  );
}
