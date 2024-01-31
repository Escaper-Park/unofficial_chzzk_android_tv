import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/dpad_slider.dart';

class MultiViewVolume extends ConsumerWidget {
  const MultiViewVolume({
    super.key,
    required this.controller,
    required this.videoFocusNode,
  });

  final ChewieController controller;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentVolume = controller.videoPlayerController.value.volume;

    return DpadSlider(
      controller: controller,
      videoFocusNode: videoFocusNode,
      leftCallback: (positionValue) {
        controller.setVolume(positionValue);
      },
      rightCallback: (positionValue) {
        controller.setVolume(positionValue);
      },
      min: 0.0,
      max: 1.0,
      initialPosition: currentVolume,
    );
    // return Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       const SizedBox(width: 10.0),
    //       Expanded(
    //         child: DpadSlider(
    //           controller: controller,
    //           videoFocusNode: videoFocusNode,
    //           leftCallback: (positionValue) {
    //             controller.setVolume(positionValue);
    //           },
    //           rightCallback: (positionValue) {
    //             controller.setVolume(positionValue);
    //           },
    //           min: 0.0,
    //           max: 1.0,
    //           initialPosition: currentVolume,
    //         ),
    //       ),
    //       SizedBox(
    //         width: 50.0,
    //         child: Text(
    //           '${(currentVolume * 100).toInt()}',
    //           style: const TextStyle(
    //             fontSize: 12.0,
    //             fontWeight: FontWeight.w600,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
