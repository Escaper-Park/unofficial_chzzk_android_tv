import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../app/shell/app_shell_design.dart';
import '../../../core/ui/ui.dart';

abstract final class SearchTagResultsScreenDesign {
  static const headerHeight = AppShellDesign.height;
  static const headerPadding = AppShellDesign.padding;
  static const gridTopGap = 16.0;
  static const gridBottomGap = 24.0;
  static const gridFocusPaintPadding = 10.0;
  static const gridCrossAxisGap = 20.0;
  static const gridMainAxisGap = 24.0;
  static const headerContentGap = gridTopGap - gridFocusPaintPadding;
  static const headerRowPadding = TvTabbedLayoutDesign.headerRowPadding;
  static const snackbarDuration = Duration(milliseconds: 2000);
  static const _gridFallbackHorizontalPadding = 58.0;

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
      gridBottomGap,
    );
  }

  static TextStyle? headerTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
      fontWeight: FontWeight.w700,
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
