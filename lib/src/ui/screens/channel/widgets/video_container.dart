import 'package:flutter/material.dart';

import '../../../../constants/assets_path.dart';
import '../../../../constants/dimensions.dart';
import '../../../../constants/styles.dart';
import '../../../../model/video/video.dart';
import '../../../common/custom_outline_button.dart';
import '../../../common/live_badge.dart';
import '../../../common/optimized_image.dart';

class VideoContainer extends StatelessWidget {
  const VideoContainer({
    super.key,
    required this.video,
    required this.onPressed,
  });

  final Video video;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = video.thumbnailImageUrl ?? video.trailerUrl;

    // For network image render optimizing
    const double imageContainerWidth = Dimensions.liveThumbnailWidth;

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        width: imageContainerWidth,
        child: CustomOutlineButton(
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    _thumbnailImage(
                      thumbnailUrl,
                      imageContainerWidth,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: _convertedDuration(video.duration),
                    ),
                  ],
                ),
              ),
              _videoInfo(
                video.videoTitle,
                video.publishDateAt,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _convertedDuration(int duration) {
    final int h = (duration / 3600).floor();
    final int m = ((duration / 3600 - h) * 60).floor();
    final int s = ((((duration / 3600 - h) * 60) - m) * 60).floor();

    String paddedHours = h.toString().padLeft(2, '0');
    String paddedMinutes = m.toString().padLeft(2, '0');
    String paddedSeconds = s.toString().padLeft(2, '0');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LiveBadge(
        text: '$paddedHours:$paddedMinutes:$paddedSeconds',
        backgroundColor: AppColors.blackColor,
      ),
    );
  }

  Widget _thumbnailImage(
    String? thumbnailUrl,
    double imageContainerWidth,
  ) {
    return (thumbnailUrl != null && !video.adult)
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: OptimizedTempNetworkImage(
              imageUrl: thumbnailUrl,
              imageWidth: imageContainerWidth,
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: OptimizedAssetImage(
              imagePath: AssetsPath.adultCautionImage,
              imageWidth: imageContainerWidth,
            ),
          );
  }

  Widget _videoInfo(
    String videoTitle,
    int publishDateAt,
  ) {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final timeDiff = currentTime - publishDateAt;

    final int hours = (timeDiff / (1000 * 60 * 60)).floor();

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            videoTitle,
            style: const TextStyle(
              fontSize: 13.0,
              color: AppColors.whiteColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 3.0),
          Text(
            hours > 24 ? '${hours ~/ 24}일 전' : '$hours시간 전',
            style: const TextStyle(
              color: AppColors.greyColor,
              fontSize: 11.0,
            ),
          ),
        ],
      ),
    );
  }
}
