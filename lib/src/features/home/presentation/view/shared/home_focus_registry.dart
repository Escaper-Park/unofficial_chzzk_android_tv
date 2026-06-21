import 'package:flutter/widgets.dart';

import '../../bloc/home_bloc.dart';

final class HomeFocusRegistry {
  final _nodes = <HomeSectionId, FocusScopeNode>{};

  FocusScopeNode nodeFor(HomeSectionId sectionId) {
    return _nodes.putIfAbsent(
      sectionId,
      () => FocusScopeNode(debugLabel: 'home ${sectionId.name}'),
    );
  }

  void dispose() {
    for (final node in _nodes.values) {
      node.dispose();
    }
    _nodes.clear();
  }
}
