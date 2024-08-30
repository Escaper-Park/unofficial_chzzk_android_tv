import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/stream_settings_controller.dart';
import '../common/setting_item.dart';

class StreamSettingsScreen extends ConsumerWidget {
  const StreamSettingsScreen({
    super.key,
    required this.settingMenuFSN,
  });

  final FocusScopeNode settingMenuFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamSettings = ref.watch(streamSettingsControllerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '해상도',
          itemType: SettingItemType.limited,
          autofocus: true,
          displayTextList: const ['360p', '480p', '720p', '1080p'],
          currentValue: streamSettings.resolutionIndex,
          minValue: 0,
          maxValue: 3,
          onUpdate: (value) {
            ref
                .read(streamSettingsControllerProvider.notifier)
                .setResolutionIndex(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '멀티뷰 해상도',
          itemType: SettingItemType.limited,
          displayTextList: const ['360p', '480p', '720p', '1080p'],
          currentValue: streamSettings.multiviewResolutionIndex,
          minValue: 0,
          maxValue: 3,
          onUpdate: (value) {
            ref
                .read(streamSettingsControllerProvider.notifier)
                .setMultiviewResolutionIndex(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '채팅창 모드',
          itemType: SettingItemType.limited,
          displayTextList: const ['끄기', '오버레이', '크게보기'],
          currentValue: streamSettings.chatWindowStateIndex,
          minValue: 0,
          maxValue: 2,
          onUpdate: (value) {
            ref
                .read(streamSettingsControllerProvider.notifier)
                .setChatWindowStateIndex(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '레이턴시',
          itemType: SettingItemType.limited,
          displayTextList: const ['일반', '저지연'],
          currentValue: streamSettings.latencyIndex,
          minValue: 0,
          maxValue: 1,
          onUpdate: (value) {
            ref
                .read(streamSettingsControllerProvider.notifier)
                .setLatencyIndex(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '오버레이 표시 시간',
          itemType: SettingItemType.range,
          currentValue: streamSettings.overlayControlsDisplayTime,
          minValue: 5,
          maxValue: 30,
          unitSuffix: '초',
          onUpdate: (value) {
            ref
                .read(streamSettingsControllerProvider.notifier)
                .setOverlayControlsDisplayTime(value);
          },
        ),
        SettingItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '동영상 넘기기',
          itemType: SettingItemType.limited,
          displayTextList: const ['5 초', '10 초', '30 초'],
          currentValue: streamSettings.vodPlaybackIntervalIndex,
          minValue: 0,
          maxValue: 2,
          onUpdate: (value) {
            ref
                .read(streamSettingsControllerProvider.notifier)
                .setVodPlaybackIntervalIndex(value);
          },
        ),
      ],
    );
  }
}
