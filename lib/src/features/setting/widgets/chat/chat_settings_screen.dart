import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/chat_settings_controller.dart';
import '../common/setting_item.dart';

class ChatSettingsScreen extends ConsumerWidget {
  const ChatSettingsScreen({
    super.key,
    required this.settingMenuFSN,
  });

  final FocusScopeNode settingMenuFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatSettings = ref.watch(chatSettingsControllerProvider);

    return ListView(
      children: [
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '채팅창 가로 위치',
          autofocus: true,
          currentValue: chatSettings.chatPositionX,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) {
            ref
                .read(chatSettingsControllerProvider.notifier)
                .setChatPositionX(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '채팅창 세로 위치',
          currentValue: chatSettings.chatPositionY,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) {
            ref
                .read(chatSettingsControllerProvider.notifier)
                .setChatPositionY(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '채팅창 높이',
          currentValue: chatSettings.chatContainerHeight,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) {
            ref
                .read(chatSettingsControllerProvider.notifier)
                .setChatContainerHeight(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '채팅창 너비',
          currentValue: chatSettings.chatContainerWidth,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) {
            ref
                .read(chatSettingsControllerProvider.notifier)
                .setChatContainerWidth(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '글씨 크기',
          currentValue: chatSettings.chatFontSize,
          minValue: 5,
          maxValue: 30,
          onUpdate: (value) {
            ref
                .read(chatSettingsControllerProvider.notifier)
                .setFontSize(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '전체 채팅창 투명도',
          currentValue: chatSettings.entireChatContainerTransparency,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) {
            ref
                .read(chatSettingsControllerProvider.notifier)
                .setEntireChatContainerTransparency(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '단일 채팅창 투명도',
          currentValue: chatSettings.singleChatContainerTransparency,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) {
            ref
                .read(chatSettingsControllerProvider.notifier)
                .setSingleChatContainerTransparency(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '채팅 간격',
          currentValue: chatSettings.chatContainerVerticalMargin,
          minValue: 0,
          maxValue: 20,
          onUpdate: (value) {
            ref
                .read(chatSettingsControllerProvider.notifier)
                .setChatContainerVerticalMargin(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          itemType: SettingItemType.limited,
          headerText: '채팅 시간 표시',
          currentValue: chatSettings.showChatTime,
          displayTextList: const ['꺼짐', '켜짐'],
          minValue: 0,
          maxValue: 1,
          onUpdate: (value) {
            ref
                .read(chatSettingsControllerProvider.notifier)
                .setShowChatTime(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          itemType: SettingItemType.limited,
          headerText: '닉네임 표시',
          currentValue: chatSettings.showNickname,
          displayTextList: const ['꺼짐', '켜짐'],
          minValue: 0,
          maxValue: 1,
          onUpdate: (value) {
            ref
                .read(chatSettingsControllerProvider.notifier)
                .setShowNickname(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          itemType: SettingItemType.limited,
          headerText: '뱃지 컬렉터',
          currentValue: chatSettings.useBadgeCollector,
          displayTextList: const ['꺼짐', '켜짐'],
          minValue: 0,
          maxValue: 1,
          onUpdate: (value) {
            ref
                .read(chatSettingsControllerProvider.notifier)
                .setUseBadgeCollector(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '뱃지 컬렉터 높이',
          currentValue: chatSettings.badgeCollectorHeight,
          minValue: 0,
          maxValue: 100,
          unitSuffix: '%',
          onUpdate: (value) {
            ref
                .read(chatSettingsControllerProvider.notifier)
                .setBadgeCollectorHeight(value);
          },
        ),
      ],
    );
  }
}
