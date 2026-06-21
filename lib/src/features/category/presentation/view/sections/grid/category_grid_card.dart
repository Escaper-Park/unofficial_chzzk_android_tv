import 'package:flutter/material.dart';

import '../../../../../../core/assets/app_asset_paths.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../../domain/entities/category_item.dart';
import '../../../category_screen_design.dart';
import '../../../category_screen_ui_mapper.dart';

part 'category_grid_card_content.dart';
part 'category_grid_card_poster.dart';

class CategoryGridCard extends StatelessWidget {
  const CategoryGridCard({
    super.key,
    required this.item,
    required this.onPressed,
    this.autofocus = false,
  });

  final CategoryItem item;
  final VoidCallback onPressed;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: CategoryScreenDesign.cardHeight,
      child: TvCard(
        width: CategoryScreenDesign.cardWidth,
        thumbnailRatio: CategoryScreenDesign.posterRatio,
        image: _CategoryPoster(imageUrl: item.posterImageUrl),
        content: _CategoryInfo(item: item),
        autofocus: autofocus,
        onPressed: onPressed,
        design: TvCardDesign(
          radius: CategoryScreenDesign.cardRadius,
          imageContentGap: 0,
          backgroundColor: colorScheme.surfaceContainerHighest,
          focusOutlineColor: CategoryScreenDesign.cardFocusOutlineColor,
          focusOutlineWidth: CategoryScreenDesign.cardFocusOutlineWidth,
          focusedScale: CategoryScreenDesign.cardFocusedScale.value,
          focusedElevation: TvCardElevation.level2.value,
        ),
      ),
    );
  }
}
