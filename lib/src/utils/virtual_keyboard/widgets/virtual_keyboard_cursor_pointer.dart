import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../common/constants/styles.dart' show AppColors;

class VirtualKeyboardCursorPointer extends HookWidget {
  /// Blink-animated cursor pointer for the virtual keyboard input field.
  const VirtualKeyboardCursorPointer({
    super.key,
    this.cursorWidth = 2.0,
    this.cursorHeight = 20.0,
  });

  final double cursorWidth;
  final double cursorHeight;

  @override
  Widget build(BuildContext context) {
    final animController =
        useAnimationController(duration: const Duration(milliseconds: 700))
          ..repeat(reverse: true);

    final animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animController);

    return FadeTransition(
      opacity: animation,
      child: Container(
        width: cursorWidth,
        height: cursorHeight,
        color: AppColors.whiteColor,
      ),
    );
  }
}
