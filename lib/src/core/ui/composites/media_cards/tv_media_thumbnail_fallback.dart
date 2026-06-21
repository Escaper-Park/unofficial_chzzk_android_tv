import 'package:flutter/material.dart';

import '../../components/primitives/primitives.dart';
import 'tv_media_card_design.dart';

class TvMediaThumbnailFallback extends StatelessWidget {
  const TvMediaThumbnailFallback({
    super.key,
    required this.icon,
    this.showLoadingAsset = false,
  });

  final IconData icon;
  final bool showLoadingAsset;

  @override
  Widget build(BuildContext context) {
    final fallback = ColoredBox(
      color: TvMediaCardDesign.thumbnailFallbackColor,
      child: Center(
        child: Icon(
          icon,
          color: TvMediaCardDesign.thumbnailFallbackIconColor,
        ),
      ),
    );

    if (!showLoadingAsset) {
      return fallback;
    }

    return ColoredBox(
      color: TvMediaCardDesign.thumbnailFallbackColor,
      child: Center(
        child: OptimizedImage.asset(
          TvMediaCardDesign.thumbnailLoadingAsset,
          width: TvMediaCardDesign.thumbnailLoadingIconSize,
          height: TvMediaCardDesign.thumbnailLoadingIconSize,
          fit: BoxFit.contain,
          errorFallback: fallback,
        ),
      ),
    );
  }
}

final class TvMediaThumbnailSize {
  const TvMediaThumbnailSize({
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  static TvMediaThumbnailSize fromConstraints(BoxConstraints constraints) {
    final width = constraints.maxWidth.isFinite
        ? constraints.maxWidth
        : TvMediaCardDesign.width.value;
    final height = constraints.maxHeight.isFinite
        ? constraints.maxHeight
        : TvMediaCardDesign.thumbnailHeight(TvMediaCardDesign.width);

    return TvMediaThumbnailSize(width: width, height: height);
  }
}
