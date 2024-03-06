import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/focused_outline_button.dart';
import '../../../../common/widgets/rounded_container.dart';
import '../../model/category.dart';
import '../category_poster.dart';
import '../category_info.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.category,
    required this.imageWidth,
    required this.imageHeight,
    required this.onPressed,
    this.autofocus = false,
  });

  final Category category;
  final double imageWidth;
  final double imageHeight;
  final VoidCallback onPressed;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: AppColors.greyContainerColor,
      borderRadius: 12.0,
      width: imageWidth,
      child: FocusedOutlineButton(
        autofocus: autofocus,
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryPoster(
              posterImageUrl: category.posterImageUrl,
              imageWidth: imageWidth,
              imageHeight: imageHeight,
            ),
            Expanded(
              child: CategoryInfo(category: category),
            ),
          ],
        ),
      ),
    );
  }
}
