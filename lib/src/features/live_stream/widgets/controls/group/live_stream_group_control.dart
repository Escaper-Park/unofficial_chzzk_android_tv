import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/dimensions.dart' show Dimensions;
import '../../../../../common/constants/enums.dart' show SettingItemType;
import '../../../../../common/widgets/ui/header_text.dart';
import '../../../../streaming/widgets/control/stream_control_icon_button.dart';
import '../../../../streaming/widgets/streaming_widgets.dart';
import '../../../live_stream_event.dart';
import '../../../live_stream_state.dart';
import 'live_stream_group_container.dart';

class LiveStreamGroupControl extends ConsumerWidget
    with LiveStreamState, LiveStreamEvent {
  const LiveStreamGroupControl({
    super.key,
    required this.showGroupInNavigators,
    required this.videoFocusNode,
  });

  final bool showGroupInNavigators;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = getCurrentGroups(ref);

    final groupList = groups.groups.isEmpty
        ? []
        : List.generate(
            groups.groups.length,
            (index) => groups.groups[index],
          );

    final Widget groupWidget = groups.groups.isEmpty
        ? HeaderText(
            text: '아직 생성된 그룹이 없습니다',
            fontSize: 13.0,
          )
        : Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: groupList.length,
              itemBuilder: (context, index) {
                final group = groupList[index];

                return LiveStreamGroupContainer(
                  lastActivatedGroup: groups.lastActivatedGroupIndex == index,
                  group: group,
                  resetOverlay: () =>
                      resetOverlayTimer(ref, videoFocusNode: videoFocusNode),
                  selectActivatedGroup: (group) =>
                      selectActivatedGroup(ref, groupIndex: index),
                );
              },
            ),
          );

    return StreamOverlayContainer(
      width: double.infinity,
      height: Dimensions.streamControlsHeight,
      borderRadius: 12.0,
      useTopBorder: true,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamControlIconButtonWithDpad(
            autofocus: true,
            headerText: '그룹라이브',
            itemType: SettingItemType.limited,
            currentDisplayedValue: showGroupInNavigators ? 1 : 0,
            minValue: 0,
            maxValue: 1,
            displayTextList: const ['꺼짐', '켜짐'],
            resetOverlayTimer: () =>
                resetOverlayTimer(ref, videoFocusNode: videoFocusNode),
            onUpdate: (updateValue) {
              setShowGroup(ref, value: updateValue);
            },
          ),
          const SizedBox(width: 20.0),
          groupWidget,
        ],
      ),
    );
  }
}
