import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_item.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/presentation/category_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/presentation/view/sections/grid/category_grid_card.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/presentation/view/sections/grid/category_grid_section.dart';

void main() {
  test('keeps the old Category card geometry and focus scale', () {
    expect(CategoryScreenDesign.gridColumnCount, 6);
    expect(CategoryScreenDesign.cardWidth, TvCardWidth.six);
    expect(CategoryScreenDesign.posterRatio, TvCardThumbnailRatio.ratio3x4);
    expect(CategoryScreenDesign.cardInfoHeight, 80);
    expect(CategoryScreenDesign.cardFocusedScale.value, 1.1);
    expect(CategoryScreenDesign.gridMainAxisGap, 24);
  });

  testWidgets('renders poster, two-line title, and metadata below it', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: CategoryGridCard(
            item: _categoryItem(
              title: 'Very long category title that may wrap',
              openLiveCount: 1234,
              concurrentUserCount: 98765,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );

    final title = tester.widget<Text>(
      find.text('Very long category title that may wrap'),
    );
    final card = tester.widget<TvCard>(find.byType(TvCard));

    expect(title.maxLines, 2);
    expect(find.text('1.2천'), findsOneWidget);
    expect(find.text('9.9만'), findsOneWidget);
    expect(card.design?.focusedScale, 1.1);
    expect(card.design?.focusOutlineColor, AppColorTokens.brandColor);
    expect(card.design?.focusOutlineWidth, 2);
  });

  testWidgets('configures grid viewport behavior', (
    tester,
  ) async {
    final gridNode = FocusScopeNode(debugLabel: 'test category grid');
    final navigationNode = FocusScopeNode(debugLabel: 'test navigation');
    addTearDown(gridNode.dispose);
    addTearDown(navigationNode.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: SizedBox(
          width: 960,
          height: 540,
          child: CategoryGridSection(
            items: [
              for (var index = 0; index < 6; index++) _categoryItem(),
            ],
            gridNode: gridNode,
            navigationNode: navigationNode,
            hasMore: true,
            isLoadingMore: false,
            onLoadMore: () {},
            onCategoryPressed: (_) {},
          ),
        ),
      ),
    );

    final grid = tester.widget<TvGrid>(find.byType(TvGrid));

    expect(grid.clipBehavior, Clip.none);
    expect(grid.tailRowThreshold, 2);
    expect(grid.mainAxisExtent, CategoryScreenDesign.cardHeight);
  });
}

CategoryItem _categoryItem({
  String title = 'Game',
  int openLiveCount = 12,
  int concurrentUserCount = 345,
}) {
  return CategoryItem(
    categoryType: 'GAME',
    categoryId: 'game',
    title: title,
    openLiveCount: openLiveCount,
    concurrentUserCount: concurrentUserCount,
  );
}
