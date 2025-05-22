import 'package:flutter/material.dart';
import '../../../../common/constants/styles.dart' show AppColors;
import '../../../../utils/extensions/custom_extensions.dart';

class ChannelFollowerCounter extends StatelessWidget {
  const ChannelFollowerCounter({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final formattedCount = '팔로워 ${count.commaFormat()}명';

    return Text(
      formattedCount,
      style: const TextStyle(
        fontSize: 14.0,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
