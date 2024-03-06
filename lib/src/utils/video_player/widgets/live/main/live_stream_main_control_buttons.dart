import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/live/model/live.dart';
import '../../../controller/live_stream_controller.dart';
import '../../../controller/network_video_controller.dart';
import '../../common/control_icon.dart';

class LiveStreamMainControlButtons extends HookConsumerWidget {
  const LiveStreamMainControlButtons({
    super.key,
    required this.controller,
    required this.videoFocusNode,
    required this.liveDetail,
  });

  final ChewieController controller;
  final FocusNode videoFocusNode;
  final LiveDetail liveDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoIsPlaying = useState<bool>(controller.isPlaying);
    final focusScopeNode = useFocusScopeNode();
    final Timer? pauseTimer = ref.watch(pauseTimerProvider);

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        ref.read(controlOverlayTimerProvider.notifier).showOverlayAndStartTimer(
              videoFocusNode: videoFocusNode,
              overlayType: OverlayType.main,
              seconds: 0,
            );
      },
      child: FocusScope(
        node: focusScopeNode,
        child: Row(
          children: [
            ControlIcon(
              autofocus: true,
              iconData: videoIsPlaying.value
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              label: videoIsPlaying.value ? '일시정지' : '재생',
              onPressed: () {
                videoIsPlaying.value = !videoIsPlaying.value;
                ref.read(liveStreamControllerProvider.notifier).playOrPause(
                      context,
                      liveDetail,
                      controller,
                      pauseTimer,
                    );
              },
            ),
            const SizedBox(width: 10.0),
            ControlIcon(
              iconData: Icons.alarm_on_rounded,
              label: '실시간',
              onPressed: () {
                ref
                    .read(liveStreamControllerProvider.notifier)
                    .playAnotherLive(context, controller, liveDetail);
              },
            ),
            const SizedBox(width: 10.0),
            ControlIcon(
              iconData: Icons.chat_rounded,
              label: '채팅',
              onPressed: () {
                ref
                    .read(liveStreamScreenModeControllerProvider.notifier)
                    .showOrHideChat();
              },
            ),
            const SizedBox(width: 10.0),
            ControlIcon(
              iconData: Icons.settings_overscan_rounded,
              label: '화면크기',
              onPressed: () {
                ref
                    .read(liveStreamScreenModeControllerProvider.notifier)
                    .changeScreenSize();
              },
            ),
            const SizedBox(width: 10.0),
            ControlIcon(
              iconData: Icons.mark_chat_read_rounded,
              label: '채팅설정',
              onPressed: () {
                ref
                    .read(controlOverlayTimerProvider.notifier)
                    .showOverlayAndStartTimer(
                      videoFocusNode: videoFocusNode,
                      overlayType: OverlayType.chatSettings,
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
