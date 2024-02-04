import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/styles.dart';
import '../../../../controller/following/following_controller.dart';
import '../../../../controller/popular/popular_controller.dart';
import '../../../common/custom_outline_button.dart';

class HomeRefreshButton extends ConsumerWidget {
  const HomeRefreshButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomOutlineButton(
      padding: const EdgeInsets.all(10.0),
      onPressed: () {
        ref.invalidate(popularControllerProvider);
        ref.invalidate(followingLivesControllerProvider);
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.refresh,
            color: AppColors.whiteColor,
          ),
          SizedBox(width: 10.0),
          Text(
            '홈 화면 새로고침',
            style: TextStyle(
              fontSize: 16.0,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
