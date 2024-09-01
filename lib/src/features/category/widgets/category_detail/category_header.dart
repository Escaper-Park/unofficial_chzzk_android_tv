import 'package:flutter/material.dart';

import '../../../../common/constants/dimensions.dart';
import '../../model/category.dart';
import '../category/category_info.dart';
import '../category/category_poster.dart';
import 'category_following_button.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({
    super.key,
    required this.category,
    required this.followingButtonFSN,
    required this.sidebarFSN,
    required this.gridViewFSN,
  });

  final Category category;
  final FocusScopeNode followingButtonFSN;
  final FocusScopeNode sidebarFSN;
  final FocusScopeNode gridViewFSN;

  @override
  Widget build(BuildContext context) {
    const Size posterSize = Dimensions.categoryHeaderPosterImageSize;
    const Size infoSize = Dimensions.categoryInfoSize;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster
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
                titleFontSize: 20.0,
              ),
            ),
          ),
          // Following
          CategoryFollowingButton(
            category: category,
            followingButtonFSN: followingButtonFSN,
            sidebarFSN: sidebarFSN,
            gridViewFSN: gridViewFSN,
          ),
        ],
      ),
    );
  }
}
