import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';
import '../../../domain/entities/category_item.dart';
import 'category_poster_card_design.dart';
import 'category_poster_card_formatters.dart';

part 'category_poster_card_badges.dart';

typedef CategoryPosterBadgeTextStyle =
    TextStyle? Function(
      TextTheme textTheme,
    );

class CategoryPosterCard extends StatelessWidget {
  const CategoryPosterCard({
    super.key,
    required this.item,
    required this.onPressed,
    this.autofocus = false,
    this.focusedScale = TvFocusedScale.standard,
    this.badgeTextStyle,
  });

  final CategoryItem item;
  final VoidCallback onPressed;
  final bool autofocus;
  final TvFocusedScale focusedScale;
  final CategoryPosterBadgeTextStyle? badgeTextStyle;

  @override
  Widget build(BuildContext context) {
    final posterImageUrl = chzzkImageUrlWithType(
      item.posterImageUrl,
      ChzzkImageVariant.categoryPoster,
    );

    return TvCard(
      autofocus: autofocus,
      onPressed: onPressed,
      width: CategoryPosterCardDesign.width,
      thumbnailRatio: CategoryPosterCardDesign.thumbnailRatio,
      content: const SizedBox.shrink(),
      design: TvCardDesign(
        radius: CategoryPosterCardDesign.radius,
        imageContentGap: 0,
        focusOutlineWidth: CategoryPosterCardDesign.focusOutlineWidth,
        focusedScale: focusedScale.value,
        focusedElevation: CategoryPosterCardDesign.focusedElevation.value,
        focusedShadowColor: CategoryPosterCardDesign.focusedShadowColor,
      ),
      image: Stack(
        fit: StackFit.expand,
        children: [
          TvMediaThumbnail(
            imageUrl: posterImageUrl,
            fallbackIcon: Icons.category_rounded,
          ),
          _CategoryNameBadge(
            text: item.title,
            badgeTextStyle: badgeTextStyle,
          ),
          _CategoryMetricBadge(
            openLiveCount: item.openLiveCount,
            concurrentUserCount: item.concurrentUserCount,
            badgeTextStyle: badgeTextStyle,
          ),
        ],
      ),
    );
  }
}
