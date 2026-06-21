import 'package:flutter/material.dart';

import 'tv_keyboard_key.dart';
import 'tv_keyboard_state.dart';

part 'tv_keyboard_english_layout.dart';
part 'tv_keyboard_korean_layout.dart';

List<List<TvKeyboardKey>> tvKeyboardLayoutFor(TvKeyboardState state) {
  final shifted = state.isShifted || state.isCapsLocked;

  return switch (state.inputMode) {
    TvKeyboardInputMode.korean =>
      shifted ? _koreanShiftLayout : _koreanStandardLayout,
    TvKeyboardInputMode.english =>
      shifted ? _englishShiftLayout : _englishStandardLayout,
  };
}

const _backspace = TvKeyboardKey.function(
  function: TvKeyboardFunctionKey.backspace,
  icon: Icons.backspace_outlined,
);
const _capsLock = TvKeyboardKey.function(
  function: TvKeyboardFunctionKey.capsLock,
  icon: Icons.keyboard_capslock,
);
const _language = TvKeyboardKey.function(
  function: TvKeyboardFunctionKey.language,
  icon: Icons.language,
);
const _shift = TvKeyboardKey.function(
  function: TvKeyboardFunctionKey.shift,
  icon: Icons.arrow_upward,
);
const _space = TvKeyboardKey.function(
  function: TvKeyboardFunctionKey.space,
  icon: Icons.space_bar,
);
const _enter = TvKeyboardKey.enter(
  icon: Icons.keyboard_return,
);

List<TvKeyboardKey> _row(List<TvKeyboardKey> keys) {
  assert(keys.length == 13);
  return keys;
}

TvKeyboardKey _character(String value) => TvKeyboardKey.character(value);
TvKeyboardKey _number(String value) => TvKeyboardKey.number(value);

final _standardNumberRow = _row([
  _number('1'),
  _number('2'),
  _number('3'),
  _number('4'),
  _number('5'),
  _number('6'),
  _number('7'),
  _number('8'),
  _number('9'),
  _number('0'),
  _number('-'),
  _number('='),
  _backspace,
]);

final _shiftNumberRow = _row([
  _number('!'),
  _number('@'),
  _number('#'),
  _number(r'$'),
  _number('%'),
  _number('^'),
  _number('&'),
  _number('*'),
  _number('('),
  _number(')'),
  _number('_'),
  _number('+'),
  _backspace,
]);
