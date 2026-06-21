import 'package:flutter/material.dart';

import '../../../tv/focus/focus.dart';
import '../../components/tabs/tabs.dart';
import '../../components/text_fields/text_fields.dart';
import 'tv_tab_action_bar.dart';
import 'tv_tabbed_content_layout.dart';
import 'tv_tabbed_layout_design.dart';

class TvTabbedInputLayout<T> extends StatelessWidget {
  const TvTabbedInputLayout({
    super.key,
    required this.tabsNode,
    required this.inputNode,
    required this.tabs,
    required this.selectedValue,
    required this.onTabSelected,
    required this.value,
    required this.onInputPressed,
    this.actions = const [],
    this.label,
    this.hintText,
    this.supportingText,
    this.showHint = true,
    this.active = false,
    this.autofocus = false,
    this.inputDesign,
    this.tabVariant = TvTabVariant.secondary,
    this.inputPadding = TvTabbedLayoutDesign.contentPadding,
    this.headerRowPadding = TvTabbedLayoutDesign.headerRowPadding,
    this.headerContentGap = TvTabbedLayoutDesign.headerContentGap,
  });

  final FocusScopeNode tabsNode;
  final FocusScopeNode inputNode;
  final List<TvTabItem<T>> tabs;
  final T selectedValue;
  final ValueChanged<T> onTabSelected;
  final String value;
  final VoidCallback onInputPressed;
  final List<Widget> actions;
  final String? label;
  final String? hintText;
  final String? supportingText;
  final bool showHint;
  final bool active;
  final bool autofocus;
  final TvTextFieldDesign? inputDesign;
  final TvTabVariant tabVariant;
  final EdgeInsetsGeometry inputPadding;
  final EdgeInsetsGeometry headerRowPadding;
  final double headerContentGap;

  @override
  Widget build(BuildContext context) {
    return TvTabbedContentLayout<T>(
      tabsNode: tabsNode,
      contentNode: inputNode,
      tabs: tabs,
      selectedValue: selectedValue,
      onTabSelected: onTabSelected,
      actions: actions,
      tabVariant: tabVariant,
      headerRowPadding: headerRowPadding,
      headerContentGap: headerContentGap,
      content: TvFocusSection.list(
        node: inputNode,
        up: tabsNode,
        child: Padding(
          padding: inputPadding,
          child: SizedBox(
            width: double.infinity,
            child: TvTextField(
              value: value,
              label: label,
              hintText: hintText,
              supportingText: supportingText,
              showHint: showHint,
              active: active,
              autofocus: autofocus,
              design: inputDesign,
              onPressed: onInputPressed,
            ),
          ),
        ),
      ),
    );
  }
}
