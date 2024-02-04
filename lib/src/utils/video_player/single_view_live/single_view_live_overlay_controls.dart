import 'dart:async';

import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controller/live/live_controller.dart';
import '../network_video_controller.dart';
import '../common/control_icon.dart';
import 'uptime_timer.dart';

class SingleViewLiveOverlayControls extends ConsumerWidget {
  const SingleViewLiveOverlayControls({
    super.key,
    required this.videoController,
    // required this.timer,
    required this.videoFocusNode,
    required this.openDate,
    required this.channelId,
  });

  final ChewieController videoController;
  // final Timer timer;
  final FocusNode videoFocusNode;
  final String channelId;
  final String openDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        // Close Controls
        ref.read(videoControlsTimerProvider.notifier).showControlsWithTimer(
              videoFocusNode: videoFocusNode,
              seconds: 0,
            );
      },
      child: LiveControlButtons(
        videoController: videoController,
        // timer: timer,
        videoFocusNode: videoFocusNode,
        openDate: openDate,
        channelId: channelId,
      ),
    );
  }
}

class LiveControlButtons extends HookConsumerWidget {
  const LiveControlButtons({
    super.key,
    required this.videoController,
    required this.channelId,
    // required this.timer,
    required this.videoFocusNode,
    required this.openDate,
  });

  final ChewieController videoController;
  final String channelId;
  // final Timer timer;
  final FocusNode videoFocusNode;
  final String openDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoIsPlaying = useState<bool>(videoController.isPlaying);
    final Timer? pauseTimer = ref.watch(pauseTimerProvider);

    final focusScopeNode = useFocusScopeNode();

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
              child: Center(
                child: FocusScope(
                  node: focusScopeNode,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      UptimeTimer(openDate: openDate),
                      ControlIcon(
                        autofocus: true,
                        iconData: videoIsPlaying.value
                            ? Icons.play_arrow
                            : Icons.pause,
                        label: videoIsPlaying.value ? '재생중' : '일시정지',
                        onPressed: () async {
                          videoIsPlaying.value = !videoIsPlaying.value;

                          if (videoController.isPlaying) {
                            videoController.pause();
                            // PauseTimer start
                            ref
                                .read(pauseTimerProvider.notifier)
                                .pauseWithStartTimer();
                          }
                          // Play
                          else {
                            if (pauseTimer != null && pauseTimer.isActive) {
                              ref
                                  .read(pauseTimerProvider.notifier)
                                  .cancelTimer();
                              videoController.play();
                            } else {
                              ref
                                  .read(pauseTimerProvider.notifier)
                                  .cancelTimer();
                              await ref
                                  .read(liveControllerProvider.notifier)
                                  .showNowLive(
                                    context: context,
                                    channelId: channelId,
                                    videoController: videoController,
                                  );
                            }
                          }
                        },
                      ),
                      const SizedBox(width: 10.0),
                      ControlIcon(
                        iconData: Icons.alarm_on_rounded,
                        label: '실시간',
                        onPressed: () async {
                          ref.read(pauseTimerProvider.notifier).cancelTimer();

                          await ref
                              .read(liveControllerProvider.notifier)
                              .showNowLive(
                                context: context,
                                channelId: channelId,
                                videoController: videoController,
                              );
                        },
                      ),
                      const SizedBox(width: 10.0),
                      // Show Chat
                      ControlIcon(
                        iconData: Icons.chat,
                        label: '채팅',
                        onPressed: () {
                          ref
                              .read(singleViewScreenControllerProvider.notifier)
                              .showOrHideChat();
                        },
                      ),
                      const SizedBox(width: 10.0),
                      ControlIcon(
                        iconData: Icons.monitor,
                        label: '화면크기',
                        onPressed: () {
                          ref
                              .read(singleViewScreenControllerProvider.notifier)
                              .changeScreenSize();
                        },
                      ),
                      const SizedBox(width: 10.0),
                      ControlIcon(
                        iconData: Icons.settings,
                        label: '채팅설정',
                        onPressed: () {
                          // Don't use showControlsWithTimer seconds 0
                          // Because of videoFocusNode.requestFocus();
                          ref
                              .read(showControlsProvider.notifier)
                              .setState(false);

                          ref
                              .read(singleViewScreenControllerProvider.notifier)
                              .setScreenMode(SingleViewScreenMode.overlayChat);

                          ref
                              .read(videoControlsTimerProvider.notifier)
                              .showControlsWithTimer(
                                videoFocusNode: videoFocusNode,
                                seconds: 10,
                                controlType: ControlType.chat,
                              );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
