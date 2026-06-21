import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/keyboard/keyboard.dart';

void main() {
  test('starts with the initial value and input mode', () {
    final cubit = TvKeyboardCubit(
      initialValue: 'abc',
      initialInputMode: TvKeyboardInputMode.english,
    );

    addTearDown(cubit.close);

    expect(cubit.state.value, 'abc');
    expect(cubit.state.inputMode, TvKeyboardInputMode.english);
    expect(cubit.state.isShifted, isFalse);
    expect(cubit.state.isCapsLocked, isFalse);
  });

  test('updates value and calls onChanged', () {
    final changes = <String>[];
    final cubit = TvKeyboardCubit(onChanged: changes.add);

    addTearDown(cubit.close);

    cubit
      ..inputCharacter('a')
      ..inputCharacter('b')
      ..backspace();

    expect(cubit.state.value, 'a');
    expect(changes, ['a', 'ab', 'a']);
  });

  test('composes Korean input through hangul package', () {
    final cubit = TvKeyboardCubit();

    addTearDown(cubit.close);

    cubit
      ..inputCharacter('ㄷ')
      ..inputCharacter('ㅏ')
      ..inputCharacter('ㄹ')
      ..inputCharacter('ㄱ')
      ..inputCharacter('ㅇ')
      ..inputCharacter('ㅡ')
      ..inputCharacter('ㄴ');

    expect(cubit.state.value, '닭은');
  });

  test('clears value', () {
    final cubit = TvKeyboardCubit(initialValue: 'abc');

    addTearDown(cubit.close);

    cubit.clear();

    expect(cubit.state.value, isEmpty);
  });

  test('changes input mode and resets shift and caps lock', () {
    final cubit = TvKeyboardCubit();

    addTearDown(cubit.close);

    cubit
      ..toggleShift()
      ..toggleCapsLock()
      ..setInputMode(TvKeyboardInputMode.english);

    expect(cubit.state.inputMode, TvKeyboardInputMode.english);
    expect(cubit.state.isShifted, isFalse);
    expect(cubit.state.isCapsLocked, isFalse);
  });

  test('shift is cleared after one character input', () {
    final cubit = TvKeyboardCubit();

    addTearDown(cubit.close);

    cubit
      ..toggleShift()
      ..inputCharacter('ㅃ');

    expect(cubit.state.value, 'ㅃ');
    expect(cubit.state.isShifted, isFalse);
  });

  test('caps lock remains after character input', () {
    final cubit = TvKeyboardCubit();

    addTearDown(cubit.close);

    cubit
      ..toggleCapsLock()
      ..inputCharacter('ㅃ');

    expect(cubit.state.value, 'ㅃ');
    expect(cubit.state.isCapsLocked, isTrue);
  });

  test('submits current value', () {
    String? submitted;
    final cubit = TvKeyboardCubit(
      initialValue: 'query',
      onSubmitted: (value) => submitted = value,
    );

    addTearDown(cubit.close);

    cubit.submit();

    expect(submitted, 'query');
  });

  test('calls cancel callback', () {
    var cancelled = false;
    final cubit = TvKeyboardCubit(
      onCancelled: () => cancelled = true,
    );

    addTearDown(cubit.close);

    cubit.cancel();

    expect(cancelled, isTrue);
  });
}
