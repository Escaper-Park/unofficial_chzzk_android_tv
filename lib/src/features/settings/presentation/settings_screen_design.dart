import 'package:flutter/material.dart';

import '../../../core/ui/layouts/layouts.dart';

abstract final class SettingsScreenDesign {
  static const horizontalPadding = TvLayoutDesign.screenHorizontalPadding;
  static const gridColumnCount = 12;
  static const menuColumnSpan = 4;
  static const detailsColumnSpan = 8;
  static const detailsContentColumnSpan = 7;
  static const columnGap = TvLayoutDesign.debugColumnGap;
  static const rowGap = 8.0;
  static const listVerticalPadding = 24.0;
  static const listVerticalFocusBleed = 4.0;
  static const listHorizontalFocusBleed = 16.0;
  static const headerTopPadding = 20.0;
  static const menuPanePadding = EdgeInsets.only(left: horizontalPadding);
  static const listViewportPadding = EdgeInsets.symmetric(
    vertical: listVerticalPadding - listVerticalFocusBleed,
  );
  static const listContentPadding = EdgeInsets.symmetric(
    horizontal: listHorizontalFocusBleed,
    vertical: listVerticalFocusBleed,
  );
  static const modalOptionListMaxHeight = 240.0;
  static const modalSliderPadding = EdgeInsets.fromLTRB(16, 12, 16, 4);
  static const infoTextPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );
  static const infoTextTitleGap = 6.0;
  static const releaseNotesPadding = EdgeInsets.fromLTRB(16, 12, 16, 14);
  static const releaseNotesMaxHeight = 220.0;
  static const releaseNotesScrollStep = 56.0;
  static const licensesContentTopGap = 24.0;
  static const licensesListWidth = 300.0;
  static const licensesListRowHeight = 56.0;
  static const licensesContentGap = 24.0;
  static const licensesContentPadding = EdgeInsets.all(20);
  static const licensesScrollStep = 56.0;

  static double gridContentWidth(double screenWidth) {
    final contentWidth = screenWidth - horizontalPadding * 2;
    return contentWidth < 0 ? 0 : contentWidth;
  }

  static double gridColumnWidth(double contentWidth) {
    final columnWidth =
        (contentWidth - columnGap * (gridColumnCount - 1)) / gridColumnCount;
    return columnWidth < 0 ? 0 : columnWidth;
  }

  static double gridSpanWidth({
    required double contentWidth,
    required int span,
  }) {
    return gridColumnWidth(contentWidth) * span + columnGap * (span - 1);
  }

  static double menuContentWidth(double screenWidth) {
    return gridSpanWidth(
      contentWidth: gridContentWidth(screenWidth),
      span: menuColumnSpan,
    );
  }

  static double detailsPaneContentWidth(double screenWidth) {
    return gridSpanWidth(
      contentWidth: gridContentWidth(screenWidth),
      span: detailsColumnSpan,
    );
  }

  static double detailsContentWidth(double screenWidth) {
    return gridSpanWidth(
      contentWidth: gridContentWidth(screenWidth),
      span: detailsContentColumnSpan,
    );
  }

  static double detailsContentInset(double screenWidth) {
    final inset =
        (detailsPaneContentWidth(screenWidth) -
            detailsContentWidth(screenWidth)) /
        2;
    return inset < 0 ? 0 : inset;
  }

  static EdgeInsets detailsPanePadding(double screenWidth) {
    final inset = detailsContentInset(screenWidth);
    return EdgeInsets.only(
      left: inset,
      right: horizontalPadding + inset,
    );
  }

  static double menuPaneWidth(double screenWidth) {
    return horizontalPadding + menuContentWidth(screenWidth);
  }

  static double detailsPaneWidth(double screenWidth) {
    return detailsPaneContentWidth(screenWidth) + horizontalPadding;
  }
}
