import 'package:flutter/material.dart';

import '../../../design/design.dart';

enum TvModalPanelType {
  standard,
  large,
}

enum TvModalPanelPosition {
  left,
  right,
  above,
}

final class TvModalPanelDesign {
  const TvModalPanelDesign._();

  static const standardWidth = 216.0;
  static const standardMaxHeight = 320.0;
  static const standardOuterSpacing = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 16,
  );
  static const standardHeaderSize = Size(216, 36);
  static const standardHeaderPadding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 10,
  );
  static const standardListPadding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  );
  static const standardDividerWeight = 1.0;
  static double get itemFocusedScale => TvFocusedScale.standard.value;

  static const largeWidth = 400.0;
  static const largePadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 32,
  );
  static const largeHeaderItemGap = 24.0;
  static const largeItemGap = 4.0;

  static BorderRadius get radius => TvRadius.xl.borderRadius;
  static const largeRadius = BorderRadius.zero;
}
