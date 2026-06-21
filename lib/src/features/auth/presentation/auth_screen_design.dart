import 'package:flutter/material.dart';

abstract final class AuthScreenDesign {
  static const framePadding = EdgeInsets.fromLTRB(58, 28, 58, 40);
  static const gridColumnCount = 12;
  static const formColumnSpan = 8;
  static const webViewColumnSpan = 4;
  static const columnGap = 20.0;
  static const sectionGap = 28.0;
  static const titleGap = 6.0;
  static const actionGap = 10.0;
  static const inputGap = 12.0;
  static const keyboardBottom = 0.0;
  static const webViewRadius = BorderRadius.all(Radius.circular(8));
  static const webViewBorderWidth = 1.0;
  static const captchaOverlayHeight = 152.0;
  static const statusMinHeight = 28.0;
  static const formTopInset = 0.0;
  static const keyboardInitialFocusIndex = 13;

  static TextStyle titleStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle subtitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle statusStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }

  static BoxDecoration webViewDecoration(ColorScheme colorScheme) {
    return BoxDecoration(
      color: colorScheme.surfaceContainerHigh,
      borderRadius: webViewRadius,
      border: Border.all(
        color: colorScheme.outlineVariant,
        width: webViewBorderWidth,
      ),
    );
  }

  static double gridColumnWidth(double availableWidth) {
    return (availableWidth - columnGap * (gridColumnCount - 1)) /
        gridColumnCount;
  }

  static double gridSpanWidth({
    required double availableWidth,
    required int span,
  }) {
    return gridColumnWidth(availableWidth) * span + columnGap * (span - 1);
  }
}
