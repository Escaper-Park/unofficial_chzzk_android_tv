import 'package:flutter/widgets.dart';

enum TvKeyboardKeyType {
  character,
  number,
  function,
  enter,
}

enum TvKeyboardFunctionKey {
  backspace,
  capsLock,
  language,
  shift,
  space,
  enter,
}

final class TvKeyboardKey {
  const TvKeyboardKey.character(this.value)
    : type = TvKeyboardKeyType.character,
      function = null,
      icon = null;

  const TvKeyboardKey.number(this.value)
    : type = TvKeyboardKeyType.number,
      function = null,
      icon = null;

  const TvKeyboardKey.function({
    required this.function,
    required this.icon,
  }) : type = TvKeyboardKeyType.function,
       value = null;

  const TvKeyboardKey.enter({
    required this.icon,
  }) : type = TvKeyboardKeyType.enter,
       function = TvKeyboardFunctionKey.enter,
       value = null;

  final TvKeyboardKeyType type;
  final String? value;
  final TvKeyboardFunctionKey? function;
  final IconData? icon;

  String get id {
    final value = this.value;
    if (value != null) {
      return value;
    }

    return function!.name;
  }
}
