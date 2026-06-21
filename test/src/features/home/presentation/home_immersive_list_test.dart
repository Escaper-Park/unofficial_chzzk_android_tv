import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/view/sections/immersive/home_immersive_list_exports.dart';

void main() {
  test('immersive list design matches documented values', () {
    expect(HomeImmersiveListDesign.thumbnailSize, const Size(758, 426));
    expect(HomeImmersiveListDesign.shellOverlap, 80);
    expect(HomeImmersiveListDesign.layoutHeight, 260);
    expect(HomeImmersiveListDesign.contentBlockSize, const Size(484, 220));
    expect(HomeImmersiveListDesign.horizontalPadding, 58);
    expect(HomeImmersiveListDesign.metadataTopPadding, 40);
    expect(HomeImmersiveListDesign.paginationHeight, 20);
    expect(HomeImmersiveListDesign.statusBadgeHeight, 40);
    expect(HomeImmersiveListDesign.statusBadgeGap, 8);
    expect(HomeImmersiveListDesign.statusBadgeRadius, 4);
    expect(
      HomeImmersiveListDesign.statusLiveBadgeBackgroundColor,
      AppColorTokens.liveIndicatorColor,
    );
    expect(
      HomeImmersiveListDesign.statusViewerBadgeBackgroundColor,
      const Color(0xCC000000),
    );
    expect(HomeImmersiveListDesign.badgeTitleGap, 24);
    expect(HomeImmersiveListDesign.titleSubtitleHeight, 92);
    expect(HomeImmersiveListDesign.titleSubtitleGap, 0);
    expect(HomeImmersiveListDesign.subtitleActionGap, 24);
    expect(HomeImmersiveListDesign.actionRowHeight, 40);
    expect(HomeImmersiveListDesign.actionTagGap, 12);
    expect(HomeImmersiveListDesign.contentTagGap, 8);
    expect(HomeImmersiveListDesign.contentTagRadius, 4);
    expect(HomeImmersiveListDesign.paginationLeft, 835);
    expect(
      HomeImmersiveListDesign.metadataAnimationDuration,
      const Duration(milliseconds: 220),
    );
    expect(HomeImmersiveListDesign.metadataAnimationSlideOffset, 0.10);
  });

  test('immersive list wraps item changes', () {
    expect(
      HomeImmersiveListDesign.wrappedIndex(
        currentIndex: 0,
        delta: -1,
        itemCount: 4,
      ),
      3,
    );
    expect(
      HomeImmersiveListDesign.wrappedIndex(
        currentIndex: 3,
        delta: 1,
        itemCount: 4,
      ),
      0,
    );
  });

  testWidgets('immersive list renders active item and pagination', (
    tester,
  ) async {
    await tester.pumpWidget(
      _ImmersiveHarness(
        child: HomeImmersiveList(
          items: _items,
          activeIndex: 1,
          previewPlaying: true,
          onActiveIndexChanged: (_) {},
          onActionPressed: () {},
        ),
      ),
    );

    expect(find.text('Channel 1'), findsOneWidget);
    expect(find.text('Streaming 1'), findsOneWidget);
    expect(find.byType(TvMediaChannelName), findsOneWidget);
    expect(
      tester
          .widget<TvMediaChannelName>(
            find.byType(TvMediaChannelName),
          )
          .channelName,
      'Channel 1',
    );
    expect(
      tester.widget<Text>(find.text('Channel 1')).style?.fontSize,
      Theme.of(
        tester.element(find.byType(HomeImmersiveList)),
      ).textTheme.headlineMedium?.fontSize,
    );
    expect(
      tester.getSize(_verifiedMarkImage()).height,
      Theme.of(
        tester.element(find.byType(HomeImmersiveList)),
      ).textTheme.headlineMedium?.fontSize,
    );
    expect(find.byType(TvPagination), findsOneWidget);
    expect(
      tester.getTopLeft(find.byType(TvPagination)).dx,
      HomeImmersiveListDesign.paginationLeft,
    );
    expect(
      tester.getTopLeft(find.byType(TvPagination)).dy,
      HomeImmersiveListDesign.paginationTop,
    );
    expect(
      tester.getBottomLeft(find.byType(TvPagination)).dy,
      HomeImmersiveListDesign.metadataTopPadding +
          HomeImmersiveListDesign.contentBlockSize.height,
    );
    expect(
      tester
          .getTopLeft(
            find.byWidgetPredicate(
              (widget) => widget is ColoredBox && widget.color == Colors.blue,
            ),
          )
          .dy,
      -HomeImmersiveListDesign.shellOverlap,
    );
    expect(
      _decorationForText(tester, 'LIVE').color,
      HomeImmersiveListDesign.statusLiveBadgeBackgroundColor,
    );
    expect(
      _decorationForText(tester, '1,000').color,
      HomeImmersiveListDesign.statusViewerBadgeBackgroundColor,
    );
    expect(
      _decorationForText(tester, 'LIVE').borderRadius,
      HomeImmersiveListDesign.statusBadgeBorderRadius,
    );
  });

  testWidgets('immersive list keeps the action row fixed', (tester) async {
    await tester.pumpWidget(
      _ImmersiveHarness(
        child: HomeImmersiveList(
          items: [_itemWithSubtitle('Short subtitle')],
          activeIndex: 0,
          previewPlaying: true,
          onActiveIndexChanged: (_) {},
          onActionPressed: () {},
        ),
      ),
    );

    final shortSubtitleButtonTop = _actionButtonTop(tester);

    await tester.pumpWidget(
      _ImmersiveHarness(
        child: HomeImmersiveList(
          items: [
            _itemWithSubtitle(
              'A long subtitle that wraps into two lines and must not push the '
              'watch action row down.',
            ),
          ],
          activeIndex: 0,
          previewPlaying: true,
          onActiveIndexChanged: (_) {},
          onActionPressed: () {},
        ),
      ),
    );

    expect(_actionButtonTop(tester), shortSubtitleButtonTop);
    expect(
      shortSubtitleButtonTop,
      HomeImmersiveListDesign.metadataTopPadding +
          HomeImmersiveListDesign.actionRowTop,
    );
  });

  testWidgets('immersive list animates channel name and title only', (
    tester,
  ) async {
    final animatedItems = [
      _itemWithDetails(
        index: 0,
        badges: const ['LIVE', '10'],
        tags: const ['Game', 'Tag'],
      ),
      _itemWithDetails(
        index: 1,
        badges: const ['PREVIEW', '20'],
        tags: const ['Music', 'Chat'],
      ),
    ];

    await tester.pumpWidget(
      _ImmersiveHarness(
        child: HomeImmersiveList(
          items: animatedItems,
          activeIndex: 0,
          previewPlaying: true,
          onActiveIndexChanged: (_) {},
          onActionPressed: () {},
        ),
      ),
    );
    await tester.pump();

    await tester.pumpWidget(
      _ImmersiveHarness(
        child: HomeImmersiveList(
          items: animatedItems,
          activeIndex: 1,
          previewPlaying: true,
          onActiveIndexChanged: (_) {},
          onActionPressed: () {},
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Channel 0'), findsOneWidget);
    expect(find.text('Channel 1'), findsOneWidget);
    expect(find.text('Streaming 0'), findsOneWidget);
    expect(find.text('Streaming 1'), findsOneWidget);
    expect(find.text('LIVE'), findsNothing);
    expect(find.text('10'), findsNothing);
    expect(find.text('Game'), findsNothing);
    expect(find.text('Tag'), findsNothing);
    expect(find.text('PREVIEW'), findsOneWidget);
    expect(find.text('20'), findsOneWidget);
    expect(find.text('Music'), findsOneWidget);
    expect(find.text('Chat'), findsOneWidget);
    expect(find.byType(FadeTransition), findsWidgets);
    expect(find.byType(SlideTransition), findsWidgets);

    await tester.pump(HomeImmersiveListDesign.metadataAnimationDuration);
    await tester.pump(const Duration(milliseconds: 1));

    expect(find.text('Channel 0'), findsNothing);
    expect(find.text('Channel 1'), findsOneWidget);
    expect(find.text('Streaming 0'), findsNothing);
    expect(find.text('Streaming 1'), findsOneWidget);
  });

  testWidgets('immersive list changes item with left and right keys', (
    tester,
  ) async {
    var changedIndex = -1;

    await tester.pumpWidget(
      _ImmersiveHarness(
        child: HomeImmersiveList(
          items: _items,
          activeIndex: 0,
          previewPlaying: true,
          onActiveIndexChanged: (index) => changedIndex = index,
          onActionPressed: () {},
        ),
      ),
    );
    await tester.pump();

    Focus.of(tester.element(find.text('Watch'))).requestFocus();
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(changedIndex, 1);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pump();

    expect(changedIndex, 3);
  });
}

double _actionButtonTop(WidgetTester tester) {
  return tester.getTopLeft(find.byType(FilledButton)).dy;
}

BoxDecoration _decorationForText(WidgetTester tester, String text) {
  final decoratedBox = find.ancestor(
    of: find.text(text),
    matching: find.byType(DecoratedBox),
  );

  return tester.widget<DecoratedBox>(decoratedBox).decoration as BoxDecoration;
}

Finder _verifiedMarkImage() {
  return find.descendant(
    of: find.byType(TvMediaVerifiedMark),
    matching: find.byType(Image),
  );
}

HomeImmersiveItem _itemWithSubtitle(String subtitle) {
  return HomeImmersiveItem(
    thumbnail: const ColoredBox(color: Colors.green),
    title: 'Channel',
    subtitle: subtitle,
    actionLabel: 'Watch',
    badges: const ['LIVE', '1,000'],
    contentTags: const ['Game', 'Tag'],
  );
}

HomeImmersiveItem _itemWithDetails({
  required int index,
  required List<String> badges,
  required List<String> tags,
}) {
  return HomeImmersiveItem(
    thumbnail: ColoredBox(color: index.isEven ? Colors.green : Colors.blue),
    title: 'Channel $index',
    subtitle: 'Streaming $index',
    actionLabel: 'Watch',
    badges: badges,
    contentTags: tags,
  );
}

final _items = [
  for (var index = 0; index < 4; index += 1)
    HomeImmersiveItem(
      thumbnail: ColoredBox(color: index.isEven ? Colors.green : Colors.blue),
      title: 'Channel $index',
      subtitle: 'Streaming $index',
      actionLabel: 'Watch',
      channelVerified: true,
      badges: const ['LIVE', '1,000'],
      contentTags: const ['Game', 'Tag'],
    ),
];

class _ImmersiveHarness extends StatelessWidget {
  const _ImmersiveHarness({
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
        body: SizedBox(width: 960, height: 426, child: child),
      ),
    );
  }
}
