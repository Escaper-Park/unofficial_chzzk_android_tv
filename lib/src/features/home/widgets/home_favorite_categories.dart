import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/assets_path.dart';
import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart';
import '../../../common/widgets/center_text.dart';
import '../../../common/widgets/focused_outline_button.dart';
import '../../../common/widgets/header_text.dart';
import '../../../common/widgets/optimized_image.dart';
import '../../../common/widgets/rounded_container.dart';
import '../../../utils/router/app_router.dart';
import '../../category/controller/category_controller.dart';
import '../../category/model/category.dart';
import '../../live/widgets/live_badge.dart';

class HomeFavoriteCategories extends ConsumerWidget {
  const HomeFavoriteCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFavoriteCategories =
        ref.watch(favoriteCategoriesControllerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(
          text: '즐겨찾는 카테고리',
          onPressed: null,
        ),
        SizedBox(
          height: Dimensions.homeFavoriteCategorySize.height,
          child: switch (asyncFavoriteCategories) {
            AsyncData(:final value) => value.isEmpty
                ? const CenterText(text: '즐겨찾기한 카테고리가 없습니다')
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: _HomeFavoriteCategoryContainer(value[index]),
                      );
                    },
                  ),
            AsyncError() => const CenterText(text: '카테고리 즐겨찾기를 불러올 수 없습니다'),
            _ => const CenterText(text: '즐겨찾기 카테고리 불러오는 중...'),
          },
        ),
      ],
    );
  }
}

class _HomeFavoriteCategoryContainer extends StatelessWidget {
  const _HomeFavoriteCategoryContainer(this.category);

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
