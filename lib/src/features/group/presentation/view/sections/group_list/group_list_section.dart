import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../domain/entities/group_collection.dart';
import '../../../group_screen_design.dart';
import '../../../group_screen_string.dart';
import '../shared/group_pane.dart';

class GroupListSection extends StatelessWidget {
  const GroupListSection({
    super.key,
    required this.groups,
    required this.selectedGroupId,
    required this.activeGroupId,
    required this.firstFocusNode,
    required this.onGroupSelected,
    required this.onCreatePressed,
  });

  final List<GroupItem> groups;
  final String? selectedGroupId;
  final String? activeGroupId;
  final FocusNode firstFocusNode;
  final ValueChanged<GroupItem> onGroupSelected;
  final VoidCallback onCreatePressed;

  @override
  Widget build(BuildContext context) {
    return GroupPane(
      header: const TvListHeader(text: GroupScreenString.groupsTitle),
      panePadding: GroupScreenDesign.groupListPanePadding(),
      content: groups.isEmpty
          ? SizedBox(
              height: 240,
              child: ContentStateView.empty(
                message: GroupScreenString.groupsEmpty,
                action: TvButton.label(
                  text: GroupScreenString.createAction,
                  icon: Icons.add_rounded,
                  onPressed: onCreatePressed,
                  autofocus: true,
                ),
              ),
            )
          : Column(
              spacing: GroupScreenDesign.rowGap,
              children: [
                for (var index = 0; index < groups.length; index += 1)
                  _GroupRow(
                    group: groups[index],
                    selected:
                        selectedGroupId == groups[index].id ||
                        selectedGroupId == null && index == 0,
                    active: activeGroupId == groups[index].id,
                    focusNode: index == 0 ? firstFocusNode : null,
                    autofocus: index == 0,
                    onSelected: onGroupSelected,
                  ),
              ],
            ),
    );
  }
}

class _GroupRow extends StatelessWidget {
  const _GroupRow({
    required this.group,
    required this.selected,
    required this.active,
    required this.focusNode,
    required this.autofocus,
    required this.onSelected,
  });

  final GroupItem group;
  final bool selected;
  final bool active;
  final FocusNode? focusNode;
  final bool autofocus;
  final ValueChanged<GroupItem> onSelected;

  @override
  Widget build(BuildContext context) {
    return TvListItem(
      key: ValueKey('group-list-${group.id}'),
      title: group.groupName,
      trailing: active ? const Icon(Icons.check_rounded) : null,
      selected: selected,
      focusNode: focusNode,
      autofocus: autofocus,
      design: GroupScreenDesign.oneLineListItemDesign(),
      onPressed: () => onSelected(group),
    );
  }
}
