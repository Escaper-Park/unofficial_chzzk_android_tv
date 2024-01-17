import 'package:flutter/material.dart';

class AppColors {
  static const Color chzzkColor = Color(0xFF00FFA3);

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF00FFA3),
    onPrimary: Color(0xFF003920),
    primaryContainer: Color(0xFF005231),
    onPrimaryContainer: Color(0xFF52FFAC),
    secondary: Color(0xFFB5CCBB),
    onSecondary: Color(0xFF213528),
    secondaryContainer: Color(0xFF374B3E),
    onSecondaryContainer: Color(0xFFD1E8D6),
    tertiary: Color(0xFFA3CDDC),
    onTertiary: Color(0xFF043541),
    tertiaryContainer: Color(0xFF224C58),
    onTertiaryContainer: Color(0xFFBFE9F8),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1A),
    onBackground: Color(0xFFE1E3DE),
    surface: Color(0xFF191C1A),
    onSurface: Color(0xFFE1E3DE),
    surfaceVariant: Color(0xFF404942),
    onSurfaceVariant: Color(0xFFC0C9C0),
    outline: Color(0xFF8A938B),
    onInverseSurface: Color(0xFF191C1A),
    inverseSurface: Color(0xFFE1E3DE),
    inversePrimary: Color(0xFF006D43),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF00FFA3),
    outlineVariant: Color(0xFF404942),
    scrim: Color(0xFF000000),
  );
}

class AppTheme {
  static final darkThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: AppColors.darkColorScheme,
    fontFamily: 'Pretendard',
  );
}
