import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../network_video_controller.dart';
import '../common/control_icon.dart';
import 'video_left_time.dart';
import 'video_slider.dart';

class SingleViewVodOverlayControls extends ConsumerWidget {
  const SingleViewVodOverlayControls({
    super.key,
    required this.chewieController,
    // required this.timer,
    required this.videoFocusNode,
  });

  final ChewieController chewieController;
  // final Timer timer;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        ref.read(videoControlsTimerProvider.notifier).showControlsWithTimer(
              videoFocusNode: videoFocusNode,
              seconds: 0,
            );
      },
      child: VodControllerButtons(
        chewieController: chewieController,
        // timer: timer,
        videoFocusNode: videoFocusNode,
      ),
    );
  }
}

class VodControllerButtons extends HookConsumerWidget {
  const VodControllerButtons({
    super.key,
    required this.chewieController,
    // required this.timer,
    required this.videoFocusNode,
  });

  final ChewieController chewieController;
  // final Timer timer;
  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoIsPlaying = useState<bool>(chewieController.isPlaying);

    return Stack(
      children: [
        // Play-Pause Button
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 150.0,
            width: double.infinity,
            color: Colors.black.withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ControlIcon(
                        iconData: Icons.replay_10_rounded,
                        label: '되감기',
                        onPressed: () {
                          chewieController.pause();

                          final currentPosition = chewieController
                              .videoPlayerController.value.position;

                          final newPosition =
                              currentPosition - const Duration(seconds: 10);

                          chewieController.seekTo(newPosition);

                          chewieController.play();

                          ref
                              .read(videoControlsTimerProvider.notifier)
                              .showControlsWithTimer(
                                  videoFocusNode: videoFocusNode);
                        },
                      ),
                      const SizedBox(width: 10.0),
                      ControlIcon(
                        autofocus: true,
                        label: videoIsPlaying.value ? '재생' : '일시정지',
                        iconData: videoIsPlaying.value
                            ? Icons.play_arrow
                            : Icons.pause,
                        onPressed: () {
                          videoIsPlaying.value = !videoIsPlaying.value;

                          chewieController.isPlaying
                              ? chewieController.pause()
                              : chewieController.play();
                        },
                      ),
                      const SizedBox(width: 10.0),
                      ControlIcon(
                        iconData: Icons.forward_10,
                        label: '빨리감기',
                        onPressed: () {
                          chewieController.pause();

                          final currentPosition = chewieController
                              .videoPlayerController.value.position;

                          final newPosition =
                              currentPosition + const Duration(seconds: 10);

                          if (newPosition <=
                              chewieController
                                  .videoPlayerController.value.duration) {
                            chewieController.seekTo(newPosition);
                          }
                          chewieController.play();

                          ref
                              .read(videoControlsTimerProvider.notifier)
                              .showControlsWithTimer(
                                  videoFocusNode: videoFocusNode);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: VideoSlider(
                          controller: chewieController,
                          videoFocusNode: videoFocusNode,
                        ),
                      ),
                      VideoLeftTime(chewieController: chewieController),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
