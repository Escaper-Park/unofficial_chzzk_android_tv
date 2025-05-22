import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../streaming/stream_screen_base.dart';
import 'widgets/vod_controls_overlay.dart';
import 'widgets/vod_seek_indicator.dart';
import 'widgets/vod_stream_widgets.dart';

import 'vod_stream_event.dart';

class VodStreamScreen extends ConsumerWidget with VodStreamEvent {
  const VodStreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamScreenBase(
      videoScreen: VodScreen(),
      controlsOverlay: VodControlsOverlay(),
      additionalElement: VodSeekIndicator(),
      pause: () async => await pause(ref),
      resume: () async => await resume(ref),
    );
  }
}
