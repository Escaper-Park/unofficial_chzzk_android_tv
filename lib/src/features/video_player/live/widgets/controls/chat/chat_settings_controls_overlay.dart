import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../setting/controller/chat_settings_controller.dart';
import '../../../../../setting/widgets/common/setting_item.dart';
import '../../../../common/control_icon.dart';
import '../../../../common/controls_overlay_container.dart';
import 'simple_chat_position_setter.dart';

class ChatSettingsControlsOverlay extends ConsumerWidget {
  const ChatSettingsControlsOverlay({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatSettings = ref.watch(chatSettingsControllerProvider);

    return FocusScope(
      node: controlsFSN,
      child: ControlsOverlayContainer(
        width: double.infinity,
        height: Dimensions.liveStreamMainControlsHeight,
        useTopBorder: true,
        borderRadius: 12.0,
        padding: const EdgeInsets.all(10.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SimpleChatPositionSetter(videoFocusNode: videoFocusNode),
              DpadControlIconButton(
                videoFocusNode: videoFocusNode,
                headerText: '가로위치',
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
              DpadControlIconButton(
                videoFocusNode: videoFocusNode,
                headerText: '세로위치',
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
              DpadControlIconButton(
                videoFocusNode: videoFocusNode,
                headerText: '높이',
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
              DpadControlIconButton(
                videoFocusNode: videoFocusNode,
                headerText: '너비',
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
              DpadControlIconButton(
                videoFocusNode: videoFocusNode,
                headerText: '글씨크기',
                currentValue: chatSettings.chatFontSize,
                minValue: 5,
                maxValue: 30,
                onUpdate: (value) {
                  ref
                      .read(chatSettingsControllerProvider.notifier)
                      .setFontSize(value);
                },
              ),
              DpadControlIconButton(
                videoFocusNode: videoFocusNode,
                headerText: '전체투명도',
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
              DpadControlIconButton(
                videoFocusNode: videoFocusNode,
                headerText: '단일투명도',
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
              DpadControlIconButton(
                videoFocusNode: videoFocusNode,
                headerText: '채팅간격',
                currentValue: chatSettings.chatContainerVerticalMargin,
                minValue: 0,
                maxValue: 20,
                onUpdate: (value) {
                  ref
                      .read(chatSettingsControllerProvider.notifier)
                      .setChatContainerVerticalMargin(value);
                },
              ),
              DpadControlIconButton(
                videoFocusNode: videoFocusNode,
                itemType: SettingItemType.limited,
                headerText: '채팅시간',
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
              DpadControlIconButton(
                videoFocusNode: videoFocusNode,
                itemType: SettingItemType.limited,
                headerText: '닉네임표시',
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
              DpadControlIconButton(
                videoFocusNode: videoFocusNode,
                itemType: SettingItemType.limited,
                headerText: '배지컬렉터',
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
              DpadControlIconButton(
                videoFocusNode: videoFocusNode,
                headerText: '컬렉터높이',
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
          ),
        ),
      ),
    );
  }
}
