import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/tag_badge.dart';

class VodTagBadge extends StatelessWidget {
  const VodTagBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return const TagBadge(
      margin: EdgeInsets.all(8.0),
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
      backgroundColor: AppColors.indigoColor,
      fontColor: AppColors.whiteColor,
      text: '다시보기',
    );
  }
}
