import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/assets_path.dart';
import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart';
import '../../../common/widgets/optimized_image.dart';
import '../model/live.dart';
import './live_badge.dart';

class LiveThumbnailWithStatus extends StatelessWidget {
  const LiveThumbnailWithStatus({super.key, required this.liveDetail});

  final LiveDetail liveDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.liveThumbnailSize.width,
      height: Dimensions.liveThumbnailSize.height,
      child: Stack(
        children: [
          _LiveThumbnailImage(liveDetail),
          _LiveStatus(liveDetail.concurrentUserCount),
          if (liveDetail.openDate != null) _Uptime(liveDetail.openDate!),
        ],
      ),
    );
  }
}

class _LiveStatus extends StatelessWidget {
  const _LiveStatus(this.concurrentUserCount);

  final int concurrentUserCount;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###", 'en_US');

    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Live badge
            const LiveBadge(
              text: 'LIVE',
              backgroundColor: AppColors.redColor,
            ),
            const SizedBox(width: 5.0),
            // concurrent user count
            LiveBadge(
              text: '${formatter.format(concurrentUserCount)}명 시청',
              backgroundColor: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _Uptime extends StatelessWidget {
  const _Uptime(this.stringOpenDate);

  final String stringOpenDate;

  @override
  Widget build(BuildContext context) {
    final DateTime openDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(stringOpenDate);

    final DateTime nowDate = DateTime.now();

    final Duration diff = nowDate.difference(openDate);

    final String h = diff.inHours.toString().padLeft(2, '0');
    final String m = (diff.inMinutes % 60).toString().padLeft(2, '0');
    final String s = (diff.inSeconds % 60).toString().padLeft(2, '0');

    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LiveBadge(
          text: '$h:$m:$s 스트리밍 중',
          backgroundColor: AppColors.blackColor,
        ),
      ),
    );
  }
}

class _LiveThumbnailImage extends StatelessWidget {
  const _LiveThumbnailImage(this.liveDetail);

  final LiveDetail liveDetail;

  @override
  Widget build(BuildContext context) {
    final String? thumbnailUrl = (liveDetail.defaultThumbnailImageUrl == null ||
            liveDetail.defaultThumbnailImageUrl!.isEmpty)
        ? liveDetail.liveImageUrl
        : liveDetail.defaultThumbnailImageUrl!;

    final double liveThumbnailWidth = Dimensions.liveThumbnailSize.width;
    final double liveThumbnailHeight = Dimensions.liveThumbnailSize.height;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: (thumbnailUrl != null)
          ? Stack(
              children: [
                OptimizedNetworkImage(
                  imageUrl: thumbnailUrl.replaceAll(
                    'image_{type}.jpg',
                    'image_360.jpg',
                  ),
                  imageWidth: liveThumbnailWidth,
                  imageHeight: liveThumbnailHeight,
                ),
                if (liveDetail.userAdultStatus == 'ADULT')
                  OptimizedAssetImage(
                    imagePath: AssetsPath.ageRestrictionTransprent,
                    imageWidth: liveThumbnailWidth,
                  ),
              ],
            )
          : // ADULT
          OptimizedAssetImage(
              imagePath: AssetsPath.ageRestriction,
              imageWidth: liveThumbnailWidth,
            ),
    );
  }
}
