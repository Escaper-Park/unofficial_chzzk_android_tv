import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../../group/domain/entities/group_collection.dart';
import '../../../bloc/channel_bloc.dart';
import '../../../channel_screen_string.dart';

class ChannelGroupPanel extends StatelessWidget {
  const ChannelGroupPanel({
    super.key,
    required this.node,
    required this.panel,
    required this.onAddToGroup,
    required this.onDismiss,
  });

  final FocusScopeNode node;
  final ChannelGroupPanelState panel;
  final ValueChanged<GroupItem> onAddToGroup;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return TvModalPanel(
      type: TvModalPanelType.standard,
      header: ChannelScreenString.groupListTitle,
      position: TvModalPanelPosition.right,
      showScrim: true,
      focusNode: node,
      onDismiss: onDismiss,
      child: _ChannelGroupPanelContent(
        panel: panel,
        onAddToGroup: onAddToGroup,
        onDismiss: onDismiss,
      ),
    );
  }
}

class _ChannelGroupPanelContent extends StatelessWidget {
  const _ChannelGroupPanelContent({
    required this.panel,
    required this.onAddToGroup,
    required this.onDismiss,
  });

  final ChannelGroupPanelState panel;
  final ValueChanged<GroupItem> onAddToGroup;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    if (panel.status == ChannelGroupPanelStatus.loading) {
      return const ContentStateView.loading(
        message: ChannelScreenString.groupListLoading,
      );
    }

    final groups = panel.groups;
    if (groups.isEmpty) {
      return TvListItem(
        title: ChannelScreenString.groupListEmpty,
        autofocus: true,
        onPressed: onDismiss,
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: _standardGroupListMaxHeight,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: groups.length,
        itemBuilder: (context, index) {
          final group = groups[index];

          return Padding(
            padding: EdgeInsets.only(
              bottom: index == groups.length - 1 ? 0 : _groupListItemGap,
            ),
            child: TvListItem(
              title: group.groupName,
              autofocus: index == 0,
              onPressed: () => onAddToGroup(group),
            ),
          );
        },
      ),
    );
  }
}

const _groupListItemGap = 4.0;
final _standardGroupListMaxHeight =
    TvModalPanelDesign.standardMaxHeight -
    TvModalPanelDesign.standardHeaderSize.height -
    TvModalPanelDesign.standardListPadding.vertical;
