import 'package:flutter/material.dart';

import '../../../tv/focus/focus.dart';
import '../../components/tabs/tabs.dart';
import '../../layouts/layouts.dart';
import 'tv_tab_action_bar.dart';
import 'tv_tabbed_layout_design.dart';

class TvTabbedContentLayout<T> extends StatelessWidget {
  const TvTabbedContentLayout({
    super.key,
    required this.tabsNode,
    required this.contentNode,
    required this.tabs,
    required this.selectedValue,
    required this.onTabSelected,
    required this.content,
    this.actions = const [],
    this.tabVariant = TvTabVariant.secondary,
    this.headerRowPadding = TvTabbedLayoutDesign.headerRowPadding,
    this.headerContentGap = TvTabbedLayoutDesign.headerContentGap,
    this.contentFocusAlignment,
    this.contentEnsureVisible = true,
    this.contentEnsureVisibleScope = false,
  });

  final FocusScopeNode tabsNode;
  final FocusScopeNode contentNode;
  final List<TvTabItem<T>> tabs;
  final T selectedValue;
  final ValueChanged<T> onTabSelected;
  final Widget content;
  final List<Widget> actions;
  final TvTabVariant tabVariant;
  final EdgeInsetsGeometry headerRowPadding;
  final double headerContentGap;
  final double? contentFocusAlignment;
  final bool contentEnsureVisible;
  final bool contentEnsureVisibleScope;

  @override
  Widget build(BuildContext context) {
    return GridContentLayout(
      headerRowPadding: headerRowPadding,
      headerContentGap: headerContentGap,
      header: TvFocusSection.list(
        node: tabsNode,
        down: contentNode,
        downFocusAlignment: contentFocusAlignment,
        downEnsureVisible: contentEnsureVisible,
        downEnsureVisibleScope: contentEnsureVisibleScope,
        child: TvTabActionBar(
          tabs: tabs,
          selectedValue: selectedValue,
          onTabSelected: onTabSelected,
          actions: actions,
          tabVariant: tabVariant,
        ),
      ),
      content: content,
    );
  }
}
