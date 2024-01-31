import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/styles.dart';
import '../../../../controller/multi_view/multi_view_controller.dart';
import '../../../common/custom_outline_button.dart';

class MultiViewStartButton extends ConsumerWidget {
  const MultiViewStartButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveDetails = ref.watch(multiViewControllerProvider);

    return CustomOutlineButton(
      padding: const EdgeInsets.all(20.0),
      onPressed: () {
        ref.read(multiViewControllerProvider.notifier).showMultiViewChannel(
              context: context,
              liveDetails: liveDetails,
            );
      },
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.video_collection_rounded,
              color: AppColors.whiteColor,
            ),
            SizedBox(width: 10.0),
            Text(
              '멀티뷰 시청하기',
              style: TextStyle(
                fontSize: 16.0,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w700,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
