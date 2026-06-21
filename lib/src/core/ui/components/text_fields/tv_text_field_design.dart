import 'package:flutter/material.dart';

import '../../../design/design.dart';

final class TvTextFieldDesign {
  const TvTextFieldDesign({
    this.fieldHeight = 48,
    this.fieldPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.gap = 6,
    this.radius = const BorderRadius.all(Radius.circular(8)),
    this.outlineWidth = 2,
    this.focusedScale = 1,
    this.cursorWidth = 2,
    this.cursorHeight = 20,
    this.cursorGap = 2,
    this.cursorBlinkInterval = const Duration(milliseconds: 530),
    this.colors = const TvTextFieldColors(),
  });

  final double fieldHeight;
  final EdgeInsetsGeometry fieldPadding;
  final double gap;
  final BorderRadius radius;
  final double outlineWidth;
  final double focusedScale;
  final double cursorWidth;
  final double cursorHeight;
  final double cursorGap;
  final Duration cursorBlinkInterval;
  final TvTextFieldColors colors;

  static TvTextFieldDesign standard() {
    return TvTextFieldDesign(
      radius: TvRadius.md.borderRadius,
      focusedScale: TvFocusedScale.standard.value,
    );
  }

  Color fieldBackgroundColor({
    required ColorScheme colorScheme,
    required bool focused,
    required bool active,
  }) {
    if (focused) {
      return colors.focusedFieldBackground ?? colorScheme.onInverseSurface;
    }

    if (active) {
      return colors.activeFieldBackground ?? Colors.transparent;
    }

    return colors.standardFieldBackground ?? Colors.transparent;
  }

  Color outlineColor({
    required ColorScheme colorScheme,
    required bool active,
  }) {
    if (active) {
      return colors.activeOutline ?? colorScheme.primary;
    }

    return colors.standardOutline ?? colorScheme.outline;
  }

  Color labelColor({
    required ColorScheme colorScheme,
    required bool active,
  }) {
    if (active) {
      return colors.activeLabel ?? colorScheme.primary;
    }

    return colors.standardLabel ?? colorScheme.onSurfaceVariant;
  }

  Color supportingTextColor(ColorScheme colorScheme) {
    return colors.supportingText ?? colorScheme.onSurfaceVariant;
  }

  Color inputTextColor({
    required ColorScheme colorScheme,
    required bool showingHint,
  }) {
    if (showingHint) {
      return colors.hintText ?? colorScheme.onSurface.withValues(alpha: 0.6);
    }

    return colors.inputText ?? colorScheme.onSurface;
  }

  Color cursorColor(ColorScheme colorScheme) {
    return colors.cursor ?? colorScheme.primary;
  }
}

final class TvTextFieldColors {
  const TvTextFieldColors({
    this.standardFieldBackground,
    this.focusedFieldBackground,
    this.activeFieldBackground,
    this.standardOutline,
    this.activeOutline,
    this.standardLabel,
    this.activeLabel,
    this.supportingText,
    this.inputText,
    this.hintText,
    this.cursor,
  });

  final Color? standardFieldBackground;
  final Color? focusedFieldBackground;
  final Color? activeFieldBackground;
  final Color? standardOutline;
  final Color? activeOutline;
  final Color? standardLabel;
  final Color? activeLabel;
  final Color? supportingText;
  final Color? inputText;
  final Color? hintText;
  final Color? cursor;
}
