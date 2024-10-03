import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'controller/vod_player_controller.dart';
import 'vod_controls_overlay.dart';
import 'vod_screen.dart';

class VodPlayer extends ConsumerStatefulWidget {
  const VodPlayer({super.key});

  @override
  ConsumerState<VodPlayer> createState() => _VodPlayerState();
}

class _VodPlayerState extends ConsumerState<VodPlayer>
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
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        break;
      // Pause
      case AppLifecycleState.paused:
        _pause(ref);

        break;
      // Pause -> Resume
      case AppLifecycleState.resumed:
        _resume(ref);
        break;
      // System Ends
      case AppLifecycleState.detached:
        break;
    }
  }

  void _pause(WidgetRef ref) {
    ref.read(vodPlayerControllerProvider.notifier).pause();
    WakelockPlus.disable();
  }

  void _resume(WidgetRef ref) {
    ref.read(vodPlayerControllerProvider.notifier).resume();
    WakelockPlus.enable();
  }

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        VodScreen(),
        VodControlsOverlay(),
      ],
    );
  }
}
