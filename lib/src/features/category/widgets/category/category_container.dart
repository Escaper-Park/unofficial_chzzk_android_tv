import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/focused_widget.dart';
import '../../../../common/widgets/rounded_container.dart';
import '../../model/category.dart';
import './category_info.dart';
import './category_poster.dart';

class CategoryContainer extends StatelessWidget {
  /// Category image with info.
  const CategoryContainer({
    super.key,
    required this.autofocus,
    required this.imageWidth,
    required this.imageHeight,
    required this.infoCardHeight,
    required this.category,
    required this.onPressed,
  });

  final bool autofocus;

  /// Width of poster image
  final double imageWidth;

  /// Height of poster image
  final double imageHeight;

  /// Height of a info card.
  final double infoCardHeight;

  final Category category;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: AppColors.greyContainerColor,
      width: imageWidth,
      height: imageHeight + infoCardHeight, // Poster + InfoCard height
      child: FocusedOutlinedButton(
        autofocus: autofocus,
        onPressed: onPressed,
        child: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster
            CategoryPoster(
              posterImageUrl: category.posterImageUrl,
              imageWidth: imageWidth,
              imageHeight: imageHeight,
            ),
            // Info
            Expanded(
              child: CategoryInfo(category: category),
            ),
          ],
        ),
      ),
    );
  }
}
