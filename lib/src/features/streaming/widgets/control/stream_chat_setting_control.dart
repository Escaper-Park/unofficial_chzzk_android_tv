import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/constants/enums.dart' show SettingItemType;
import '../../../settings/model/chat_settings.dart';
import '../../stream_common_event.dart';
import '../streaming_widgets.dart';
import 'stream_chat_simple_position_setter.dart';
import 'stream_control_icon_button.dart';

class StreamChatSettingControl extends ConsumerWidget with StreamCommonEvent {
  const StreamChatSettingControl({
    super.key,
    required this.chatSettings,
    required this.resetOverlayTimer,
  });

  final ChatSettings chatSettings;
  final VoidCallback resetOverlayTimer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<StreamControlIconButtonWithDpad> items = [
      StreamControlIconButtonWithDpad(
        headerText: '가로위치',
        currentDisplayedValue: chatSettings.chatPositionX,
        minValue: 0,
        maxValue: 100,
        unitSuffix: '%',
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async =>
            await updateChatPositionX(ref, value: updateValue),
      ),
      StreamControlIconButtonWithDpad(
        headerText: '세로위치',
        currentDisplayedValue: chatSettings.chatPositionY,
        minValue: 0,
        maxValue: 100,
        unitSuffix: '%',
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async =>
            await updateChatPositionY(ref, value: updateValue),
      ),
      StreamControlIconButtonWithDpad(
        headerText: '높이',
        currentDisplayedValue: chatSettings.chatContainerHeight,
        minValue: 0,
        maxValue: 100,
        unitSuffix: '%',
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async =>
            await updateChatContainerHeight(ref, value: updateValue),
      ),
      StreamControlIconButtonWithDpad(
        headerText: '너비',
        currentDisplayedValue: chatSettings.chatContainerWidth,
        minValue: 0,
        maxValue: 100,
        unitSuffix: '%',
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async =>
            await updateChatContainerWidth(ref, value: updateValue),
      ),
      StreamControlIconButtonWithDpad(
        headerText: '글씨크기',
        currentDisplayedValue: chatSettings.chatFontSize,
        minValue: 1,
        maxValue: 30,
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async =>
            await updateChatFontSize(ref, value: updateValue),
      ),
      StreamControlIconButtonWithDpad(
        headerText: '전체투명도',
        currentDisplayedValue: chatSettings.entireChatContainerTransparency,
        minValue: 0,
        maxValue: 100,
        unitSuffix: '%',
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async =>
            await updateEntireChatContainerTransparency(
          ref,
          value: updateValue,
        ),
      ),
      StreamControlIconButtonWithDpad(
        headerText: '단일투명도',
        currentDisplayedValue: chatSettings.singleChatContainerTransparency,
        minValue: 0,
        maxValue: 100,
        unitSuffix: '%',
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async =>
            await updateSingleChatContainerTransparency(
          ref,
          value: updateValue,
        ),
      ),
      StreamControlIconButtonWithDpad(
        headerText: '채팅간격',
        currentDisplayedValue: chatSettings.chatContainerVerticalMargin,
        minValue: 0,
        maxValue: 20,
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async =>
            await updateChatContainerVerticalMargin(
          ref,
          value: updateValue,
        ),
      ),
      StreamControlIconButtonWithDpad(
        headerText: '가로여백',
        currentDisplayedValue: chatSettings.chatContainerHorizontalMargin,
        minValue: 0,
        maxValue: 20,
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async =>
            await updateChatContainerHorizontalMargin(
          ref,
          value: updateValue,
        ),
      ),
      StreamControlIconButtonWithDpad(
        headerText: '채팅시간',
        itemType: SettingItemType.limited,
        currentDisplayedValue: chatSettings.showChatTime,
        displayTextList: const ['꺼짐', '켜짐'],
        minValue: 0,
        maxValue: 1,
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async => await updateShowChatTime(
          ref,
          value: updateValue,
        ),
      ),
      StreamControlIconButtonWithDpad(
        headerText: '닉네임표시',
        itemType: SettingItemType.limited,
        currentDisplayedValue: chatSettings.showNickname,
        displayTextList: const ['꺼짐', '켜짐'],
        minValue: 0,
        maxValue: 1,
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async => await updateShowNickname(
          ref,
          value: updateValue,
        ),
      ),
      StreamControlIconButtonWithDpad(
        headerText: '도네이션',
        itemType: SettingItemType.limited,
        currentDisplayedValue: chatSettings.showDonation,
        displayTextList: const ['꺼짐', '켜짐'],
        minValue: 0,
        maxValue: 1,
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async => await updateShowDonation(
          ref,
          value: updateValue,
        ),
      ),
      StreamControlIconButtonWithDpad(
        headerText: '뱃지컬렉터',
        itemType: SettingItemType.limited,
        currentDisplayedValue: chatSettings.useBadgeCollector,
        displayTextList: const ['꺼짐', '켜짐'],
        minValue: 0,
        maxValue: 1,
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async => await updateUseBadgeCollector(
          ref,
          value: updateValue,
        ),
      ),
      StreamControlIconButtonWithDpad(
        headerText: '컬렉터높이',
        currentDisplayedValue: chatSettings.badgeCollectorHeight,
        minValue: 0,
        maxValue: 100,
        unitSuffix: '%',
        resetOverlayTimer: resetOverlayTimer,
        onUpdate: (updateValue) async => await updateBadgeCollectorHeight(
          ref,
          value: updateValue,
        ),
      ),
    ];

    return StreamOverlayContainer(
      width: double.infinity,
      height: Dimensions.streamControlsHeight,
      borderRadius: 12.0,
      useTopBorder: true,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(10.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // simple chat position setter,
            StreamChatSimplePositionSetter(
              chatSettings: chatSettings,
              resetOverlayTimer: resetOverlayTimer,
              updateChatPosition: (x, y) async =>
                  await updateChatPosition(ref, x: x, y: y),
            ),
            // items
            ...items,
          ],
        ),
      ),
    );
  }
}
