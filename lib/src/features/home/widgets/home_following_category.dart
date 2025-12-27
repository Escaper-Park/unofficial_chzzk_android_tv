import 'package:flutter/material.dart';

import '../../../common/widgets/ui/rich_icon_text.dart';
import '../../../utils/extensions/custom_extensions.dart';
import '../../../common/constants/assets_path.dart' show AssetsPath;
import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/optimized_image.dart';
import '../../../common/widgets/ui/ui_widgets.dart'
    show CustomBadge, FocusedOutlinedButton;
import '../../category/model/category.dart';

class HomeFollowingCategoryItem extends StatelessWidget {
  const HomeFollowingCategoryItem({
    super.key,
    required this.category,
    required this.focusNode,
    required this.onPressed,
  });

  final Category category;
  final FocusNode focusNode;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final openLive = category.openLiveCount.commaFormat();
    final concurrentUserCount = category.concurrentUserCount.commaFormat();

    return FocusedOutlinedButton(
      autofocus: false,
      focusNode: focusNode,
      onPressed: onPressed,
      child: SizedBox(
        width: Dimensions.homeCategoryContainerWidth,
        height: Dimensions.homeCategoryContainerHeight,
        child: Stack(
          children: [
            // poster
            _poster(category.posterImageUrl),
            //
            _categoryBadge(category.categoryValue),
            //
            _iconBadge(openLive, concurrentUserCount),
          ],
        ),
      ),
    );
  }

  Widget _poster(String? posterImgUrl) {
    final posterWidth = Dimensions.homeCategoryPosterWidth;
    final posterHeight = Dimensions.homeCategoryPosterHeight;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: SizedBox(
        width: Dimensions.homeCategoryContainerWidth,
        height: Dimensions.homeCategoryContainerHeight,
        child: posterImgUrl == null
            ? OptimizedAssetImage(
                imagePath: AssetsPath.categoryBaseThumbnail,
                imageWidth: posterWidth,
                imageHeight: posterHeight,
              )
            : OptimizedNetworkImage(
                imageUrl: posterImgUrl,
                imageWidth: posterWidth,
                imageHeight: posterHeight,
                fit: BoxFit.fill,
              ),
      ),
    );
  }

  Widget _categoryBadge(String text) {
    return CustomBadge(
      margin: const EdgeInsets.all(5.0),
      alignment: Alignment.topLeft,
      backgroundColor: AppColors.greyContainerColor.withOpacity(0.9),
      elements: [TextElement(text: text)],
    );
  }

  Widget _iconBadge(String openLive, String concurrentUserCount) {
    return CustomBadge(
      margin: const EdgeInsets.all(5.0),
      alignment: Alignment.bottomRight,
      backgroundColor: AppColors.greyContainerColor.withOpacity(0.9),
      elements: [
        IconElement(icon: Icons.live_tv_rounded),
        TextElement(text: openLive),
        PaddingElement(horizontalPadding: 3.0),
        IconElement(icon: Icons.person_2_rounded),
        TextElement(text: concurrentUserCount),
      ],
    );
  }
}
