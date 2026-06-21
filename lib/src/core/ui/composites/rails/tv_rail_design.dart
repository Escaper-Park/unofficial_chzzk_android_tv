import 'package:flutter/material.dart';

final class TvRailDesign {
  const TvRailDesign._();

  static const itemGap = 20.0;
  static const leadingInset = 58.0;
  static const trailingInset = 58.0;
  static const scrollOffsetTolerance = 0.5;
  static const scrollDuration = Duration(milliseconds: 150);
  static const scrollCurve = Curves.easeOut;
  static const padding = EdgeInsets.symmetric(horizontal: leadingInset);

  static double targetOffsetForIndex({
    required int index,
    required double itemExtent,
    required double maxScrollExtent,
  }) {
    final rawOffset = index * (itemExtent + itemGap);

    return rawOffset.clamp(0, maxScrollExtent).toDouble();
  }

  static bool shouldScrollToTarget({
    required double currentOffset,
    required double targetOffset,
  }) {
    return (currentOffset - targetOffset).abs() > scrollOffsetTolerance;
  }

  static bool isTailIndex({
    required int index,
    required int itemCount,
    int tailItemThreshold = 6,
  }) {
    if (itemCount <= 0 || index < 0 || index >= itemCount) {
      return false;
    }

    return index >= itemCount - tailItemThreshold;
  }
}
