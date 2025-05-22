import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/enums.dart' show SettingItemType;
import '../../../../streaming/widgets/control/stream_settings_control_item.dart';
import '../../../../streaming/widgets/control/stream_setting_control.dart';
import '../../../live_stream_event.dart';
import '../../../live_stream_state.dart';

class LiveStreamSoundControl extends HookConsumerWidget
    with LiveStreamEvent, LiveStreamState {
  const LiveStreamSoundControl({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlist = getLivePlaylist(ref);
    final liveCount = playlist.length;

    final controllers = List.generate(
      liveCount,
      (index) => getSingleVideoPlayerController(ref, index: index),
    );

    final currentVolumes = useState<List<int>>(
      controllers
          .map(
            (c) => (c!.value.volume * 100).toInt(),
          )
          .toList(),
    );

    final volumeBeforeMutedList = useState<List<int>>(
      List.from(currentVolumes.value),
    );

    final isMuteList = useState<List<bool>>(
      currentVolumes.value
          .map(
            (volume) => volume == 0,
          )
          .toList(),
    );

    final soundSettingItems = List.generate(
      liveCount,
      (index) {
        final liveDetail = playlist[index];

        return StreamSettingsControlItem(
          autofocus: index == 0,
          itemType: SettingItemType.range,
          maxValue: 100,
          channel: liveDetail.channel,
          currentValue: currentVolumes.value[index],
          resetOverlayTimer: () => resetOverlayTimer(
            ref,
            videoFocusNode: videoFocusNode,
          ),
          onUpdate: (value) {
            currentVolumes.value[index] = value;
            volumeBeforeMutedList.value[index] =
                currentVolumes.value[index] == 0 ? 100 : value;
            isMuteList.value[index] =
                currentVolumes.value[index] == 0 ? true : false;
            controllers[index]!.setVolume(value / 100);
          },
          onPressed: (_) {
            final newIsMuted = !isMuteList.value[index];
            final newVolume = newIsMuted
                ? 0
                : volumeBeforeMutedList.value[index] == 0
                    ? 100
                    : volumeBeforeMutedList.value[index];

            isMuteList.value = List.from(isMuteList.value)
              ..[index] = newIsMuted;
            currentVolumes.value = List.from(currentVolumes.value)
              ..[index] = newVolume;

            controllers[index]!.setVolume(newVolume / 100);
          },
        );
      },
    );

    return StreamSettingControl(
      headerText: '소리설정',
      text1: '위\u00b7아래',
      text2: '볼륨조절',
      text3: '클릭',
      text4: '음소거 on\u00b7off',
      streamSettingsControlItems: soundSettingItems,
    );
  }
}
