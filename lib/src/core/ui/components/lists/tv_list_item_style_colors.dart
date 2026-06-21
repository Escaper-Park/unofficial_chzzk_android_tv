part of 'tv_list_item_design.dart';

Color _tvListItemBackgroundColor({
  required TvListItemDesign design,
  required ColorScheme colorScheme,
  required bool focused,
  required bool selected,
  required bool enabled,
}) {
  final colors = design.colors;

  if (!enabled) {
    return colors.disabledBackground ?? Colors.transparent;
  }

  if (focused) {
    return colors.focusedBackground ?? colorScheme.inverseSurface;
  }

  if (selected) {
    return colors.selectedBackground ?? colorScheme.secondaryContainer;
  }

  return colors.standardBackground ?? Colors.transparent;
}

TvListItemPalette _tvListItemPalette({
  required ColorScheme colorScheme,
  required bool focused,
  required bool selected,
  required bool enabled,
}) {
  if (!enabled) {
    return TvListItemPalette(
      overline: colorScheme.onSurface.withValues(alpha: 0.24),
      title: colorScheme.onSurface.withValues(alpha: 0.4),
      icon: colorScheme.onSurface.withValues(alpha: 0.4),
      subtitle: colorScheme.onSurface.withValues(alpha: 0.24),
      action: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
      trailing: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
    );
  }

  if (focused) {
    return TvListItemPalette(
      overline: colorScheme.surface.withValues(alpha: 0.6),
      title: colorScheme.surface,
      icon: colorScheme.surface,
      subtitle: colorScheme.surface.withValues(alpha: 0.8),
      action: colorScheme.surfaceContainerHighest,
      trailing: colorScheme.inversePrimary,
    );
  }

  if (selected) {
    return TvListItemPalette(
      overline: colorScheme.onSecondaryContainer.withValues(alpha: 0.6),
      title: colorScheme.onSecondaryContainer,
      icon: colorScheme.onSecondaryContainer,
      subtitle: colorScheme.onSecondaryContainer.withValues(alpha: 0.8),
      action: colorScheme.secondary,
      trailing: colorScheme.secondary,
    );
  }

  return TvListItemPalette(
    overline: colorScheme.onSurface.withValues(alpha: 0.6),
    title: colorScheme.onSurface,
    icon: colorScheme.onSurface,
    subtitle: colorScheme.onSurface.withValues(alpha: 0.8),
    action: colorScheme.outline,
    trailing: colorScheme.secondary,
  );
}
