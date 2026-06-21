import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  test('grid design matches documented variant values', () {
    final category = TvGridDesign.resolve(TvGridVariant.category);
    final feed = TvGridDesign.resolve(TvGridVariant.feedCard);

    expect(category.crossAxisCount, 6);
    expect(category.cardWidth, TvCardWidth.six);
    expect(feed.crossAxisCount, 3);
    expect(feed.cardWidth, TvCardWidth.three);
    expect(feed.mainAxisGap, 20);
    expect(feed.crossAxisGap, 20);
    expect(feed.padding, const EdgeInsets.fromLTRB(58, 40, 58, 24));
  });

  test('grid design detects focused tail by row', () {
    final design = TvGridDesign.resolve(TvGridVariant.feedCard);

    expect(design.isTailIndex(index: 2, itemCount: 9), isFalse);
    expect(design.isTailIndex(index: 3, itemCount: 9), isTrue);
    expect(
      design.isTailIndex(index: 5, itemCount: 9, tailRowThreshold: 1),
      isFalse,
    );
    expect(design.isTailIndex(index: 6, itemCount: 9), isTrue);
    expect(
      design.isTailIndex(index: 3, itemCount: 9, tailRowThreshold: 2),
      isTrue,
    );
    expect(design.isTailIndex(index: 9, itemCount: 9), isFalse);
  });

  testWidgets('grid renders items with fixed variant count', (tester) async {
    final node = FocusScopeNode();
    addTearDown(node.dispose);

    await tester.pumpWidget(
      _GridHarness(
        child: TvGrid(
          node: node,
          itemCount: 6,
          mainAxisExtent: 40,
          itemBuilder: (context, index) {
            return TvButton.label(text: 'Item $index', onPressed: () {});
          },
        ),
      ),
    );

    expect(find.byType(GridView), findsOneWidget);
    expect(find.text('Item 0'), findsOneWidget);
  });

  testWidgets('grid reverse traversal keeps focus on child item', (
    tester,
  ) async {
    final node = FocusScopeNode();
    final itemNodes = [
      for (var index = 0; index < 6; index += 1)
        FocusNode(debugLabel: 'grid child $index'),
    ];

    addTearDown(() {
      node.dispose();
      for (final itemNode in itemNodes) {
        itemNode.dispose();
      }
    });

    await tester.pumpWidget(
      _GridHarness(
        child: TvGrid(
          node: node,
          itemCount: itemNodes.length,
          mainAxisExtent: 40,
          itemBuilder: (context, index) {
            return TextButton(
              focusNode: itemNodes[index],
              onPressed: () {},
              child: Text('Item $index'),
            );
          },
        ),
      ),
    );

    itemNodes[4].requestFocus();
    await tester.pump();

    expect(itemNodes[4].hasFocus, isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump();

    expect(itemNodes[1].hasFocus, isTrue);
    expect(FocusManager.instance.primaryFocus, itemNodes[1]);
  });

  testWidgets(
    'grid calls focused tail trigger without duplicates while loading',
    (
      tester,
    ) async {
      final node = FocusScopeNode();
      var tailCalls = 0;
      addTearDown(node.dispose);

      await tester.pumpWidget(
        _GridHarness(
          child: TvGrid(
            node: node,
            itemCount: 9,
            mainAxisExtent: 40,
            onFocusedTail: () => tailCalls += 1,
            itemBuilder: (context, index) {
              return TvButton.label(
                text: 'Item $index',
                autofocus: index == 8,
                onPressed: () {},
              );
            },
          ),
        ),
      );
      await tester.pump();

      expect(tailCalls, 1);

      await tester.pumpWidget(
        _GridHarness(
          child: TvGrid(
            node: node,
            itemCount: 9,
            mainAxisExtent: 40,
            isLoadingMore: true,
            onFocusedTail: () => tailCalls += 1,
            itemBuilder: (context, index) {
              return TvButton.label(
                text: 'Item $index',
                autofocus: index == 8,
                onPressed: () {},
              );
            },
          ),
        ),
      );
      await tester.pump();

      expect(tailCalls, 1);
    },
  );
}

class _GridHarness extends StatelessWidget {
  const _GridHarness({
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
        body: SizedBox(width: 960, height: 540, child: child),
      ),
    );
  }
}
