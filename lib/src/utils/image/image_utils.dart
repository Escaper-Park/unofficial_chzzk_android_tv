import 'package:flutter/material.dart';

abstract class ImageUtils {
  const ImageUtils._();

  /// Used in GridView
  static double calcImageWidthByCrossAxisCount(
    BuildContext context, {
    double horizontalPadding = 0.0,
    required double screenWidth,
    required int crossAxisCount,
    required double crossAxisSpacing,
  }) {
    final double availableGridWidth = screenWidth - horizontalPadding * 2;

    return (availableGridWidth - (crossAxisCount - 1) * crossAxisSpacing) /
        crossAxisCount;
  }

  /// Used in GridView
  static double calcImageHeightByRatio({
    required int w,
    required int h,
    required double imageWidth,
  }) =>
      imageWidth / w * h;
}
