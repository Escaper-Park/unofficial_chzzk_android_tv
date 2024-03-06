import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/styles.dart';
import '../model/vod.dart';

class VodInfo extends StatelessWidget {
  const VodInfo({super.key, required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    final timeDiff = currentTime - vod.publishDateAt;

    final int hours = (timeDiff / (1000 * 60 * 60)).floor();

    final String since = hours > 24 ? '${hours ~/ 24}일 전' : '$hours시간 전';
    final formatter = NumberFormat("#,###", 'en_US');
    final String readCount = formatter.format(vod.readCount ?? 0);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              vod.videoTitle.replaceAll('\n', ' '),
              style: const TextStyle(
                fontSize: 13.0,
                color: AppColors.whiteColor,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            '조회수 $readCount회 \u00B7 $since',
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
