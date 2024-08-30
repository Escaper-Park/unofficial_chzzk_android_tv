import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../../common/widgets/header_text.dart';
import '../../../../common/control_icon.dart';
import '../../../../common/controls_overlay_container.dart';
import '../../../controller/live_player_controller.dart';
import '../../../controller/live_playlist_controller.dart';

class SoundSettingsControlsOverlay extends ConsumerWidget {
  const SoundSettingsControlsOverlay({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livePlaylist = ref.watch(livePlaylistControllerProvider);

    final soundSettingItems = List.generate(
      livePlaylist.length,
      (index) => SoundControlItem(
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
            ...soundSettingItems,
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
              text: '소리설정',
              verticalPadding: 0.0,
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 3.0),
          Text(
            '위아래: 볼륨조절',
            style: TextStyle(fontSize: 12.0),
          ),
          Text(
            '클릭: 음소거 on / off',
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}

class SoundControlItem extends HookConsumerWidget {
  const SoundControlItem({
    super.key,
    this.autofocus = false,
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
    final controller =
        ref.watch(singleLivePlayerControllerProvider(index: index)).value;

    final currentVolume =
        useState<int>((controller!.value.volume * 100).toInt());

    final volumeBeforeMuted = useState<int>(currentVolume.value);
    final isMute = useState<bool>(currentVolume.value == 0);

    return SizedBox(
      width: Dimensions.settingsControlItemWidth,
      child: DpadControlIconButton(
        autofocus: autofocus,
        videoFocusNode: videoFocusNode,
        headerText: channelName,
        currentValue: currentVolume.value,
        headerTextSize: 11.0,
        displayTextSize: 13.0,
        minValue: 0,
        maxValue: 100,
        unitSuffix: '%',
        onPressedSelect: (_) {
          isMute.value = !isMute.value;
          currentVolume.value = isMute.value == true
              ? 0
              : volumeBeforeMuted.value == 0
                  ? 100
                  : volumeBeforeMuted.value;
          controller.setVolume(currentVolume.value / 100);
        },
        onUpdate: (updateValue) {
          currentVolume.value = updateValue;
          volumeBeforeMuted.value =
              currentVolume.value == 0 ? 100 : updateValue;
          isMute.value = currentVolume.value == 0 ? true : false;
          controller.setVolume(updateValue / 100);
        },
      ),
    );
  }
}
