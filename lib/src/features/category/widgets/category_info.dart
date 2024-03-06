import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/styles.dart';
import '../model/category.dart';

class CategoryInfo extends StatelessWidget {
  const CategoryInfo({
    super.key,
    required this.category,
    this.categoryFontSize = 14.0,
    this.infoFontSize = 13.0,
  });

  final Category category;
  final double categoryFontSize;
  final double infoFontSize;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###", 'en_US');

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
                fontSize: categoryFontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            '${formatter.format(category.openLiveCount)}개 라이브',
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: infoFontSize,
            ),
          ),
          Text(
            '${formatter.format(category.concurrentUserCount)}명 시청',
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: infoFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
