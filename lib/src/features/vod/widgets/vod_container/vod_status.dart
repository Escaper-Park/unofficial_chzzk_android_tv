import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/tag_badge.dart';
import '../../../../utils/formatter/formatter.dart';

class VodDuration extends StatelessWidget {
  const VodDuration({super.key, required this.durationInSeconds});

  final int durationInSeconds;

  @override
  Widget build(BuildContext context) {
    final Duration duration = Duration(seconds: durationInSeconds);

    return TagBadge(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.all(8.0),
      text: duration.paddedDuration(),
      backgroundColor: AppColors.blackColor,
    );
  }
}

class VodPublishDateAt extends StatelessWidget {
  const VodPublishDateAt({super.key, required this.publishDateAt});

  final int publishDateAt;

  @override
  Widget build(BuildContext context) {
    final int diff = DateTime.now().millisecondsSinceEpoch - publishDateAt;
    final int hoursAt = (diff / (1000 * 60 * 60)).floor();
    final String since = hoursAt > 24 ? '${hoursAt ~/ 24}일 전' : '$hoursAt시간 전';

    return TagBadge(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.all(8.0),
      backgroundColor: AppColors.blackColor,
      text: since,
    );
  }
}
