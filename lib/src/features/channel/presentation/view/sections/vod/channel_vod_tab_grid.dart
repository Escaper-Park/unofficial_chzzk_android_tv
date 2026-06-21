import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../channel_screen_design.dart';

class ChannelVodTabGrid extends StatelessWidget {
  const ChannelVodTabGrid({
    super.key,
    required this.gridNode,
    required this.tabsNode,
    required this.itemCount,
    required this.itemBuilder,
    this.hasMore = true,
    this.isLoadingMore = false,
    this.onFocusedTail,
  });

  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final int itemCount;
  final TvGridItemBuilder itemBuilder;
  final bool hasMore;
  final bool isLoadingMore;
  final VoidCallback? onFocusedTail;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return TvGrid(
          node: gridNode,
          up: tabsNode,
          variant: TvGridVariant.feedCard,
          padding: ChannelScreenDesign.gridPadding(
            availableWidth: constraints.maxWidth,
            variant: TvGridVariant.feedCard,
          ),
          mainAxisSpacing: ChannelScreenDesign.gridMainAxisGap,
          crossAxisSpacing: ChannelScreenDesign.gridCrossAxisGap,
          mainAxisExtent: ChannelScreenDesign.mediaGridItemHeight,
          itemCount: itemCount,
          hasMore: hasMore,
          isLoadingMore: isLoadingMore,
          onFocusedTail: onFocusedTail,
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}
