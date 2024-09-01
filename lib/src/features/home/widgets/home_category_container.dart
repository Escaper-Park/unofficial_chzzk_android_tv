import 'package:flutter/material.dart';

import '../../../common/widgets/focused_widget.dart';
import '../../../utils/formatter/formatter.dart';
import '../../../common/constants/assets_path.dart';
import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart';
import '../../../common/widgets/optimized_image.dart';
import '../../../common/widgets/tag_badge.dart';
import '../../../utils/router/app_router.dart';
import '../../category/model/category.dart';

class HomeCategoryContainer extends StatelessWidget {
  const HomeCategoryContainer({
    super.key,
    this.autofocus = false,
    required this.focusNode,
    required this.category,
  });

  final bool autofocus;
  final FocusNode focusNode;
  final Category category;

  @override
  Widget build(BuildContext context) {
    const Size containerSize = Dimensions.followingCategoryContainerSize;

    return FocusedOutlinedButton(
      padding: EdgeInsets.zero,
      autofocus: autofocus,
      focusNode: focusNode,
      onPressed: () {
        if (context.mounted) {
          context.pushNamed(
            AppRoute.categoryDetail.routeName,
            extra: {'category': category},
          );
        }
      },
      child: (_) => Stack(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: SizedBox(
              width: containerSize.width,
              child: category.posterImageUrl == null
                  ? OptimizedAssetImage(
                      imagePath: AssetsPath.categoryBaseThumbnail,
                      imageWidth: containerSize.width,
                      imageHeight: containerSize.height,
                    )
                  : OptimizedNetworkImage(
                      imageUrl: category.posterImageUrl!,
                      imageWidth: containerSize.width,
                      imageHeight: containerSize.height,
                    ),
            ),
          ),
          // Category
          SizedBox(
            width: containerSize.width,
            child: TagBadge(
              margin: const EdgeInsets.all(5.0),
              alignment: Alignment.topLeft,
              backgroundColor: AppColors.greyContainerColor.withOpacity(0.65),
              text: category.categoryValue,
            ),
          ),
          // Status
          SizedBox(
            width: containerSize.width,
            child: TagBadge(
              margin: const EdgeInsets.all(5.0),
              alignment: Alignment.bottomRight,
              text:
                  '${category.openLiveCount.commaFormat()} 라이브\n${category.concurrentUserCount.commaFormat()} 명',
              backgroundColor: AppColors.greyContainerColor.withOpacity(0.65),
            ),
          ),
        ],
      ),
    );
  }
}
