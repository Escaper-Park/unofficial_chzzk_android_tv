import 'package:flutter/widgets.dart';

final class GroupChannelFocusRegistry {
  final Map<String, FocusNode> _nodes = {};
  final Map<String, LayerLink> _links = {};

  FocusNode nodeFor(String channelId) {
    return _nodes.putIfAbsent(
      channelId,
      () => FocusNode(debugLabel: 'group channel $channelId'),
    );
  }

  FocusNode? maybeNodeFor(String channelId) {
    final node = _nodes[channelId];
    return _canRestoreFocus(node) ? node : null;
  }

  LayerLink linkFor(String channelId) {
    return _links.putIfAbsent(channelId, LayerLink.new);
  }

  LayerLink? maybeLinkFor(String channelId) {
    return _links[channelId];
  }

  void release(String channelId) {
    _nodes.remove(channelId)?.dispose();
    _links.remove(channelId);
  }

  void dispose() {
    for (final node in _nodes.values) {
      node.dispose();
    }
    _nodes.clear();
    _links.clear();
  }
}

bool _canRestoreFocus(FocusNode? node) {
  return node != null && node.canRequestFocus && node.context != null;
}
