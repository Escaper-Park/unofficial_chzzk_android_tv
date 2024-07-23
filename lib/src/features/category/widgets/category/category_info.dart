import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart';
import '../../../../utils/formatter/formatter.dart';
import '../../model/category.dart';

class CategoryInfo extends StatelessWidget {
  const CategoryInfo({
    super.key,
    required this.category,
    this.titleFontSize = 14.0,
    this.dataFontSize = 13.0,
  });

  final Category category;
  final double titleFontSize;
  final double dataFontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              category.categoryValue,
              style: TextStyle(
                color: AppColors.whiteColor,
                // overflow: TextOverflow.ellipsis,
                fontSize: titleFontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Open live count
          Text(
            '${category.openLiveCount.commaFormat()}개 라이브',
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: dataFontSize,
            ),
          ),
          // Concurrent user count
          Text(
            '${category.concurrentUserCount.commaFormat()}명 시청',
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: dataFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
