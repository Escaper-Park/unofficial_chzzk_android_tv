import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../ui/common/dpad_widget.dart';
import './multi_view/multi_view_dynamic_screens.dart';
import './multi_view/multi_view_overlay_controls.dart';
import './network_video_controller.dart';

class MultiViewNetworkVideos extends ConsumerStatefulWidget {
  const MultiViewNetworkVideos({
    super.key,
    required this.videoPaths,
    required this.initialVolumeSettings,
    required this.profileImageUrls,
  });

  final List<String> videoPaths;
  final List<double> initialVolumeSettings;
  final List<String?> profileImageUrls;

  @override
  ConsumerState<MultiViewNetworkVideos> createState() =>
      _MultiViewNetworkVideosState();
}

class _MultiViewNetworkVideosState
    extends ConsumerState<MultiViewNetworkVideos> {
  List<VideoPlayerController> videoPlayerControllers = [];
  List<ChewieController>? _chewieControllers;

  int? bufferDelay = 5000;
  late FocusNode _videoFocusNode;

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
    _videoFocusNode = FocusNode(debugLabel: 'wholeVideos');

    initializePlayers();
  }

  @override
  void dispose() {
    _videoFocusNode.unfocus();
    WakelockPlus.disable();
    disposeAllVideoControllers();

    super.dispose();
  }

  void disposeAllVideoControllers() {
    for (var controller in videoPlayerControllers) {
      controller.dispose();
    }
    for (var controller in _chewieControllers!) {
      controller.dispose();
    }
  }

  Future<void> initializePlayers() async {
    widget.videoPaths.asMap().forEach((index, videoPath) async {
      videoPlayerControllers.add(
        VideoPlayerController.networkUrl(
          Uri.parse(videoPath),
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
        ),
      );
    });

    List<Future> initializeFutures = List.generate(widget.videoPaths.length,
        (index) => videoPlayerControllers[index].initialize());

    await Future.wait(initializeFutures);

    _createChewieController();

    if (context.mounted) {
      setState(() {});
    }
  }

  void _createChewieController() {
    _chewieControllers = List.generate(
      widget.videoPaths.length,
      (index) => ChewieController(
        videoPlayerController: videoPlayerControllers[index],
        autoPlay: true,
        looping: false,
        allowedScreenSleep: false,
        isLive: false,
        allowMuting: true,
        draggableProgressBar: false,
        fullScreenByDefault: false,
        allowFullScreen: false,
        showControls: false,
        showControlsOnInitialize: false,
        progressIndicatorDelay:
            bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
      ),
    );

    for (var i = 0; i < widget.initialVolumeSettings.length; i++) {
      _chewieControllers![i].setVolume(widget.initialVolumeSettings[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final showControls = ref.watch(showControlsProvider);
    final Timer? videoControlsTimer = ref.watch(videoControlsTimerProvider);

    bool allVideoControllsAreInitialized = videoPlayerControllers
        .every((controller) => controller.value.isInitialized == true);

    return _chewieControllers != null && allVideoControllsAreInitialized
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
                        videoFocusNode: _videoFocusNode
                      );
                },
                child: Center(
                  child: MultiViewDynamicScreens(
                    chewieControllers: _chewieControllers!,
                  ),
                ),
              ),
              if (showControls)
                MultiViewOverlayControls(
                  chewieControllers: _chewieControllers!,
                  timer: videoControlsTimer!,
                  videoFocusNode: _videoFocusNode,
                  profileImageUrls: widget.profileImageUrls,
                ) // overlays
            ],
          )
        : const Center(
            child: Text('멀티뷰 불러오는 중...'),
          );
  }
}
