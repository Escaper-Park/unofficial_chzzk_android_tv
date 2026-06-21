import 'package:flutter/material.dart';

import '../../../core/ui/ui.dart';

abstract final class GroupScreenDesign {
  static const headerRowPadding = TvTabbedLayoutDesign.headerRowPadding;
  static const headerContentGap = 24.0;
  static const horizontalPadding = TvLayoutDesign.screenHorizontalPadding;
  static const gridColumnCount = 12;
  static const groupListColumnSpan = 4;
  static const contentColumnSpan = 8;
  static const contentContentColumnSpan = 7;
  static const columnGap = TvLayoutDesign.debugColumnGap;
  static const rowGap = 8.0;
  static const oneLineListItemHeight = 56.0;
  static const memberAvatarRadius = 16.0;
  static const listVerticalPadding = 12.0;
  static const listBottomPadding = 24.0;
  static const listVerticalFocusBleed = 4.0;
  static const listHorizontalFocusBleed = 16.0;
  static const headerTopPadding = 0.0;
  static const listViewportPadding = EdgeInsets.only(
    top: listVerticalPadding - listVerticalFocusBleed,
    bottom: listBottomPadding - listVerticalFocusBleed,
  );
  static const listContentPadding = EdgeInsets.fromLTRB(
    listHorizontalFocusBleed,
    listVerticalFocusBleed,
    listHorizontalFocusBleed,
    listVerticalFocusBleed,
  );
  static const createInputPadding = EdgeInsets.symmetric(
    horizontal: TvLayoutDesign.screenHorizontalPadding,
  );
  static const createContentPadding = EdgeInsets.symmetric(
    horizontal: TvLayoutDesign.screenHorizontalPadding,
  );
  static const createContentGap = 16.0;
  static const keyboardBottom = 0.0;
  static const keyboardInitialFocusIndex = 13;
  static const snackbarDuration = Duration(seconds: 2);

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

  static double groupListPaneWidth(double screenWidth) {
    return horizontalPadding +
        gridSpanWidth(
          contentWidth: gridContentWidth(screenWidth),
          span: groupListColumnSpan,
        );
  }

  static double contentPaneWidth(double screenWidth) {
    return gridSpanWidth(
          contentWidth: gridContentWidth(screenWidth),
          span: contentColumnSpan,
        ) +
        horizontalPadding;
  }

  static double contentPaneContentWidth(double screenWidth) {
    return gridSpanWidth(
      contentWidth: gridContentWidth(screenWidth),
      span: contentColumnSpan,
    );
  }

  static double contentContentWidth(double screenWidth) {
    return gridSpanWidth(
      contentWidth: gridContentWidth(screenWidth),
      span: contentContentColumnSpan,
    );
  }

  static double contentContentInset(double screenWidth) {
    final inset =
        (contentPaneContentWidth(screenWidth) -
            contentContentWidth(screenWidth)) /
        2;
    return inset < 0 ? 0 : inset;
  }

  static EdgeInsets groupListPanePadding() {
    return const EdgeInsets.only(left: horizontalPadding);
  }

  static EdgeInsets contentPanePadding(double screenWidth) {
    final inset = contentContentInset(screenWidth);
    return EdgeInsets.only(
      left: inset,
      right: horizontalPadding + inset,
    );
  }

  static TvTextFieldDesign createInputDesign() {
    return const TvTextFieldDesign(
      fieldPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      radius: BorderRadius.all(Radius.circular(999)),
      focusedScale: 1,
    );
  }

  static TvListItemDesign oneLineListItemDesign() {
    return TvListItemDesign.regular(
      lineCount: 1,
    ).copyWith(height: oneLineListItemHeight);
  }
}
