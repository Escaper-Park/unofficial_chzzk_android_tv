import 'package:flutter/material.dart';

final class TvLayoutDesign {
  const TvLayoutDesign._();

  static const screenHorizontalPadding = 58.0;
  static const gridHeaderContentGap = 24.0;
  static const inputContentGap = 32.0;
  static const splitListGap = 24.0;
  static const stateContentGap = 12.0;
  static const playerMetadataLeft = 58.0;
  static const playerMetadataBottom = 40.0;
  static const debugHorizontalPadding = 58.0;
  static const debugColumnCount = 12;
  static const debugColumnGap = 20.0;
  static const debugEdgeBarHeight = 24.0;

  static const horizontalScreenPadding = EdgeInsets.symmetric(
    horizontal: screenHorizontalPadding,
  );

  static Color get debugColumnColor {
    return Colors.indigo.withValues(alpha: 0.2);
  }

  static Color get debugEdgeBarColor {
    return Colors.red.withValues(alpha: 0.2);
  }
}
