import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './custom_outline_button.dart';
import './optimized_image.dart';

import '../../constants/styles.dart';
import '../../constants/assets_path.dart';
import '../../constants/dimensions.dart';

import '../../model/live/live.dart';
import './channel_info.dart';
import 'live_badge.dart';

class LiveContainer extends StatelessWidget {
  const LiveContainer({
    super.key,
    required this.liveDetail,
    required this.onPressed,
    this.focusNode,
    this.autofocus = false,
  });

  final LiveDetail liveDetail;
  final VoidCallback onPressed;
  final bool autofocus;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = liveDetail.defaultThumbnailImageUrl == null
        ? liveDetail.liveImageUrl
        : liveDetail.defaultThumbnailImageUrl!;

    // For network image render optimizing
    const double imageContainerWidth = Dimensions.liveThumbnailWidth;

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        width: imageContainerWidth,
        child: CustomOutlineButton(
          autofocus: autofocus,
          focusNode: focusNode,
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    _thumbnailImage(
                      thumbnailUrl,
                      imageContainerWidth,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: _liveStatus(),
                    ),
                    if (liveDetail.openDate != null)
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: _uptime(),
                      ),
                  ],
                ),
              ),
              ChannelInfo(liveDetail: liveDetail),
            ],
          ),
        ),
      ),
    );
  }

  Widget _liveStatus() {
    final formatter = NumberFormat("#,###", 'en_US');

    return Padding(
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
            text: '${formatter.format(liveDetail.concurrentUserCount)}명 시청',
            backgroundColor: AppColors.blackColor,
          ),
        ],
      ),
    );
  }

  Widget _uptime() {
    final openDateString = liveDetail.openDate;

    final DateTime openDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(openDateString!);

    final DateTime nowDate = DateTime.now();

    final Duration diff = nowDate.difference(openDate);

    final String h = diff.inHours.toString().padLeft(2, '0');
    final String m = (diff.inMinutes % 60).toString().padLeft(2, '0');
    final String s = (diff.inSeconds % 60).toString().padLeft(2, '0');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LiveBadge(
        text: '$h:$m:$s 스트리밍 중',
        backgroundColor: AppColors.blackColor,
      ),
    );
  }

  Widget _thumbnailImage(
    String? thumbnailUrl,
    double imageContainerWidth,
  ) {
    return (thumbnailUrl != null && !liveDetail.adult)
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: OptimizedTempNetworkImage(
              imageUrl: thumbnailUrl.replaceAll(
                'image_{type}.jpg',
                'image_360.jpg',
              ),
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
}
