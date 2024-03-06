import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/live/model/live.dart';
import '../../../controller/network_video_controller.dart';
import 'live_uptime.dart';
import 'live_stream_main_control_buttons.dart';
import '../live_stream_contorls_container.dart';

class LiveStreamMainControlOverlay extends ConsumerWidget {
  const LiveStreamMainControlOverlay({
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
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        ref.read(controlOverlayTimerProvider.notifier).showOverlayAndStartTimer(
              videoFocusNode: videoFocusNode,
              seconds: 0,
            );
      },
      child: LiveStreamControlsContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LiveStreamUptime(
                openDate: liveDetail.openDate ?? '2024-01-01 00:00:00'),
            LiveStreamMainControlButtons(
              controller: controller,
              videoFocusNode: videoFocusNode,
              liveDetail: liveDetail,
            ),
          ],
        ),
      ),
    );
  }
}
