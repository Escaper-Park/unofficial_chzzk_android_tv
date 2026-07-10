import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/focus/focus.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';

void main() {
  test('rail design matches documented values', () {
    expect(TvRailDesign.itemGap, 20);
    expect(TvRailDesign.leadingInset, 58);
    expect(TvRailDesign.trailingInset, 58);
    expect(TvRailDesign.scrollOffsetTolerance, 0.5);
    expect(TvRailDesign.padding, const EdgeInsets.symmetric(horizontal: 58));
    expect(
      TvRailDesign.fixedExtentPadding,
      const EdgeInsets.only(left: 58, right: 38),
    );
    expect(TvRailDesign.scrollItemExtent(124), 144);
    expect(
      TvRailDesign.targetOffsetForIndex(
        index: 2,
        itemExtent: 124,
        maxScrollExtent: 1000,
      ),
      288,
    );
    expect(
      TvRailDesign.targetOffsetForIndex(
        index: 9,
        itemExtent: 124,
        maxScrollExtent: 500,
      ),
      500,
    );
    expect(
      TvRailDesign.shouldScrollToTarget(
        currentOffset: 500,
        targetOffset: 500.2,
      ),
      isFalse,
    );
    expect(
      TvRailDesign.shouldScrollToTarget(
        currentOffset: 500,
        targetOffset: 501,
      ),
      isTrue,
    );
  });

  test('rail detects focused tail by index', () {
    expect(TvRailDesign.isTailIndex(index: 3, itemCount: 10), isFalse);
    expect(TvRailDesign.isTailIndex(index: 4, itemCount: 10), isTrue);
    expect(
      TvRailDesign.isTailIndex(
        index: 8,
        itemCount: 10,
        tailItemThreshold: 1,
      ),
      isFalse,
    );
    expect(TvRailDesign.isTailIndex(index: 9, itemCount: 10), isTrue);
    expect(
      TvRailDesign.isTailIndex(
        index: 8,
        itemCount: 10,
        tailItemThreshold: 2,
      ),
      isTrue,
    );
  });

  testWidgets('rail renders horizontal items', (tester) async {
    final node = FocusScopeNode();
    addTearDown(node.dispose);

    await tester.pumpWidget(
      _RailHarness(
        child: TvRail(
          node: node,
          itemCount: 3,
          itemExtent: 124,
          itemBuilder: (context, index) {
            return TvButton.label(text: 'Item $index', onPressed: () {});
          },
        ),
      ),
    );

    final railList = tester.widget<ListView>(find.byType(ListView));

    expect(railList.clipBehavior, Clip.none);
    expect(railList.itemExtent, 144);
    expect(railList.padding, TvRailDesign.fixedExtentPadding);
    expect(find.text('Item 0'), findsOneWidget);
  });

  testWidgets('rail uses target scopes for section exits by default', (
    tester,
  ) async {
    final node = FocusScopeNode();
    final up = FocusScopeNode();
    final down = FocusScopeNode();
    addTearDown(node.dispose);
    addTearDown(up.dispose);
    addTearDown(down.dispose);

    await tester.pumpWidget(
      _RailHarness(
        child: TvRail(
          node: node,
          up: up,
          down: down,
          itemCount: 1,
          itemExtent: 124,
          itemBuilder: (context, index) {
            return TvButton.label(text: 'Item $index', onPressed: () {});
          },
        ),
      ),
    );

    final exit = tester.widget<TvFocusExit>(find.byType(TvFocusExit));

    expect(exit.upEnsureVisibleScope, isTrue);
    expect(exit.downEnsureVisibleScope, isTrue);
  });

  testWidgets('rail auto-scrolls focused visible item', (tester) async {
    final node = FocusScopeNode();
    final controller = ScrollController();
    addTearDown(node.dispose);
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _RailHarness(
        child: TvRail(
          node: node,
          controller: controller,
          itemCount: 10,
          itemExtent: 124,
          itemBuilder: (context, index) {
            return TvButton.label(
              text: 'Item $index',
              autofocus: index == 5,
              onPressed: () {},
            );
          },
        ),
      ),
    );
    await tester.pump();

    expect(controller.offset, greaterThan(0));
  });

  testWidgets(
    'rail traversal focus scrolls immediately without ensureVisible',
    (
      tester,
    ) async {
      final node = FocusScopeNode();
      final controller = ScrollController();
      final itemNodes = List.generate(
        8,
        (index) => FocusNode(debugLabel: 'item $index'),
      );
      addTearDown(node.dispose);
      addTearDown(controller.dispose);
      addTearDown(() {
        for (final itemNode in itemNodes) {
          itemNode.dispose();
        }
      });

      await tester.pumpWidget(
        _RailHarness(
          child: TvRail(
            node: node,
            controller: controller,
            itemCount: itemNodes.length,
            itemExtent: 124,
            itemBuilder: (context, index) {
              return Focus(
                focusNode: itemNodes[index],
                child: Text('Item $index'),
              );
            },
          ),
        ),
      );
      await tester.pump();

      final traversalGroup = tester.widget<FocusTraversalGroup>(
        find.descendant(
          of: find.byType(TvRail),
          matching: find.byType(FocusTraversalGroup),
        ),
      );

      traversalGroup.policy.requestFocusCallback(
        itemNodes[3],
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
      );

      expect(controller.offset, 0);

      await tester.pump();

      expect(itemNodes[3].hasFocus, isTrue);
      expect(controller.offset, greaterThan(0));
    },
  );

  testWidgets('rail clamps focused tail scroll to max extent', (
    tester,
  ) async {
    final node = FocusScopeNode();
    final controller = ScrollController();
    addTearDown(node.dispose);
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _RailHarness(
        child: TvRail(
          node: node,
          controller: controller,
          itemCount: 10,
          itemExtent: 124,
          itemBuilder: (context, index) {
            return TvButton.label(
              text: 'Item $index',
              autofocus: index == 6,
              onPressed: () {},
            );
          },
        ),
      ),
    );
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(
      controller.offset,
      moreOrLessEquals(controller.position.maxScrollExtent),
    );
  });

  testWidgets('rail left traversal keeps focus on actionable child', (
    tester,
  ) async {
    final node = FocusScopeNode();
    final pressed = <int>[];
    addTearDown(node.dispose);

    await tester.pumpWidget(
      _RailHarness(
        child: TvRail(
          node: node,
          itemCount: 4,
          itemExtent: 124,
          itemBuilder: (context, index) {
            return TvButton.label(
              text: 'Item $index',
              autofocus: index == 1,
              onPressed: () => pressed.add(index),
            );
          },
        ),
      ),
    );
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();

    expect(pressed, [2, 1]);
  });

  testWidgets(
    'rail calls focused tail trigger without duplicates while loading',
    (
      tester,
    ) async {
      final node = FocusScopeNode();
      var tailCalls = 0;
      addTearDown(node.dispose);

      await tester.pumpWidget(
        _RailHarness(
          child: TvRail(
            node: node,
            itemCount: 6,
            itemExtent: 124,
            onFocusedTail: () => tailCalls += 1,
            itemBuilder: (context, index) {
              return TvButton.label(
                text: 'Item $index',
                autofocus: index == 5,
                onPressed: () {},
              );
            },
          ),
        ),
      );
      await tester.pump();

      expect(tailCalls, 1);

      await tester.pumpWidget(
        _RailHarness(
          child: TvRail(
            node: node,
            itemCount: 6,
            itemExtent: 124,
            isLoadingMore: true,
            onFocusedTail: () => tailCalls += 1,
            itemBuilder: (context, index) {
              return TvButton.label(
                text: 'Item $index',
                autofocus: index == 5,
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

class _RailHarness extends StatelessWidget {
  const _RailHarness({
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
        body: SizedBox(width: 960, height: 220, child: child),
      ),
    );
  }
}
