import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../domain/entities/category_item.dart';
import '../../../category_screen_design.dart';
import 'category_grid_card.dart';

class CategoryGridSection extends StatelessWidget {
  const CategoryGridSection({
    super.key,
    required this.items,
    required this.gridNode,
    required this.navigationNode,
    required this.hasMore,
    required this.isLoadingMore,
    required this.onLoadMore,
    required this.onCategoryPressed,
  });

  final List<CategoryItem> items;
  final FocusScopeNode gridNode;
  final FocusScopeNode navigationNode;
  final bool hasMore;
  final bool isLoadingMore;
  final VoidCallback onLoadMore;
  final ValueChanged<CategoryItem> onCategoryPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return TvGrid(
          node: gridNode,
          up: navigationNode,
          variant: TvGridVariant.category,
          itemCount: items.length,
          mainAxisExtent: CategoryScreenDesign.cardHeight,
          padding: CategoryScreenDesign.gridPadding(
            availableWidth: constraints.maxWidth,
            hasMore: hasMore,
          ),
          clipBehavior: Clip.none,
          tailRowThreshold: CategoryScreenDesign.gridTailRowThreshold,
          hasMore: hasMore,
          isLoadingMore: isLoadingMore,
          onFocusedTail: onLoadMore,
          itemBuilder: (context, index) {
            final item = items[index];

            return CategoryGridCard(
              item: item,
              autofocus: index == 0,
              onPressed: () => onCategoryPressed(item),
            );
          },
        );
      },
    );
  }
}
