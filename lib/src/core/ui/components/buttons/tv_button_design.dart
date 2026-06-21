import 'package:flutter/material.dart';

import '../../../design/design.dart';
import 'tv_button.dart';

part 'tv_button_colors.dart';
part 'tv_button_icon_design.dart';
part 'tv_button_state_helpers.dart';
part 'tv_button_style_colors.dart';

final class TvButtonDesign {
  const TvButtonDesign({
    required this.height,
    required this.width,
    required this.padding,
    required this.radius,
    required this.iconSize,
    required this.focusedScale,
    this.outlineWidth = 0,
    this.colors = const TvButtonColors(),
    this.textStyle,
  });

  static const focusScaleDuration = Duration(milliseconds: 120);

  final double height;
  final double? width;
  final EdgeInsetsGeometry padding;
  final BorderRadius radius;
  final double iconSize;
  final double focusedScale;
  final double outlineWidth;
  final TvButtonColors colors;
  final TextStyle? textStyle;

  static TvButtonDesign resolve({
    required TvButtonType type,
    required TvIconButtonSize? iconButtonSize,
  }) {
    final size = iconButtonSize;
    if (size != null) {
      return _iconButtonDesign(type: type, size: size);
    }

    return TvButtonDesign(
      height: 40,
      width: null,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      radius: TvRadius.round.borderRadius,
      iconSize: 18,
      focusedScale: switch (type) {
        TvButtonType.filled => TvFocusedScale.md.value,
        TvButtonType.outline => TvFocusedScale.lg.value,
      },
      outlineWidth: switch (type) {
        TvButtonType.filled => 0,
        TvButtonType.outline => 1,
      },
    );
  }

  ButtonStyle style({
    required ColorScheme colorScheme,
    required bool selected,
    bool focused = false,
  }) {
    return ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(width ?? 0, height)),
      fixedSize: width == null
          ? null
          : WidgetStatePropertyAll(Size(width!, height)),
      padding: WidgetStatePropertyAll(padding),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.standard,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide.none,
        ),
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => _tvButtonContainerColor(
          _tvButtonStatesWithFocus(states, focused),
          selected,
          design: this,
          colorScheme: colorScheme,
        ),
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => _tvButtonContentColor(
          _tvButtonStatesWithFocus(states, focused),
          selected,
          design: this,
          colorScheme: colorScheme,
        ),
      ),
      iconColor: WidgetStateProperty.resolveWith(
        (states) => _tvButtonContentColor(
          _tvButtonStatesWithFocus(states, focused),
          selected,
          design: this,
          colorScheme: colorScheme,
        ),
      ),
      iconSize: WidgetStatePropertyAll(iconSize),
      iconAlignment: IconAlignment.start,
      textStyle: textStyle == null ? null : WidgetStatePropertyAll(textStyle),
      side: WidgetStateProperty.resolveWith(
        (states) => _tvButtonOutlineSide(
          _tvButtonStatesWithFocus(states, focused),
          selected,
          design: this,
          colorScheme: colorScheme,
        ),
      ),
    );
  }

  TvButtonDesign copyWith({
    double? focusedScale,
  }) {
    return TvButtonDesign(
      height: height,
      width: width,
      padding: padding,
      radius: radius,
      iconSize: iconSize,
      focusedScale: focusedScale ?? this.focusedScale,
      outlineWidth: outlineWidth,
      colors: colors,
      textStyle: textStyle,
    );
  }
}
