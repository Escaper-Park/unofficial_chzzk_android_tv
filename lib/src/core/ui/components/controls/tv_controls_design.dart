import 'package:flutter/material.dart';

enum TvControlSize {
  standard,
  large,
}

enum TvCheckboxShape {
  rectangle,
  rounded,
}

final class TvControlDesign {
  const TvControlDesign._();

  static double containerSize(TvControlSize size) {
    return switch (size) {
      TvControlSize.standard => 24,
      TvControlSize.large => 32,
    };
  }

  static Size switchSize(TvControlSize size) {
    return switch (size) {
      TvControlSize.standard => const Size(30, 18),
      TvControlSize.large => const Size(40, 24),
    };
  }

  static double switchScale(TvControlSize size) {
    final target = switchSize(size);
    return target.height / materialSwitchTrackSize.height;
  }

  static const materialSwitchTrackSize = Size(52, 32);

  static Color selectionColor({
    required ColorScheme colorScheme,
    required bool focused,
    required bool selected,
  }) {
    if (focused) {
      return selected
          ? colorScheme.inversePrimary
          : colorScheme.surfaceContainerHighest;
    }

    return selected ? colorScheme.secondary : colorScheme.outline;
  }

  static TvSwitchPalette switchPalette({
    required ColorScheme colorScheme,
    required bool focused,
    required bool selected,
  }) {
    if (focused && selected) {
      return TvSwitchPalette(
        track: colorScheme.inversePrimary,
        handle: colorScheme.onPrimaryContainer,
        stroke: Colors.transparent,
      );
    }

    if (focused) {
      return TvSwitchPalette(
        track: colorScheme.surfaceContainerHighest,
        handle: colorScheme.outline,
        stroke: colorScheme.outline,
      );
    }

    if (selected) {
      return TvSwitchPalette(
        track: colorScheme.primary,
        handle: colorScheme.primaryContainer,
        stroke: Colors.transparent,
      );
    }

    return TvSwitchPalette(
      track: colorScheme.surfaceContainerHighest,
      handle: colorScheme.outline,
      stroke: colorScheme.outline,
    );
  }

  static Color checkmarkColor({
    required ColorScheme colorScheme,
    required bool focused,
  }) {
    return focused ? colorScheme.inversePrimary : colorScheme.secondary;
  }
}

final class TvSwitchPalette {
  const TvSwitchPalette({
    required this.track,
    required this.handle,
    required this.stroke,
  });

  final Color track;
  final Color handle;
  final Color stroke;
}
