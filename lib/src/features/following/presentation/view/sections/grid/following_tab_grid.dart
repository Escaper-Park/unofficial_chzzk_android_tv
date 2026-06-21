import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../following_screen_design.dart';

class FollowingTabGrid extends StatelessWidget {
  const FollowingTabGrid({
    super.key,
    required this.gridNode,
    required this.tabsNode,
    required this.variant,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent,
    this.hasMore = true,
    this.isLoadingMore = false,
    this.onFocusedTail,
    this.tailRowThreshold = 2,
  });

  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final TvGridVariant variant;
  final int itemCount;
  final TvGridItemBuilder itemBuilder;
  final double? mainAxisExtent;
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
          variant: variant,
          padding: FollowingScreenDesign.gridPadding(
            availableWidth: constraints.maxWidth,
            variant: variant,
          ),
          mainAxisSpacing: FollowingScreenDesign.gridMainAxisGap,
          crossAxisSpacing: FollowingScreenDesign.gridCrossAxisGap,
          mainAxisExtent: mainAxisExtent,
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
