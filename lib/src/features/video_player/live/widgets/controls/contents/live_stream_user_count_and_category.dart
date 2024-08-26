import 'package:flutter/material.dart';

import '../../../../../../utils/formatter/formatter.dart';
import '../../../../../../common/constants/styles.dart';
import '../../../../../../common/widgets/rounded_container.dart';

class LiveStreamUserCountAndCategory extends StatelessWidget {
  const LiveStreamUserCountAndCategory({
    super.key,
    required this.concurrentUserCount,
    required this.liveCategoryValue,
  });

  final int concurrentUserCount;
  final String? liveCategoryValue;

  @override
  Widget build(BuildContext context) {
    final String categoryValue =
        (liveCategoryValue == null || liveCategoryValue!.isEmpty)
            ? '?'
            : liveCategoryValue!;

    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: RoundedContainer(
          backgroundColor: AppColors.blackColor.withOpacity(0.55),
          borderRadius: 8.0,
          padding: const EdgeInsets.symmetric(
            vertical: 3.0,
            horizontal: 5.0,
          ),
          child: IntrinsicWidth(
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 2.5,
                  backgroundColor: AppColors.redColor,
                ),
                const SizedBox(width: 3.0),
                Expanded(
                  child: Text(
                    '${concurrentUserCount.commaFormat()} \u00b7 $categoryValue',
                    style: const TextStyle(
                      fontSize: 11.0,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
