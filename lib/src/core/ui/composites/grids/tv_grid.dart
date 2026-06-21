import 'dart:async';

import 'package:flutter/material.dart';

import '../../../tv/focus/focus.dart';
import 'tv_grid_design.dart';

typedef TvGridItemBuilder = Widget Function(BuildContext context, int index);

class TvGrid extends StatelessWidget {
  const TvGrid({
    super.key,
    required this.node,
    required this.itemCount,
    required this.itemBuilder,
    this.variant = TvGridVariant.feedCard,
    this.up,
    this.down,
    this.focusableItemCount,
    this.childAspectRatio = 1,
    this.mainAxisExtent,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.controller,
    this.padding,
    this.clipBehavior = Clip.hardEdge,
    this.onFocusedTail,
    this.hasMore = true,
    this.isLoadingMore = false,
    this.tailRowThreshold = 2,
  }) : assert(itemCount >= 0),
       assert(focusableItemCount == null || focusableItemCount <= itemCount),
       assert(tailRowThreshold > 0);

  final FocusScopeNode node;
  final int itemCount;
  final TvGridItemBuilder itemBuilder;
  final TvGridVariant variant;
  final FocusScopeNode? up;
  final FocusScopeNode? down;
  final int? focusableItemCount;
  final double childAspectRatio;
  final double? mainAxisExtent;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final Clip clipBehavior;
  final VoidCallback? onFocusedTail;
  final bool hasMore;
  final bool isLoadingMore;
  final int tailRowThreshold;

  @override
  Widget build(BuildContext context) {
    final design = TvGridDesign.resolve(variant);
    final effectiveFocusableItemCount = focusableItemCount ?? itemCount;

    return TvFocusSection.grid(
      node: node,
      itemCount: effectiveFocusableItemCount,
      crossAxisCount: design.crossAxisCount,
      up: up,
      down: down,
      builder: (context, focus) {
        return GridView.builder(
          controller: controller,
          clipBehavior: clipBehavior,
          padding: padding ?? design.padding,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: design.crossAxisCount,
            mainAxisSpacing: mainAxisSpacing ?? design.mainAxisGap,
            crossAxisSpacing: crossAxisSpacing ?? design.crossAxisGap,
            childAspectRatio: childAspectRatio,
            mainAxisExtent: mainAxisExtent,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            final child = _TvGridFocusableItem(
              index: index,
              design: design,
              itemCount: itemCount,
              hasMore: hasMore,
              isLoadingMore: isLoadingMore,
              tailRowThreshold: tailRowThreshold,
              onFocusedTail: onFocusedTail,
              child: itemBuilder(context, index),
            );

            if (index >= effectiveFocusableItemCount) {
              return child;
            }

            return focus.wrapItem(index: index, child: child);
          },
        );
      },
    );
  }
}

class _TvGridFocusableItem extends StatelessWidget {
  const _TvGridFocusableItem({
    required this.index,
    required this.design,
    required this.itemCount,
    required this.hasMore,
    required this.isLoadingMore,
    required this.tailRowThreshold,
    required this.onFocusedTail,
    required this.child,
  });

  final int index;
  final TvGridDesign design;
  final int itemCount;
  final bool hasMore;
  final bool isLoadingMore;
  final int tailRowThreshold;
  final VoidCallback? onFocusedTail;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onFocusChange: (focused) {
        if (!focused) {
          return;
        }

        unawaited(
          Scrollable.ensureVisible(
            context,
            alignment: 0.5,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
          ),
        );

        if (!hasMore || isLoadingMore) {
          return;
        }

        if (design.isTailIndex(
          index: index,
          itemCount: itemCount,
          tailRowThreshold: tailRowThreshold,
        )) {
          onFocusedTail?.call();
        }
      },
      child: child,
    );
  }
}
