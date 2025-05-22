import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/enums.dart' show SettingItemType;
import '../../../../common/widgets/dpad/dpad_widgets.dart' show DpadListView;
import '../../controller/chat_setting_controller.dart';
import '../../model/chat_settings.dart';
import '../../settings_event.dart';
import '../../settings_state.dart';
import '../value/setting_value_item.dart';

class SettingsDetailChat extends ConsumerWidget
    with SettingsEvent, SettingsState {
  const SettingsDetailChat({
    super.key,
    required this.settingMenuFSN,
    required this.chatSettingListFSN,
  });

  final FocusScopeNode settingMenuFSN;
  final FocusScopeNode chatSettingListFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStreamSettings = getCurrentChatSettings(ref);
    final controller = getChatSettingsController(ref);
    final settingItems = _getItems(currentStreamSettings, controller);

    return DpadListView(
      scrollDirection: Axis.vertical,
      verticalPadding: 0.0,
      itemList: settingItems,
      listViewFSN: chatSettingListFSN,
      itemBuilder: (index, focusNode, object) => settingItems[index],
    );
  }

  List<SettingValueItem> _getItems(
    ChatSettings currentChatSettings,
    ChatSettingsController controller,
  ) =>
      [
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '채팅창 가로 위치',
          autofocus: true,
          currentValue: currentChatSettings.chatPositionX,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) => controller.setChatPositionX(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '채팅창 세로 위치',
          currentValue: currentChatSettings.chatPositionY,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) => controller.setChatPositionY(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '채팅창 높이',
          currentValue: currentChatSettings.chatContainerHeight,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) => controller.setChatContainerHeight(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '채팅창 너비',
          currentValue: currentChatSettings.chatContainerWidth,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) => controller.setChatContainerWidth(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '글씨 크기',
          currentValue: currentChatSettings.chatFontSize,
          minValue: 5,
          maxValue: 30,
          onUpdate: (value) => controller.setFontSize(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '전체 채팅창 투명도',
          currentValue: currentChatSettings.entireChatContainerTransparency,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) =>
              controller.setEntireChatContainerTransparency(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '단일 채팅창 투명도',
          currentValue: currentChatSettings.singleChatContainerTransparency,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) =>
              controller.setSingleChatContainerTransparency(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '채팅 간격',
          currentValue: currentChatSettings.chatContainerVerticalMargin,
          minValue: 0,
          maxValue: 20,
          onUpdate: (value) => controller.setChatContainerVerticalMargin(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          itemType: SettingItemType.limited,
          headerText: '채팅 시간 표시',
          currentValue: currentChatSettings.showChatTime,
          displayTextList: const ['꺼짐', '켜짐'],
          minValue: 0,
          maxValue: 1,
          onUpdate: (value) => controller.setShowChatTime(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          itemType: SettingItemType.limited,
          headerText: '닉네임 표시',
          currentValue: currentChatSettings.showNickname,
          displayTextList: const ['꺼짐', '켜짐'],
          minValue: 0,
          maxValue: 1,
          onUpdate: (value) => controller.setShowNickname(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          itemType: SettingItemType.limited,
          headerText: '도네이션',
          currentValue: currentChatSettings.showDonation,
          displayTextList: const ['꺼짐', '켜짐'],
          minValue: 0,
          maxValue: 1,
          onUpdate: (value) => controller.setShowDonation(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          itemType: SettingItemType.limited,
          headerText: '뱃지 컬렉터',
          currentValue: currentChatSettings.useBadgeCollector,
          displayTextList: const ['꺼짐', '켜짐'],
          minValue: 0,
          maxValue: 1,
          onUpdate: (value) => controller.setUseBadgeCollector(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '뱃지 컬렉터 높이',
          currentValue: currentChatSettings.badgeCollectorHeight,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) => controller.setBadgeCollectorHeight(value),
        ),
      ];
}
