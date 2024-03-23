import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/assets_path.dart';
import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart';
import '../../../common/widgets/focused_outline_button.dart';
import '../../../common/widgets/optimized_image.dart';
import '../../../common/widgets/rounded_container.dart';
import '../../../utils/router/app_router.dart';
import '../../category/model/category.dart';
import '../../live/widgets/live_badge.dart';

class HomeFavoriteCategoryContainer extends StatelessWidget {
  const HomeFavoriteCategoryContainer({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final double imageWidth = Dimensions.homeFavoriteCategorySize.width;
    final formatter = NumberFormat("#,###", 'en_US');

    return RoundedContainer(
      backgroundColor: AppColors.greyContainerColor,
      borderRadius: 12.0,
      width: imageWidth,
      height: Dimensions.homeFavoriteCategorySize.height,
      child: FocusedOutlineButton(
        onPressed: () {
          context.goNamed(
            AppRoute.categoryStreaming.routeName,
            extra: {
              'category': category,
              'fromHome': true,
            },
          );
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: category.posterImageUrl == null
                  ? OptimizedAssetImage(
                      imagePath: AssetsPath.categoryBaseThumbnail,
                      imageWidth: imageWidth,
                    )
                  : OptimizedNetworkImage(
                      imageUrl: category.posterImageUrl!,
                      imageWidth: imageWidth,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: LiveBadge(
                  backgroundColor:
                      AppColors.greyContainerColor.withOpacity(0.65),
                  text: category.categoryValue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: LiveBadge(
                  text:
                      '${formatter.format(category.openLiveCount)} 라이브\n${formatter.format(category.concurrentUserCount)} 명',
                  backgroundColor:
                      AppColors.greyContainerColor.withOpacity(0.65),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
