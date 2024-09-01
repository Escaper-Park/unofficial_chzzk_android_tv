import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../common/constants/styles.dart';

class VirtualKeyboardCursorPointer extends HookWidget {
  /// Blink-Animated cursor pointer for virtual keyboard input.
  const VirtualKeyboardCursorPointer({super.key});

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
        width: 2.0,
        height: 20.0,
        color: AppColors.whiteColor,
      ),
    );
  }
}
