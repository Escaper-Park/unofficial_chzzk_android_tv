import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../../common/widgets/header_text.dart';
import '../../../../../setting/widgets/common/setting_item.dart';
import '../../../../common/control_icon.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/live_player_controller.dart';
import '../../../controller/live_playlist_controller.dart';

class ResolutionSettingsControlsOverlay extends ConsumerWidget {
  const ResolutionSettingsControlsOverlay({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livePlaylist = ref.watch(livePlaylistControllerProvider);

    final resolutionSettingItems = List.generate(
      livePlaylist.length,
      (index) => ResolutionControlItem(
        autofocus: index == 0,
        index: index,
        videoFocusNode: videoFocusNode,
        channelName: livePlaylist[index].channel.channelName,
      ),
    );

    return FocusScope(
      node: controlsFSN,
      child: ControlsOverlayContainer(
        width: double.infinity,
        height: Dimensions.liveStreamMainControlsHeight,
        useTopBorder: true,
        borderRadius: 12.0,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header and comments
            _headerWithComments(),
            const SizedBox(width: 10.0),
            ...resolutionSettingItems,
          ],
        ),
      ),
    );
  }

  Widget _headerWithComments() {
    return const SizedBox(
      width: Dimensions.settingHeaderTextWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: HeaderText(
              text: '화질설정',
              verticalPadding: 0.0,
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 3.0),
          Text(
            '위아래: 화질변경',
            style: TextStyle(fontSize: 12.0),
          ),
          Text(
            '클릭: 적용',
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}

class ResolutionControlItem extends HookConsumerWidget {
  const ResolutionControlItem({
    super.key,
    required this.autofocus,
    required this.index,
    required this.videoFocusNode,
    required this.channelName,
  });

  final bool autofocus;
  final int index;
  final FocusNode videoFocusNode;
  final String channelName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resolution = ref
        .read(singleLivePlayerControllerProvider(index: index).notifier)
        .getCurrentResolutionIndex();

    final currentResolutionIndex = useState<int>(resolution);

    return SizedBox(
      width: Dimensions.settingsControlItemWidth,
      child: DpadControlIconButton(
        autofocus: autofocus,
        videoFocusNode: videoFocusNode,
        itemType: SettingItemType.limited,
        headerText: channelName,
        displayTextList: const ['360p', '480p', '720p', '1080p', '자동'],
        currentValue: currentResolutionIndex.value,
        minValue: 0,
        maxValue: 4,
        onUpdate: (updateValue) {
          currentResolutionIndex.value = updateValue;
        },
        onPressedSelect: (value) {
          ref
              .read(singleLivePlayerControllerProvider(index: index).notifier)
              .changeResolution(currentResolutionIndex.value);
        },
      ),
    );
  }
}
