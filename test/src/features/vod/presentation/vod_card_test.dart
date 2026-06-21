import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/presentation/view/shared/vod_card.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/presentation/vod_card_string.dart';

void main() {
  testWidgets('vod card renders feed info and thumbnail metadata', (
    tester,
  ) async {
    var pressed = 0;

    await tester.pumpWidget(
      _CardHarness(
        child: VodCard(
          item: Vod(
            videoNo: 20,
            title: 'VOD title',
            videoType: 'REPLAY',
            publishDate: '2026-06-01 12:00:00',
            duration: 120,
            readCount: 1234,
            publishDateAt: DateTime.now()
                .subtract(const Duration(hours: 2))
                .millisecondsSinceEpoch,
            categoryValue: 'Game',
            adult: false,
            livePv: 9208,
            tags: const ['tag'],
            channel: const VodChannel(
              channelId: 'channel-id',
              channelName: 'Channel',
              verifiedMark: false,
            ),
            watchTimeline: 30,
          ),
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.text('VOD title'));

    expect(pressed, 1);
    expect(find.text(VodCardString.replay), findsOneWidget);
    expect(find.text(VodCardString.watchedLive('9천회')), findsOneWidget);
    expect(find.text('00:02:00'), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);
    expect(find.text('1,234'), findsOneWidget);
    expect(find.byIcon(Icons.calendar_month_rounded), findsOneWidget);
    expect(find.text('2026-06-01'), findsOneWidget);
    expect(find.text('2시간 전'), findsOneWidget);
    expect(find.text('Channel'), findsOneWidget);
    expect(find.text('Game'), findsOneWidget);
    expect(find.text('tag'), findsOneWidget);

    final thumbnail = tester.widget<TvMediaThumbnail>(
      find.byType(TvMediaThumbnail),
    );
    expect(thumbnail.restrictionAssetPath, isNull);
  });

  testWidgets('vod card uses abroad restriction asset only for ABROAD blind', (
    tester,
  ) async {
    await tester.pumpWidget(
      _CardHarness(
        child: VodCard(
          item: Vod(
            videoNo: 20,
            title: 'VOD title',
            videoType: 'REPLAY',
            publishDate: '2026-06-01 12:00:00',
            duration: 120,
            readCount: 1234,
            publishDateAt: DateTime.now().millisecondsSinceEpoch,
            adult: true,
            livePv: 0,
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

  testWidgets('vod card uses age restriction overlay when adult image exists', (
    tester,
  ) async {
    await tester.pumpWidget(
      _CardHarness(
        child: VodCard(
          item: Vod(
            videoNo: 20,
            title: 'VOD title',
            videoType: 'REPLAY',
            publishDate: '2026-06-01 12:00:00',
            thumbnailImageUrl: 'https://example.com/vod.png',
            duration: 120,
            readCount: 1234,
            publishDateAt: DateTime.now().millisecondsSinceEpoch,
            adult: true,
            livePv: 0,
          ),
          onPressed: () {},
        ),
      ),
    );

    final thumbnail = tester.widget<TvMediaThumbnail>(
      find.byType(TvMediaThumbnail),
    );
    expect(thumbnail.imageUrl, 'https://example.com/vod.png');
    expect(thumbnail.restrictionAssetPath, isNull);
    expect(thumbnail.showAgeRestrictionOverlay, isTrue);
  });

  testWidgets(
    'vod card uses age restriction asset when adult image is missing',
    (
      tester,
    ) async {
      await tester.pumpWidget(
        _CardHarness(
          child: VodCard(
            item: Vod(
              videoNo: 20,
              title: 'VOD title',
              videoType: 'REPLAY',
              publishDate: '2026-06-01 12:00:00',
              duration: 120,
              readCount: 1234,
              publishDateAt: DateTime.now().millisecondsSinceEpoch,
              adult: true,
              livePv: 0,
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
