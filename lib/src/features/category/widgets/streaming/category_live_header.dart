import 'package:flutter/material.dart';

import '../../../../common/constants/dimensions.dart';
import '../../model/category.dart';
import 'category_favorite_button.dart';
import '../category_info.dart';
import '../category_poster.dart';

class CategoryLiveHeader extends StatelessWidget {
  const CategoryLiveHeader({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    const Size posterSize = Dimensions.categoryLiveHeaderPosterSize;
    const Size infoSize = Dimensions.categoryLiveInfoSize;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryPoster(
          posterImageUrl: category.posterImageUrl,
          imageWidth: posterSize.width,
          imageHeight: posterSize.height,
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: SizedBox(
            width: infoSize.width,
            height: infoSize.height,
            child: CategoryInfo(
              category: category,
              categoryFontSize: 24.0,
              infoFontSize: 18.0,
            ),
          ),
        ),
        CategoryFavoriteButton(category: category),
      ],
    );
  }
}
