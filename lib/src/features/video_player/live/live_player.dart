import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/features/video_player/live/widgets/util/wakelock_monitor.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'controller/live_player_controller.dart';
import 'controller/live_playlist_controller.dart';
import 'live_screen.dart';
import 'live_controls_overlay.dart';

class LivePlayer extends ConsumerStatefulWidget {
  const LivePlayer({super.key});

  @override
  ConsumerState<LivePlayer> createState() => _LivePlayerState();
}

class _LivePlayerState extends ConsumerState<LivePlayer>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    initialize();
  }

  Future<void> initialize() async {
    WidgetsBinding.instance.addObserver(this);
    if (!await WakelockPlus.enabled) {
      await WakelockPlus.enable();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        break;
      // Pause
      case AppLifecycleState.paused:
        _pauseAllVideos(ref);
        WakelockPlus.disable();
        break;
      // Pause -> Resume
      case AppLifecycleState.resumed:
        _replayAllVideos(ref);
        WakelockPlus.enable();
        break;
      // System Ends
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        WakelockMonitor(),
        LiveScreen(),
        LiveControlsOverlay(),
      ],
    );
  }

  void _pauseAllVideos(WidgetRef ref) {
    final liveCount =
        ref.read(livePlaylistControllerProvider.notifier).getLiveCount();

    ref.read(currentActivatedAudioSourceIndexProvider.notifier).reset();
    ref.read(currentActivatedLiveIndexProvider.notifier).reset();

    for (int i = 0; i < liveCount; i++) {
      ref.read(singleLivePlayerControllerProvider(index: i).notifier).pause();
    }
  }

  void _replayAllVideos(WidgetRef ref) {
    final liveCount =
        ref.read(livePlaylistControllerProvider.notifier).getLiveCount();

    for (int i = 0; i < liveCount; i++) {
      ref
          .read(singleLivePlayerControllerProvider(index: i).notifier)
          .changeSource();
    }
  }
}
