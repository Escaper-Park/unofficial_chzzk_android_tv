import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/player_shared/presentation/player_content/player_content.dart';

void main() {
  testWidgets('player content layout focuses invisible controller', (
    tester,
  ) async {
    final controllerNode = FocusScopeNode();
    final controllerFocusNode = FocusNode();
    addTearDown(controllerNode.dispose);
    addTearDown(controllerFocusNode.dispose);

    await tester.pumpWidget(
      _PlayerContentHarness(
        child: SizedBox(
          width: 800,
          height: 480,
          child: PlayerContentLayout(
            player: const Text('Player'),
            controllerNode: controllerNode,
            controllerFocusNode: controllerFocusNode,
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Player'), findsOneWidget);
    expect(controllerNode.hasFocus, isTrue);
    expect(controllerFocusNode.hasFocus, isTrue);
  });

  testWidgets('player input controller handles select and d-pad callbacks', (
    tester,
  ) async {
    final controllerNode = FocusScopeNode();
    final controllerFocusNode = FocusNode();
    addTearDown(controllerNode.dispose);
    addTearDown(controllerFocusNode.dispose);

    var selectCount = 0;
    var downCount = 0;
    var leftCount = 0;

    await tester.pumpWidget(
      _PlayerContentHarness(
        child: SizedBox(
          width: 800,
          height: 480,
          child: PlayerContentLayout(
            player: const Text('Player'),
            controllerNode: controllerNode,
            controllerFocusNode: controllerFocusNode,
            onSelect: () => selectCount += 1,
            onDown: () => downCount += 1,
            onLeft: () => leftCount += 1,
            controlsOverlay: const Text('Controls'),
            foreground: const Text('Foreground'),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.sendKeyEvent(LogicalKeyboardKey.numpadEnter);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);

    expect(selectCount, 3);
    expect(downCount, 1);
    expect(leftCount, 1);
    expect(find.text('Controls'), findsOneWidget);
    expect(find.text('Foreground'), findsOneWidget);
  });

  testWidgets('player input controller repeats d-pad callbacks only', (
    tester,
  ) async {
    final controllerNode = FocusScopeNode();
    final controllerFocusNode = FocusNode();
    addTearDown(controllerNode.dispose);
    addTearDown(controllerFocusNode.dispose);

    var selectCount = 0;
    var leftCount = 0;

    await tester.pumpWidget(
      _PlayerContentHarness(
        child: SizedBox(
          width: 800,
          height: 480,
          child: PlayerContentLayout(
            player: const Text('Player'),
            controllerNode: controllerNode,
            controllerFocusNode: controllerFocusNode,
            onSelect: () => selectCount += 1,
            onLeft: () => leftCount += 1,
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowLeft);
    await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowLeft);
    await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowLeft);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowLeft);
    await tester.sendKeyDownEvent(LogicalKeyboardKey.select);
    await tester.sendKeyRepeatEvent(LogicalKeyboardKey.select);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.select);

    expect(leftCount, 3);
    expect(selectCount, 1);
  });
}

class _PlayerContentHarness extends StatelessWidget {
  const _PlayerContentHarness({
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
      home: Scaffold(body: Center(child: child)),
    );
  }
}
