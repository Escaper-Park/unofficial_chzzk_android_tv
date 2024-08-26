import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../common/constants/dimensions.dart';
import '../../../../../../common/widgets/header_text.dart';
import '../../../../../live/model/live.dart';
import '../../../../common/control_icon.dart';
import '../../../../common/controls_overlay_container.dart';

class SoundControls extends StatelessWidget {
  const SoundControls({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
    required this.liveDetails,
    required this.controllers,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;
  final List<LiveDetail> liveDetails;
  final List<VideoPlayerController> controllers;

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      liveDetails.length,
      (index) => SoundControlItem(
        autofocus: index == 0,
        videoFocusNode: videoFocusNode,
        headerText: liveDetails[index].channel.channelName,
        controller: controllers[index],
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
            const SizedBox(
              width: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
            const SizedBox(width: 10.0),
            ...items,
          ],
        ),
      ),
    );
  }
}

class SoundControlItem extends HookWidget {
  const SoundControlItem({
    super.key,
    this.autofocus = false,
    required this.videoFocusNode,
    required this.headerText,
    required this.controller,
  });

  final bool autofocus;
  final FocusNode videoFocusNode;
  final String headerText;
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    final currentVolume =
        useState<int>((controller.value.volume * 100).toInt());
    final volumeBeforeMute = useState<int>(currentVolume.value);
    final isMute = useState<bool>(currentVolume.value == 0);

    return SizedBox(
      width: 120.0,
      child: DpadControlIconButton(
        autofocus: autofocus,
        videoFocusNode: videoFocusNode,
        headerText: headerText,
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
              : volumeBeforeMute.value == 0
                  ? 100
                  : volumeBeforeMute.value;
          controller.setVolume(currentVolume.value / 100);
        },
        onUpdate: (updateValue) {
          currentVolume.value = updateValue;
          volumeBeforeMute.value = currentVolume.value == 0 ? 100 : updateValue;
          isMute.value = currentVolume.value == 0 ? true : false;
          controller.setVolume(updateValue / 100);
        },
      ),
    );
  }
}
