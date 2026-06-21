import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../browse_screen_design.dart';

class BrowseTabGrid extends StatelessWidget {
  const BrowseTabGrid({
    super.key,
    required this.gridNode,
    required this.tabsNode,
    required this.itemCount,
    required this.itemBuilder,
    this.hasMore = true,
    this.isLoadingMore = false,
    this.onFocusedTail,
    this.tailRowThreshold = 2,
  });

  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final int itemCount;
  final TvGridItemBuilder itemBuilder;
  final bool hasMore;
  final bool isLoadingMore;
  final VoidCallback? onFocusedTail;
  final int tailRowThreshold;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return TvGrid(
          node: gridNode,
          up: tabsNode,
          variant: TvGridVariant.feedCard,
          padding: BrowseScreenDesign.gridPadding(
            availableWidth: constraints.maxWidth,
            variant: TvGridVariant.feedCard,
          ),
          mainAxisSpacing: BrowseScreenDesign.gridMainAxisGap,
          crossAxisSpacing: BrowseScreenDesign.gridCrossAxisGap,
          mainAxisExtent: BrowseScreenDesign.mediaGridItemHeight,
          itemCount: itemCount,
          hasMore: hasMore,
          isLoadingMore: isLoadingMore,
          onFocusedTail: onFocusedTail,
          tailRowThreshold: tailRowThreshold,
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}
