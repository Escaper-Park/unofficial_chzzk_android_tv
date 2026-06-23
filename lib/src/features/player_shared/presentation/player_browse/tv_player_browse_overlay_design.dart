import 'package:flutter/material.dart';

import '../../../../core/design/design.dart';
import '../../../../core/ui/components/cards/cards.dart';
import '../overlay_controls/tv_player_overlay_controls_design.dart';

abstract final class TvPlayerBrowseOverlayDesign {
  static const verticalPadding = TvPlayerOverlayControlsDesign.verticalMargin;
  static const headerContentHeight = 24.0;
  static const headerCardGap = 12.0;
  static const headerHorizontalInset = 58.0;
  static const cardRadius = 6.0;
  static const cardOutlineWidth = 2.0;
  static const cardFocusedElevation = 0.0;
  static const cardFocusDuration = Duration(milliseconds: 120);

  static const backgroundColor = Color.fromRGBO(10, 14, 16, 0.5);
  static const topBadgeInset = 6.0;
  static const topBadgeRadius = 4.0;
  static const topBadgePadding = EdgeInsets.symmetric(
    horizontal: 6,
    vertical: 3,
  );
  static const topBadgeGap = 6.0;
  static const topBadgeDotSize = 5.0;
  static const topBadgeIconSize = 10.0;
  static const topBadgeIconTextGap = 3.0;

  static const infoBandHeight = 40.0;
  static const infoBandPadding = EdgeInsets.fromLTRB(8, 4, 8, 4);
  static const infoAvatarRadius = 13.0;
  static const infoAvatarGap = 7.0;
  static const infoTextGap = 2.0;
  static const verifiedMarkSize = 10.0;

  static const cardBackgroundColor = AppColorTokens.neutral10;
  static const cardScrimColor = Color.fromRGBO(0, 0, 0, 0.44);
  static const infoBandBackgroundColor = Color.fromRGBO(0, 0, 0, 0.54);
  static const badgeBackgroundColor = Color.fromRGBO(0, 0, 0, 0.62);
  static const liveBadgeBackgroundColor = Color.fromRGBO(46, 48, 51, 0.68);
  static const badgeBorderColor = Color.fromRGBO(255, 255, 255, 0.12);
  static const badgeForegroundColor = Color(0xFFE6E6E6);

  static double bandHeight(TvCardWidth width) {
    return containerHeight(width) + verticalPadding * 2;
  }

  static double containerHeight(TvCardWidth width) {
    return headerContentHeight + headerCardGap + cardHeight(width);
  }

  static double topMargin(TvCardWidth width) {
    return verticalPadding;
  }

  static double bottomMargin(TvCardWidth width) {
    return verticalPadding;
  }

  static double cardHeight(TvCardWidth width) {
    return width.value * 9 / 16;
  }

  static double headerHeight(TvCardWidth width) {
    return headerContentHeight;
  }

  static double maxBadgeWidth(TvCardWidth width) {
    return width.value - topBadgeInset * 2;
  }

  static TextStyle? headerTextStyle(
    BuildContext context,
    TvCardWidth width,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return textTheme.titleMedium?.copyWith(
      color: colorScheme.onSurface,
    );
  }

  static TextStyle? titleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall?.copyWith(
      color: AppColorTokens.neutral100,
      fontWeight: FontWeight.w600,
      height: 14 / 11,
    );
  }

  static TextStyle? channelTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall?.copyWith(
      color: AppColorTokens.neutral100,
      fontWeight: FontWeight.w700,
      height: 14 / 11,
    );
  }

  static TextStyle? badgeTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall?.copyWith(
      color: badgeForegroundColor,
      fontSize: 10,
      fontWeight: FontWeight.w600,
      height: 12 / 10,
    );
  }
}
