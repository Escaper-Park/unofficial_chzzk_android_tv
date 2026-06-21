part of 'following_grid_section.dart';

class _RegisteredFollowingChannelCard extends StatefulWidget {
  const _RegisteredFollowingChannelCard({
    super.key,
    required this.item,
    required this.focusRegistry,
    required this.autofocus,
    required this.onPressed,
  });

  final FollowingChannel item;
  final FollowingChannelFocusRegistry focusRegistry;
  final bool autofocus;
  final VoidCallback onPressed;

  @override
  State<_RegisteredFollowingChannelCard> createState() =>
      _RegisteredFollowingChannelCardState();
}

class _RegisteredFollowingChannelCardState
    extends State<_RegisteredFollowingChannelCard> {
  late final FollowingChannelFocusRegistry _focusRegistry;
  late final String _channelId;
  late final FocusNode _focusNode;
  late final LayerLink _anchorLink;

  @override
  void initState() {
    super.initState();
    _focusRegistry = widget.focusRegistry;
    _channelId = widget.item.channelId;
    _focusNode = _focusRegistry.nodeFor(_channelId);
    _anchorLink = _focusRegistry.linkFor(_channelId);
  }

  @override
  void dispose() {
    _focusRegistry.release(_channelId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FollowingChannelCard(
      item: widget.item,
      focusNode: _focusNode,
      anchorLink: _anchorLink,
      autofocus: widget.autofocus,
      onPressed: widget.onPressed,
    );
  }
}
