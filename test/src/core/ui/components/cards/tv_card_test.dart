import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  test('card tokens match documented values', () {
    expect(TvCardWidth.one.value, 844);
    expect(TvCardWidth.wideClassic.value, 844);
    expect(TvCardWidth.two.value, 412);
    expect(TvCardWidth.three.value, 268);
    expect(TvCardWidth.four.value, 196);
    expect(TvCardWidth.six.value, 124);
    expect(TvCardThumbnailRatio.ratio16x9.value, 16 / 9);
    expect(TvCardThumbnailRatio.ratio1x1.value, 1);
    expect(TvCardThumbnailRatio.ratio2x3.value, 2 / 3);
    expect(TvCardThumbnailRatio.ratio3x4.value, 3 / 4);
    expect(TvCardElevation.level1.value, 2);
    expect(TvCardElevation.level5.value, 24);
    expect(TvCardOutlineWidth.thin.value, 1);
    expect(TvCardOutlineWidth.thick.value, 2);
  });

  test('card design matches documented defaults', () {
    final design = TvCardDesign.defaults(
      focusedScale: TvFocusedScale.md,
      focusedElevation: TvCardElevation.level3,
    );

    expect(design.radius, TvRadius.md.borderRadius);
    expect(design.imageContentGap, 8);
    expect(design.classicContentPadding, const EdgeInsets.all(12));
    expect(design.compactPadding, const EdgeInsets.all(12));
    expect(design.contentGap, 8);
    expect(design.titleSubtitleHeight, 40);
    expect(design.extrasHeight, 24);
    expect(design.backgroundColor, isNull);
    expect(design.focusOutlineColor, AppColorTokens.brandColor);
    expect(design.focusOutlineWidth, 2);
    expect(design.focusedScale, TvFocusedScale.md.value);
    expect(design.focusedElevation, TvCardElevation.level3.value);
    expect(design.focusedShadowColor, isNull);
  });

  test('card design allows context-specific static backgrounds', () {
    final design = TvCardDesign.defaults(
      imageContentGap: 0,
      backgroundColor: AppColorTokens.neutral10,
      focusedShadowColor: AppColorTokens.neutral30,
    );

    expect(design.imageContentGap, 0);
    expect(design.backgroundColor, AppColorTokens.neutral10);
    expect(design.focusedShadowColor, AppColorTokens.neutral30);
  });

  testWidgets('standard card renders content and calls action', (tester) async {
    var pressed = 0;

    await tester.pumpWidget(
      _CardHarness(
        child: TvCard(
          image: const ColoredBox(color: Colors.red),
          title: 'Title',
          subtitle: 'Subtitle',
          description: 'Description',
          extras: const Text('Extras'),
          width: TvCardWidth.four,
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.text('Title'));

    expect(pressed, 1);
    expect(find.text('Subtitle'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
    expect(find.text('Extras'), findsOneWidget);
    expect(tester.getSize(find.byType(TvCard)).width, TvCardWidth.four.value);
    expect(
      find.descendant(
        of: find.byType(TvCard),
        matching: find.byType(TextButton),
      ),
      findsNothing,
    );
    expect(
      find.descendant(of: find.byType(TvCard), matching: find.byType(InkWell)),
      findsOneWidget,
    );
  });

  testWidgets('standard card throttles rapid duplicate activation', (
    tester,
  ) async {
    var pressed = 0;

    await tester.pumpWidget(
      _CardHarness(
        child: TvCard(
          image: const ColoredBox(color: Colors.red),
          title: 'Title',
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.text('Title'));
    await tester.tap(find.text('Title'));

    expect(pressed, 1);
  });

  testWidgets('focused outline is painted as an overlay', (tester) async {
    await tester.pumpWidget(
      _CardHarness(
        child: TvCard(
          image: const ColoredBox(color: Colors.red),
          title: 'Focused',
          autofocus: true,
          onPressed: () {},
        ),
      ),
    );
    await tester.pump();

    expect(
      find.descendant(
        of: find.byType(TvCard),
        matching: find.byType(IgnorePointer),
      ),
      findsOneWidget,
    );
  });

  testWidgets('focused elevation is applied through Card', (tester) async {
    await tester.pumpWidget(
      _CardHarness(
        child: TvCard(
          image: const ColoredBox(color: Colors.red),
          title: 'Raised',
          autofocus: true,
          design: TvCardDesign.defaults(
            focusedElevation: TvCardElevation.level5,
          ),
          onPressed: () {},
        ),
      ),
    );
    await tester.pump();

    final cardFinder = find.descendant(
      of: find.byType(TvCard),
      matching: find.byWidgetPredicate(
        (widget) =>
            widget is Card && widget.elevation == TvCardElevation.level5.value,
      ),
    );
    final card = tester.widget<Card>(cardFinder);
    final shape = card.shape! as RoundedRectangleBorder;

    expect(card.margin, EdgeInsets.zero);
    expect(card.shadowColor, isNull);
    expect(card.surfaceTintColor, Colors.transparent);
    expect(card.clipBehavior, Clip.antiAlias);
    expect(shape.borderRadius, TvRadius.md.borderRadius);
    expect(tester.getSize(cardFinder), tester.getSize(find.byType(TvCard)));
  });

  testWidgets('classic and compact cards render', (tester) async {
    await tester.pumpWidget(
      _CardHarness(
        child: Row(
          children: [
            TvCard(
              type: TvCardType.classic,
              image: const ColoredBox(color: Colors.green),
              title: 'Classic',
              onPressed: () {},
            ),
            TvCard(
              type: TvCardType.compact,
              image: const ColoredBox(color: Colors.blue),
              title: 'Compact',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );

    expect(find.text('Classic'), findsOneWidget);
    expect(find.text('Compact'), findsOneWidget);
  });

  testWidgets('wide classic card keeps thumbnail and content heights aligned', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);

    const imageKey = Key('wide-classic-image');
    const contentKey = Key('wide-classic-content');

    await tester.pumpWidget(
      _CardHarness(
        child: TvCard(
          type: TvCardType.wideClassic,
          width: TvCardWidth.wideClassic,
          image: const ColoredBox(key: imageKey, color: Colors.red),
          content: const ColoredBox(key: contentKey, color: Colors.blue),
          onPressed: () {},
        ),
      ),
    );

    final expectedThumbnailWidth = TvCardDesign.wideClassicThumbnailWidth(
      TvCardWidth.wideClassic,
    );
    final expectedHeight = TvCardDesign.wideClassicHeight(
      TvCardWidth.wideClassic,
      TvCardThumbnailRatio.ratio16x9,
    );
    final imageSize = tester.getSize(find.byKey(imageKey));
    final contentSize = tester.getSize(find.byKey(contentKey));

    expect(expectedThumbnailWidth, TvCardWidth.three.value);
    expect(imageSize.width, expectedThumbnailWidth);
    expect(imageSize.height, expectedHeight);
    expect(contentSize.width, 576);
    expect(contentSize.height, expectedHeight);
    expect(
      tester.getTopLeft(find.byKey(imageKey)).dy,
      tester.getTopLeft(find.byKey(contentKey)).dy,
    );
  });
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
