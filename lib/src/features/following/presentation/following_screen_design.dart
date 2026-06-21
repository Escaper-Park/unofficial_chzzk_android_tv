import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/ui/ui.dart';

abstract final class FollowingScreenDesign {
  static const tabHeight = TvTabbedLayoutDesign.tabHeight;
  static const tabRowHeight = tabHeight;
  static const gridTopGap = 16.0;
  static const gridBottomGap = 24.0;
  static const gridFocusPaintPadding = 10.0;
  static const gridCrossAxisGap = 20.0;
  static const gridMainAxisGap = 24.0;
  static const headerContentGap = gridTopGap - gridFocusPaintPadding;
  static const headerRowPadding = TvTabbedLayoutDesign.headerRowPadding;
  static const _gridFallbackHorizontalPadding = 58.0;
  static const channelModalGap = 20.0;
  static const channelModalEstimatedHeight = 36.0 + 4 * 40 + 16;
  static const channelGridCrossAxisCount = 6;
  static const channelAvatarRadius = 38.0;
  static const channelAvatarBadgeHeight = 20.0;
  static const channelAvatarBadgeOverlap = 10.0;
  static const channelAvatarHeight =
      channelAvatarRadius * 2 +
      channelAvatarBadgeHeight -
      channelAvatarBadgeOverlap;
  static const channelNameHeight = 18.0;
  static const channelVerifiedMarkSize = 12.0;
  static const channelCardContentGap = 8.0;
  static const channelCardVerticalPadding = 8.0;
  static const channelCardHorizontalPadding = 10.0;
  static const channelCardHeight =
      channelAvatarHeight +
      channelCardContentGap +
      channelNameHeight +
      channelCardVerticalPadding * 2;
  static const channelCardPadding = EdgeInsets.symmetric(
    horizontal: channelCardHorizontalPadding,
    vertical: channelCardVerticalPadding,
  );
  static const channelLiveBadgeTop = 8.0;
  static const channelLiveBadgeLeft = 8.0;
  static final categoryCardHeight =
      TvCardWidth.six.value / TvCardThumbnailRatio.ratio3x4.value;
  static const itemFocusedScale = TvFocusedScale.lg;
  static const signedOutActionGap = 20.0;
  static const signedOutMaxWidth = 560.0;
  static const snackbarDuration = Duration(milliseconds: 2000);

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

  static TvCardDesign channelCardDesign() {
    return TvCardDesign.defaults(
      focusedScale: itemFocusedScale,
      focusedElevation: TvCardElevation.level2,
      backgroundColor: AppColorTokens.neutral10,
    );
  }

  static TvButtonDesign tabActionButtonDesign() {
    return TvTabbedLayoutDesign.actionButtonDesign();
  }

  static TextStyle? channelNameStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
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
