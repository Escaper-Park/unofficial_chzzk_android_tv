import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/network_video_controller.dart';
import '../common/control_icon.dart';

enum PlaybackDirection {
  forward,
  backward,
}

class VodPlaybackControls extends HookConsumerWidget {
  const VodPlaybackControls({
    super.key,
    required this.controller,
    required this.videoFocusNode,
  });

  final ChewieController controller;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoIsPlaying = useState<bool>(controller.isPlaying);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ControlIcon(
          iconData: Icons.replay_10_rounded,
          onPressed: () {
            _seekTo(ref, controller, PlaybackDirection.backward);
          },
        ),
        const SizedBox(width: 10.0),
        ControlIcon(
          autofocus: true,
          iconData: videoIsPlaying.value
              ? Icons.pause_rounded
              : Icons.play_arrow_rounded,
          onPressed: () {
            controller.isPlaying ? controller.pause() : controller.play();

            videoIsPlaying.value = !videoIsPlaying.value;
          },
        ),
        const SizedBox(width: 10.0),
        ControlIcon(
          iconData: Icons.forward_10_rounded,
          onPressed: () {
            _seekTo(ref, controller, PlaybackDirection.forward);
          },
        ),
      ],
    );
  }

  void _seekTo(
    WidgetRef ref,
    ChewieController controller,
    PlaybackDirection direction,
  ) {
    const int intervalSec = 10;

    controller.pause();

    final currentPosition = controller.videoPlayerController.value.position;

    switch (direction) {
      case PlaybackDirection.forward:
        final newPosition =
            currentPosition + const Duration(seconds: intervalSec);
        if (newPosition <= controller.videoPlayerController.value.duration) {
          controller.seekTo(newPosition);
        }
        break;

      case PlaybackDirection.backward:
        final newPosition =
            currentPosition - const Duration(seconds: intervalSec);
        controller.seekTo(newPosition);
        break;
    }

    controller.play();

    ref
        .read(controlOverlayTimerProvider.notifier)
        .showOverlayAndStartTimer(videoFocusNode: videoFocusNode);
  }
}
