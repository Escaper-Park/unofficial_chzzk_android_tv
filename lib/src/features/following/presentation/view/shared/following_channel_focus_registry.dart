import 'package:flutter/widgets.dart';

final class FollowingChannelFocusRegistry {
  final _nodes = <String, FocusNode>{};
  final _links = <String, LayerLink>{};

  FocusNode nodeFor(String channelId) {
    return _nodes.putIfAbsent(
      channelId,
      () => FocusNode(debugLabel: 'following channel $channelId'),
    );
  }

  LayerLink linkFor(String channelId) {
    return _links.putIfAbsent(channelId, LayerLink.new);
  }

  FocusNode? maybeNodeFor(String channelId) {
    final node = _nodes[channelId];
    return _canRestoreFocus(node) ? node : null;
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
