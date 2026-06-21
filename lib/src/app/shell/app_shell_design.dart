import 'package:flutter/material.dart';

abstract final class AppShellDesign {
  static const height = 80.0;
  static const padding = EdgeInsets.symmetric(horizontal: 58, vertical: 24);
  static const immersiveNavigationBackdropHeight = height;
  static const immersiveNavigationBackdropStartColor = Color.fromRGBO(
    19,
    19,
    20,
    0.56,
  );
  static const immersiveNavigationBackdropEndColor = Color.fromRGBO(
    19,
    19,
    20,
    0,
  );
  static const exitNoticeDuration = Duration(milliseconds: 2000);
  static const exitNoticeIcon = Icons.info_outline;
  static const profileAvatarButtonSize = Size(48, 32);
  static const profileAvatarFocusRingSize = 32.0;
  static const profileAvatarRadius = 13.0;
  static const profileAvatarFocusStroke = 2.0;
  static const profileAvatarFocusedScale = 1.04;

  static Color opaqueNavigationBackdropColor(ThemeData theme) {
    return theme.scaffoldBackgroundColor;
  }
}
