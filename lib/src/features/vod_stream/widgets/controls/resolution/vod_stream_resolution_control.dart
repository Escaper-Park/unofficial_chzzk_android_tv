import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../streaming/widgets/control/stream_settings_control_item.dart';
import '../../../../streaming/widgets/control/stream_setting_control.dart';
import '../../../../vod/model/vod.dart';
import '../../../vod_stream_event.dart';
import '../../../vod_stream_state.dart';

class VodStreamResolutionControl extends ConsumerWidget
    with VodStreamEvent, VodStreamState {
  const VodStreamResolutionControl({
    super.key,
    required this.vod,
    required this.videoFocusNode,
  });

  final Vod? vod;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return vod == null
        ? const SizedBox.shrink()
        : StreamSettingControl(
            headerText: '화질설정',
            text1: '위\u00b7아래',
            text2: '화질 변경',
            text3: '클릭',
            text4: '적용',
            streamSettingsControlItems: [
              StreamSettingsControlItem(
                autofocus: true,
                channel: vod!.channel!,
                currentValue: getCurrentResolutionIndex(ref),
                maxValue: 2,
                resetOverlayTimer: () =>
                    resetOverlayTimer(ref, videoFocusNode: videoFocusNode),
                displayTextList: const ['720p', '1080p', '자동'],
                onPressed: (value) async {
                  await changeResolution(ref, resolutionIndex: value);
                },
              ),
            ],
          );
  }
}
