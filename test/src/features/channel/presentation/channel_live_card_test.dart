import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/channel_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/view/sections/home/channel_live_card.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/live_card_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/view/shared/live_preview_settings.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';

void main() {
  testWidgets('uses a channel-only wide classic card layout', (tester) async {
    _setWideViewport(tester);

    await tester.pumpWidget(
      _CardHarness(
        child: ChannelLiveCard(
          item: _live(),
          onPressed: () {},
        ),
      ),
    );

    final card = tester.widget<TvCard>(find.byType(TvCard));

    expect(card.type, TvCardType.wideClassic);
    expect(card.width, ChannelScreenDesign.liveCardWidth);
    expect(ChannelScreenDesign.liveCardWidth, TvCardWidth.wideClassic);
    expect(tester.getSize(find.byType(TvCard)).width, 844);
    expect(
      ChannelScreenDesign.liveRailHeight,
      TvMediaCardDesign.thumbnailHeight(TvMediaCardDesign.width),
    );
    expect(find.byType(ProfileCircleAvatar), findsNothing);
    expect(find.text('Channel'), findsNothing);
  });

  testWidgets('keeps live badge on thumbnail and moves stats to metadata', (
    tester,
  ) async {
    _setWideViewport(tester);

    await tester.pumpWidget(
      _CardHarness(
        child: ChannelLiveCard(
          item: _live(),
          onPressed: () {},
        ),
      ),
    );

    final viewerText = LiveCardString.watchingCount('1,234');

    expect(
      find.descendant(
        of: find.byType(TvMediaThumbnail),
        matching: find.text(LiveCardString.live),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byType(TvMediaThumbnail),
        matching: find.text(viewerText),
      ),
      findsNothing,
    );
    expect(find.text(viewerText), findsOneWidget);
    expect(find.byIcon(Icons.person_rounded), findsOneWidget);
    expect(find.byIcon(Icons.schedule_rounded), findsOneWidget);
  });

  testWidgets('updates elapsed stat locally each second', (tester) async {
    _setWideViewport(tester);
    final openedAt = DateTime.utc(2026, 1, 1, 0, 0);
    var now = openedAt.add(const Duration(minutes: 5));

    await tester.pumpWidget(
      _CardHarness(
        child: ChannelLiveCard(
          item: _live(openedAt: openedAt),
          now: () => now,
          onPressed: () {},
        ),
      ),
    );

    expect(find.text('00:05:00'), findsOneWidget);

    now = now.add(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('00:05:01'), findsOneWidget);
  });

  testWidgets('focused channel live card shows preview outline progress', (
    tester,
  ) async {
    _setWideViewport(tester);

    await tester.pumpWidget(
      _CardHarness(
        child: ChannelLiveCard(
          item: _previewableLive,
          autofocus: true,
          previewSettings: _previewSettings,
          onPressed: () {},
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(
      find.byKey(const ValueKey('channel-live-preview-outline')),
      findsOneWidget,
    );
    expect(find.byType(TvProgressBar), findsNothing);

    final outline = tester.widget<CustomPaint>(
      find.byKey(const ValueKey('channel-live-preview-outline')),
    );
    expect(outline.painter, isNotNull);
  });

  testWidgets(
    'focused restricted channel live card does not start preview wait progress',
    (tester) async {
      _setWideViewport(tester);

      await tester.pumpWidget(
        _CardHarness(
          child: ChannelLiveCard(
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

Live _live({DateTime? openedAt}) {
  final openDate =
      openedAt ?? DateTime.now().subtract(const Duration(minutes: 5));

  return Live(
    liveId: 1,
    title: 'Live title',
    concurrentUserCount: 1234,
    adult: false,
    openDate: openDate.toIso8601String(),
    tags: const ['tag'],
    categoryValue: 'Game',
    channel: const LiveChannel(
      channelId: 'channel-id',
      channelName: 'Channel',
      channelImageUrl: 'https://example.invalid/profile.png',
      verifiedMark: false,
    ),
  );
}

void _setWideViewport(WidgetTester tester) {
  tester.view.physicalSize = const Size(960, 540);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
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
