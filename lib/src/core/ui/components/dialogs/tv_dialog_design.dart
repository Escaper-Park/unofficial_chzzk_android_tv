import 'package:flutter/material.dart';

import '../../../design/design.dart';

enum TvDialogType {
  alert,
  confirm,
}

enum TvDialogBackgroundType {
  standard,
  fullScreen,
}

final class TvDialogDesign {
  const TvDialogDesign._();

  static const standardWidth = 412.0;
  static const standardPadding = EdgeInsets.symmetric(
    horizontal: 32,
    vertical: 24,
  );
  static const standardTitlePadding = EdgeInsets.fromLTRB(32, 24, 32, 0);
  static const standardContentPadding = EdgeInsets.fromLTRB(32, 24, 32, 0);
  static const standardActionsPadding = EdgeInsets.fromLTRB(32, 24, 32, 24);
  static const standardGap = 24.0;
  static const standardActionHeight = 40.0;
  static const standardActionSize = Size(168, standardActionHeight);
  static const standardActionFullWidth = standardWidth - 64.0;
  static const standardElevation = 4.0;

  static const fullScreenWidth = 480.0;
  static const iconContainerSize = 48.0;
  static const iconSize = 24.0;
  static const iconTitleGap = 32.0;
  static const titleContentGap = 16.0;
  static const contentActionGap = 48.0;
  static const actionsGap = 12.0;

  static BorderRadius get standardRadius => TvRadius.md.borderRadius;
  static BorderRadius get actionRadius => TvRadius.sm.borderRadius;
  static BorderRadius get iconRadius {
    return const BorderRadius.all(Radius.circular(24));
  }

  static double get focusedActionScale => TvFocusedScale.sm.value;
}
