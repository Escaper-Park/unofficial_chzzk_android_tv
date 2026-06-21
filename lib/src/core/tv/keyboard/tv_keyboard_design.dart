import 'package:flutter/material.dart';

import '../../ui/ui.dart';
import 'tv_keyboard_key.dart';

final class TvKeyboardDesign {
  const TvKeyboardDesign._();

  static const size = Size(460, 166);
  static const keySize = Size(28, 32);
  static const keyGap = 6.0;
  static const rowGap = 6.0;
  static const padding = EdgeInsets.symmetric(horizontal: 12, vertical: 10);
  static const radius = BorderRadius.vertical(top: Radius.circular(8));
  static const keyRadius = BorderRadius.all(Radius.circular(4));
  static const focusedElevation = 4.0;
  static const iconSize = 16.0;
  static const textStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static BoxDecoration containerDecoration(ColorScheme colorScheme) {
    return BoxDecoration(
      color: colorScheme.surfaceContainerHighest,
      borderRadius: radius,
    );
  }

  static TvButtonDesign keyButtonDesign(
    ColorScheme colorScheme,
    TvKeyboardKeyType keyType,
  ) {
    return TvButtonDesign(
      height: keySize.height,
      width: keySize.width,
      padding: EdgeInsets.zero,
      radius: keyRadius,
      iconSize: iconSize,
      focusedScale: TvFocusedScale.standard.value,
      colors: TvButtonColors(
        standardContainer: switch (keyType) {
          TvKeyboardKeyType.character => colorScheme.surfaceContainerHigh,
          TvKeyboardKeyType.enter => colorScheme.primaryContainer,
          TvKeyboardKeyType.number ||
          TvKeyboardKeyType.function => AppColorTokens.neutral30,
        },
        focusedContainer: AppColorTokens.neutral100,
        selectedContainer: AppColorTokens.brandColor,
        disabledContainer: AppColorTokens.neutral30,
        standardContent: AppColorTokens.neutral100,
        focusedContent: AppColorTokens.neutral10,
        selectedContent: AppColorTokens.neutral10,
        disabledContent: AppColorTokens.neutral100.withValues(alpha: 0.4),
      ),
      textStyle: textStyle,
    );
  }
}
