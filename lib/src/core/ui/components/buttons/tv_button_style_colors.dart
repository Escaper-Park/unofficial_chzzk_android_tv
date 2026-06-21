part of 'tv_button_design.dart';

Color _tvButtonContainerColor(
  Set<WidgetState> states,
  bool selected, {
  required TvButtonDesign design,
  required ColorScheme colorScheme,
}) {
  final colors = design.colors;

  if (states.contains(WidgetState.disabled)) {
    return colors.disabledContainer ??
        _tvButtonStandardContainer(design, colorScheme);
  }

  if (states.contains(WidgetState.focused)) {
    return colors.focusedContainer ?? colorScheme.inverseSurface;
  }

  if (_isTvButtonSelectedOrPressed(states, selected)) {
    return colors.selectedContainer ?? colorScheme.inverseSurface;
  }

  return colors.standardContainer ??
      _tvButtonStandardContainer(design, colorScheme);
}

Color _tvButtonContentColor(
  Set<WidgetState> states,
  bool selected, {
  required TvButtonDesign design,
  required ColorScheme colorScheme,
}) {
  final colors = design.colors;

  if (states.contains(WidgetState.disabled)) {
    return colors.disabledContent ??
        colorScheme.inverseSurface.withValues(alpha: 0.4);
  }

  if (states.contains(WidgetState.focused)) {
    return colors.focusedContent ?? colorScheme.onInverseSurface;
  }

  if (_isTvButtonSelectedOrPressed(states, selected)) {
    return colors.selectedContent ?? colorScheme.onInverseSurface;
  }

  return colors.standardContent ??
      colorScheme.inverseSurface.withValues(alpha: 0.8);
}

BorderSide _tvButtonOutlineSide(
  Set<WidgetState> states,
  bool selected, {
  required TvButtonDesign design,
  required ColorScheme colorScheme,
}) {
  if (design.outlineWidth <= 0) {
    return BorderSide.none;
  }

  return BorderSide(
    color: _tvButtonOutlineColor(
      states,
      selected,
      design: design,
      colorScheme: colorScheme,
    ),
    width: design.outlineWidth,
  );
}

Color _tvButtonStandardContainer(
  TvButtonDesign design,
  ColorScheme colorScheme,
) {
  return design.outlineWidth > 0
      ? Colors.transparent
      : colorScheme.surfaceContainerHighest;
}

Color _tvButtonOutlineColor(
  Set<WidgetState> states,
  bool selected, {
  required TvButtonDesign design,
  required ColorScheme colorScheme,
}) {
  final colors = design.colors;

  if (states.contains(WidgetState.disabled)) {
    return colors.disabledOutline ?? colorScheme.onSurfaceVariant;
  }

  if (states.contains(WidgetState.focused)) {
    return colors.focusedOutline ?? colorScheme.outline;
  }

  if (_isTvButtonSelectedOrPressed(states, selected)) {
    return colors.selectedOutline ?? colorScheme.outline;
  }

  return colors.standardOutline ?? colorScheme.onSurfaceVariant;
}
