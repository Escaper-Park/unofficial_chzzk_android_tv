import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../tv/focus/focus.dart';
import 'tv_rail_design.dart';

part 'tv_rail_focusable_item.dart';

typedef TvRailItemBuilder = Widget Function(BuildContext context, int index);

class TvRail extends HookWidget {
  const TvRail({
    super.key,
    required this.node,
    required this.itemCount,
    required this.itemExtent,
    required this.itemBuilder,
    this.up,
    this.down,
    this.upFocusAlignment,
    this.downFocusAlignment,
    this.upEnsureVisible = true,
    this.downEnsureVisible = true,
    this.upEnsureVisibleScope = true,
    this.downEnsureVisibleScope = true,
    this.controller,
    this.onFocusedTail,
    this.hasMore = true,
    this.isLoadingMore = false,
    this.tailItemThreshold = 6,
  }) : assert(itemCount >= 0),
       assert(itemExtent > 0),
       assert(tailItemThreshold > 0);

  final FocusScopeNode node;
  final int itemCount;
  final double itemExtent;
  final TvRailItemBuilder itemBuilder;
  final FocusScopeNode? up;
  final FocusScopeNode? down;
  final double? upFocusAlignment;
  final double? downFocusAlignment;
  final bool upEnsureVisible;
  final bool downEnsureVisible;
  final bool upEnsureVisibleScope;
  final bool downEnsureVisibleScope;
  final ScrollController? controller;
  final VoidCallback? onFocusedTail;
  final bool hasMore;
  final bool isLoadingMore;
  final int tailItemThreshold;

  @override
  Widget build(BuildContext context) {
    final fallbackController = useScrollController();
    final controller = this.controller ?? fallbackController;

    return TvFocusSection.list(
      node: node,
      up: up,
      down: down,
      upFocusAlignment: upFocusAlignment,
      downFocusAlignment: downFocusAlignment,
      upEnsureVisible: upEnsureVisible,
      downEnsureVisible: downEnsureVisible,
      upEnsureVisibleScope: upEnsureVisibleScope,
      downEnsureVisibleScope: downEnsureVisibleScope,
      child: FocusTraversalGroup(
        policy: ReadingOrderTraversalPolicy(
          requestFocusCallback: _requestRailTraversalFocus,
        ),
        child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          padding: TvRailDesign.padding,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return _TvRailFocusableItem(
              index: index,
              itemCount: itemCount,
              itemExtent: itemExtent,
              controller: controller,
              hasMore: hasMore,
              isLoadingMore: isLoadingMore,
              tailItemThreshold: tailItemThreshold,
              onFocusedTail: onFocusedTail,
              child: Padding(
                padding: EdgeInsets.only(
                  right: index == itemCount - 1 ? 0 : TvRailDesign.itemGap,
                ),
                child: SizedBox(
                  width: itemExtent,
                  child: itemBuilder(context, index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void _requestRailTraversalFocus(
  FocusNode node, {
  ScrollPositionAlignmentPolicy? alignmentPolicy,
  double? alignment,
  Duration? duration,
  Curve? curve,
}) {
  node.requestFocus();
}
