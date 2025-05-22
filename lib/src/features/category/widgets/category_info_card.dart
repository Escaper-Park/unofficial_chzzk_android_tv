import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/custom_badge.dart';
import '../../../utils/extensions/custom_extensions.dart';
import '../model/category.dart';

class CategoryInfoCard extends StatelessWidget {
  const CategoryInfoCard({
    super.key,
    required this.category,
    this.fontSize = 13.0,
    this.iconSize = 16.0,
  });

  final Category category;
  final double fontSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final openLiveCount = category.openLiveCount.commaFormat();
    final concurrentUserCount = category.concurrentUserCount.commaFormat();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              maxLines: 2,
              category.categoryValue,
              style: TextStyle(
                color: AppColors.whiteColor,
                overflow: TextOverflow.ellipsis,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          _iconText(openLiveCount, concurrentUserCount),
        ],
      ),
    );
  }

  IconElement _iconElement(IconData iconData) => IconElement(
        icon: iconData,
        iconColor: AppColors.greyColor,
        iconSize: iconSize,
      );

  TextElement _textElement(String text) => TextElement(
        text: text,
        fontColor: AppColors.greyColor,
        fontSize: iconSize - 6.0,
      );

  Widget _iconText(String openLiveCount, String concurrentUserCount) {
    return RichIconText(
      elements: [
        _iconElement(Icons.live_tv_rounded),
        _textElement(openLiveCount),
        PaddingElement(),
        _iconElement(Icons.person_2_rounded),
        _textElement(concurrentUserCount),
      ],
    );
  }
}
