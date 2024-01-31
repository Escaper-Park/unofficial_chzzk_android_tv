import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import '../common/dpad_slider.dart';

class VideoSlider extends StatelessWidget {
  const VideoSlider({
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
      min: 0.0,
      max: controller.videoPlayerController.value.duration.inSeconds.toDouble(),
      initialPosition:
          controller.videoPlayerController.value.position.inSeconds.toDouble(),
      leftCallback: (double positionValue) {
        controller.seekTo(
          Duration(seconds: positionValue.toInt()),
        );
      },
      rightCallback: (double positionValue) {
        controller.seekTo(
          Duration(seconds: positionValue.toInt()),
        );
      },
    );
  }
}
