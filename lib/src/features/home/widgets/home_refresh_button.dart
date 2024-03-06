import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/focused_outline_button.dart';
import '../../live/controller/live_controller.dart';

class HomeRefreshButton extends ConsumerWidget {
  const HomeRefreshButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Material(
        elevation: 5.0,
        color: AppColors.greyContainerColor,
        borderRadius: BorderRadius.circular(12.0),
        child: FocusedOutlineButton(
          padding: const EdgeInsets.all(10.0),
          onPressed: () {
            ref.invalidate(followingLiveControllerProvider);
            ref.invalidate(popularLiveControllerProvider);
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
                '새로고침',
                style: TextStyle(
                  fontSize: 14.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
