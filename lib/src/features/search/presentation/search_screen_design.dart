import 'package:flutter/material.dart';

import '../../../core/ui/ui.dart';

abstract final class SearchScreenDesign {
  static const headerRowPadding = TvTabbedLayoutDesign.headerRowPadding;
  static const headerContentGap = 24.0;
  static const inputPadding = EdgeInsets.symmetric(
    horizontal: TvLayoutDesign.screenHorizontalPadding,
  );
  static const inputContentGap = 28.0;
  static const railTitlePadding = TvLayoutDesign.horizontalScreenPadding;
  static const railTitleGap = 14.0;
  static const railSectionGap = 36.0;
  static const suggestionCardWidth = TvCardWidth.six;
  static const suggestionCardPadding = EdgeInsets.all(12);
  static const keyboardBottom = 0.0;
  static const keyboardInitialFocusIndex = 13;

  static double get railViewportHeight {
    return suggestionCardWidth.value * 9 / 16;
  }

  static double get suggestionCardContentHeight {
    return railViewportHeight - suggestionCardPadding.vertical;
  }

  static TvTextFieldDesign inputDesign() {
    return const TvTextFieldDesign(
      fieldPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      radius: BorderRadius.all(Radius.circular(999)),
      focusedScale: 1,
    );
  }

  static TvCardDesign suggestionCardDesign(ColorScheme colorScheme) {
    return TvCardDesign(
      radius: TvRadius.md.borderRadius,
      compactPadding: suggestionCardPadding,
      contentGap: 0,
      titleSubtitleHeight: 32,
      backgroundColor: colorScheme.surfaceContainerHighest,
      focusOutlineColor: AppColorTokens.brandColor,
      focusOutlineWidth: 2,
      focusedScale: TvFocusedScale.standard.value,
    );
  }

  static TextStyle? railTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge;
  }
}
