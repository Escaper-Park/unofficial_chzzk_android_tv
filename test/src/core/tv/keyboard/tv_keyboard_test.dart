import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/keyboard/keyboard.dart';

void main() {
  test('layout has four rows and thirteen keys per row', () {
    const state = TvKeyboardState(
      value: '',
      inputMode: TvKeyboardInputMode.korean,
      isShifted: false,
      isCapsLocked: false,
    );

    final rows = tvKeyboardLayoutFor(state);

    expect(rows, hasLength(4));
    for (final row in rows) {
      expect(row, hasLength(13));
    }
  });

  testWidgets('renders the fixed keyboard and key sizes', (tester) async {
    final cubit = TvKeyboardCubit();
    addTearDown(cubit.close);

    await tester.pumpWidget(_KeyboardHarness(cubit: cubit));

    expect(tester.getSize(find.byType(TvKeyboard)), TvKeyboardDesign.size);
    expect(
      tester.getSize(find.byKey(const Key('tv-keyboard-key-1'))),
      TvKeyboardDesign.keySize,
    );
    expect(
      TvKeyboardDesign.radius,
      const BorderRadius.vertical(top: Radius.circular(8)),
    );
  });

  testWidgets('inputs characters through the focused layout', (tester) async {
    final cubit = TvKeyboardCubit(
      initialInputMode: TvKeyboardInputMode.english,
    );
    addTearDown(cubit.close);

    await tester.pumpWidget(_KeyboardHarness(cubit: cubit));
    await tester.tap(find.byKey(const Key('tv-keyboard-key-q')));
    await tester.pump();

    expect(cubit.state.value, 'q');
  });

  testWidgets('allows rapid repeated key input', (tester) async {
    final cubit = TvKeyboardCubit(
      initialInputMode: TvKeyboardInputMode.english,
    );
    addTearDown(cubit.close);

    await tester.pumpWidget(_KeyboardHarness(cubit: cubit));
    await tester.tap(find.byKey(const Key('tv-keyboard-key-q')));
    await tester.tap(find.byKey(const Key('tv-keyboard-key-q')));
    await tester.pump();

    expect(cubit.state.value, 'qq');
  });

  testWidgets('toggles language and shift layouts', (tester) async {
    final cubit = TvKeyboardCubit(
      initialInputMode: TvKeyboardInputMode.english,
    );
    addTearDown(cubit.close);

    await tester.pumpWidget(_KeyboardHarness(cubit: cubit));
    await tester.tap(find.byKey(const Key('tv-keyboard-key-language')));
    await tester.pump();

    expect(cubit.state.inputMode, TvKeyboardInputMode.korean);
    expect(find.text('ㅂ'), findsOneWidget);

    await tester.tap(find.byKey(const Key('tv-keyboard-key-shift')));
    await tester.pump();

    expect(cubit.state.isShifted, isTrue);
    expect(find.text('ㅃ'), findsOneWidget);

    await tester.tap(find.byKey(const Key('tv-keyboard-key-ㅃ')));
    await tester.pump();

    expect(cubit.state.isShifted, isFalse);
  });

  testWidgets('shows grave and tilde on shifted Korean layout', (tester) async {
    final cubit = TvKeyboardCubit(
      initialInputMode: TvKeyboardInputMode.korean,
    );
    addTearDown(cubit.close);

    await tester.pumpWidget(_KeyboardHarness(cubit: cubit));
    await tester.tap(find.byKey(const Key('tv-keyboard-key-shift')));
    await tester.pump();

    expect(find.text('`'), findsOneWidget);
    expect(find.text('~'), findsOneWidget);

    await tester.tap(find.byKey(const Key('tv-keyboard-key-`')));
    await tester.pump();

    expect(cubit.state.value, '`');
  });

  testWidgets('backspace removes the last input value', (tester) async {
    final cubit = TvKeyboardCubit(initialValue: 'ab');
    addTearDown(cubit.close);

    await tester.pumpWidget(_KeyboardHarness(cubit: cubit));
    await tester.tap(find.byKey(const Key('tv-keyboard-key-backspace')));
    await tester.pump();

    expect(cubit.state.value, 'a');
  });

  testWidgets('enter submits the current value', (tester) async {
    String? submitted;
    final cubit = TvKeyboardCubit(
      initialValue: 'query',
      onSubmitted: (value) => submitted = value,
    );
    addTearDown(cubit.close);

    await tester.pumpWidget(_KeyboardHarness(cubit: cubit));
    await tester.tap(find.byKey(const Key('tv-keyboard-key-enter')));
    await tester.pump();

    expect(submitted, 'query');
  });
}

class _KeyboardHarness extends StatelessWidget {
  const _KeyboardHarness({
    required this.cubit,
  });

  final TvKeyboardCubit cubit;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TvKeyboard(cubit: cubit),
        ),
      ),
    );
  }
}
