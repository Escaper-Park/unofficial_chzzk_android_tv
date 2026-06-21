import 'package:flutter/material.dart';

import '../../../../category/presentation/view/shared/category_poster_card_design.dart';

abstract final class HomeCategoryCardDesign {
  static const width = CategoryPosterCardDesign.width;
  static const thumbnailRatio = CategoryPosterCardDesign.thumbnailRatio;
  static const radius = CategoryPosterCardDesign.radius;
  static const focusOutlineWidth = CategoryPosterCardDesign.focusOutlineWidth;
  static const focusedElevation = CategoryPosterCardDesign.focusedElevation;
  static const focusedShadowColor = CategoryPosterCardDesign.focusedShadowColor;
  static const badgeMargin = CategoryPosterCardDesign.badgeMargin;
  static const badgePadding = CategoryPosterCardDesign.badgePadding;
  static const badgeRadius = CategoryPosterCardDesign.badgeRadius;
  static const badgeIconSize = CategoryPosterCardDesign.badgeIconSize;
  static const badgeIconGap = CategoryPosterCardDesign.badgeIconGap;
  static const badgeBackgroundColor =
      CategoryPosterCardDesign.badgeBackgroundColor;
  static const badgeTextColor = CategoryPosterCardDesign.badgeTextColor;
  static const compactBadgeFontSize =
      CategoryPosterCardDesign.compactBadgeFontSize;

  static double get height {
    return CategoryPosterCardDesign.height;
  }

  static double get badgeAvailableWidth {
    return CategoryPosterCardDesign.badgeAvailableWidth;
  }

  static TextStyle? badgeTextStyle(TextTheme textTheme) {
    return CategoryPosterCardDesign.compactBadgeTextStyle(textTheme);
  }
}
