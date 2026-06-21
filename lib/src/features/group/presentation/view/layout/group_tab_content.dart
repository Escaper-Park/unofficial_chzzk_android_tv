part of 'group_layout.dart';

class _GroupTabContent extends StatelessWidget {
  const _GroupTabContent({
    required this.groups,
    required this.selectedGroupId,
    required this.activeGroupId,
    required this.selectedGroup,
    required this.selectedGroupMembers,
    required this.groupListNode,
    required this.groupContentNode,
    required this.groupFirstNode,
    required this.contentFirstNode,
    required this.focusRegistry,
    required this.onGroupSelected,
    required this.onCreateTabPressed,
    required this.onActivateGroup,
    required this.onAddMemberPressed,
    required this.onDeleteGroup,
    required this.onChannelPressed,
  });

  final List<GroupItem> groups;
  final String? selectedGroupId;
  final String? activeGroupId;
  final GroupItem? selectedGroup;
  final List<GroupMemberItem> selectedGroupMembers;
  final FocusScopeNode groupListNode;
  final FocusScopeNode groupContentNode;
  final FocusNode groupFirstNode;
  final FocusNode contentFirstNode;
  final GroupChannelFocusRegistry focusRegistry;
  final ValueChanged<GroupItem> onGroupSelected;
  final VoidCallback onCreateTabPressed;
  final ValueChanged<GroupItem> onActivateGroup;
  final VoidCallback onAddMemberPressed;
  final ValueChanged<GroupItem> onDeleteGroup;
  final void Function(GroupItem group, GroupMemberItem channel)
  onChannelPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final contentPanePadding = GroupScreenDesign.contentPanePadding(
          constraints.maxWidth,
        );

        return SplitListLayout(
          gap: GroupScreenDesign.columnGap,
          leadingWidth: GroupScreenDesign.groupListPaneWidth(
            constraints.maxWidth,
          ),
          trailingWidth: GroupScreenDesign.contentPaneWidth(
            constraints.maxWidth,
          ),
          leading: TvFocusSection.list(
            node: groupListNode,
            right: selectedGroup == null ? null : groupContentNode,
            child: GroupListSection(
              groups: groups,
              selectedGroupId: selectedGroupId,
              activeGroupId: activeGroupId,
              firstFocusNode: groupFirstNode,
              onGroupSelected: onGroupSelected,
              onCreatePressed: onCreateTabPressed,
            ),
          ),
          trailing: TvFocusSection.list(
            node: groupContentNode,
            left: groupListNode,
            child: GroupContentSection(
              group: selectedGroup,
              members: selectedGroupMembers,
              activeGroupId: activeGroupId,
              panePadding: contentPanePadding,
              firstFocusNode: contentFirstNode,
              focusRegistry: focusRegistry,
              onActivateGroup: onActivateGroup,
              onAddMemberPressed: onAddMemberPressed,
              onDeleteGroup: onDeleteGroup,
              onChannelPressed: onChannelPressed,
            ),
          ),
        );
      },
    );
  }
}
