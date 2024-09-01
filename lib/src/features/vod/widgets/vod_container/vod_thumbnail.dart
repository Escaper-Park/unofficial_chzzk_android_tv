import 'package:flutter/material.dart';

import '../../../../common/constants/assets_path.dart';
import '../../../../common/constants/dimensions.dart';
import '../../../../common/widgets/optimized_image.dart';
import '../../model/vod.dart';

class VodThumbnail extends StatelessWidget {
  const VodThumbnail({
    super.key,
    required this.vod,
    this.imageHeight = Dimensions.videoThumbnailHeight,
    this.imageWidth = Dimensions.videoThumbnailWidth,
  });

  final Vod vod;
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: vod.thumbnailImageUrl != null
          ? Stack(
              children: [
                // Thumbnail
                OptimizedNetworkImage(
                  imageUrl: vod.thumbnailImageUrl!,
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
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                // Adult vod mark
                if (vod.adult)
                  OptimizedAssetImage(
                    imagePath: AssetsPath.ageRestrictionTransprent,
                    imageWidth: imageWidth,
                    imageHeight: imageHeight,
                  ),
              ],
            )
          // User is unauthenticated
          : OptimizedAssetImage(
              imagePath: AssetsPath.ageRestriction,
              imageWidth: imageWidth,
              imageHeight: imageHeight,
            ),
    );
  }
}
