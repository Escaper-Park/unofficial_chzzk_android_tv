import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controller/live_mode_controller.dart';
import './multi_stream_main_controls.dart';
import './single_stream_main_controls.dart';

class LiveStreamMainControls extends ConsumerWidget {
  const LiveStreamMainControls({
    super.key,
    required this.videoFocusNode,
    required this.controlsFSN,
  });

  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenMode = ref.watch(liveModeControllerProvider);

    return screenMode == LiveMode.singleView
        ? SingleStreamMainControls(
            videoFocusNode: videoFocusNode,
            controlsFSN: controlsFSN,
          )
        : MultiStreamMainControls(
            videoFocusNode: videoFocusNode,
            controlsFSN: controlsFSN,
          );
  }
}
