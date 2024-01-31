import 'dart:async';

import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../network_video_controller.dart';
import '../common/control_icon.dart';
import 'uptime_timer.dart';

class SingleViewLiveOverlayControls extends ConsumerWidget {
  const SingleViewLiveOverlayControls({
    super.key,
    required this.videoController,
    required this.timer,
    required this.videoFocusNode,
    required this.openDate,
  });

  final ChewieController videoController;
  final Timer timer;
  final FocusNode videoFocusNode;
  final String openDate;

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
      child: LiveControlButtons(
        videoController: videoController,
        timer: timer,
        videoFocusNode: videoFocusNode,
        openDate: openDate,
      ),
    );
  }
}

class LiveControlButtons extends HookConsumerWidget {
  const LiveControlButtons({
    super.key,
    required this.videoController,
    required this.timer,
    required this.videoFocusNode,
    required this.openDate,
  });

  final ChewieController videoController;
  final Timer timer;
  final FocusNode videoFocusNode;
  final String openDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoIsPlaying = useState<bool>(videoController.isPlaying);

    return Stack(
      children: [
        // Play-Pause Button
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80.0,
            width: double.infinity,
            color: Colors.black.withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UptimeTimer(openDate: openDate),
                  ControlIcon(
                    autofocus: true,
                    iconData:
                        videoIsPlaying.value ? Icons.play_arrow : Icons.pause,
                    onPressed: () {
                      videoIsPlaying.value = !videoIsPlaying.value;

                      videoController.isPlaying
                          ? videoController.pause()
                          : videoController.play();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Seek to lastest
                      ControlIcon(
                        iconData: Icons.alarm_on_rounded,
                        onPressed: () {
                          videoController.seekTo(const Duration(days: 3));
                        },
                      ),
                      const SizedBox(width: 10.0),
                      // Show Chat
                      ControlIcon(
                        iconData: Icons.chat,
                        onPressed: () {
                          ref.read(showChatProvider.notifier).setState();
                        },
                      ),
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
