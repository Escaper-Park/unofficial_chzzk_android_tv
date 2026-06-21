import 'package:flutter/material.dart';

import '../../../design/design.dart';

part 'tv_list_item_colors.dart';
part 'tv_list_item_line_count.dart';
part 'tv_list_item_style_colors.dart';

final class TvListItemDesign {
  const TvListItemDesign({
    required this.height,
    required this.padding,
    required this.slotGap,
    required this.iconSize,
    required this.trailingSlotSize,
    required this.itemGap,
    required this.focusedScale,
    this.radius = const BorderRadius.all(Radius.circular(8)),
    this.colors = const TvListItemColors(),
  });

  final double height;
  final EdgeInsetsGeometry padding;
  final double slotGap;
  final double iconSize;
  final double trailingSlotSize;
  final double itemGap;
  final double focusedScale;
  final BorderRadius radius;
  final TvListItemColors colors;

  TvListItemDesign copyWith({
    double? height,
    EdgeInsetsGeometry? padding,
    double? slotGap,
    double? iconSize,
    double? trailingSlotSize,
    double? itemGap,
    double? focusedScale,
    BorderRadius? radius,
    TvListItemColors? colors,
  }) {
    return TvListItemDesign(
      height: height ?? this.height,
      padding: padding ?? this.padding,
      slotGap: slotGap ?? this.slotGap,
      iconSize: iconSize ?? this.iconSize,
      trailingSlotSize: trailingSlotSize ?? this.trailingSlotSize,
      itemGap: itemGap ?? this.itemGap,
      focusedScale: focusedScale ?? this.focusedScale,
      radius: radius ?? this.radius,
      colors: colors ?? this.colors,
    );
  }

  static TvListItemDesign regular({required int lineCount}) {
    return TvListItemDesign(
      height: _tvListItemLineValue(lineCount, one: 48, two: 64, three: 80),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      slotGap: 8,
      iconSize: 32,
      trailingSlotSize: 24,
      itemGap: _tvListItemLineValue(lineCount, one: 4, two: 8, three: 12),
      focusedScale: TvFocusedScale.md.value,
      radius: TvRadius.md.borderRadius,
    );
  }

  static TvListItemDesign dense({required int lineCount}) {
    return TvListItemDesign(
      height: _tvListItemLineValue(lineCount, one: 40, two: 56, three: 72),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      slotGap: 6,
      iconSize: 18,
      trailingSlotSize: 18,
      itemGap: _tvListItemLineValue(lineCount, one: 0, two: 4, three: 8),
      focusedScale: TvFocusedScale.standard.value,
      radius: TvRadius.md.borderRadius,
    );
  }

  Color backgroundColor({
    required ColorScheme colorScheme,
    required bool focused,
    required bool selected,
    required bool enabled,
  }) {
    return _tvListItemBackgroundColor(
      design: this,
      colorScheme: colorScheme,
      focused: focused,
      selected: selected,
      enabled: enabled,
    );
  }

  TvListItemPalette palette({
    required ColorScheme colorScheme,
    required bool focused,
    required bool selected,
    required bool enabled,
  }) {
    return _tvListItemPalette(
      colorScheme: colorScheme,
      focused: focused,
      selected: selected,
      enabled: enabled,
    );
  }
}
