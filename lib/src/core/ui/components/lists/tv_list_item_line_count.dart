part of 'tv_list_item_design.dart';

double _tvListItemLineValue(
  int lineCount, {
  required double one,
  required double two,
  required double three,
}) {
  final clampedLineCount = lineCount.clamp(1, 3).toInt();

  return switch (clampedLineCount) {
    1 => one,
    2 => two,
    _ => three,
  };
}
