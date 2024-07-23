import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/tag_badge.dart';
import '../../../../utils/formatter/formatter.dart';

class LiveUptime extends StatelessWidget {
  /// Uptime
  const LiveUptime({super.key, required this.strOpenDate});

  final String? strOpenDate;

  @override
  Widget build(BuildContext context) {
    final DateTime openDate =
        CustomFormatter.parseDateTimeFromString(strOpenDate!);
    final DateTime nowDate = DateTime.now();

    final Duration diff = nowDate.difference(openDate);

    return TagBadge(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.all(8.0),
      text: '${diff.paddedDuration()} 스트리밍 중',
      backgroundColor: AppColors.blackColor,
    );
  }
}
