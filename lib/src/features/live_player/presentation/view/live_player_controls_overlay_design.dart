import 'package:flutter/material.dart';

import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';

abstract final class LivePlayerControlsOverlayDesign {
  static const baselineScreenWidth =
      TvPlayerOverlayControlsDesign.baselineScreenWidth;
  static const modalGap = TvPlayerOverlayControlsDesign.modalGap;
  static const modalOptionListMaxHeight =
      TvPlayerOverlayControlsDesign.modalOptionListMaxHeight;
  static const modalSliderHeight =
      TvPlayerOverlayControlsDesign.modalSliderHeight;

  static const denseOptionHeight =
      TvPlayerOverlayControlsDesign.modalDenseOptionHeight;

  static const multiviewInfoPadding = EdgeInsets.all(24);
  static const multiviewInfoGap = 12.0;
  static const multiviewInfoAvatarRadius = 10.0;
  static const multiviewInfoContentGap = 8.0;
  static const multiviewInfoChannelTitleGap = 4.0;
  static const multiviewInfoMetricGap = 4.0;
  static const multiviewInfoMetricIconSize = 14.0;
  static const multiviewInfoMetricIconGap = 4.0;
  static const multiviewInfoMetricTextWidth = 96.0;
  static const multiviewInfoMetricsWidth =
      multiviewInfoMetricIconSize +
      multiviewInfoMetricIconGap +
      multiviewInfoMetricTextWidth;

  static TextStyle? multiviewInfoTextStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme.of(context).textTheme.labelMedium?.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.86),
      fontWeight: FontWeight.w600,
      height: 1,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
  }

  static double modalHorizontalOffsetForAction({
    required int actionIndex,
    required int actionCount,
  }) {
    return TvPlayerOverlayControlsDesign.modalHorizontalOffsetForAction(
      actionIndex: actionIndex,
      actionCount: actionCount,
    );
  }
}
