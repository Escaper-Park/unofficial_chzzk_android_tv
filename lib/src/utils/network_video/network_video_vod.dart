import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Video
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

// Wakelock
import 'package:wakelock_plus/wakelock_plus.dart';

class NetworkVideoVod extends StatefulWidget {
  const NetworkVideoVod({
    super.key,
    required this.vodPath,
  });

  final String vodPath;

  @override
  State<NetworkVideoVod> createState() => _NetworkVideoVodState();
}

class _NetworkVideoVodState extends State<NetworkVideoVod> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  int? bufferDelay = 2000;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    focusNode.dispose();
    WakelockPlus.disable();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.vodPath),
    );

    await Future.wait([_videoPlayerController.initialize()]);

    _createChewieController();

    if (context.mounted) {
      setState(() {});
    }
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      allowedScreenSleep: false,
      isLive: false,
      draggableProgressBar: false,
      fullScreenByDefault: true,
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
    );
  }

  dynamic onKey(RawKeyEvent key) {
    if (key.runtimeType.toString() == 'RawKeyDownEvent') {
      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      int dpadKeyValue = data.keyCode;

      // Ok Button
      if (dpadKeyValue == 23 && _chewieController != null) {
        _chewieController!.isPlaying
            ? _chewieController!.pause()
            : _chewieController!.play();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      // TODO : Check FocusNode
      autofocus: true,
      focusNode: focusNode,
      onKey: onKey,
      child: Center(
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : const Center(
                child: Text('Loading...'),
              ),
      ),
    );
  }
}
