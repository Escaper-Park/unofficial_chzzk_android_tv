import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/enums.dart' show SettingItemType;
import '../../../../common/widgets/dpad/dpad_widgets.dart' show DpadListView;
import '../../controller/stream_setting_controller.dart';
import '../../settings_event.dart';
import '../../settings_state.dart';
import '../../widgets/value/setting_value_item.dart';
import '../../model/stream_settings.dart';

class SettingsDetailStreaming extends ConsumerWidget
    with SettingsEvent, SettingsState {
  const SettingsDetailStreaming({
    super.key,
    required this.settingMenuFSN,
    required this.streamSettingListFSN,
  });

  final FocusScopeNode settingMenuFSN;
  final FocusScopeNode streamSettingListFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStreamSettings = getCurrentStreamSettings(ref);
    final controller = getStreamSettingsController(ref);
    final settingItems = _getItems(currentStreamSettings, controller);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DpadListView(
        scrollDirection: Axis.vertical,
        verticalPadding: 0.0,
        itemList: settingItems,
        listViewFSN: streamSettingListFSN,
        itemBuilder: (index, focusNode, object) => settingItems[index],
      ),
    );
  }

  List<SettingValueItem> _getItems(
    StreamSettings currentStreamSettings,
    StreamSettingsController controller,
  ) =>
      [
        SettingValueItem(
          autofocus: true,
          settingMenuFSN: settingMenuFSN,
          headerText: '해상도',
          itemType: SettingItemType.limited,
          displayTextList: const ['360p', '480p', '720p', '1080p', '자동'],
          currentValue: currentStreamSettings.resolutionIndex,
          minValue: 0,
          maxValue: 4,
          onUpdate: (value) => controller.setResolutionIndex(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '멀티뷰 해상도',
          itemType: SettingItemType.limited,
          displayTextList: const ['360p', '480p', '720p', '1080p', '자동'],
          currentValue: currentStreamSettings.multiviewResolutionIndex,
          minValue: 0,
          maxValue: 4,
          onUpdate: (value) => controller.setMultiviewResolutionIndex(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '다시보기 해상도',
          itemType: SettingItemType.limited,
          displayTextList: const ['720p', '1080p', '자동'],
          currentValue: currentStreamSettings.vodResolutionIndex,
          minValue: 0,
          maxValue: 2,
          onUpdate: (value) => controller.setVodResolutionIndex(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '라이브 채팅창 모드',
          itemType: SettingItemType.limited,
          displayTextList: const ['끄기', '오버레이', '크게보기'],
          currentValue: currentStreamSettings.liveChatWindowIndex,
          minValue: 0,
          maxValue: 2,
          onUpdate: (value) => controller.setLiveChatWindowIndex(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '다시보기 채팅창 모드',
          itemType: SettingItemType.limited,
          displayTextList: const ['끄기', '오버레이', '크게보기'],
          currentValue: currentStreamSettings.vodChatWindowIndex,
          minValue: 0,
          maxValue: 2,
          onUpdate: (value) => controller.setVodChatWindowIndex(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '그룹 라이브 보이기',
          itemType: SettingItemType.limited,
          displayTextList: const ['끄기', '보이기'],
          currentValue: currentStreamSettings.showGroupInVideoPlayer,
          minValue: 0,
          maxValue: 1,
          onUpdate: (value) => controller.setShowGroupIndex(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '레이턴시',
          itemType: SettingItemType.limited,
          displayTextList: const ['일반', '저지연'],
          currentValue: currentStreamSettings.latencyIndex,
          minValue: 0,
          maxValue: 1,
          onUpdate: (value) => controller.setLatencyIndex(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '오버레이 표시 시간',
          itemType: SettingItemType.range,
          currentValue: currentStreamSettings.overlayControlsDisplayTime,
          minValue: 5,
          maxValue: 30,
          unitSuffix: '초',
          onUpdate: (value) => controller.setOverlayControlsDisplayTime(value),
        ),
        SettingValueItem(
          settingMenuFSN: settingMenuFSN,
          headerText: '동영상 넘기기',
          itemType: SettingItemType.limited,
          displayTextList: const ['5 초', '10 초', '30 초'],
          currentValue: currentStreamSettings.vodPlaybackIntervalIndex,
          minValue: 0,
          maxValue: 2,
          onUpdate: (value) => controller.setVodPlaybackIntervalIndex(value),
        ),
      ];
}
