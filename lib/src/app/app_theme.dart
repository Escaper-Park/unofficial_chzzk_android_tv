import 'package:flutter/material.dart';

import '../core/design/design.dart';

abstract final class AppTheme {
  static ThemeData dark() {
    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: 'Pretendard',
      scaffoldBackgroundColor: AppColorTokens.screenBackgroundColor,
    );
  }

  static ColorScheme get colorScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColorTokens.brandColor,
      brightness: Brightness.dark,
    );
  }
}
