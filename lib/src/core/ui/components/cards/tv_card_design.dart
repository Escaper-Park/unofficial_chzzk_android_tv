import 'package:flutter/material.dart';

import '../../../design/design.dart';

enum TvCardType {
  standard,
  classic,
  wideClassic,
  compact,
}

enum TvCardWidth {
  one(844),
  wideClassic(844),
  two(412),
  three(268),
  four(196),
  six(124);

  const TvCardWidth(this.value);

  final double value;
}

enum TvCardThumbnailRatio {
  ratio16x9(16 / 9),
  ratio1x1(1),
  ratio2x3(2 / 3),
  ratio3x4(3 / 4);

  const TvCardThumbnailRatio(this.value);

  final double value;
}

enum TvCardElevation {
  level1(2),
  level2(4),
  level3(8),
  level4(16),
  level5(24);

  const TvCardElevation(this.value);

  final double value;
}

enum TvCardOutlineWidth {
  thin(1),
  thick(2);

  const TvCardOutlineWidth(this.value);

  final double value;
}

final class TvCardDesign {
  const TvCardDesign({
    this.radius = const BorderRadius.all(Radius.circular(8)),
    this.imageContentGap = 8,
    this.classicContentPadding = const EdgeInsets.all(12),
    this.compactPadding = const EdgeInsets.all(12),
    this.contentGap = 8,
    this.titleSubtitleHeight = 40,
    this.extrasHeight = 24,
    this.backgroundColor,
    this.focusOutlineColor = AppColorTokens.brandColor,
    this.focusOutlineWidth = 2,
    this.focusedScale = 1,
    this.focusedElevation = 0,
    this.focusedShadowColor,
  });

  final BorderRadius radius;
  final double imageContentGap;
  final EdgeInsetsGeometry classicContentPadding;
  final EdgeInsetsGeometry compactPadding;
  final double contentGap;
  final double titleSubtitleHeight;
  final double extrasHeight;
  final Color? backgroundColor;
  final Color focusOutlineColor;
  final double focusOutlineWidth;
  final double focusedScale;
  final double focusedElevation;
  final Color? focusedShadowColor;

  static double wideClassicThumbnailWidth(TvCardWidth width) {
    if (width == TvCardWidth.wideClassic) {
      return TvCardWidth.three.value;
    }

    return width.value / 2;
  }

  static double wideClassicHeight(
    TvCardWidth width,
    TvCardThumbnailRatio thumbnailRatio,
  ) {
    return wideClassicThumbnailWidth(width) / thumbnailRatio.value;
  }

  static TvCardDesign defaults({
    TvCardOutlineWidth focusOutlineWidth = TvCardOutlineWidth.thick,
    TvFocusedScale focusedScale = TvFocusedScale.standard,
    TvCardElevation? focusedElevation,
    Color? focusedShadowColor,
    double? imageContentGap,
    Color? backgroundColor,
  }) {
    return TvCardDesign(
      radius: TvRadius.md.borderRadius,
      imageContentGap: imageContentGap ?? 8,
      backgroundColor: backgroundColor,
      focusOutlineWidth: focusOutlineWidth.value,
      focusedScale: focusedScale.value,
      focusedElevation: focusedElevation?.value ?? 0,
      focusedShadowColor: focusedShadowColor,
    );
  }
}
