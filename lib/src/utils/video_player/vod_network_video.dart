import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../features/vod/model/vod.dart';
import '../focus/dpad_widget.dart';
import './controller/network_video_controller.dart';
import 'widgets/vod/vod_stream_control_overlay.dart';
import 'widgets/vod/vod_stream_info.dart';

class VodStreamingNetworkVideo extends StatefulHookConsumerWidget {
  const VodStreamingNetworkVideo({
    super.key,
    required this.vodPath,
    required this.vod,
  });

  final String vodPath;
  final Vod vod;

  @override
  ConsumerState<VodStreamingNetworkVideo> createState() =>
      _VodStreamingNetworkVideoState();
}

class _VodStreamingNetworkVideoState
    extends ConsumerState<VodStreamingNetworkVideo>
    with WidgetsBindingObserver {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  int? bufferDelay;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    initialize();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    WakelockPlus.disable();
    WidgetsBinding.instance.removeObserver(this);
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
      case AppLifecycleState.paused:
        ref.read(controlOverlayTimerProvider.notifier).cancelTimer();
        WakelockPlus.disable();
        break;
      case AppLifecycleState.resumed:
        WakelockPlus.enable();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  Future<void> initialize() async {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.vodPath),
    );

    await Future.wait([_videoPlayerController.initialize()]);

    _createChewieController();

    if (context.mounted) setState(() {});

    // Check Wakelock enabled
    if (!await WakelockPlus.enabled) {
      await WakelockPlus.enable();
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
    final videoFocusNode = useFocusNode();
    final overlayType = ref.watch(overlayControllerProvider);

    return _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized
        ? Stack(
            children: [
              // Video
              DpadWidget(
                autofocus: true,
                focusNode: videoFocusNode,
                actionCallbacks: {
                  DpadAction.select: () {
                    videoFocusNode.unfocus();

                    ref
                        .read(controlOverlayTimerProvider.notifier)
                        .showOverlayAndStartTimer(
                          videoFocusNode: videoFocusNode,
                          overlayType: OverlayType.main,
                        );
                  },
                },
                child: Center(
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: Chewie(controller: _chewieController!),
                  ),
                ),
              ),
              // VOD Info
              if (overlayType == OverlayType.main) VodStreamInfo(vod: widget.vod),
              // Control overlay
              if (overlayType == OverlayType.main)
                VodStreamControlOverlay(
                  controller: _chewieController!,
                  videoFocusNode: videoFocusNode,
                  vod: widget.vod,
                ),
            ],
          )
        : const Center(
            child: Text('동영상 불러오는 중...'),
          );
  }
}
