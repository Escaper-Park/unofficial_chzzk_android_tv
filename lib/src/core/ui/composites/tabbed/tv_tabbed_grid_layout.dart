import 'package:flutter/material.dart';

import '../../../design/design.dart';
import '../../components/tabs/tabs.dart';
import '../grids/grids.dart';
import 'tv_tab_action_bar.dart';
import 'tv_tabbed_content_layout.dart';
import 'tv_tabbed_layout_design.dart';

typedef TvTabbedGridItemBuilder =
    Widget Function(
      BuildContext context,
      int index, {
      required bool autofocus,
      required TvFocusedScale focusedScale,
    });

class TvTabbedGridLayout<T> extends StatelessWidget {
  const TvTabbedGridLayout({
    super.key,
    required this.tabsNode,
    required this.gridNode,
    required this.tabs,
    required this.selectedValue,
    required this.onTabSelected,
    required this.itemCount,
    required this.itemBuilder,
    this.actions = const [],
    this.tabVariant = TvTabVariant.secondary,
    this.gridVariant = TvGridVariant.feedCard,
    this.focusedScale = TvTabbedLayoutDesign.gridFocusedScale,
    this.focusableItemCount,
    this.childAspectRatio = 1,
    this.mainAxisExtent,
    this.controller,
    this.padding = TvTabbedLayoutDesign.contentPadding,
    this.clipBehavior = Clip.hardEdge,
    this.onFocusedTail,
    this.hasMore = true,
    this.isLoadingMore = false,
    this.tailRowThreshold = 2,
    this.headerRowPadding = TvTabbedLayoutDesign.headerRowPadding,
    this.headerContentGap = TvTabbedLayoutDesign.headerContentGap,
  });

  final FocusScopeNode tabsNode;
  final FocusScopeNode gridNode;
  final List<TvTabItem<T>> tabs;
  final T selectedValue;
  final ValueChanged<T> onTabSelected;
  final int itemCount;
  final TvTabbedGridItemBuilder itemBuilder;
  final List<Widget> actions;
  final TvTabVariant tabVariant;
  final TvGridVariant gridVariant;
  final TvFocusedScale focusedScale;
  final int? focusableItemCount;
  final double childAspectRatio;
  final double? mainAxisExtent;
  final ScrollController? controller;
  final EdgeInsetsGeometry padding;
  final Clip clipBehavior;
  final VoidCallback? onFocusedTail;
  final bool hasMore;
  final bool isLoadingMore;
  final int tailRowThreshold;
  final EdgeInsetsGeometry headerRowPadding;
  final double headerContentGap;

  @override
  Widget build(BuildContext context) {
    return TvTabbedContentLayout<T>(
      tabsNode: tabsNode,
      contentNode: gridNode,
      tabs: tabs,
      selectedValue: selectedValue,
      onTabSelected: onTabSelected,
      actions: actions,
      tabVariant: tabVariant,
      headerRowPadding: headerRowPadding,
      headerContentGap: headerContentGap,
      content: TvGrid(
        node: gridNode,
        up: tabsNode,
        variant: gridVariant,
        padding: padding,
        itemCount: itemCount,
        focusableItemCount: focusableItemCount,
        childAspectRatio: childAspectRatio,
        mainAxisExtent: mainAxisExtent,
        controller: controller,
        clipBehavior: clipBehavior,
        onFocusedTail: onFocusedTail,
        hasMore: hasMore,
        isLoadingMore: isLoadingMore,
        tailRowThreshold: tailRowThreshold,
        itemBuilder: (context, index) {
          return itemBuilder(
            context,
            index,
            autofocus: index == 0,
            focusedScale: focusedScale,
          );
        },
      ),
    );
  }
}
