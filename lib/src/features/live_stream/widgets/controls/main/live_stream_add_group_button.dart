import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/enums.dart' show LiveStreamOverlayType;
import '../../../../channel/model/channel.dart';
import '../../../../group/widgets/group_list.dart';
import '../../../../streaming/widgets/control/stream_control_icon_button.dart';
import '../../../live_stream_event.dart';
import '../../../live_stream_state.dart';

class LiveStreamAddChannelToGroupButton extends ConsumerWidget
    with LiveStreamEvent, LiveStreamState {
  const LiveStreamAddChannelToGroupButton({
    super.key,
    required this.channel,
    required this.videoFocusNode,
  });

  final Channel channel;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamControlIconButton(
      iconData: Icons.group_add_rounded,
      label: '그룹에추가',
      autofocus: false,
      resetOverlayTimer: () => resetOverlayTimer(
        ref,
        videoFocusNode: videoFocusNode,
      ),
      onPressed: () async {
        // hide main control overlay
        changeOverlay(
          ref,
          overlayType: LiveStreamOverlayType.none,
          videoFocusNode: videoFocusNode,
        );

        await showGroupListDialog(
          ref,
          context,
          groupListWidget: (dialogContext) => Consumer(
            builder: (context, ref, child) {
              final groups = getGroups(ref);

              return GroupList(
                dialogContext: dialogContext,
                groups: groups,
                selectGroup: (group) {
                  addMemberToGroup(
                    ref,
                    context,
                    dialogContext: dialogContext,
                    group: group,
                    channel: channel,
                  );
                },
                pushGroupGenerate: null,
              );
            },
          ),
        );
      },
    );
  }
}
