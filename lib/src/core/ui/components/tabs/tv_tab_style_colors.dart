part of 'tv_tab_design.dart';

Color _tvTabBackgroundColor({
  required TvTabDesign design,
  required ColorScheme colorScheme,
  required Set<WidgetState> states,
  required bool selected,
}) {
  if (design.variant == TvTabVariant.secondary) {
    return Colors.transparent;
  }

  final colors = design.colors;
  if (states.contains(WidgetState.disabled)) {
    return colors.disabledContainer ?? Colors.transparent;
  }

  if (states.contains(WidgetState.focused)) {
    return colors.focusedContainer ?? colorScheme.inverseSurface;
  }

  if (selected) {
    return colors.selectedContainer ?? colorScheme.secondaryContainer;
  }

  return colors.standardContainer ?? Colors.transparent;
}

Color _tvTabContentColor({
  required TvTabDesign design,
  required ColorScheme colorScheme,
  required Set<WidgetState> states,
  required bool selected,
}) {
  final colors = design.colors;

  if (states.contains(WidgetState.disabled)) {
    return colors.disabledContent ??
        colorScheme.onSurfaceVariant.withValues(alpha: 0.4);
  }

  if (states.contains(WidgetState.focused)) {
    return colors.focusedContent ??
        switch (design.variant) {
          TvTabVariant.primary => colorScheme.onInverseSurface,
          TvTabVariant.secondary => colorScheme.primary,
        };
  }

  if (selected) {
    return colors.selectedContent ??
        switch (design.variant) {
          TvTabVariant.primary => colorScheme.onSecondaryContainer,
          TvTabVariant.secondary => colorScheme.secondary,
        };
  }

  return colors.standardContent ?? colorScheme.onSurface;
}
