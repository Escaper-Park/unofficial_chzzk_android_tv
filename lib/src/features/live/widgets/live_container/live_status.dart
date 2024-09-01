import 'package:flutter/material.dart';

import '../../../../common/widgets/tag_badge.dart';
import '../../../../common/constants/styles.dart';
import '../../../../utils/formatter/formatter.dart';

class LiveStatusContainer extends StatelessWidget {
  /// Live status badges located at the top left.
  const LiveStatusContainer({
    super.key,
    required this.concurrentUserCount,
  });

  final int concurrentUserCount;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Live badge
            const TagBadge(
              text: 'LIVE',
              backgroundColor: AppColors.redColor,
            ),
            const SizedBox(width: 5.0),
            // concurrent user count
            TagBadge(
              text: '${concurrentUserCount.commaFormat()} 명 시청',
              backgroundColor: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
