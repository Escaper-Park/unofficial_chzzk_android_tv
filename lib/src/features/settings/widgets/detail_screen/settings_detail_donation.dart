import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/ui/optimized_image.dart'
    show OptimizedAssetImage;

class SettingsDetailDonation extends StatelessWidget {
  const SettingsDetailDonation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OptimizedAssetImage(
          imageWidth: 200.0,
          imageHeight: 200.0,
          imagePath: 'assets/images/donation.png',
        ),
        const SizedBox(height: 10.0),
        Text(
          '개발자에게 후원 하기\n감사합니다 \u{1F60A}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
