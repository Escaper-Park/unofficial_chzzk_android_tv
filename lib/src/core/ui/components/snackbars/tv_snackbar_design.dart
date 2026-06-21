import 'package:flutter/material.dart';

import '../../../design/design.dart';

enum TvSnackbarVariant {
  textOneLine,
  iconOneLine,
  iconTwoLines,
}

final class TvSnackbarDesign {
  const TvSnackbarDesign({
    required this.variant,
    required this.height,
    required this.padding,
    required this.maxLines,
    this.width = 556,
    this.radius = const BorderRadius.all(Radius.circular(12)),
    this.iconContainerSize = 32,
    this.iconPadding = const EdgeInsets.all(8),
    this.iconContainerRadius = const BorderRadius.all(Radius.circular(24)),
    this.iconSize = 16,
    this.iconTextGap = 8,
  });

  static const duration = Duration(milliseconds: 2000);
  static const outsideSpacing = EdgeInsets.symmetric(vertical: 24);

  final TvSnackbarVariant variant;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final int maxLines;
  final BorderRadius radius;
  final double iconContainerSize;
  final EdgeInsetsGeometry iconPadding;
  final BorderRadius iconContainerRadius;
  final double iconSize;
  final double iconTextGap;

  static TvSnackbarDesign resolve({
    required bool hasIcon,
    required int maxLines,
  }) {
    if (!hasIcon) {
      return TvSnackbarDesign(
        variant: TvSnackbarVariant.textOneLine,
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        maxLines: 1,
        radius: TvRadius.lg.borderRadius,
      );
    }

    final clampedMaxLines = maxLines <= 1 ? 1 : 2;

    return TvSnackbarDesign(
      variant: clampedMaxLines == 1
          ? TvSnackbarVariant.iconOneLine
          : TvSnackbarVariant.iconTwoLines,
      height: clampedMaxLines == 1 ? 56 : 64,
      padding: const EdgeInsets.fromLTRB(16, 12, 24, 12),
      maxLines: clampedMaxLines,
      radius: TvRadius.lg.borderRadius,
    );
  }
}
