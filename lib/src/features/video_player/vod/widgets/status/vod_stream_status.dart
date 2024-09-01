import 'package:flutter/material.dart';

import '../../../../../common/constants/styles.dart';
import '../../../../../utils/formatter/formatter.dart';
import '../../../../../common/widgets/tag_badge.dart';
import '../../../../vod/model/vod.dart';

class VodStreamStatus extends StatelessWidget {
  /// Read count and publish date at.
  const VodStreamStatus({super.key, required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _VodStreamCategory(vod.videoCategoryValue),
        const SizedBox(width: 3.0),
        _VodStreamReadCount(vod.readCount),
        const SizedBox(width: 3.0),
        _VodStreamPublishDate(vod.publishDate),
      ],
    );
  }
}

class _VodStreamCategory extends StatelessWidget {
  const _VodStreamCategory(this.category);

  final String? category;

  @override
  Widget build(BuildContext context) {
    return TagBadge(
      text: category ?? '?',
      backgroundColor: AppColors.blackColor,
      fontColor: AppColors.whiteColor,
    );
  }
}

class _VodStreamReadCount extends StatelessWidget {
  // Show current read count of vod.
  const _VodStreamReadCount(this.readCount);

  final int readCount;

  @override
  Widget build(BuildContext context) {
    return TagBadge(
      text: '조회수 ${readCount.commaFormat()}',
      backgroundColor: AppColors.blackColor,
    );
  }
}

class _VodStreamPublishDate extends StatelessWidget {
  const _VodStreamPublishDate(this.publishDate);

  final String publishDate;

  @override
  Widget build(BuildContext context) {
    return TagBadge(
      text: publishDate.split(' ')[0],
      backgroundColor: AppColors.blackColor,
    );
  }
}
