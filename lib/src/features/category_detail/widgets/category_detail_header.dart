import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../category/model/category.dart';
import '../../category/widgets/category_widgets.dart'
    show CategoryPoster, CategoryInfoCard;
import 'category_detail_widgets.dart' show CategoryFollowingButton;

class CategoryDetailHeader extends StatelessWidget {
  const CategoryDetailHeader({
    super.key,
    required this.asyncCategoryFollowingList,
    required this.category,
    required this.itemNode,
    required this.sidebarFSN,
    required this.belowFSN,
    required this.toggleFollow,
  });

  final AsyncValue<List<Category>?> asyncCategoryFollowingList;
  final Category category;
  final FocusScopeNode itemNode;
  final FocusScopeNode? sidebarFSN;
  final FocusScopeNode belowFSN;
  final Future<void> Function(bool isFollowing, Category category) toggleFollow;
  @override
  Widget build(BuildContext context) {
    final double categoryDetailPosterWidth =
        Dimensions.categoryDetailPosterWidth;
    final double categoryDetailPosterHeight =
        Dimensions.categoryDetailPosterHeight;
    final double categoryDetailInfoCardHeight =
        Dimensions.categoryDetailInfoCardHeight;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // poster
              CategoryPoster(
                posterImageUrl: category.posterImageUrl,
                posterWidth: categoryDetailPosterWidth,
                posterHeight: categoryDetailPosterHeight,
              ),
              const SizedBox(width: 10.0),
              // info
              SizedBox(
                height: categoryDetailInfoCardHeight,
                child: CategoryInfoCard(
                  category: category,
                  fontSize: 26.0,
                  iconSize: 20.0,
                ),
              ),
            ],
          ),
          // following Button
          CategoryFollowingButton(
            category: category,
            asyncCategoryFollowingList: asyncCategoryFollowingList,
            followingButtonFSN: itemNode,
            sidebarFSN: sidebarFSN,
            belowFSN: belowFSN,
            toggleFollow: toggleFollow,
          ),
        ],
      ),
    );
  }
}
