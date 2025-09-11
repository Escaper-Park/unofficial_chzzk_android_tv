import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../../../../common/constants/playback_speed.dart';
import '../../../../streaming/widgets/control/stream_settings_control_item.dart';
import '../../../../streaming/widgets/control/stream_setting_control.dart';
import '../../../../vod/model/vod.dart';
import '../../../vod_stream_event.dart';
import '../../../vod_stream_state.dart';
import '../../../controller/vod_player_controller.dart';

class VodStreamPlaybackSpeedControl extends ConsumerWidget
    with VodStreamEvent, VodStreamState {
  VodStreamPlaybackSpeedControl({
    super.key,
    required this.vod,
    required this.videoFocusNode,
  });

  final Vod? vod;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerController = ref.watch(vodPlayerControllerProvider).value;
    final currentSpeed = playerController?.value.playbackSpeed ?? 1.0;

    final currentIndex = PlaybackSpeed.values.indexOf(currentSpeed) != -1
        ? PlaybackSpeed.values.indexOf(currentSpeed)
        : 2;

    final settingItem = StreamSettingsControlItem(
      autofocus: true,
      channel: vod!.channel!,
      currentValue: currentIndex,
      maxValue: PlaybackSpeed.values.length - 1,
      resetOverlayTimer: () => resetOverlayTimer(
        ref,
        videoFocusNode: videoFocusNode,
      ),
      displayTextList: PlaybackSpeed.texts,
      onPressed: (value) {
        final newSpeed = PlaybackSpeed.values[value];
        ref.read(vodPlayerControllerProvider.notifier).setPlaybackSpeed(newSpeed);
      },
    );

    return StreamSettingControl(
      headerText: '배속 설정',
      text1: '위\u00b7아래',
      text2: '배속 변경',
      text3: '클릭',
      text4: '적용',
      streamSettingsControlItems: [settingItem],
    );
  }
}