import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class StreamScreenBase extends StatefulHookConsumerWidget {
  const StreamScreenBase({
    super.key,
    required this.videoScreen,
    required this.controlsOverlay,
    this.additionalElement,
    required this.pause,
    required this.resume,
  });

  final Widget videoScreen;
  final Widget controlsOverlay;
  final Widget? additionalElement;

  final Future<void> Function() pause;
  final Future<void> Function() resume;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StreamingScreenState();
}

class _StreamingScreenState extends ConsumerState<StreamScreenBase>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initWakelock();
  }

  Future<void> initWakelock() async {
    if (!await WakelockPlus.enabled) {
      await WakelockPlus.enable();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.inactive:
        await widget.pause();
        break;
      case AppLifecycleState.resumed:
        await widget.resume();
        break;
      case AppLifecycleState.paused:
        await widget.pause();
        break;
      case AppLifecycleState.hidden:
        await widget.pause();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.videoScreen,
          widget.controlsOverlay,
          if (widget.additionalElement != null) widget.additionalElement!,
        ],
      ),
    );
  }
}
