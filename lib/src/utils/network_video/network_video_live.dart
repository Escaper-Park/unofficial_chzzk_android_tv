import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Video
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

// Wakelock
import 'package:wakelock_plus/wakelock_plus.dart';

class NetworkVideoLive extends StatefulWidget {
  const NetworkVideoLive({
    super.key,
    required this.videoPath,
    this.isMuting = false,
  });

  final String videoPath;
  final bool isMuting;

  @override
  State<NetworkVideoLive> createState() => _NetworkVideoLiveState();
}

class _NetworkVideoLiveState extends State<NetworkVideoLive> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  int? bufferDelay = 2000;
  FocusNode focusNode = FocusNode();

  bool showChat = false;

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
      Uri.parse(widget.videoPath),
    );

    await Future.wait([_videoPlayerController.initialize()]);

    // If you use multiview, the sounds on the screen is muted
    // except for the main screen.
    if (widget.isMuting) _videoPlayerController.setVolume(0.0);

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
      isLive: true,
      draggableProgressBar: false,
      fullScreenByDefault: true,
      showControls: false,
      showControlsOnInitialize: false,
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
    );
  }

  dynamic onKey(RawKeyEvent key) {
    if (key.runtimeType.toString() == 'RawKeyDownEvent') {
      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      int dpadKeyValue = data.keyCode;

      if (_chewieController != null) {
        // Ok Button
        if (dpadKeyValue == 23) {
          _chewieController!.isPlaying
              ? _chewieController!.pause()
              : _chewieController!.play();
        }

        // Future works
        // // left
        // else if (dpadKeyValue == 21) {
        //   if (context.mounted && showChat == true) {
        //     setState(() {
        //       showChat = false;
        //     });
        //   }
        // }
        // // right
        // else if (dpadKeyValue == 22) {
        //   if (context.mounted && showChat == false) {
        //     setState(() {
        //       showChat = true;
        //     });
        //   }
        // }
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
