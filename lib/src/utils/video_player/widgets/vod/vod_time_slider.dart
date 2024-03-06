import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';

import '../common/dpad_slider.dart';

class VodTimeSlider extends StatelessWidget {
  const VodTimeSlider({
    super.key,
    required this.controller,
    required this.videoFocusNode,
  });

  final ChewieController controller;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context) {
    return DpadSlider(
      controller: controller,
      videoFocusNode: videoFocusNode,
      maxValue:
          controller.videoPlayerController.value.duration.inSeconds.toDouble(),
      initialPosition:
          controller.videoPlayerController.value.position.inSeconds.toDouble(),
      leftCallback: (positionValue) {
        controller.seekTo(
          Duration(seconds: positionValue.toInt()),
        );
      },
      rightCallback: (positionValue) {
        controller.seekTo(
          Duration(seconds: positionValue.toInt()),
        );
      },
    );
  }
}
