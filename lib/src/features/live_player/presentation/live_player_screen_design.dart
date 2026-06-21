import 'package:flutter/material.dart';

import '../../../core/ui/ui.dart';

abstract final class LivePlayerScreenDesign {
  static const backgroundColor = Colors.black;
  static const statusContentGap = 20.0;
  static const statusActionGap = 12.0;
  static const statusMaxWidth = 640.0;
  static const inactiveStatusIconMinSize = 28.0;
  static const inactiveStatusIconMaxSize = 72.0;
  static const inactiveStatusIconSizeRatio = 0.24;
  static const exitNoticeDuration = Duration(seconds: 2);
  static const multiviewActiveOutlineDuration = Duration(seconds: 2);
  static const multiviewActiveOutlineWidth = 3.0;
  static const multiviewPipScreenPadding = 24.0;
  static const multiviewPipGap = 12.0;
  static const multiviewPipRadiusRatio = 0.06;
  static const multiviewPipMinRadius = 6.0;
  static const multiviewPipMaxRadius = 12.0;
  static const multiviewPipSingleMaxSizePercent = 50;
  static const multiviewPipMultiMaxSizePercent = 33;

  static TextStyle? statusTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium?.copyWith(
      color: AppColorTokens.neutral100,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle? statusActionTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge?.copyWith(
      color: AppColorTokens.neutral100.withValues(alpha: 0.72),
      fontWeight: FontWeight.w700,
    );
  }
}
