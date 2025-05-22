import 'package:flutter/material.dart';

import '../../../common/widgets/ui/ui_widgets.dart' show FocusedOutlinedButton;

class ResponsiveSidebarTile extends StatelessWidget {
  /// A responsive sidebar tile that changes its layout
  /// based on the focus state of the sidebar.
  const ResponsiveSidebarTile({
    super.key,
    required this.autofocus,
    required this.sidebarHasFocus,
    required this.collapsedWidget,
    required this.expandedWidget,
    required this.onPressed,
  });

  final bool autofocus;

  /// If the sidebar has focus, this value is true, and
  /// the `expanded` widget is displayed.
  final bool sidebarHasFocus;

  /// If [sidebarHasFocus] is `false`, only this widget will be displayed.
  final Widget collapsedWidget;

  /// If [sidebarHasFocus] is `true`, both the [collapsedWidget] and the [expandedWidget]
  /// will be displayed at a ratio of 1:3.
  final Widget expandedWidget;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: FocusedOutlinedButton(
        autofocus: autofocus,
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        onPressed: onPressed,
        child: sidebarHasFocus
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
