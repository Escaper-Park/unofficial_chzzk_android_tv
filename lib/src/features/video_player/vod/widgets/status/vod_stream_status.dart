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
        _VodStreamReadCount(vod.readCount),
        const SizedBox(width: 3.0),
        _VodStreamPublishDateAt(vod.publishDateAt),
      ],
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

class _VodStreamPublishDateAt extends StatelessWidget {
  // Since
  const _VodStreamPublishDateAt(this.publishDateAt);

  final int publishDateAt;

  @override
  Widget build(BuildContext context) {
    final int diff = DateTime.now().millisecondsSinceEpoch - publishDateAt;
    final int hoursAt = (diff / (1000 * 60 * 60)).floor();
    final String since = hoursAt > 24 ? '${hoursAt ~/ 24}일 전' : '$hoursAt시간 전';

    return TagBadge(
      text: since,
      backgroundColor: AppColors.blackColor,
    );
  }
}
