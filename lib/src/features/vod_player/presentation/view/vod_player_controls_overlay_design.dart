import 'package:flutter/material.dart';

import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';

abstract final class VodPlayerControlsOverlayDesign {
  static const modalGap = TvPlayerOverlayControlsDesign.modalGap;
  static const denseOptionHeight =
      TvPlayerOverlayControlsDesign.modalDenseOptionHeight;
  static const modalOptionListMaxHeight =
      TvPlayerOverlayControlsDesign.modalOptionListMaxHeight;
  static const modalSliderHeight =
      TvPlayerOverlayControlsDesign.modalSliderHeight;

  static const chapterListItemHeight = 100.0;
  static const chapterItemPadding = EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 4,
  );
  static const chapterThumbnailWidth = 164.0;
  static const chapterThumbnailHeight = chapterThumbnailWidth * 9 / 16;
  static const chapterThumbnailRadius = 6.0;
  static const chapterThumbnailTextGap = 12.0;
  static const chapterTextWidth = 156.0;
  static const chapterListGap = 4.0;

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
