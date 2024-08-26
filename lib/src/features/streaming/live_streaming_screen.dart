import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../video_player/live/controller/live_playlist_controller.dart';
import '../video_player/live/live_player.dart';

class LiveStreamingScreen extends ConsumerWidget {
  const LiveStreamingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(livePlaylistControllerProvider);

    return Scaffold(
      body: LivePlayer(liveStream: data),
    );
  }
}
