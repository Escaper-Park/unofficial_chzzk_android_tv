import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../category_detail_screen_design.dart';

class CategoryDetailFeedGrid extends StatelessWidget {
  const CategoryDetailFeedGrid({
    super.key,
    required this.gridNode,
    required this.tabsNode,
    required this.itemCount,
    required this.itemBuilder,
    required this.hasMore,
    required this.isLoadingMore,
    required this.onFocusedTail,
  });

  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final int itemCount;
  final TvGridItemBuilder itemBuilder;
  final bool hasMore;
  final bool isLoadingMore;
  final VoidCallback onFocusedTail;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return TvGrid(
          node: gridNode,
          up: tabsNode,
          variant: TvGridVariant.feedCard,
          padding: CategoryDetailScreenDesign.gridPadding(
            availableWidth: constraints.maxWidth,
            variant: TvGridVariant.feedCard,
          ),
          mainAxisSpacing: CategoryDetailScreenDesign.gridMainAxisGap,
          crossAxisSpacing: CategoryDetailScreenDesign.gridCrossAxisGap,
          mainAxisExtent: CategoryDetailScreenDesign.mediaGridItemHeight,
          itemCount: itemCount,
          hasMore: hasMore,
          isLoadingMore: isLoadingMore,
          onFocusedTail: onFocusedTail,
          tailRowThreshold: CategoryDetailScreenDesign.gridTailRowThreshold,
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}
