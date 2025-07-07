import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  /* Common */
  static const Color chzzkColor = Color(0xFF00FFA3);
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFE1E3DE);
  static const Color backgroundColor = Color(0xFF141517);
  static const Color backgroundBlack = Color(0xFF0E0F10);
  static const Color fullWhiteColor = Color.fromRGBO(255, 255, 255, 1.0);

  static const Color redColor = Color(0xFFE02020);
  static const Color lightRedColor = Color(0xFFFF5454);

  static const Color greyContainerColor = Color(0xFF242528);
  static const Color greyColor = Color(0xFF9da5b6);

  /* Tags */
  static const Color categoryTagBackgroundColor =
      Color.fromRGBO(46, 48, 51, 0.6);
  static const Color liveTagColor = Color.fromRGBO(255, 255, 255, 0.15);
  static const Color watchPartyTagBorderColor =
      Color.fromRGBO(0, 255, 163, 0.3);
  static const Color watchPartyTagFontColor = Color.fromRGBO(0, 255, 163, 0.7);
  static const Color replayTagBackgroundColor =
      Color.fromRGBO(78, 65, 219, 1.0);

  /* chat */
  static const Color chatWhite = Color(0xFFFAFAFA);
  static const Color donationContainer1000 = Color(0xFF473ACA);
  static const Color donationContainer10000 = Color(0xFF2D7B8B);
  static const Color donationContainer100000 = Color(0xFF23815A);
  static const Color donationContainer500000 = Color(0xFFD18E3C);
  static const Color donationContainer1000000 = Color(0xFFC54952);

  static const Color donationNicknameWhite = Color(0xFFFFFFFF);

  static const List<Color> nicknameColors = [
    Color.fromRGBO(90, 144, 192, 1),
    Color.fromRGBO(94, 125, 204, 1),
    Color.fromRGBO(98, 141, 204, 1),
    Color.fromRGBO(113, 125, 198, 1),
    Color.fromRGBO(121, 148, 208, 1),
    Color.fromRGBO(125, 191, 178, 1),
    Color.fromRGBO(127, 104, 174, 1),
    Color.fromRGBO(128, 189, 211, 1),
    Color.fromRGBO(129, 161, 202, 1),
    Color.fromRGBO(131, 195, 187, 1),
    Color.fromRGBO(131, 197, 214, 1),
    Color.fromRGBO(132, 193, 148, 1),
    Color.fromRGBO(139, 200, 203, 1),
    Color.fromRGBO(141, 122, 184, 1),
    Color.fromRGBO(144, 95, 170, 1),
    Color.fromRGBO(145, 203, 198, 1),
    Color.fromRGBO(146, 200, 150, 1),
    Color.fromRGBO(148, 201, 148, 1),
    Color.fromRGBO(157, 120, 184, 1),
    Color.fromRGBO(159, 153, 200, 1),
    Color.fromRGBO(159, 206, 142, 1),
    Color.fromRGBO(166, 210, 147, 1),
    Color.fromRGBO(169, 107, 178, 1),
    Color.fromRGBO(170, 214, 194, 1),
    Color.fromRGBO(171, 211, 115, 1),
    Color.fromRGBO(173, 210, 222, 1),
    Color.fromRGBO(175, 113, 181, 1),
    Color.fromRGBO(179, 139, 194, 1),
    Color.fromRGBO(179, 219, 180, 1),
    Color.fromRGBO(186, 130, 190, 1),
    Color.fromRGBO(191, 222, 115, 1),
    Color.fromRGBO(204, 229, 125, 1),
    Color.fromRGBO(208, 113, 182, 1),
    Color.fromRGBO(210, 95, 172, 1),
    Color.fromRGBO(210, 99, 174, 1),
    Color.fromRGBO(214, 108, 180, 1),
    Color.fromRGBO(220, 94, 154, 1),
    Color.fromRGBO(225, 100, 144, 1),
    Color.fromRGBO(225, 108, 181, 1),
    Color.fromRGBO(228, 129, 174, 1),
    Color.fromRGBO(229, 107, 121, 1),
    Color.fromRGBO(230, 109, 95, 1),
    Color.fromRGBO(230, 129, 153, 1),
    Color.fromRGBO(231, 109, 83, 1),
    Color.fromRGBO(233, 127, 88, 1),
    Color.fromRGBO(233, 129, 88, 1),
    Color.fromRGBO(234, 114, 61, 1),
    Color.fromRGBO(234, 163, 95, 1),
    Color.fromRGBO(236, 168, 67, 1),
    Color.fromRGBO(238, 160, 93, 1),
  ];

  static final ColorScheme _colorScheme = ColorScheme.fromSeed(
    seedColor: chzzkColor,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    brightness: Brightness.dark,
    primary: chzzkColor,
    onPrimary: Color(0xFF003920),
    primaryContainer: Color(0xFF005231),
    onPrimaryContainer: Color(0xFFE1E3DE),
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
    surface: backgroundColor,
    onSurface: Color(0xFFE1E3DE),
    onSurfaceVariant: Color(0xFFC0C9C0),
    outline: Color(0xFF8A938B),
    onInverseSurface: Color(0xFF191C1A),
    inverseSurface: Color(0xFFE1E3DE),
    inversePrimary: Color(0xFF006D43),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF00FFA3),
    outlineVariant: Color(0xFF404942),
    scrim: backgroundColor,
  );
}

abstract class AppTheme {
  const AppTheme._();

  static final darkThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: AppColors._colorScheme,
    fontFamily: 'Pretendard',
    scaffoldBackgroundColor: Colors.black,
  );
}
