import 'package:flutter/material.dart';

import '../../../design/design.dart';
import '../../components/buttons/buttons.dart';
import '../../layouts/layouts.dart';

abstract final class TvTabbedLayoutDesign {
  static const tabHeight = 32.0;
  static const headerContentGap = 0.0;
  static const actionGap = 8.0;
  static const headerRowPadding = EdgeInsets.fromLTRB(
    TvLayoutDesign.screenHorizontalPadding,
    24,
    TvLayoutDesign.screenHorizontalPadding,
    24,
  );
  static const contentPadding = EdgeInsets.fromLTRB(
    TvLayoutDesign.screenHorizontalPadding,
    16,
    TvLayoutDesign.screenHorizontalPadding,
    24,
  );
  static const gridFocusedScale = TvFocusedScale.md;

  static TvButtonDesign actionButtonDesign() {
    return TvButtonDesign(
      height: tabHeight,
      width: null,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      radius: TvRadius.xl.borderRadius,
      iconSize: 18,
      focusedScale: TvFocusedScale.standard.value,
      outlineWidth: 1,
    );
  }
}
