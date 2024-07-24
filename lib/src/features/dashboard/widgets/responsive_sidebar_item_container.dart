import 'package:flutter/material.dart';

import '../../../common/widgets/focused_widget.dart';

class ResponsiveSidebarItemContainer extends StatelessWidget {
  /// A responsive container of sidebar items that changes based on the sidebar's focus state.
  const ResponsiveSidebarItemContainer({
    super.key,
    this.verticalMargin = 5.0,
    this.horizontalMargin = 5.0,
    required this.sidebarHasFocus,
    required this.focusNode,
    required this.onPressed,
    required this.collapsedWidget,
    required this.expandedWidget,
  });

  final double verticalMargin;
  final double horizontalMargin;

  /// When the sidebar has focus, this value becomes 'true'
  /// and the 'expanded' widget is displayed.
  final bool sidebarHasFocus;

  /// Add [FocusNode] to highlight the current page when the sidebar is focused.
  final FocusNode focusNode;

  final VoidCallback onPressed;

  /// If [sidebarHasFocus] is 'false', only this widget shown.
  final Widget collapsedWidget;

  // If [sidebarHasFocus] is 'true', both the collapsed and expanded widgets are shown.
  final Widget expandedWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalMargin,
        horizontal: horizontalMargin,
      ),
      child: FocusedOutlinedButton(
        autofocus: false,
        padding: const EdgeInsets.all(10.0),
        focusNode: focusNode,
        onPressed: onPressed,
        child: (_) => sidebarHasFocus
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: collapsedWidget,
                  ),
                  Expanded(
                    flex: 3,
                    child: expandedWidget,
                  ),
                ],
              )
            : collapsedWidget,
      ),
    );
  }
}
