import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../domain/entities/group_collection.dart';
import '../../../group_screen_string.dart';

class GroupChannelModal extends StatelessWidget {
  const GroupChannelModal({
    super.key,
    required this.group,
    required this.channel,
    required this.node,
    required this.openerNode,
    required this.onWatchLive,
    required this.onMoveToChannel,
    required this.onRemoveFromGroup,
    required this.onDismiss,
  });

  final GroupItem group;
  final GroupMemberItem channel;
  final FocusScopeNode node;
  final FocusNode? openerNode;
  final ValueChanged<GroupMemberItem> onWatchLive;
  final ValueChanged<GroupMemberItem> onMoveToChannel;
  final ValueChanged<GroupMemberItem> onRemoveFromGroup;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final canWatchLive = channel.openLive;

    return TvModalPanel(
      type: TvModalPanelType.standard,
      header: channel.channelName,
      headerContent: TvMediaChannelName(
        channelName: channel.channelName,
        verified: channel.verifiedMark,
        textAlign: TextAlign.center,
        mainAxisAlignment: MainAxisAlignment.center,
        style: _headerChannelNameStyle(context),
      ),
      position: TvModalPanelPosition.right,
      showScrim: true,
      focusNode: node,
      openerFocusNode: openerNode,
      onDismiss: onDismiss,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TvDenseListItem(
            title: GroupScreenString.watchLive,
            icon: Icons.play_arrow_rounded,
            enabled: canWatchLive,
            autofocus: canWatchLive,
            onPressed: () => onWatchLive(channel),
          ),
          TvDenseListItem(
            title: GroupScreenString.moveToChannel,
            icon: Icons.open_in_new_rounded,
            autofocus: !canWatchLive,
            onPressed: () => onMoveToChannel(channel),
          ),
          TvDenseListItem(
            title: GroupScreenString.removeFromGroup,
            icon: Icons.person_remove_rounded,
            onPressed: () => onRemoveFromGroup(channel),
          ),
        ],
      ),
    );
  }
}

TextStyle? _headerChannelNameStyle(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;

  return Theme.of(context).textTheme.labelMedium?.copyWith(
    color: colorScheme.inverseSurface,
  );
}
