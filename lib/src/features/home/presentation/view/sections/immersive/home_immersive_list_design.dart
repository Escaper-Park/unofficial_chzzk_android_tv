import 'package:flutter/material.dart';

import '../../../../../../core/design/design.dart';

final class HomeImmersiveListDesign {
  const HomeImmersiveListDesign._();

  static const thumbnailSize = Size(758, 426);
  static const shellOverlap = 80.0;
  static const contentBlockSize = Size(484, 220);
  static const horizontalPadding = 58.0;
  static const metadataTopPadding = 40.0;
  static const paginationHeight = 20.0;
  static const statusBadgeHeight = 40.0;
  static const statusBadgeGap = 8.0;
  static const statusBadgeRadius = 4.0;
  static const statusLiveBadgeBackgroundColor =
      AppColorTokens.liveIndicatorColor;
  static const statusViewerBadgeBackgroundColor = Color(0xCC000000);
  static const statusBadgeTextColor = AppColorTokens.neutral100;
  static const badgeTitleGap = 24.0;
  static const titleSubtitleHeight = 92.0;
  static const titleSubtitleGap = 0.0;
  static const subtitleActionGap = 24.0;
  static const actionRowHeight = 40.0;
  static const actionTagGap = 12.0;
  static const contentTagGap = 8.0;
  static const contentTagRadius = 4.0;
  static const paginationLeft = 835.0;
  static const metadataAnimationDuration = Duration(milliseconds: 220);
  static const metadataAnimationSlideOffset = 0.10;

  static double get layoutHeight {
    return metadataTopPadding + contentBlockSize.height;
  }

  static double get metadataContentHeight {
    return statusBadgeHeight + badgeTitleGap + titleSubtitleHeight;
  }

  static double get actionRowTop {
    return statusBadgeHeight +
        badgeTitleGap +
        titleSubtitleHeight +
        subtitleActionGap;
  }

  static double get paginationTop {
    return metadataTopPadding + contentBlockSize.height - paginationHeight;
  }

  static BorderRadius get statusBadgeBorderRadius {
    return BorderRadius.circular(statusBadgeRadius);
  }

  static BorderRadius get contentTagBorderRadius {
    return BorderRadius.circular(contentTagRadius);
  }

  static int wrappedIndex({
    required int currentIndex,
    required int delta,
    required int itemCount,
  }) {
    if (itemCount <= 0) {
      return 0;
    }

    return (currentIndex + delta) % itemCount;
  }
}
