import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';

abstract final class HomeRailMoreCardDesign {
  static const surfaceColor = AppColorTokens.neutral10;
  static const iconColor = AppColorTokens.brandColor;
  static const labelColor = AppColorTokens.neutral100;

  static const radius = BorderRadius.all(Radius.circular(8));
  static const contentGap = 8.0;
  static const contentPadding = EdgeInsets.symmetric(horizontal: 12);

  static TextStyle? labelStyle(TextTheme textTheme) {
    return textTheme.titleLarge?.copyWith(
      color: labelColor,
      fontWeight: FontWeight.w700,
    );
  }
}
