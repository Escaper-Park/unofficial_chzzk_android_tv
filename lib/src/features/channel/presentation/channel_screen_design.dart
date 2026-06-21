import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/ui/ui.dart';

abstract final class ChannelScreenDesign {
  static const headerHeight = 120.0;
  static const headerHorizontalPadding = 58.0;
  static const headerTopPadding = 24.0;
  static const headerBottomPadding = 0.0;
  static const headerContentHeight =
      headerHeight - headerTopPadding - headerBottomPadding;
  static const headerAvatarRadius = 34.0;
  static const headerAvatarBadgeHeight = 20.0;
  static const headerAvatarBadgeOverlap = 8.0;
  static const headerAvatarHeight =
      headerAvatarRadius * 2 +
      headerAvatarBadgeHeight -
      headerAvatarBadgeOverlap;
  static const headerContentGap = 20.0;
  static const headerMetadataGap = 2.0;
  static const headerDescriptionTopGap = 8.0;
  static const headerDescriptionMaxLines = 2;
  static const headerDescriptionMaxWidth = 780.0;
  static const contentTopGap = 16.0;
  static const contentBottomGap = 24.0;
  static const contentHorizontalPadding = 58.0;
  static const sectionTitleBottomGap = 14.0;
  static const sectionGap = 28.0;
  static const stateViewHeight = 360.0;
  static const gridFocusPaintPadding = 10.0;
  static const gridCrossAxisGap = 20.0;
  static const gridMainAxisGap = 24.0;
  static const liveFocusAlignment = 0.0;
  static const liveCardMetadataGap = 12.0;
  static const headerContentGapForTabs = contentTopGap - gridFocusPaintPadding;
  static const tabRowPadding = EdgeInsets.fromLTRB(
    TvLayoutDesign.screenHorizontalPadding,
    24,
    TvLayoutDesign.screenHorizontalPadding,
    24,
  );
  static final mediaRailItemExtent = TvMediaCardDesign.width.value;
  static final mediaRailHeight = TvMediaCardDesign.cardHeight(
    TvMediaCardDesign.width,
  );
  static const liveCardWidth = TvCardWidth.wideClassic;
  static final liveRailItemExtent = liveCardWidth.value;
  static final liveRailHeight = TvCardDesign.wideClassicHeight(
    liveCardWidth,
    TvCardThumbnailRatio.ratio16x9,
  );
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
      contentBottomGap,
    );
  }

  static TextStyle? headerNameStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle? headerMetadataStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle? headerDescriptionStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall?.copyWith(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle? sectionTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge;
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
