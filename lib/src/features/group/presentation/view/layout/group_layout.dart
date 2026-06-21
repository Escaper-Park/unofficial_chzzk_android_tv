import 'package:flutter/material.dart';

import '../../../../../core/tv/focus/focus.dart';
import '../../../../../core/ui/ui.dart';
import '../../../domain/entities/group_collection.dart';
import '../../group_screen_design.dart';
import '../../group_screen_string.dart';
import '../../models/group_screen_models.dart';
import '../sections/create/group_create_section.dart';
import '../sections/group_content/group_content_section.dart';
import '../sections/group_list/group_list_section.dart';
import '../shared/group_channel_focus_registry.dart';

part 'group_tab_content.dart';

class GroupLayout extends StatelessWidget {
  const GroupLayout({
    super.key,
    required this.selectedTab,
    required this.groups,
    required this.selectedGroupId,
    required this.activeGroupId,
    required this.selectedGroup,
    required this.selectedGroupMembers,
    required this.createInputValue,
    required this.isKeyboardOpen,
    required this.tabsNode,
    required this.groupListNode,
    required this.groupContentNode,
    required this.createNode,
    required this.keyboardNode,
    required this.groupFirstNode,
    required this.contentFirstNode,
    required this.focusRegistry,
    required this.onTabSelected,
    required this.onGroupSelected,
    required this.onCreateTabPressed,
    required this.onCreateInputPressed,
    required this.onActivateGroup,
    required this.onAddMemberPressed,
    required this.onDeleteGroup,
    required this.onChannelPressed,
  });

  final GroupTab selectedTab;
  final List<GroupItem> groups;
  final String? selectedGroupId;
  final String? activeGroupId;
  final GroupItem? selectedGroup;
  final List<GroupMemberItem> selectedGroupMembers;
  final String createInputValue;
  final bool isKeyboardOpen;
  final FocusScopeNode tabsNode;
  final FocusScopeNode groupListNode;
  final FocusScopeNode groupContentNode;
  final FocusScopeNode createNode;
  final FocusScopeNode keyboardNode;
  final FocusNode groupFirstNode;
  final FocusNode contentFirstNode;
  final GroupChannelFocusRegistry focusRegistry;
  final ValueChanged<GroupTab> onTabSelected;
  final ValueChanged<GroupItem> onGroupSelected;
  final VoidCallback onCreateTabPressed;
  final VoidCallback onCreateInputPressed;
  final ValueChanged<GroupItem> onActivateGroup;
  final VoidCallback onAddMemberPressed;
  final ValueChanged<GroupItem> onDeleteGroup;
  final void Function(GroupItem group, GroupMemberItem channel)
  onChannelPressed;

  @override
  Widget build(BuildContext context) {
    return TvTabbedContentLayout<GroupTab>(
      tabsNode: tabsNode,
      contentNode: selectedTab == GroupTab.group ? groupListNode : createNode,
      tabs: [
        for (final tab in GroupTab.values)
          TvTabItem(value: tab, label: GroupScreenString.tabLabel(tab)),
      ],
      selectedValue: selectedTab,
      onTabSelected: onTabSelected,
      headerRowPadding: GroupScreenDesign.headerRowPadding,
      headerContentGap: GroupScreenDesign.headerContentGap,
      content: switch (selectedTab) {
        GroupTab.group => _GroupTabContent(
          groups: groups,
          selectedGroupId: selectedGroupId,
          activeGroupId: activeGroupId,
          selectedGroup: selectedGroup,
          selectedGroupMembers: selectedGroupMembers,
          groupListNode: groupListNode,
          groupContentNode: groupContentNode,
          groupFirstNode: groupFirstNode,
          contentFirstNode: contentFirstNode,
          focusRegistry: focusRegistry,
          onGroupSelected: onGroupSelected,
          onCreateTabPressed: onCreateTabPressed,
          onActivateGroup: onActivateGroup,
          onAddMemberPressed: onAddMemberPressed,
          onDeleteGroup: onDeleteGroup,
          onChannelPressed: onChannelPressed,
        ),
        GroupTab.create => GroupCreateSection(
          createNode: createNode,
          tabsNode: tabsNode,
          keyboardNode: keyboardNode,
          value: createInputValue,
          isKeyboardOpen: isKeyboardOpen,
          onInputPressed: onCreateInputPressed,
        ),
      },
    );
  }
}
