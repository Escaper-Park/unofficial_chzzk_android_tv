import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../streaming/widgets/control/stream_settings_control_item.dart';
import '../../../../streaming/widgets/control/stream_setting_control.dart';
import '../../../live_stream_event.dart';
import '../../../live_stream_state.dart';

class LiveStreamResolutionControl extends ConsumerWidget
    with LiveStreamEvent, LiveStreamState {
  const LiveStreamResolutionControl({
    super.key,
    required this.videoFocusNode,
  });

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlist = getLivePlaylist(ref);

    final resolutionSettingItems = List.generate(
      playlist.length,
      (index) {
        final liveDetail = playlist[index];

        return StreamSettingsControlItem(
          autofocus: index == 0,
          channel: liveDetail.channel,
          currentValue:
              getCurrentResolutionIndex(ref, controllerIndex: index),
          maxValue: 4,
          resetOverlayTimer: () => resetOverlayTimer(
            ref,
            videoFocusNode: videoFocusNode,
          ),
          displayTextList: const ['360p', '480p', '720p', '1080p', '자동'],
          onPressed: (value) async {
            await changeResolution(
              ref,
              resolutionIndex: value,
              controllerIndex: index,
            );
          },
        );
      },
    );

    return StreamSettingControl(
      headerText: '화질설정',
      text1: '위\u00b7아래',
      text2: '화질 변경',
      text3: '클릭',
      text4: '적용',
      streamSettingsControlItems: resolutionSettingItems,
    );
  }
}
