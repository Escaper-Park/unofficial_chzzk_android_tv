import 'package:flutter/widgets.dart';

import '../../../common/widgets/ui/thumbnail.dart';
import '../model/vod.dart';

import 'package:flutter/material.dart';
import '../../../common/constants/styles.dart';

class VodThumbnail extends StatelessWidget {
  const VodThumbnail({
    super.key,
    required this.vod,
    this.timeline,
    this.duration,
  });

  final Vod vod;
  final int? timeline;
  final int? duration;

  @override
  Widget build(BuildContext context) {
    final double progress = (timeline != null && duration != null && duration! > 0)
        ? timeline! / duration!
        : 0.0;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Thumbnail(
          thumbnailUrl: vod.thumbnailImageUrl,
          abroad: vod.blindType == "ABROAD",
          adult: vod.adult,
        ),
        if (progress > 0)
          LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.blackColor.withOpacity(0.5),
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.chzzkColor),
            minHeight: 5.0,
          ),
      ],
    );
  }
}
