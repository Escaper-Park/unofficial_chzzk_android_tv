import 'package:flutter/material.dart';

import '../../../design/design.dart';
import 'tv_tab_variant.dart';

part 'tv_tab_colors.dart';
part 'tv_tab_padding.dart';
part 'tv_tab_style_colors.dart';

final class TvTabDesign {
  const TvTabDesign({
    required this.variant,
    required this.height,
    required this.padding,
    required this.radius,
    required this.iconSize,
    required this.iconTextGap,
    required this.focusedScale,
    this.underlineHeight = 2,
    this.selectedUnderlineWidth = 8,
    this.colors = const TvTabColors(),
    this.textStyle,
  });

  static const focusedUnderlineWidth = double.infinity;

  final TvTabVariant variant;
  final double height;
  final EdgeInsetsGeometry padding;
  final BorderRadius radius;
  final double iconSize;
  final double iconTextGap;
  final double focusedScale;
  final double underlineHeight;
  final double selectedUnderlineWidth;
  final TvTabColors colors;
  final TextStyle? textStyle;

  static TvTabDesign resolve({
    required TvTabVariant variant,
    required bool showLabel,
    required bool showIcon,
  }) {
    return TvTabDesign(
      variant: variant,
      height: 32,
      padding: _tvTabPadding(showLabel: showLabel, showIcon: showIcon),
      radius: TvRadius.xl.borderRadius,
      iconSize: 18,
      iconTextGap: 6,
      focusedScale: TvFocusedScale.standard.value,
    );
  }

  ButtonStyle style({
    required ColorScheme colorScheme,
    required bool selected,
    required TextStyle? defaultTextStyle,
  }) {
    return ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(0, height)),
      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: radius),
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => backgroundColor(
          colorScheme: colorScheme,
          states: states,
          selected: selected,
        ),
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => contentColor(
          colorScheme: colorScheme,
          states: states,
          selected: selected,
        ),
      ),
      iconColor: WidgetStateProperty.resolveWith(
        (states) => contentColor(
          colorScheme: colorScheme,
          states: states,
          selected: selected,
        ),
      ),
      iconSize: WidgetStatePropertyAll(iconSize),
      textStyle: WidgetStatePropertyAll(textStyle ?? defaultTextStyle),
    );
  }

  Color backgroundColor({
    required ColorScheme colorScheme,
    required Set<WidgetState> states,
    required bool selected,
  }) {
    return _tvTabBackgroundColor(
      design: this,
      colorScheme: colorScheme,
      states: states,
      selected: selected,
    );
  }

  Color contentColor({
    required ColorScheme colorScheme,
    required Set<WidgetState> states,
    required bool selected,
  }) {
    return _tvTabContentColor(
      design: this,
      colorScheme: colorScheme,
      states: states,
      selected: selected,
    );
  }

  double? underlineWidth({
    required bool focused,
    required bool selected,
  }) {
    if (variant != TvTabVariant.secondary) {
      return null;
    }

    if (focused) {
      return focusedUnderlineWidth;
    }

    if (selected) {
      return selectedUnderlineWidth;
    }

    return null;
  }

  Color underlineColor({
    required ColorScheme colorScheme,
    required bool focused,
    required bool selected,
    required bool enabled,
  }) {
    final states = <WidgetState>{
      if (focused) WidgetState.focused,
      if (!enabled) WidgetState.disabled,
    };

    return contentColor(
      colorScheme: colorScheme,
      states: states,
      selected: selected,
    );
  }
}
