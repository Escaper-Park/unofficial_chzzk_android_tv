import 'dart:async';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../controller/chat/chat_controller.dart';
import '../../controller/live/live_controller.dart';
import '../../ui/common/dpad_widget.dart';
import './single_view_live/single_view_live_overlay_controls.dart';
import './network_video_controller.dart';
import './vod/single_view_vod_overlay_controls.dart';
import 'single_view_live/single_view_chat_controls.dart';

class NetworkVideo extends StatefulHookConsumerWidget {
  const NetworkVideo({
    super.key,
    required this.videoPath,
    this.channelId,
    this.isLive = true,
    this.openDate,
  });

  final String videoPath;
  final String? channelId;
  final bool isLive;
  final String? openDate;

  @override
  ConsumerState<NetworkVideo> createState() => _NetworkVideoState();
}

class _NetworkVideoState extends ConsumerState<NetworkVideo>
    with WidgetsBindingObserver {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  int? bufferDelay;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WakelockPlus.enable();

    initializePlayer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _videoPlayerController.dispose();
    _chewieController?.dispose();

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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.paused:
        ref.read(videoControlsTimerProvider.notifier).cancelTimer();
        ref.invalidate(chatControllerProvider);
        break;
      case AppLifecycleState.resumed:
        if (widget.isLive && widget.channelId != null) {
          await ref.read(liveControllerProvider.notifier).showNowLive(
                context: context,
                channelId: widget.channelId!,
                videoController: _chewieController!,
              );
        }
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      allowedScreenSleep: false,
      isLive: widget.isLive,
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
    final showControls = ref.watch(showControlsProvider);
    final showChatControls = ref.watch(showChatControlsProvider);
    final videoFocusNode = useFocusNode();

    return _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized
        ? Stack(
            children: [
              DpadWidget(
                autofocus: true,
                focusNode: videoFocusNode,
                okCallback: () {
                  videoFocusNode.unfocus();

                  ref
                      .read(videoControlsTimerProvider.notifier)
                      .showControlsWithTimer(videoFocusNode: videoFocusNode);
                },
                child: Center(
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: Chewie(controller: _chewieController!),
                  ),
                ),
              ),
              if (showControls &&
                  !showChatControls &&
                  widget.isLive &&
                  widget.channelId != null)
                SingleViewLiveOverlayControls(
                  videoController: _chewieController!,
                  // timer: videoControlsTimer!,
                  videoFocusNode: videoFocusNode,
                  openDate: widget.openDate ?? '2024-01-01 00:00:00',
                  channelId: widget.channelId!,
                ),
              if (showControls && !widget.isLive)
                SingleViewVodOverlayControls(
                  chewieController: _chewieController!,
                  // timer: videoControlsTimer!,
                  videoFocusNode: videoFocusNode,
                ),
              if (!showControls && showChatControls)
                SingleViewChatControls(
                  videoFocusNode: videoFocusNode,
                ),
            ],
          )
        : Center(
            child: Text(widget.isLive ? '라이브 불러오는 중...' : '동영상 불러오는 중...'),
          );
  }
}
