import 'package:flutter/material.dart';

import '../../../../common/constants/assets_path.dart';
import '../../../../common/constants/dimensions.dart';
import '../../../../common/widgets/optimized_image.dart';
import '../../model/live.dart';

class LiveThumbnail extends StatelessWidget {
  /// Thumbnail of live streaming updated every 5 mins.
  ///
  /// If user is unauthenticated, show the ageRestriction mark.
  const LiveThumbnail({super.key, required this.liveInfo});

  final LiveInfo liveInfo;

  @override
  Widget build(BuildContext context) {
    final String? thumbnailUrl =
        (liveInfo.defaultThumbnailImageUrl?.isNotEmpty ?? false)
            ? liveInfo.defaultThumbnailImageUrl
            : liveInfo.liveImageUrl;

    final double imageWidth = Dimensions.videoThumbnailSize.width;
    final double imageHeight = Dimensions.videoThumbnailSize.height;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: thumbnailUrl != null
          ? Stack(
              children: [
                OptimizedNetworkImage(
                  imageUrl: thumbnailUrl.replaceAll(
                    'image_{type}.jpg',
                    'image_360.jpg',
                  ),
                  useCacheKey: true,
                  useDynamicCacheKey: true,
                  imageWidth: imageWidth,
                  imageHeight: imageHeight,
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
                // Show transparent adult mark over the thumbnail.
                // Adult video & user is authenticated.
                if (liveInfo.adult == true)
                  OptimizedAssetImage(
                    imagePath: AssetsPath.ageRestrictionTransprent,
                    imageWidth: imageWidth,
                  ),
              ],
            )
          // Adult video & user is unauthenticated.
          : OptimizedAssetImage(
              imagePath: AssetsPath.ageRestriction,
              imageWidth: imageWidth,
            ),
      //,
    );
  }
}
