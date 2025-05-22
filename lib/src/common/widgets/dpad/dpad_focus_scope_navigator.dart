import 'package:flutter/material.dart';

import '../../constants/enums.dart' show DpadAction;
import 'dpad_widgets.dart'
    show DpadCallbackShortcuts, ShortcutsBindings, DpadKeyNodeMap;

class DpadFocusScopeNavigator extends StatelessWidget {
  /// A FocusScope navigator widget that requests focus to another [FocusScope] when
  /// the directional key is pressed, such as ArrowUp, ArrowDown, and so on.
  ///
  /// For example, if the child widget is [ListView]'s and scroll direction is `Axis.horizontal`, you should use ArrowUp, ArrowDown or both in [dpadKeyFocusScopeNodeMap].
  const DpadFocusScopeNavigator({
    super.key,
    required this.node,
    required this.dpadKeyNodeMap,
    this.autofocus = false,
    this.skipTraversal = true,
    this.onFocusChange,
    this.bindings,
    required this.child,
  });

  final FocusScopeNode node;

  /// Add a map consisting of the [DpadAction] and [FocusScopeNode] of the FocusScope widget
  /// to which you want to move the focus.
  ///
  /// e.g.) { DpadAction.arrowUp : contentScreenFSN }
  final DpadKeyNodeMap? dpadKeyNodeMap;
  final bool autofocus;
  final bool skipTraversal;
  final void Function(bool value)? onFocusChange;

  /// Custom bindings.
  final ShortcutsBindings? bindings;

  /// This should be something like a [ListView].
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DpadCallbackShortcuts(
      bindings: bindings,
      dpadKeyNodeMap: dpadKeyNodeMap ?? {},
      child: FocusScope(
        node: node,
        autofocus: autofocus,
        skipTraversal: skipTraversal,
        onFocusChange: onFocusChange,
        child: child,
      ),
    );
  }
}
