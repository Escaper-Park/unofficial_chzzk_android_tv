import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/focus/focus.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/input/input.dart';

void main() {
  group('DpadKey', () {
    test('maps each direction to its logical key', () {
      expect(
        DpadKey.up.logicalKey,
        LogicalKeyboardKey.arrowUp,
      );
      expect(
        DpadKey.down.logicalKey,
        LogicalKeyboardKey.arrowDown,
      );
      expect(
        DpadKey.left.logicalKey,
        LogicalKeyboardKey.arrowLeft,
      );
      expect(
        DpadKey.right.logicalKey,
        LogicalKeyboardKey.arrowRight,
      );
    });
  });

  group('TvFocusSection.list', () {
    testWidgets('requestTvSectionFocus uses first child without memory', (
      tester,
    ) async {
      final scope = FocusScopeNode(debugLabel: 'scope');
      final firstItem = FocusNode(debugLabel: 'first item');
      final secondItem = FocusNode(debugLabel: 'second item');

      addTearDown(scope.dispose);
      addTearDown(firstItem.dispose);
      addTearDown(secondItem.dispose);

      await tester.pumpWidget(
        _TraversalHarness(
          scope: scope,
          firstItem: firstItem,
          secondItem: secondItem,
        ),
      );

      requestTvSectionFocus(scope);
      await tester.pump();

      expect(scope.hasFocus, isTrue);
      expect(firstItem.hasFocus, isTrue);
      expect(secondItem.hasFocus, isFalse);
    });

    testWidgets('requestTvSectionFocus prefers the remembered child', (
      tester,
    ) async {
      final scope = FocusScopeNode(debugLabel: 'scope');
      final firstItem = FocusNode(debugLabel: 'first item');
      final secondItem = FocusNode(debugLabel: 'second item');

      addTearDown(scope.dispose);
      addTearDown(firstItem.dispose);
      addTearDown(secondItem.dispose);

      await tester.pumpWidget(
        _TraversalHarness(
          scope: scope,
          firstItem: firstItem,
          secondItem: secondItem,
        ),
      );

      secondItem.requestFocus();
      await tester.pump();

      requestTvSectionFocus(scope);
      await tester.pump();

      expect(scope.hasFocus, isTrue);
      expect(firstItem.hasFocus, isFalse);
      expect(secondItem.hasFocus, isTrue);
    });

    testWidgets('moves focus to a target scope for a wired direction', (
      tester,
    ) async {
      final topScope = FocusScopeNode(debugLabel: 'top');
      final bottomScope = FocusScopeNode(debugLabel: 'bottom');
      final topItem = FocusNode(debugLabel: 'top item');
      final bottomItem = FocusNode(debugLabel: 'bottom item');

      addTearDown(topScope.dispose);
      addTearDown(bottomScope.dispose);
      addTearDown(topItem.dispose);
      addTearDown(bottomItem.dispose);

      await tester.pumpWidget(
        _FocusSectionHarness(
          topScope: topScope,
          bottomScope: bottomScope,
          topItem: topItem,
          bottomItem: bottomItem,
          downTarget: bottomScope,
        ),
      );

      bottomItem.requestFocus();
      await tester.pump();
      topItem.requestFocus();
      await tester.pump();

      expect(topItem.hasFocus, isTrue);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();

      expect(bottomScope.hasFocus, isTrue);
      expect(bottomItem.hasFocus, isTrue);
      expect(topItem.hasFocus, isFalse);
    });

    testWidgets('can move focus without scrolling the target visible', (
      tester,
    ) async {
      final topScope = FocusScopeNode(debugLabel: 'top');
      final bottomScope = FocusScopeNode(debugLabel: 'bottom');
      final topItem = FocusNode(debugLabel: 'top item');
      final bottomItem = FocusNode(debugLabel: 'bottom item');
      final controller = ScrollController();

      addTearDown(topScope.dispose);
      addTearDown(bottomScope.dispose);
      addTearDown(topItem.dispose);
      addTearDown(bottomItem.dispose);
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 80,
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                    TvFocusSection.list(
                      node: topScope,
                      down: bottomScope,
                      downEnsureVisible: false,
                      child: _FocusableBox(
                        focusNode: topItem,
                        label: 'Top',
                      ),
                    ),
                    const SizedBox(height: 400),
                    TvFocusSection.list(
                      node: bottomScope,
                      child: _FocusableBox(
                        focusNode: bottomItem,
                        label: 'Bottom',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      topItem.requestFocus();
      await tester.pump();

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();

      expect(bottomScope.hasFocus, isTrue);
      expect(bottomItem.hasFocus, isTrue);
      expect(controller.offset, 0);
    });

    testWidgets('uses the first target child when no remembered child exists', (
      tester,
    ) async {
      final topScope = FocusScopeNode(debugLabel: 'top');
      final bottomScope = FocusScopeNode(debugLabel: 'bottom');
      final topItem = FocusNode(debugLabel: 'top item');
      final bottomItem = FocusNode(debugLabel: 'bottom item');

      addTearDown(topScope.dispose);
      addTearDown(bottomScope.dispose);
      addTearDown(topItem.dispose);
      addTearDown(bottomItem.dispose);

      await tester.pumpWidget(
        _FocusSectionHarness(
          topScope: topScope,
          bottomScope: bottomScope,
          topItem: topItem,
          bottomItem: bottomItem,
          downTarget: bottomScope,
        ),
      );

      topItem.requestFocus();
      await tester.pump();

      expect(topItem.hasFocus, isTrue);
      expect(bottomItem.hasFocus, isFalse);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();

      expect(bottomScope.hasFocus, isTrue);
      expect(bottomItem.hasFocus, isTrue);
      expect(topItem.hasFocus, isFalse);
    });

    testWidgets('preserves child traversal for an unwired direction', (
      tester,
    ) async {
      final scope = FocusScopeNode(debugLabel: 'scope');
      final firstItem = FocusNode(debugLabel: 'first item');
      final secondItem = FocusNode(debugLabel: 'second item');

      addTearDown(scope.dispose);
      addTearDown(firstItem.dispose);
      addTearDown(secondItem.dispose);

      await tester.pumpWidget(
        _TraversalHarness(
          scope: scope,
          firstItem: firstItem,
          secondItem: secondItem,
        ),
      );

      firstItem.requestFocus();
      await tester.pump();

      expect(firstItem.hasFocus, isTrue);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();

      expect(secondItem.hasFocus, isTrue);
    });

    testWidgets(
      'ignores a wired direction when the target has no focusable child',
      (
        tester,
      ) async {
        final topScope = FocusScopeNode(debugLabel: 'top');
        final emptyScope = FocusScopeNode(debugLabel: 'empty');
        final topItem = FocusNode(debugLabel: 'top item');
        var bubbledEvents = 0;

        addTearDown(topScope.dispose);
        addTearDown(emptyScope.dispose);
        addTearDown(topItem.dispose);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Focus(
                onKeyEvent: (_, event) {
                  if (event is KeyDownEvent &&
                      event.logicalKey == LogicalKeyboardKey.arrowDown) {
                    bubbledEvents += 1;
                    return KeyEventResult.handled;
                  }

                  return KeyEventResult.ignored;
                },
                child: Column(
                  children: [
                    TvFocusSection.list(
                      node: topScope,
                      down: emptyScope,
                      child: _FocusableBox(
                        focusNode: topItem,
                        label: 'Top',
                      ),
                    ),
                    FocusScope(
                      node: emptyScope,
                      child: const SizedBox(width: 120, height: 48),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        topItem.requestFocus();
        await tester.pump();

        await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
        await tester.pump();

        expect(topItem.hasFocus, isTrue);
        expect(emptyScope.hasFocus, isFalse);
        expect(bubbledEvents, 1);
      },
    );

    testWidgets(
      'ignores a wired direction when the target focus request fails',
      (tester) async {
        final topScope = FocusScopeNode(debugLabel: 'top');
        final bottomScope = FocusScopeNode(debugLabel: 'bottom');
        final topItem = FocusNode(debugLabel: 'top item');
        final bottomItem = _RejectingFocusNode(debugLabel: 'bottom item');
        var bubbledEvents = 0;

        addTearDown(topScope.dispose);
        addTearDown(bottomScope.dispose);
        addTearDown(topItem.dispose);
        addTearDown(bottomItem.dispose);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Focus(
                onKeyEvent: (_, event) {
                  if (event is KeyDownEvent &&
                      event.logicalKey == LogicalKeyboardKey.arrowDown) {
                    bubbledEvents += 1;
                    return KeyEventResult.handled;
                  }

                  return KeyEventResult.ignored;
                },
                child: Column(
                  children: [
                    TvFocusSection.list(
                      node: topScope,
                      down: bottomScope,
                      child: _FocusableBox(
                        focusNode: topItem,
                        label: 'Top',
                      ),
                    ),
                    TvFocusSection.list(
                      node: bottomScope,
                      child: _FocusableBox(
                        focusNode: bottomItem,
                        label: 'Bottom',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        topItem.requestFocus();
        await tester.pump();

        await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
        await tester.pump();

        expect(topItem.hasFocus, isTrue);
        expect(bottomItem.hasFocus, isFalse);
        expect(bubbledEvents, 1);
      },
    );
  });

  group('TvFocusSection.grid', () {
    testWidgets('moves focus out from matching grid edges', (tester) async {
      await _expectGridExit(
        tester: tester,
        sourceIndex: 1,
        key: LogicalKeyboardKey.arrowUp,
        target: _GridTarget.up,
      );
      await _expectGridExit(
        tester: tester,
        sourceIndex: 3,
        key: LogicalKeyboardKey.arrowLeft,
        target: _GridTarget.left,
      );
      await _expectGridExit(
        tester: tester,
        sourceIndex: 7,
        key: LogicalKeyboardKey.arrowRight,
        target: _GridTarget.right,
      );
      await _expectGridExit(
        tester: tester,
        sourceIndex: 7,
        key: LogicalKeyboardKey.arrowDown,
        target: _GridTarget.down,
      );
    });

    testWidgets('preserves internal traversal for non-edge items', (
      tester,
    ) async {
      final nodes = _GridHarnessNodes(itemCount: 8);

      addTearDown(nodes.dispose);

      await tester.pumpWidget(
        _GridSectionHarness(
          nodes: nodes,
          crossAxisCount: 3,
        ),
      );

      nodes.gridItems[4].requestFocus();
      await tester.pump();

      expect(nodes.gridItems[4].hasFocus, isTrue);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();

      expect(nodes.gridItems[1].hasFocus, isTrue);
    });

    testWidgets('wraps only items that can exit the section', (tester) async {
      final nodes = _GridHarnessNodes(itemCount: 8);

      addTearDown(nodes.dispose);

      await tester.pumpWidget(
        _GridSectionHarness(
          nodes: nodes,
          crossAxisCount: 3,
        ),
      );

      expect(find.byType(TvFocusExit), findsNWidgets(7));
    });
  });
}

Future<void> _expectGridExit({
  required WidgetTester tester,
  required int sourceIndex,
  required LogicalKeyboardKey key,
  required _GridTarget target,
}) async {
  final nodes = _GridHarnessNodes(itemCount: 8);
  final targetScope = nodes.scopeFor(target);
  final targetItem = nodes.itemFor(target);
  final sourceItem = nodes.gridItems[sourceIndex];

  addTearDown(nodes.dispose);

  await tester.pumpWidget(
    _GridSectionHarness(
      nodes: nodes,
      crossAxisCount: 3,
    ),
  );

  targetItem.requestFocus();
  await tester.pump();
  sourceItem.requestFocus();
  await tester.pump();

  expect(sourceItem.hasFocus, isTrue);

  await tester.sendKeyEvent(key);
  await tester.pump();

  expect(targetScope.hasFocus, isTrue);
  expect(targetItem.hasFocus, isTrue);
  expect(sourceItem.hasFocus, isFalse);
}

class _FocusSectionHarness extends StatelessWidget {
  const _FocusSectionHarness({
    required this.topScope,
    required this.bottomScope,
    required this.topItem,
    required this.bottomItem,
    required this.downTarget,
  });

  final FocusScopeNode topScope;
  final FocusScopeNode bottomScope;
  final FocusNode topItem;
  final FocusNode bottomItem;
  final FocusScopeNode downTarget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            TvFocusSection.list(
              node: topScope,
              down: downTarget,
              child: _FocusableBox(
                focusNode: topItem,
                label: 'Top',
              ),
            ),
            TvFocusSection.list(
              node: bottomScope,
              child: _FocusableBox(
                focusNode: bottomItem,
                label: 'Bottom',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TraversalHarness extends StatelessWidget {
  const _TraversalHarness({
    required this.scope,
    required this.firstItem,
    required this.secondItem,
  });

  final FocusScopeNode scope;
  final FocusNode firstItem;
  final FocusNode secondItem;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TvFocusSection.list(
          node: scope,
          child: Row(
            children: [
              _FocusableBox(
                focusNode: firstItem,
                label: 'First',
              ),
              const SizedBox(width: 48),
              _FocusableBox(
                focusNode: secondItem,
                label: 'Second',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _GridTarget {
  up,
  down,
  left,
  right,
}

class _GridHarnessNodes {
  _GridHarnessNodes({
    required this.itemCount,
  }) : gridItems = List.generate(
         itemCount,
         (index) => FocusNode(debugLabel: 'grid item $index'),
       );

  final int itemCount;
  final gridScope = FocusScopeNode(debugLabel: 'grid scope');
  final upScope = FocusScopeNode(debugLabel: 'up scope');
  final downScope = FocusScopeNode(debugLabel: 'down scope');
  final leftScope = FocusScopeNode(debugLabel: 'left scope');
  final rightScope = FocusScopeNode(debugLabel: 'right scope');
  final upItem = FocusNode(debugLabel: 'up item');
  final downItem = FocusNode(debugLabel: 'down item');
  final leftItem = FocusNode(debugLabel: 'left item');
  final rightItem = FocusNode(debugLabel: 'right item');
  final List<FocusNode> gridItems;

  FocusScopeNode scopeFor(_GridTarget target) {
    return switch (target) {
      _GridTarget.up => upScope,
      _GridTarget.down => downScope,
      _GridTarget.left => leftScope,
      _GridTarget.right => rightScope,
    };
  }

  FocusNode itemFor(_GridTarget target) {
    return switch (target) {
      _GridTarget.up => upItem,
      _GridTarget.down => downItem,
      _GridTarget.left => leftItem,
      _GridTarget.right => rightItem,
    };
  }

  void dispose() {
    gridScope.dispose();
    upScope.dispose();
    downScope.dispose();
    leftScope.dispose();
    rightScope.dispose();
    upItem.dispose();
    downItem.dispose();
    leftItem.dispose();
    rightItem.dispose();

    for (final item in gridItems) {
      item.dispose();
    }
  }
}

class _GridSectionHarness extends StatelessWidget {
  const _GridSectionHarness({
    required this.nodes,
    required this.crossAxisCount,
  });

  final _GridHarnessNodes nodes;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            TvFocusSection.list(
              node: nodes.upScope,
              child: _FocusableBox(
                focusNode: nodes.upItem,
                label: 'Up',
              ),
            ),
            Row(
              children: [
                TvFocusSection.list(
                  node: nodes.leftScope,
                  child: _FocusableBox(
                    focusNode: nodes.leftItem,
                    label: 'Left',
                  ),
                ),
                TvFocusSection.grid(
                  node: nodes.gridScope,
                  itemCount: nodes.itemCount,
                  crossAxisCount: crossAxisCount,
                  up: nodes.upScope,
                  down: nodes.downScope,
                  left: nodes.leftScope,
                  right: nodes.rightScope,
                  builder: (context, focus) => _GridItems(
                    focus: focus,
                    nodes: nodes,
                  ),
                ),
                TvFocusSection.list(
                  node: nodes.rightScope,
                  child: _FocusableBox(
                    focusNode: nodes.rightItem,
                    label: 'Right',
                  ),
                ),
              ],
            ),
            TvFocusSection.list(
              node: nodes.downScope,
              child: _FocusableBox(
                focusNode: nodes.downItem,
                label: 'Down',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GridItems extends StatelessWidget {
  const _GridItems({
    required this.focus,
    required this.nodes,
  });

  final TvGridFocusController focus;
  final _GridHarnessNodes nodes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (
          var rowStart = 0;
          rowStart < nodes.itemCount;
          rowStart += focus.crossAxisCount
        )
          _GridRow(
            focus: focus,
            nodes: nodes,
            rowStart: rowStart,
          ),
      ],
    );
  }
}

class _GridRow extends StatelessWidget {
  const _GridRow({
    required this.focus,
    required this.nodes,
    required this.rowStart,
  });

  final TvGridFocusController focus;
  final _GridHarnessNodes nodes;
  final int rowStart;

  @override
  Widget build(BuildContext context) {
    final rowEnd = (rowStart + focus.crossAxisCount).clamp(
      0,
      nodes.itemCount,
    );

    return Row(
      children: [
        for (var index = rowStart; index < rowEnd; index += 1)
          focus.wrapItem(
            index: index,
            child: _FocusableBox(
              focusNode: nodes.gridItems[index],
              label: '$index',
            ),
          ),
      ],
    );
  }
}

class _FocusableBox extends StatelessWidget {
  const _FocusableBox({
    required this.focusNode,
    required this.label,
  });

  final FocusNode focusNode;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 48,
      child: TextButton(
        focusNode: focusNode,
        onPressed: () {},
        child: Text(label),
      ),
    );
  }
}

class _RejectingFocusNode extends FocusNode {
  _RejectingFocusNode({super.debugLabel});

  @override
  void requestFocus([FocusNode? node]) {}
}
