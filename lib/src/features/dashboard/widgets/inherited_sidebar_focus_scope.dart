import 'package:flutter/material.dart';

class InheritedSidebarFocusScope extends InheritedWidget {
  /// Wrap the [DashboardScreen] with this widget to pass the sidebar [FocusScopeNode]
  /// to the sub routes of the ShellRoute.
  const InheritedSidebarFocusScope({
    super.key,
    required this.node,
    required super.child,
  });

  final FocusScopeNode node;

  static FocusScopeNode of(BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<InheritedSidebarFocusScope>();
    assert(widget != null, 'No SidebarFocusScope foun in context');
    return widget!.node;
  }

  @override
  bool updateShouldNotify(covariant InheritedSidebarFocusScope oldWidget) =>
      oldWidget.node != node;
}
