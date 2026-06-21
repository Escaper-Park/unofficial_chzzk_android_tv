import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../domain/entities/group_collection.dart';
import '../../../group_screen_design.dart';
import '../../../group_screen_string.dart';
import '../../shared/group_channel_focus_registry.dart';
import '../shared/group_pane.dart';

part 'group_content_channel_row.dart';
part 'group_content_selected.dart';

class GroupContentSection extends StatelessWidget {
  const GroupContentSection({
    super.key,
    required this.group,
    required this.members,
    required this.activeGroupId,
    required this.panePadding,
    required this.firstFocusNode,
    required this.focusRegistry,
    required this.onActivateGroup,
    required this.onAddMemberPressed,
    required this.onDeleteGroup,
    required this.onChannelPressed,
  });

  final GroupItem? group;
  final List<GroupMemberItem> members;
  final String? activeGroupId;
  final EdgeInsets panePadding;
  final FocusNode firstFocusNode;
  final GroupChannelFocusRegistry focusRegistry;
  final ValueChanged<GroupItem> onActivateGroup;
  final VoidCallback onAddMemberPressed;
  final ValueChanged<GroupItem> onDeleteGroup;
  final void Function(GroupItem group, GroupMemberItem channel)
  onChannelPressed;

  @override
  Widget build(BuildContext context) {
    final group = this.group;

    return GroupPane(
      header: TvListHeader(
        text: group?.groupName ?? GroupScreenString.selectedGroupTitle,
      ),
      panePadding: panePadding,
      content: group == null
          ? const SizedBox(
              height: 240,
              child: ContentStateView.empty(
                message: GroupScreenString.noSelectedGroup,
              ),
            )
          : _SelectedGroupContent(
              group: group,
              members: members,
              active: activeGroupId == group.id,
              firstFocusNode: firstFocusNode,
              focusRegistry: focusRegistry,
              onActivateGroup: onActivateGroup,
              onAddMemberPressed: onAddMemberPressed,
              onDeleteGroup: onDeleteGroup,
              onChannelPressed: onChannelPressed,
            ),
    );
  }
}
