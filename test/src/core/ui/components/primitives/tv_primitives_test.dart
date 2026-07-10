import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/assets/assets.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  test('tag design matches documented values', () {
    final small = TvTagDesign.resolve(TvTagSize.small);
    final medium = TvTagDesign.resolve(TvTagSize.medium);
    final large = TvTagDesign.resolve(TvTagSize.large);

    expect(small.height, 20);
    expect(medium.height, 24);
    expect(large.height, 40);
    expect(
      small.padding,
      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    );
    expect(
      medium.padding,
      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    );
    expect(
      large.padding,
      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
    expect(TvTagDesign.rowGap(TvTagSize.small), 4);
    expect(TvTagDesign.rowGap(TvTagSize.medium), 4);
    expect(TvTagDesign.rowGap(TvTagSize.large), 8);
  });

  test('scrim colors and home asset match documented values', () {
    expect(TvScrim.homeImmersiveAsset, AppAssetPaths.radialScrim);
    expect(
      TvScrim.colorFor(TvScrimType.dialog),
      const Color(0xFF1A1C1E).withValues(alpha: 0.6),
    );
    expect(
      TvScrim.colorFor(TvScrimType.modal),
      const Color(0xFF1A1C1E).withValues(alpha: 0.6),
    );
    expect(
      TvScrim.colorFor(TvScrimType.playerControls),
      const Color(0xFF1A1C1E).withValues(alpha: 0.4),
    );
  });

  test('progress bar design matches documented values', () {
    expect(TvProgressBarDesign.height(TvProgressBarSize.standard), 3);
    expect(TvProgressBarDesign.height(TvProgressBarSize.large), 5);
    expect(TvProgressBarDesign.handleSize(TvProgressBarSize.standard), 7);
    expect(TvProgressBarDesign.handleSize(TvProgressBarSize.large), 11);
  });

  testWidgets('pagination renders active and standard dots', (tester) async {
    await tester.pumpWidget(
      const _PrimitiveHarness(
        child: TvPagination(count: 4, activeIndex: 1),
      ),
    );

    expect(find.byType(TvPagination), findsOneWidget);
  });

  testWidgets('profile avatar supports live ring without resizing', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _PrimitiveHarness(
        child: ProfileCircleAvatar(
          imageUrl: null,
          radius: 16,
          openLive: true,
        ),
      ),
    );

    final avatar = find.byType(ProfileCircleAvatar);
    final liveRing = find.byWidgetPredicate((widget) {
      if (widget is! DecoratedBox || widget.decoration is! BoxDecoration) {
        return false;
      }

      final decoration = widget.decoration as BoxDecoration;
      return decoration.border != null;
    });
    final liveRingBox = tester.widget<DecoratedBox>(liveRing);
    final liveRingDecoration = liveRingBox.decoration as BoxDecoration;
    final liveRingBorder = liveRingDecoration.border! as Border;

    expect(tester.getSize(avatar), const Size.square(32));
    expect(liveRing, findsOneWidget);
    expect(liveRingBorder.top.color, AppColorTokens.brandColor);
  });

  testWidgets('optimized image preserves placeholder and error slot size', (
    tester,
  ) async {
    const imageKey = ValueKey('optimized-image');
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const _PrimitiveHarness(
        child: OptimizedImage.network(
          'https://example.com/missing.png',
          key: imageKey,
          width: 24,
          height: 18,
          placeholder: SizedBox.shrink(),
          errorFallback: SizedBox.shrink(),
        ),
      ),
    );

    expect(tester.getSize(find.byKey(imageKey)), const Size(24, 18));
    final image = tester.widget<Image>(
      find
          .descendant(
            of: find.byKey(imageKey),
            matching: find.byType(Image),
          )
          .first,
    );
    final provider = image.image as ResizeImage;
    expect(provider.width, 48);
    expect(provider.height, 36);

    await tester.pump();

    expect(tester.getSize(find.byKey(imageKey)), const Size(24, 18));
  });

  testWidgets('tag and progress bar render', (tester) async {
    await tester.pumpWidget(
      const _PrimitiveHarness(
        child: Column(
          children: [
            TvTagsRow(
              tags: [
                TvTag(text: 'Filled'),
                TvTag(text: 'Outlined', type: TvTagType.outlined),
              ],
            ),
            SizedBox(width: 120, child: TvProgressBar(value: 0.5)),
            SizedBox(
              width: 120,
              child: TvProgressBar(
                value: 0.5,
                size: TvProgressBarSize.large,
                showHandle: true,
              ),
            ),
          ],
        ),
      ),
    );

    expect(find.text('Filled'), findsOneWidget);
    expect(find.text('Outlined'), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsNWidgets(2));
    expect(find.byType(TvProgressBar), findsNWidgets(2));
  });

  testWidgets('tag preserves documented color and centered text contract', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _PrimitiveHarness(
        child: TvTag(
          text: 'LIVE',
          backgroundColor: AppColorTokens.liveIndicatorColor,
          textColor: AppColorTokens.neutral100,
        ),
      ),
    );

    final tag = find.byType(TvTag);
    final text = find.text('LIVE');
    final decoration =
        tester
                .widget<DecoratedBox>(
                  find.descendant(of: tag, matching: find.byType(DecoratedBox)),
                )
                .decoration
            as BoxDecoration;

    expect(
      tester.getSize(tag).height,
      TvTagDesign.resolve(TvTagSize.small).height,
    );
    expect(decoration.color, AppColorTokens.liveIndicatorColor);
    expect(
      (tester.getCenter(text).dy - tester.getCenter(tag).dy).abs(),
      lessThan(1),
    );
  });

  testWidgets('tag shrink-wraps inside a wide flexible row', (tester) async {
    await tester.pumpWidget(
      const _PrimitiveHarness(
        child: SizedBox(
          width: 220,
          child: Row(
            children: [
              Flexible(child: TvTag(text: '1,234')),
            ],
          ),
        ),
      ),
    );

    expect(tester.getSize(find.byType(TvTag)).width, lessThan(80));
  });
}

class _PrimitiveHarness extends StatelessWidget {
  const _PrimitiveHarness({
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
