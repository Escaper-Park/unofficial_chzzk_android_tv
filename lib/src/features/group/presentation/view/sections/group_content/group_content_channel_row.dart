part of 'group_content_section.dart';

class _GroupChannelRow extends StatefulWidget {
  const _GroupChannelRow({
    super.key,
    required this.group,
    required this.channel,
    required this.focusRegistry,
    required this.onPressed,
  });

  final GroupItem group;
  final GroupMemberItem channel;
  final GroupChannelFocusRegistry focusRegistry;
  final void Function(GroupItem group, GroupMemberItem channel) onPressed;

  @override
  State<_GroupChannelRow> createState() => _GroupChannelRowState();
}

class _GroupChannelRowState extends State<_GroupChannelRow> {
  late final GroupChannelFocusRegistry _focusRegistry;
  late final String _channelId;
  late final FocusNode _focusNode;
  late final LayerLink _link;

  @override
  void initState() {
    super.initState();
    _focusRegistry = widget.focusRegistry;
    _channelId = widget.channel.channelId;
    _focusNode = _focusRegistry.nodeFor(_channelId);
    _link = _focusRegistry.linkFor(_channelId);
  }

  @override
  void dispose() {
    _focusRegistry.release(_channelId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: TvListItem(
        key: ValueKey(
          'group-channel-${widget.group.id}-${widget.channel.channelId}',
        ),
        title: widget.channel.channelName,
        titleBuilder: (context, style) => TvMediaChannelName(
          channelName: widget.channel.channelName,
          verified: widget.channel.verifiedMark,
          style: style,
        ),
        leading: ProfileCircleAvatar(
          imageUrl: widget.channel.profileImageUrl,
          radius: GroupScreenDesign.memberAvatarRadius,
          openLive: widget.channel.openLive,
        ),
        focusNode: _focusNode,
        design: GroupScreenDesign.oneLineListItemDesign(),
        onPressed: () => widget.onPressed(widget.group, widget.channel),
      ),
    );
  }
}
