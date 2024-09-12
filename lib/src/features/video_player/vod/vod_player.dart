import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../common/widgets/center_widgets.dart';
import '../../vod/model/vod.dart';
import 'vod_controls_overlay.dart';

class VodPlayer extends StatefulWidget {
  const VodPlayer({
    super.key,
    required this.vodPath,
    required this.vod,
  });

  final String vodPath;
  final Vod vod;

  @override
  State<VodPlayer> createState() => _VodPlayerState();
}

class _VodPlayerState extends State<VodPlayer> with WidgetsBindingObserver {
  VideoPlayerController? _videoPlayerController;

  // Show current state.
  String msg = '동영상 로딩 중...';

  @override
  void initState() {
    super.initState();
    // add observer for detecting App Life cycle
    WidgetsBinding.instance.addObserver(this);

    initialize();
  }

  Future<void> initialize() async {
    RegExp regExp = RegExp(r'_lsu_sa_=([a-zA-Z0-9]+)');
    Match? match = regExp.firstMatch(widget.vodPath);

    String lsuSa = '';
    if (match != null) {
      lsuSa = match.group(1)!;
    }

    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.vodPath),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      httpHeaders: {'_lsu_sa_': lsuSa},
    );

    await Future.wait([_videoPlayerController!.initialize()]);
    _videoPlayerController!.play();

    // Check wakelock
    if (!await WakelockPlus.enabled) {
      await WakelockPlus.enable();
    }

    _videoPlayerController?.addListener(_checkVideoEnds);

    if (context.mounted) {
      setState(() {});
    }
  }

  void _checkVideoEnds() async {
    if (_videoPlayerController != null) {
      final value = _videoPlayerController!.value;

      // Sometimes this package detects the end of video as an error situation.
      final bool checkEnds = value.hasError == true || // Error
          // Ends
          (value.isInitialized &&
              (value.position >= value.duration) &&
              !value.isPlaying);

      if (checkEnds) {
        setState(() {
          msg = '영상이 마지막까지 재생되었습니다';
          WakelockPlus.disable();
          _videoPlayerController = null;
        });
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    WakelockPlus.disable();
    if (_videoPlayerController != null) {
      _videoPlayerController!.pause(); // To avoid android errors.
      _videoPlayerController!.removeListener(_checkVideoEnds);
      _videoPlayerController!.dispose();
    }

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
        _videoPlayerController?.pause();
        WakelockPlus.disable();
        break;
      // Pause -> Resume
      case AppLifecycleState.resumed:
        if (_videoPlayerController?.value.isPlaying == false) {
          _videoPlayerController?.play();
          await WakelockPlus.enable();
        }
        break;
      // System Ends
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController != null &&
            _videoPlayerController!.value.isInitialized
        ? Stack(
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: _videoPlayerController!.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController!),
                ),
              ),
              // Controls
              VodControlsOverlay(
                controller: _videoPlayerController!,
                vod: widget.vod,
              ),
            ],
          )
        : CenteredText(text: msg);
  }
}
