import 'package:flutter/material.dart';

import '../../../common/constants/app_version.dart';
import '../../../common/constants/styles.dart';
import '../../../common/widgets/center_widgets.dart';

class AppInfo extends StatelessWidget {
  // App version and email address
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CenteredText(
            text: AppVersion.version,
            fontSize: 11.0,
            fontColor: AppColors.greyColor,
          ),
          SizedBox(height: 5.0),
          CenteredText(
            text: '문의: escaper.bgp@gmail.com',
            fontSize: 11.0,
            fontColor: AppColors.greyColor,
          ),
        ],
      ),
    );
  }
}
