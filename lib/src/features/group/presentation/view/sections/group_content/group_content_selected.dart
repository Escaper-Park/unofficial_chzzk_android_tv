part of 'group_content_section.dart';

class _SelectedGroupContent extends StatelessWidget {
  const _SelectedGroupContent({
    required this.group,
    required this.members,
    required this.active,
    required this.firstFocusNode,
    required this.focusRegistry,
    required this.onActivateGroup,
    required this.onAddMemberPressed,
    required this.onDeleteGroup,
    required this.onChannelPressed,
  });

  final GroupItem group;
  final List<GroupMemberItem> members;
  final bool active;
  final FocusNode firstFocusNode;
  final GroupChannelFocusRegistry focusRegistry;
  final ValueChanged<GroupItem> onActivateGroup;
  final VoidCallback onAddMemberPressed;
  final ValueChanged<GroupItem> onDeleteGroup;
  final void Function(GroupItem group, GroupMemberItem channel)
  onChannelPressed;

  @override
  Widget build(BuildContext context) {
    final actionItemDesign = GroupScreenDesign.oneLineListItemDesign();

    return Column(
      spacing: GroupScreenDesign.rowGap,
      children: [
        TvListItem(
          key: ValueKey('group-content-activate-${group.id}'),
          title: GroupScreenString.activateGroup,
          icon: active ? Icons.star_rounded : Icons.star_border_rounded,
          action: active ? GroupScreenString.activeGroup : null,
          selected: active,
          focusNode: firstFocusNode,
          autofocus: true,
          design: actionItemDesign,
          onPressed: () => onActivateGroup(group),
        ),
        TvListItem(
          key: ValueKey('group-content-add-${group.id}'),
          title: GroupScreenString.addMember,
          icon: Icons.person_add_alt_1_rounded,
          design: actionItemDesign,
          onPressed: onAddMemberPressed,
        ),
        TvListItem(
          key: ValueKey('group-content-delete-${group.id}'),
          title: GroupScreenString.deleteGroup,
          icon: Icons.delete_rounded,
          design: actionItemDesign,
          onPressed: () => onDeleteGroup(group),
        ),
        for (final channel in members)
          _GroupChannelRow(
            key: ValueKey(
              'group-channel-focus-${group.id}-${channel.channelId}',
            ),
            group: group,
            channel: channel,
            focusRegistry: focusRegistry,
            onPressed: onChannelPressed,
          ),
      ],
    );
  }
}
