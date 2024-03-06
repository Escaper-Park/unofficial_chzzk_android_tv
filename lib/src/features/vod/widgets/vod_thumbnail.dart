import 'package:flutter/material.dart';

import '../../../common/constants/assets_path.dart';
import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart';
import '../../../common/widgets/optimized_image.dart';
import '../../live/widgets/live_badge.dart';
import '../model/vod.dart';

class VodThumbnailWithStatus extends StatelessWidget {
  const VodThumbnailWithStatus({super.key, required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.liveThumbnailSize.width,
      height: Dimensions.liveThumbnailSize.height,
      child: Stack(
        children: [
          _VodThumbnailImage(vod),
          _ConvertedDuration(vod.duration),
        ],
      ),
    );
  }
}

class _VodThumbnailImage extends StatelessWidget {
  const _VodThumbnailImage(this.vod);

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    final String? thumbnailUrl = vod.thumbnailImageUrl ?? vod.trailerUrl;
    final double thumbnailWidth = Dimensions.liveThumbnailSize.width;
    final double thumbnailHeight = Dimensions.liveThumbnailSize.height;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: (thumbnailUrl != null)
          ? Stack(
              children: [
                OptimizedNetworkImage(
                  imageUrl: thumbnailUrl,
                  imageWidth: thumbnailWidth,
                  imageHeight: thumbnailHeight,
                ),
                if (vod.adult)
                  OptimizedAssetImage(
                    imagePath: AssetsPath.ageRestrictionTransprent,
                    imageWidth: thumbnailWidth,
                  ),
              ],
            )
          : // ADULT
          OptimizedAssetImage(
              imagePath: AssetsPath.ageRestriction,
              imageWidth: thumbnailWidth,
            ),
    );
  }
}

class _ConvertedDuration extends StatelessWidget {
  const _ConvertedDuration(this.duration);

  final int duration;

  @override
  Widget build(BuildContext context) {
    final int h = (duration / 3600).floor();
    final int m = ((duration / 3600 - h) * 60).floor();
    final int s = ((((duration / 3600 - h) * 60) - m) * 60).floor();

    String paddedHours = h.toString().padLeft(2, '0');
    String paddedMinutes = m.toString().padLeft(2, '0');
    String paddedSeconds = s.toString().padLeft(2, '0');

    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LiveBadge(
          text: '$paddedHours:$paddedMinutes:$paddedSeconds',
          backgroundColor: AppColors.blackColor,
        ),
      ),
    );
  }
}
