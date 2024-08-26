import 'package:flutter/material.dart';

import '../../../common/constants/assets_path.dart';
import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/optimized_image.dart';
import '../model/clip.dart';

class ClipThumbnail extends StatelessWidget {
  const ClipThumbnail({
    super.key,
    required this.clip,
    this.imageHeight = Dimensions.videoThumbnailHeight,
    this.imageWidth = Dimensions.videoThumbnailWidth,
  });

  final NaverClip clip;
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: clip.thumbnailImageUrl != null
          ? Stack(
              children: [
                // Thumbnail
                OptimizedNetworkImage(
                  imageUrl: clip.thumbnailImageUrl!,
                  imageWidth: imageWidth,
                  imageHeight: imageHeight,
                  useCacheKey: false,
                  useDynamicCacheKey: false,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: imageWidth,
                      height: imageHeight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    );
                  },
                ),
                // Adult vod mark
                if (clip.adult)
                  OptimizedAssetImage(
                    imagePath: AssetsPath.ageRestrictionTransprent,
                    imageWidth: imageWidth,
                    imageHeight: imageHeight,
                    fit: BoxFit.contain,
                  ),
              ],
            )
          : OptimizedAssetImage(
              imagePath: AssetsPath.ageRestriction,
              imageWidth: imageWidth,
              imageHeight: imageHeight,
              fit: BoxFit.contain,
            ),
    );
  }
}
