import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/back/back.dart';

void main() {
  group('TvScaffold', () {
    testWidgets('handles system Back through the controller', (tester) async {
      var backs = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: TvScaffold(
            backController: TvBackController(
              onBack: () => backs += 1,
            ),
            body: const Text('Back page'),
          ),
        ),
      );

      await _sendSystemBack(tester);

      expect(find.text('Back page'), findsOneWidget);
      expect(backs, 1);
    });
  });

  group('TvBackController.doubleBackExit', () {
    testWidgets('exits on the second Back inside the window', (tester) async {
      var notices = 0;
      var exits = 0;
      final controller = TvBackController.doubleBackExit(
        window: const Duration(seconds: 2),
        onFirstBack: () => notices += 1,
        onExit: () => exits += 1,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: TvBackScope(
            controller: controller,
            child: const Text('Back page'),
          ),
        ),
      );

      await _sendSystemBack(tester);

      expect(notices, 1);
      expect(exits, 0);

      await _sendSystemBack(tester);

      expect(notices, 1);
      expect(exits, 1);
    });

    testWidgets('arms again after the window expires', (tester) async {
      var notices = 0;
      var exits = 0;
      const window = Duration(milliseconds: 100);
      final controller = TvBackController.doubleBackExit(
        window: window,
        onFirstBack: () => notices += 1,
        onExit: () => exits += 1,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: TvBackScope(
            controller: controller,
            child: const Text('Back page'),
          ),
        ),
      );

      await _sendSystemBack(tester);
      await tester.pump(window + const Duration(milliseconds: 1));
      await _sendSystemBack(tester);

      expect(notices, 2);
      expect(exits, 0);

      await tester.pump(window + const Duration(milliseconds: 1));
    });

    testWidgets('dispose clears the armed exit window', (tester) async {
      var notices = 0;
      var exits = 0;
      final controller = TvBackController.doubleBackExit(
        window: const Duration(seconds: 2),
        onFirstBack: () => notices += 1,
        onExit: () => exits += 1,
      );
      addTearDown(controller.dispose);

      controller
        ..handleBack()
        ..dispose()
        ..handleBack();

      expect(notices, 2);
      expect(exits, 0);

      controller.dispose();
    });
  });

  group('TvBackScope', () {
    testWidgets('disabled scope does not call its controller', (
      tester,
    ) async {
      var backs = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: TvBackScope(
            enabled: false,
            controller: TvBackController(
              onBack: () => backs += 1,
            ),
            child: const Text('Back page'),
          ),
        ),
      );

      await _sendSystemBack(tester);

      expect(backs, 0);
    });

    testWidgets('disabled nested scope lets an enabled parent handle Back', (
      tester,
    ) async {
      var outerBacks = 0;
      var innerBacks = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: TvBackScope(
            controller: TvBackController(
              onBack: () => outerBacks += 1,
            ),
            child: TvBackScope(
              enabled: false,
              controller: TvBackController(
                onBack: () => innerBacks += 1,
              ),
              child: const Text('Nested Back page'),
            ),
          ),
        ),
      );

      await _sendSystemBack(tester);

      expect(outerBacks, 1);
      expect(innerBacks, 0);
      expect(find.text('Nested Back page'), findsOneWidget);
    });
  });

  group('TvBackController.focusOrPop', () {
    testWidgets('focuses the target scope before popping', (tester) async {
      final targetScope = FocusScopeNode(debugLabel: 'target scope');
      final otherScope = FocusScopeNode(debugLabel: 'other scope');
      final targetItem = FocusNode(debugLabel: 'target item');
      final otherItem = FocusNode(debugLabel: 'other item');
      var popCalls = 0;

      addTearDown(targetScope.dispose);
      addTearDown(otherScope.dispose);
      addTearDown(targetItem.dispose);
      addTearDown(otherItem.dispose);

      await tester.pumpWidget(
        _RouteHarness(
          pageBuilder: (context) => TvBackScope(
            controller: TvBackController.focusOrPop(
              focusNode: targetScope,
              onPop: () {
                popCalls += 1;
                Navigator.of(context).pop();
              },
            ),
            child: Column(
              children: [
                FocusScope(
                  node: targetScope,
                  child: _FocusableButton(
                    focusNode: targetItem,
                    label: 'Target',
                  ),
                ),
                FocusScope(
                  node: otherScope,
                  child: _FocusableButton(
                    focusNode: otherItem,
                    label: 'Other',
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await _openRoute(tester, expectedText: 'Target');
      targetItem.requestFocus();
      await tester.pump();
      otherItem.requestFocus();
      await tester.pump();

      expect(otherItem.hasFocus, isTrue);

      await _sendSystemBack(tester);

      expect(targetScope.hasFocus, isTrue);
      expect(targetItem.hasFocus, isTrue);
      expect(popCalls, 0);

      await _sendSystemBack(tester);
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Open'), findsOneWidget);
      expect(popCalls, 1);
    });
  });

  group('TvBackController.pop', () {
    testWidgets('calls the explicit pop callback', (tester) async {
      var popCalls = 0;

      await tester.pumpWidget(
        _RouteHarness(
          pageBuilder: (context) => TvBackScope(
            controller: TvBackController.pop(
              onPop: () {
                popCalls += 1;
                Navigator.of(context).pop();
              },
            ),
            child: const Text('Back page'),
          ),
        ),
      );

      await _openRoute(tester);
      await _sendSystemBack(tester);
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Open'), findsOneWidget);
      expect(popCalls, 1);
    });
  });

  group('TvBackController.navigate', () {
    testWidgets('calls the explicit navigate callback without popping', (
      tester,
    ) async {
      var navigations = 0;

      await tester.pumpWidget(
        _RouteHarness(
          pageBuilder: (context) => TvBackScope(
            controller: TvBackController.navigate(
              onNavigate: () => navigations += 1,
            ),
            child: const Text('Back page'),
          ),
        ),
      );

      await _openRoute(tester);
      await _sendSystemBack(tester);
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Back page'), findsOneWidget);
      expect(navigations, 1);
    });
  });
}

Future<void> _sendSystemBack(WidgetTester tester) async {
  await tester.binding.handlePopRoute();
  await tester.pump();
}

Future<void> _openRoute(
  WidgetTester tester, {
  String expectedText = 'Back page',
}) async {
  await tester.tap(find.text('Open'));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 300));
  expect(find.text(expectedText), findsOneWidget);
}

class _RouteHarness extends StatelessWidget {
  const _RouteHarness({
    required this.pageBuilder,
  });

  final WidgetBuilder pageBuilder;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: TextButton(
                onPressed: () {
                  unawaited(
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: pageBuilder,
                      ),
                    ),
                  );
                },
                child: const Text('Open'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FocusableButton extends StatelessWidget {
  const _FocusableButton({
    required this.focusNode,
    required this.label,
  });

  final FocusNode focusNode;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      focusNode: focusNode,
      onPressed: () {},
      child: Text(label),
    );
  }
}
