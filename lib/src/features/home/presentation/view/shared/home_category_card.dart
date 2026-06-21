import 'package:flutter/material.dart';

import '../../../../category/domain/entities/category_item.dart';
import '../../../../category/presentation/view/shared/category_poster_card.dart';
import 'home_category_card_design.dart';

class HomeCategoryCard extends StatelessWidget {
  const HomeCategoryCard({
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
    return CategoryPosterCard(
      item: item,
      autofocus: autofocus,
      badgeTextStyle: HomeCategoryCardDesign.badgeTextStyle,
      onPressed: onPressed,
    );
  }
}
