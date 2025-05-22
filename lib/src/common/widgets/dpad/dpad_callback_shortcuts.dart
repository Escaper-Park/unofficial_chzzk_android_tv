import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LogicalKeyboardKey;

import '../../constants/enums.dart' show DpadAction;

typedef ShortcutsBindings = Map<ShortcutActivator, void Function()>;
typedef DpadKeyNodeMap = Map<DpadAction, FocusScopeNode?>;

class DpadCallbackShortcuts extends StatelessWidget {
  /// A [Callbackshortcuts] with auto-creates a bindings that requests
  /// focus on the node you mapped when a directional key is pressed.
  const DpadCallbackShortcuts({
    super.key,
    required this.dpadKeyNodeMap,
    this.bindings,
    required this.child,
  });

  /// Add a map consisting of the [DpadAction] and [FocusScopeNode] of the FocusScope widget
  /// to which you want to move the focus.
  ///
  /// e.g.) { DpadAction.arrowUp : contentScreenFSN }
  final DpadKeyNodeMap? dpadKeyNodeMap;

  /// Custom bindings.
  final ShortcutsBindings? bindings;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: bindings ?? _createBasicBindings(),
      child: child,
    );
  }

  ShortcutsBindings _createBasicBindings() {
    ShortcutsBindings bindings = {};

    // mapping [DpadAction] to [LogicalKeyboardKey]
    dpadKeyNodeMap?.forEach((DpadAction action, FocusScopeNode? node) {
      if (node != null) {
        LogicalKeyboardKey key = switch (action) {
          DpadAction.arrowUp => LogicalKeyboardKey.arrowUp,
          DpadAction.arrowDown => LogicalKeyboardKey.arrowDown,
          DpadAction.arrowLeft => LogicalKeyboardKey.arrowLeft,
          DpadAction.arrowRight => LogicalKeyboardKey.arrowRight,
          DpadAction.select => LogicalKeyboardKey.select,
        };

        bindings[SingleActivator(key)] = () {
          node.requestFocus();
        };
      }
    });

    return bindings;
  }
}
