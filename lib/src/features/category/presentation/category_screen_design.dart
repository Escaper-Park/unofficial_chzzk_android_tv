import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/ui/ui.dart';

abstract final class CategoryScreenDesign {
  static const gridColumnCount = 6;
  static const gridTailRowThreshold = 2;
  static const gridCrossAxisGap = 20.0;
  static const gridMainAxisGap = 24.0;
  static const gridTopGap = 20.0;

  static const cardWidth = TvCardWidth.six;
  static const posterRatio = TvCardThumbnailRatio.ratio3x4;
  static const cardInfoHeight = 80.0;
  static const cardRadius = BorderRadius.all(Radius.circular(8));
  static const cardFocusOutlineColor = AppColorTokens.brandColor;
  static const cardFocusOutlineWidth = 2.0;
  static const cardFocusedScale = TvFocusedScale.lg;
  static const cardInfoPadding = EdgeInsets.all(12);
  static const titleHeight = 32.0;
  static const titleMetricsGap = 8.0;
  static const metricGap = 4.0;
  static const metricIconSize = 11.0;
  static const metricIconGap = 4.0;
  static const secondaryTextOpacity = 0.6;
  static const snackbarDuration = Duration(seconds: 2);

  static double get posterHeight {
    return cardWidth.value / posterRatio.value;
  }

  static double get cardHeight {
    return posterHeight + cardInfoHeight;
  }

  static double get focusPaintPadding {
    return cardHeight * (cardFocusedScale.value - 1) / 2;
  }

  static EdgeInsets gridPadding({
    required double availableWidth,
    required bool hasMore,
  }) {
    final gridWidth =
        gridColumnCount * cardWidth.value +
        (gridColumnCount - 1) * gridCrossAxisGap;
    final horizontalPadding = math.max(0.0, (availableWidth - gridWidth) / 2);
    final bottomPadding = hasMore
        ? focusPaintPadding
        : focusPaintPadding + gridMainAxisGap;

    return EdgeInsets.fromLTRB(
      horizontalPadding,
      gridTopGap + focusPaintPadding,
      horizontalPadding,
      bottomPadding,
    );
  }

  static TextStyle? titleTextStyle(TextTheme textTheme, Color color) {
    return textTheme.bodySmall?.copyWith(
      color: color,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle? metricTextStyle(TextTheme textTheme, Color color) {
    return textTheme.labelSmall?.copyWith(color: color);
  }
}
