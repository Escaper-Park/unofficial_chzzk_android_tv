import 'package:flutter/material.dart';

import '../../../../../utils/formatter/formatter.dart';
import '../../../../../common/constants/styles.dart';

class LiveStreamConcurrentUserCount extends StatelessWidget {
  const LiveStreamConcurrentUserCount({
    super.key,
    required this.concurrentUserCount,
  });

  final int concurrentUserCount;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${concurrentUserCount.commaFormat()}명 시청 중 \u00b7 ',
      style: const TextStyle(
        fontSize: 11.0,
        color: AppColors.whiteColor,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class LiveStreamTitle extends StatelessWidget {
  const LiveStreamTitle({super.key, required this.liveTitle});

  final String liveTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      liveTitle.replaceAll('\n', ' '),
      style: const TextStyle(
        fontSize: 12.0,
        color: AppColors.whiteColor,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
