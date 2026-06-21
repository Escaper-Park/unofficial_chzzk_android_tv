import 'package:flutter/services.dart';

enum DpadKey {
  up,
  down,
  left,
  right;

  LogicalKeyboardKey get logicalKey {
    return switch (this) {
      DpadKey.up => LogicalKeyboardKey.arrowUp,
      DpadKey.down => LogicalKeyboardKey.arrowDown,
      DpadKey.left => LogicalKeyboardKey.arrowLeft,
      DpadKey.right => LogicalKeyboardKey.arrowRight,
    };
  }
}
