import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/assets/assets.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/composites/media_cards/tv_media_badge_row.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/composites/media_cards/tv_media_thumbnail_fallback.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  test('media card design keeps feed-card dimensions stable', () {
    expect(TvMediaCardDesign.width, TvCardWidth.three);
    expect(
      TvMediaCardDesign.thumbnailHeight(TvCardWidth.three),
      TvCardWidth.three.value * 9 / 16,
    );
    expect(
      TvMediaCardDesign.cardHeight(TvCardWidth.three),
      TvCardWidth.three.value * 9 / 16 + TvMediaCardDesign.contentHeight,
    );
    expect(TvMediaCardDesign.imageContentGap, 0);
    expect(TvMediaCardDesign.cardBackgroundColor, AppColorTokens.neutral10);
    expect(TvMediaCardDesign.thumbnailLoadingIconSize, 48);
    expect(
      TvMediaCardDesign.thumbnailLoadingAsset,
      AppAssetPaths.iconChzzkDark,
    );
    expect(TvMediaCardDesign.ageRestrictionAsset, AppAssetPaths.ageRestriction);
    expect(
      TvMediaCardDesign.abroadRestrictionAsset,
      AppAssetPaths.abroadRestriction,
    );
  });

  testWidgets('media card renders shared thumbnail, info, and action', (
    tester,
  ) async {
    var pressed = 0;

    await tester.pumpWidget(
      _CardHarness(
        child: TvMediaCard(
          thumbnail: const TvMediaThumbnail(
            imageUrl: null,
            fallbackIcon: Icons.live_tv_rounded,
            topStartBadges: [
              TvMediaBadge(
                text: 'LIVE',
                backgroundColor: TvMediaCardDesign.liveBadgeColor,
              ),
            ],
            topEndBadge: TvMediaBadge(text: '2시간 전'),
          ),
          content: const TvMediaCardInfo(
            title: 'Sample title',
            channelName: 'Sample channel',
            tags: [
              TvMediaBadge(text: 'Game'),
            ],
          ),
          onPressed: () => pressed += 1,
        ),
      ),
    );

    await tester.tap(find.text('Sample title'));

    expect(pressed, 1);
    expect(find.text('LIVE'), findsOneWidget);
    expect(find.text('2시간 전'), findsOneWidget);
    expect(find.text('Sample channel'), findsOneWidget);
    expect(find.text('Game'), findsOneWidget);

    final surfaceContainerHighest = Theme.of(
      tester.element(find.byType(TvMediaCardInfo)),
    ).colorScheme.surfaceContainerHighest;

    expect(
      find.descendant(
        of: find.byType(TvMediaCardInfo),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget is ColoredBox && widget.color == surfaceContainerHighest,
        ),
      ),
      findsOneWidget,
    );
  });

  testWidgets('media card frame keeps design height in larger cells', (
    tester,
  ) async {
    await tester.pumpWidget(
      _CardHarness(
        child: SizedBox(
          width: TvMediaCardDesign.width.value,
          height: TvMediaCardDesign.cardHeight(TvMediaCardDesign.width) + 24,
          child: TvMediaCard(
            thumbnail: const TvMediaThumbnail(
              imageUrl: null,
              fallbackIcon: Icons.live_tv_rounded,
            ),
            content: const TvMediaCardInfo(
              title: 'Sample title',
              channelName: 'Sample channel',
              tags: [
                TvMediaBadge(text: 'Game'),
              ],
            ),
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(
      tester.getSize(find.byType(Card)).height,
      TvMediaCardDesign.cardHeight(TvMediaCardDesign.width),
    );
  });

  testWidgets('media card channel name uses title typography', (tester) async {
    await tester.pumpWidget(
      const _CardHarness(
        child: TvMediaCardInfo(
          title: 'Sample title',
          channelName: 'Sample channel',
          channelVerified: true,
        ),
      ),
    );

    final context = tester.element(find.byType(TvMediaCardInfo));
    final channelText = tester.widget<Text>(find.text('Sample channel'));

    expect(
      channelText.style?.fontSize,
      Theme.of(context).textTheme.titleSmall?.fontSize,
    );
    expect(
      tester.getSize(_verifiedMarkImage()).height,
      Theme.of(context).textTheme.titleSmall?.fontSize,
    );
  });

  testWidgets('media feed info uses two-line title content contract', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _CardHarness(
        child: TvMediaFeedInfo(
          title: 'Sample title',
          channelName: 'Sample channel',
          tags: [
            TvMediaBadge(text: 'Game'),
          ],
        ),
      ),
    );

    final titleText = tester.widget<Text>(find.text('Sample title'));

    expect(titleText.maxLines, 2);
    expect(find.text('Sample channel'), findsOneWidget);
    expect(find.text('Game'), findsOneWidget);
  });

  testWidgets('media badge row keeps secondary badges content-sized', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _CardHarness(
        child: SizedBox(
          width: 268,
          child: TvMediaBadgeRow(
            children: [
              TvMediaBadge(
                text: 'LIVE',
                backgroundColor: TvMediaCardDesign.liveBadgeColor,
              ),
              TvMediaBadge(text: '1,234명 시청 중'),
            ],
          ),
        ),
      ),
    );

    final viewerTag = find.ancestor(
      of: find.text('1,234명 시청 중'),
      matching: find.byType(TvTag),
    );

    expect(tester.getSize(viewerTag).width, lessThan(180));
  });

  testWidgets('media thumbnail progress uses linear progress indicator', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _CardHarness(
        child: SizedBox(
          width: 268,
          height: 151,
          child: TvMediaThumbnail(
            imageUrl: null,
            fallbackIcon: Icons.live_tv_rounded,
            progress: 0.5,
          ),
        ),
      ),
    );

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('media thumbnail uses CHZZK icon while network image loads', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _CardHarness(
        child: SizedBox(
          width: 268,
          height: 151,
          child: TvMediaThumbnail(
            imageUrl: 'https://example.invalid/thumbnail.png',
            fallbackIcon: Icons.live_tv_rounded,
          ),
        ),
      ),
    );

    final images = tester.widgetList<Image>(find.byType(Image));
    final loadingImage = images.firstWhere(
      (image) => _usesAsset(image.image, AppAssetPaths.iconChzzkDark),
    );

    expect(loadingImage.width, TvMediaCardDesign.thumbnailLoadingIconSize);
    expect(loadingImage.height, TvMediaCardDesign.thumbnailLoadingIconSize);
    expect(
      images.any(
        (image) => _usesAsset(image.image, AppAssetPaths.abroadRestriction),
      ),
      isFalse,
    );
  });

  testWidgets('media thumbnail uses fallback icon for missing image fallback', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _CardHarness(
        child: SizedBox(
          width: 268,
          height: 151,
          child: TvMediaThumbnail(
            imageUrl: null,
            fallbackIcon: Icons.live_tv_rounded,
          ),
        ),
      ),
    );

    final fallbackAsset = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          _usesAsset(widget.image, AppAssetPaths.iconChzzkDark),
    );

    expect(fallbackAsset, findsNothing);
    expect(find.byIcon(Icons.live_tv_rounded), findsOneWidget);
  });

  testWidgets('media thumbnail fallback can use loading asset as placeholder', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _CardHarness(
        child: SizedBox(
          width: 268,
          height: 151,
          child: TvMediaThumbnailFallback(
            icon: Icons.live_tv_rounded,
            showLoadingAsset: true,
          ),
        ),
      ),
    );

    final fallbackImage = tester.widget<Image>(
      find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            _usesAsset(widget.image, AppAssetPaths.iconChzzkDark),
      ),
    );

    expect(fallbackImage.width, TvMediaCardDesign.thumbnailLoadingIconSize);
    expect(fallbackImage.height, TvMediaCardDesign.thumbnailLoadingIconSize);
  });

  testWidgets('media thumbnail renders restriction asset only when provided', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _CardHarness(
        child: SizedBox(
          width: 268,
          height: 151,
          child: TvMediaThumbnail(
            imageUrl: 'https://example.invalid/thumbnail.png',
            fallbackIcon: Icons.live_tv_rounded,
            restrictionAssetPath: TvMediaCardDesign.abroadRestrictionAsset,
          ),
        ),
      ),
    );

    final restrictionImage = tester.widget<Image>(
      find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            _usesAsset(widget.image, AppAssetPaths.abroadRestriction),
      ),
    );

    expect(restrictionImage.width, 268);
    expect(restrictionImage.height, 151);
  });

  testWidgets('media metadata badge preserves icon-text groups', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _CardHarness(
        child: TvMediaMetadataBadge(
          items: [
            TvMediaMetadataItem(
              icon: Icons.play_arrow_rounded,
              label: '1,234',
            ),
            TvMediaMetadataItem(
              icon: Icons.calendar_month_rounded,
              label: '2시간 전',
            ),
          ],
        ),
      ),
    );

    expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);
    expect(find.text('1,234'), findsOneWidget);
    expect(find.byIcon(Icons.calendar_month_rounded), findsOneWidget);
    expect(find.text('2시간 전'), findsOneWidget);
  });

  testWidgets('media metadata badge keeps horizontal padding balanced', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _CardHarness(
        child: TvMediaMetadataBadge(
          items: [
            TvMediaMetadataItem(
              icon: Icons.play_arrow_rounded,
              label: '1,234',
            ),
            TvMediaMetadataItem(
              icon: Icons.calendar_month_rounded,
              label: '2026-06-01',
            ),
          ],
        ),
      ),
    );

    final badge = find.descendant(
      of: find.byType(TvMediaMetadataBadge),
      matching: find.byWidgetPredicate(
        (widget) =>
            widget is DecoratedBox &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).color ==
                TvMediaCardDesign.scrimBadgeColor,
      ),
    );
    final badgeRect = tester.getRect(badge);
    final firstIconRect = tester.getRect(find.byIcon(Icons.play_arrow_rounded));
    final lastLabelRect = tester.getRect(find.text('2026-06-01'));
    final expectedPadding = TvTagDesign.resolve(
      TvTagSize.small,
    ).padding.resolve(TextDirection.ltr).left;

    expect(firstIconRect.left - badgeRect.left, closeTo(expectedPadding, 0.01));
    expect(
      badgeRect.right - lastLabelRect.right,
      closeTo(expectedPadding, 0.01),
    );
  });
}

bool _usesAsset(ImageProvider<Object> provider, String assetPath) {
  if (provider is AssetImage) {
    return provider.assetName == assetPath;
  }

  if (provider is ResizeImage) {
    return _usesAsset(provider.imageProvider, assetPath);
  }

  return false;
}

Finder _verifiedMarkImage() {
  return find.descendant(
    of: find.byType(TvMediaVerifiedMark),
    matching: find.byType(Image),
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
