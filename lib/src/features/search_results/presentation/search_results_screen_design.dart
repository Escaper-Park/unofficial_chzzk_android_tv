import 'package:flutter/material.dart';

import '../../../app/shell/app_shell_design.dart';
import '../../../core/ui/ui.dart';

abstract final class SearchResultsScreenDesign {
  static const headerHeight = AppShellDesign.height;
  static const headerPadding = AppShellDesign.padding;
  static const contentTopPadding = 8.0;
  static const contentBottomPadding = 24.0;
  static const railTitleHorizontalPadding = 58.0;
  static const railTitleBottomGap = 14.0;
  static const railGap = 36.0;
  static const channelCardWidth = TvCardWidth.four;
  static const channelCardHeight = 88.0;
  static const channelCardAvatarRadius = 28.0;
  static const channelCardPadding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 12,
  );
  static const channelCardContentGap = 12.0;
  static const channelCardMetaTopGap = 5.0;
  static const verifiedMarkGap = 4.0;
  static const verifiedMarkSize = 14.0;
  static const verticalScrollDuration = Duration(milliseconds: 150);
  static const verticalScrollAlignment = 0.6;
  static const liveVerticalScrollAlignment = 0.36;

  static double get mediaCardWidth {
    return TvMediaCardDesign.width.value;
  }

  static double get mediaRailHeight {
    return TvMediaCardDesign.cardHeight(TvMediaCardDesign.width);
  }

  static TextStyle? headerTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle? railTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
      fontWeight: FontWeight.w700,
    );
  }
}
