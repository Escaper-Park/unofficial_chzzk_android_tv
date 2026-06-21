import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';

abstract final class CategoryPosterCardDesign {
  static const width = TvCardWidth.six;
  static const thumbnailRatio = TvCardThumbnailRatio.ratio3x4;
  static const radius = BorderRadius.all(Radius.circular(8));
  static const focusOutlineWidth = 2.0;
  static const focusedElevation = TvCardElevation.level1;
  static const focusedShadowColor = Color(0x66454745);
  static const badgeMargin = 8.0;
  static const badgePadding = EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 4,
  );
  static const badgeRadius = BorderRadius.all(Radius.circular(6));
  static const badgeIconSize = 11.0;
  static const badgeIconGap = 4.0;
  static const badgeBackgroundColor = Color(0xCC000000);
  static const badgeTextColor = AppColorTokens.neutral100;
  static const compactBadgeFontSize = 9.0;

  static double get height {
    return width.value / thumbnailRatio.value;
  }

  static double get badgeAvailableWidth {
    return width.value - badgeMargin * 2;
  }

  static TextStyle? badgeTextStyle(TextTheme textTheme) {
    return textTheme.labelSmall?.copyWith(
      color: badgeTextColor,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle? compactBadgeTextStyle(TextTheme textTheme) {
    return badgeTextStyle(textTheme)?.copyWith(fontSize: compactBadgeFontSize);
  }
}
