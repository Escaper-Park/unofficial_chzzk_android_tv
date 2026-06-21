import 'package:flutter/material.dart';

import '../../components/cards/cards.dart';

enum TvGridVariant {
  category,
  feedCard,
}

final class TvGridDesign {
  const TvGridDesign({
    required this.variant,
    required this.crossAxisCount,
    required this.cardWidth,
    this.mainAxisGap = 20,
    this.crossAxisGap = 20,
    this.padding = const EdgeInsets.fromLTRB(58, 40, 58, 24),
  });

  final TvGridVariant variant;
  final int crossAxisCount;
  final TvCardWidth cardWidth;
  final double mainAxisGap;
  final double crossAxisGap;
  final EdgeInsetsGeometry padding;

  static TvGridDesign resolve(TvGridVariant variant) {
    return switch (variant) {
      TvGridVariant.category => const TvGridDesign(
        variant: TvGridVariant.category,
        crossAxisCount: 6,
        cardWidth: TvCardWidth.six,
        mainAxisGap: 24,
      ),
      TvGridVariant.feedCard => const TvGridDesign(
        variant: TvGridVariant.feedCard,
        crossAxisCount: 3,
        cardWidth: TvCardWidth.three,
      ),
    };
  }

  bool isTailIndex({
    required int index,
    required int itemCount,
    int tailRowThreshold = 2,
  }) {
    if (itemCount <= 0 || index < 0 || index >= itemCount) {
      return false;
    }

    final focusedRow = index ~/ crossAxisCount;
    final lastRow = (itemCount - 1) ~/ crossAxisCount;

    return focusedRow >= lastRow - tailRowThreshold + 1;
  }
}
