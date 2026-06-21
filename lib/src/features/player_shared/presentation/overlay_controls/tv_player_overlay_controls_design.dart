import 'package:flutter/material.dart';

import '../../../../core/ui/components/cards/cards.dart';
import '../../../../core/ui/components/modal_drawers/modal_drawers.dart';

abstract final class TvPlayerOverlayControlsDesign {
  static const labelFadeDuration = Duration(milliseconds: 120);

  static const backgroundColor = Color.fromRGBO(10, 14, 16, 0.35);

  static const baselineScreenWidth = 960.0;
  static const verticalMargin = 24.0;
  static const containerWidth = 844.0;
  static const containerHeight = topRowHeight + rowGap + bottomRowHeight;
  static const bandHeight = containerHeight + verticalMargin * 2;

  static const topRowHeight = 80.0;
  static const bottomRowHeight = 20.0;
  static const rowGap = 8.0;

  static const headerWidth = 528.0;
  static const headerActionsGap = 24.0;
  static const actionsWidth = 292.0;
  static const actionGap = 8.0;
  static const actionItemWidth = 52.0;
  static const actionLabelHeight = 16.0;
  static const actionLabelGap = 4.0;

  static const modalGap = 8.0;
  static const modalOptionListMaxHeight = 240.0;
  static const modalSliderHeight = 92.0;
  static const modalDenseOptionHeight = 40.0;

  static const channelNameHeight = 32.0;
  static const titleHeight = 40.0;
  static const titleGap = 8.0;

  static const liveInfoGap = 12.0;
  static const liveInfoMetricGap = 4.0;
  static const liveInfoMetricDividerGap = 8.0;
  static const liveInfoIconSize = 14.0;
  static const liveInfoDividerSize = 3.0;
  static const liveInfoElapsedTextWidth = 56.0;
  static const vodInfoGap = 12.0;
  static const vodTimeSummaryWidth = 160.0;
  static const vodSeekFocusPadding = EdgeInsets.symmetric(
    horizontal: 4,
    vertical: 5,
  );
  static const vodSeekFocusRadius = 6.0;
  static const vodSeekFocusBorderWidth = 1.0;
  static const vodSeekChapterGapWidth = 3.0;
  static const vodSeekPreviewGap = 4.0;
  static const vodSeekPreviewSeekBarGap = 8.0;
  static const vodSeekPreviewRetainDuration = Duration(seconds: 5);
  static final vodSeekPreviewWidth = TvCardWidth.six.value;
  static final vodSeekPreviewThumbnailWidth = TvCardWidth.six.value;
  static final vodSeekPreviewThumbnailHeight =
      vodSeekPreviewThumbnailWidth / TvCardThumbnailRatio.ratio16x9.value;
  static const vodSeekPreviewThumbnailRadius = 6.0;
  static const vodSeekPreviewThumbnailBorderWidth = 1.0;
  static const vodSeekPreviewThumbnailBorderColor = Color.fromRGBO(
    255,
    255,
    255,
    0.62,
  );
  static const vodSeekPreviewLabelPadding = EdgeInsets.symmetric(
    horizontal: 6,
    vertical: 3,
  );
  static const vodSeekPreviewLabelRadius = 4.0;
  static const vodSeekPreviewLabelBackgroundColor = Color.fromRGBO(
    0,
    0,
    0,
    0.42,
  );

  static TextStyle? channelNameTextStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme.of(context).textTheme.headlineSmall?.copyWith(
      color: colorScheme.onSurface,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle? titleTextStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurface,
    );
  }

  static TextStyle? infoTextStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme.of(context).textTheme.labelSmall?.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.8),
      fontWeight: FontWeight.w600,
      height: 1,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
  }

  static TextStyle? seekPreviewTitleTextStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme.of(context).textTheme.labelMedium?.copyWith(
      color: colorScheme.onSurface,
      fontWeight: FontWeight.w700,
      height: 1.15,
      shadows: const [
        Shadow(
          color: Color.fromRGBO(0, 0, 0, 0.85),
          blurRadius: 4,
        ),
      ],
    );
  }

  static TextStyle? seekPreviewTimeTextStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme.of(context).textTheme.labelSmall?.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.86),
      fontWeight: FontWeight.w600,
      height: 1,
      fontFeatures: const [FontFeature.tabularFigures()],
      shadows: const [
        Shadow(
          color: Color.fromRGBO(0, 0, 0, 0.85),
          blurRadius: 4,
        ),
      ],
    );
  }

  static TextStyle? actionLabelTextStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme.of(context).textTheme.labelSmall?.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.9),
      fontWeight: FontWeight.w600,
      height: 1,
    );
  }

  static double modalHorizontalOffsetForAction({
    required int actionIndex,
    required int actionCount,
  }) {
    const centeredOffset =
        (actionItemWidth - TvModalPanelDesign.standardWidth) / 2;
    const contentLeft = (baselineScreenWidth - containerWidth) / 2;
    const rowLeft = contentLeft + headerWidth + headerActionsGap;
    final actionContentWidth =
        actionCount * actionItemWidth + (actionCount - 1) * actionGap;
    final firstActionLeft = rowLeft + actionsWidth - actionContentWidth;
    final anchorLeft =
        firstActionLeft + actionIndex * (actionItemWidth + actionGap);
    final unclampedLeft = anchorLeft + centeredOffset;
    final clampedLeft = unclampedLeft
        .clamp(0.0, baselineScreenWidth - TvModalPanelDesign.standardWidth)
        .toDouble();

    return centeredOffset + clampedLeft - unclampedLeft;
  }

  static Offset standardMenuAnchorOffset({
    required int itemCount,
    double? horizontalOffset,
    double extraHeight = 0,
  }) {
    final contentHeight = itemCount * modalDenseOptionHeight + extraHeight;
    final listHeight = contentHeight.clamp(0, modalOptionListMaxHeight);
    final panelHeight =
        TvModalPanelDesign.standardHeaderSize.height +
        TvModalPanelDesign.standardListPadding.vertical +
        listHeight;

    return Offset(
      horizontalOffset ??
          (actionItemWidth - TvModalPanelDesign.standardWidth) / 2,
      -panelHeight - modalGap,
    );
  }
}
