import 'dart:async';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../ui/common/dpad_widget.dart';
import 'single_view_live/single_view_live_overlay_controls.dart';
import './network_video_controller.dart';
import 'vod/single_view_vod_overlay_controls.dart';

class NetworkVideo extends ConsumerStatefulWidget {
  const NetworkVideo({
    super.key,
    required this.videoPath,
    this.isLive = true,
    this.openDate,
  });

  final String videoPath;
  final bool isLive;
  final String? openDate;

  @override
  ConsumerState<NetworkVideo> createState() => _NetworkVideoState();
}

class _NetworkVideoState extends ConsumerState<NetworkVideo> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  int? bufferDelay;
  late FocusNode _videoFocusNode;

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
    _videoFocusNode = FocusNode(debugLabel: 'video');

    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    _videoFocusNode.dispose();

    WakelockPlus.disable();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoPath),
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
      looping: false,
      allowedScreenSleep: false,
      isLive: false,
      draggableProgressBar: false,
      fullScreenByDefault: false,
      allowFullScreen: false,
      showControls: false,
      showControlsOnInitialize: false,
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool showControls = ref.watch(showControlsProvider);
    final Timer? videoControlsTimer = ref.watch(videoControlsTimerProvider);

    return _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized
        ? Stack(
            children: [
              DpadWidget(
                autofocus: true,
                focusNode: _videoFocusNode,
                okCallback: () {
                  _videoFocusNode.unfocus();

                  ref
                      .read(videoControlsTimerProvider.notifier)
                      .showControlsWithTimer(
                        videoFocusNode: _videoFocusNode,
                      );
                },
                child: Center(
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: Chewie(controller: _chewieController!),
                  ),
                ),
              ),
              if (showControls && widget.isLive)
                SingleViewLiveOverlayControls(
                  videoController: _chewieController!,
                  timer: videoControlsTimer!,
                  videoFocusNode: _videoFocusNode,
                  openDate: widget.openDate ?? '2024-01-01 00:00:00',
                ),
              if (showControls && !widget.isLive)
                SingleViewVodOverlayControls(
                  chewieController: _chewieController!,
                  timer: videoControlsTimer!,
                  videoFocusNode: _videoFocusNode,
                ),
            ],
          )
        : const Center(
            child: Text('라이브 불러오는 중...'),
          );
  }
}
