import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/ui/ui.dart';

abstract final class CategoryDetailScreenDesign {
  static const headerHeight = 120.0;
  static const headerPadding = EdgeInsets.fromLTRB(58, 24, 58, 16);
  static const headerContentHeight = 80.0;
  static const headerPosterWidth = 60.0;
  static const headerPosterRadius = BorderRadius.all(Radius.circular(6));
  static const headerContentGap = 16.0;
  static const headerMetricGap = 16.0;
  static const headerMetricIconSize = 15.0;
  static const headerMetricIconGap = 6.0;
  static const tabHeaderContentGap = 10.0;
  static const contentBottomGap = 24.0;
  static const gridFocusPaintPadding = 10.0;
  static const gridCrossAxisGap = 20.0;
  static const gridMainAxisGap = 20.0;
  static const gridTailRowThreshold = 2;
  static const snackbarDuration = Duration(seconds: 2);
  static const _gridFallbackHorizontalPadding = 58.0;

  static double get headerPosterHeight {
    return headerPosterWidth / TvCardThumbnailRatio.ratio3x4.value;
  }

  static double get mediaGridItemHeight {
    return TvMediaCardDesign.cardHeight(TvMediaCardDesign.width);
  }

  static EdgeInsets gridPadding({
    required double availableWidth,
    required TvGridVariant variant,
  }) {
    final horizontalPadding = _gridHorizontalPadding(
      availableWidth: availableWidth,
      variant: variant,
    );

    return EdgeInsets.fromLTRB(
      horizontalPadding,
      gridFocusPaintPadding,
      horizontalPadding,
      contentBottomGap,
    );
  }

  static TextStyle? headerTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle? headerMetricStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w600,
    );
  }

  static double _gridHorizontalPadding({
    required double availableWidth,
    required TvGridVariant variant,
  }) {
    if (!availableWidth.isFinite) {
      return _gridFallbackHorizontalPadding;
    }

    final design = TvGridDesign.resolve(variant);
    final gridWidth =
        design.crossAxisCount * design.cardWidth.value +
        (design.crossAxisCount - 1) * gridCrossAxisGap;

    return math.max(0.0, (availableWidth - gridWidth) / 2);
  }
}
