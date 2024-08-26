import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../../live/model/live.dart';
import '../../../controller/live_player_controller.dart';
import 'multi_stream_main_controls.dart';
import 'single_stream_main_controls.dart';

class LiveStreamMainControls extends ConsumerWidget {
  const LiveStreamMainControls({
    super.key,
    required this.videoFocusNode,
    required this.mainControlsFSN,
    required this.controllers,
    required this.liveDetails,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode mainControlsFSN;
  final List<VideoPlayerController> controllers;
  final List<LiveDetail> liveDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenMode = ref.watch(livePlayerScreenModeControllerProvider);
    
    return screenMode != LivePlayerScreenMode.multiview
        ? SingleStreamMainControls(
            videoFocusNode: videoFocusNode,
            mainControlsFSN: mainControlsFSN,
            liveDetail: liveDetails[0],
            controller: controllers[0],
          )
        : MultiStreamMainControls(
            videoFocusNode: videoFocusNode,
            mainControlsFSN: mainControlsFSN,
            liveDetails: liveDetails,
            controllers: controllers,
          );
  }
}
