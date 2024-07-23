import 'package:flutter/material.dart';

extension ImageCacheX on num {
  /// Use imageWidth.cacheSize(context), imageHeight.cacheSize(context) or both
  int cacheSize(BuildContext context) =>
      (this * MediaQuery.of(context).devicePixelRatio).round();
}

class ImageUtils {
  static double imageWidthByCrossAxisCount({
    double horizontalPadding = 0.0,
    required int crossAxisCount,
    required double crossAxisSpacing,
    required BuildContext context,
  }) =>
      (MediaQuery.of(context).size.width -
          horizontalPadding * 2 -
          (crossAxisCount - 1) * crossAxisSpacing) /
      crossAxisCount;

  static double imageHeightByRatio({
    /// Ratio of Width
    required int w,

    /// Ratio of Height
    required int h,

    /// W : H image
    required double imageWidth,
  }) =>
      imageWidth / w * h;
}
