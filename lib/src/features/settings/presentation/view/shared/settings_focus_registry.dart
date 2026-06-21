import 'package:flutter/widgets.dart';

import '../../models/settings_preference_models.dart';

final class SettingsFocusRegistry {
  final _nodes = <SettingsPreferenceRef, FocusNode>{};

  FocusNode nodeFor(SettingsPreferenceRef ref) {
    return _nodes.putIfAbsent(
      ref,
      () => FocusNode(
        debugLabel: 'settings preference ${ref.category.name} ${ref.index}',
      ),
    );
  }

  FocusNode? openerNodeFor({
    required SettingsPreferenceRef? activeRef,
    required FocusNode detailsFirstNode,
  }) {
    if (activeRef == null) {
      return null;
    }

    if (activeRef.index == 0) {
      return _canRestoreFocus(detailsFirstNode) ? detailsFirstNode : null;
    }

    final node = _nodes[activeRef];
    if (_canRestoreFocus(node)) {
      return node;
    }

    return _canRestoreFocus(detailsFirstNode) ? detailsFirstNode : null;
  }

  void dispose() {
    for (final node in _nodes.values) {
      node.dispose();
    }
    _nodes.clear();
  }
}

bool _canRestoreFocus(FocusNode? node) {
  return node != null && node.canRequestFocus && node.context != null;
}
