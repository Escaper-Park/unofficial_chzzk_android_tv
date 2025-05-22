import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../streaming/stream_screen_base.dart';
import 'live_stream_event.dart';
import 'widgets/live_stream_widgets.dart';

class LiveStreamScreen extends ConsumerWidget with LiveStreamEvent {
  const LiveStreamScreen({super.key, this.fromHome = false});

  final bool fromHome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamScreenBase(
      videoScreen: LiveScreen(),
      controlsOverlay: LiveControlsOverlay(fromHome: fromHome),
      pause: () async => await pauseAll(ref),
      resume: () async => await resumeAll(ref),
    );
  }
}
