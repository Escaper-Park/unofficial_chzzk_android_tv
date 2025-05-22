import 'package:flutter/material.dart';

import '../../constants/assets_path.dart';
import '../../constants/dimensions.dart';
import 'ui_widgets.dart' show OptimizedAssetImage, OptimizedNetworkImage;

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    super.key,
    required this.thumbnailUrl,
    this.thumbnailWidth = Dimensions.videoThumbnailWidth,
    this.thumbnailHeight = Dimensions.videoThumbnailHeight,
    required this.abroad,
    required this.adult,
    this.useLatestImage = false,
    this.fit = BoxFit.cover,
  });

  final String? thumbnailUrl;
  final double thumbnailWidth;
  final double thumbnailHeight;
  final bool abroad;
  final bool adult;
  final bool useLatestImage;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: thumbnailUrl == null
          // abroad: abroadRestriction.
          // adult: ageRestriction.
          ? Center(
              child: _assetImage(
                abroad
                    ? AssetsPath.abroadRestriction
                    : AssetsPath.ageRestriction,
              ),
            )
          : Stack(
              children: [
                // live thumbnail
                _networkImage(useLatestImage, thumbnailUrl!),
                // adult only and user is verified.
                if (adult == true)
                  Center(
                    child: _assetImage(AssetsPath.ageRestrictionTransparent),
                  ),
              ],
            ),
    );
  }

  Widget _networkImage(bool useLatestThumbnail, String imageUrl) {
    return OptimizedNetworkImage(
      imageHeight: thumbnailHeight,
      imageWidth: thumbnailWidth,
      useLatestThumbnail: useLatestThumbnail,
      imageUrl: imageUrl,
      fit: fit,
    );
  }

  Widget _assetImage(String imagePath) {
    return OptimizedAssetImage(
      imageWidth: thumbnailWidth,
      imagePath: imagePath,
      fit: fit,
    );
  }
}
