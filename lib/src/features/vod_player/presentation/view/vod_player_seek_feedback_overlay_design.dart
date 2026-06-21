import 'package:flutter/material.dart';

abstract final class VodPlayerSeekFeedbackOverlayDesign {
  static const iconHorizontalPadding = 96.0;
  static const displayLargeFallbackSize = 57.0;
  static const foregroundColor = Colors.white;

  static TextStyle? positionTextStyle(BuildContext context) {
    final displayLarge =
        Theme.of(context).textTheme.displayLarge ?? const TextStyle();

    return displayLarge.copyWith(
      color: foregroundColor,
      fontSize: displayLarge.fontSize ?? displayLargeFallbackSize,
      fontWeight: FontWeight.w700,
      shadows: const [
        Shadow(
          color: Color.fromRGBO(0, 0, 0, 0.5),
          offset: Offset(0, 2),
          blurRadius: 8,
        ),
      ],
    );
  }

  static double iconSize(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge?.fontSize ??
        displayLargeFallbackSize;
  }
}
