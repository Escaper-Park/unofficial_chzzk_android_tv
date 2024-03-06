import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../common/constants/styles.dart';
import '../../features/chat/controller/chat_controller.dart';
import '../../features/chat/controller/chat_settings_controller.dart';
import '../../features/chat/model/chat_settings.dart';
import '../../features/live/model/live.dart';
import '../../features/live_streaming/widgets/live_chat_stream.dart';
import '../focus/dpad_widget.dart';
import './controller/network_video_controller.dart';
import './controller/live_stream_controller.dart';
import './widgets/live/following/live_stream_following_list.dart';
import './widgets/live/main/live_stream_info.dart';
import './widgets/live/main/live_stream_main_control_overlay.dart';
import './widgets/live/chat/live_stream_chat_control_overlay.dart';
import './widgets/live/category/live_stream_category_live_list.dart';
import './widgets/live/popular/live_stream_popular_list.dart';

class LiveStreamingNetworkVideo extends StatefulHookConsumerWidget {
  const LiveStreamingNetworkVideo({
    super.key,
    required this.liveDetail,
  });

  final LiveDetail liveDetail;

  @override
  ConsumerState<LiveStreamingNetworkVideo> createState() =>
      _NetworkVideoState();
}

class _NetworkVideoState extends ConsumerState<LiveStreamingNetworkVideo>
    with WidgetsBindingObserver {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  String msg = '라이브 불러오는 중...';
  int? bufferDelay;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    initialize();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    WakelockPlus.disable();
    super.dispose();
  }

  Future<void> initialize() async {
    final initialSource = Uri.parse(widget.liveDetail.livePath!);

    _videoPlayerController = VideoPlayerController.networkUrl(
      initialSource,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: false),
    );

    await Future.wait([_videoPlayerController.initialize()]);

    // Check Wakelock enabled
    if (!await WakelockPlus.enabled) {
      await WakelockPlus.enable();
    }

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
      isLive: true,
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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.paused:
        ref.read(pauseTimerProvider.notifier).cancelTimer();
        ref.invalidate(chatControllerProvider);
        WakelockPlus.disable();
        break;
      case AppLifecycleState.resumed:
        if (_chewieController != null) {
          ref.read(liveStreamControllerProvider.notifier).playAnotherLive(
                context,
                _chewieController!,
                widget.liveDetail,
              );
        }

        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final videoFocusNode = useFocusNode();
    final currentOverlay = ref.watch(overlayControllerProvider);
    final screenMode = ref.watch(liveStreamScreenModeControllerProvider);
    final chatSettings = ref.watch(chatSettingsControllerProvider);

    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;

    final double opacity =
        (1.0 - chatSettings.chatContainerTransparency * 0.01);
    final int chatContainerHeight = chatSettings.chatContainerHeight;
    final int chatContainerWidth = chatSettings.chatContainerWidth;
    final int chatPositionIndex = chatSettings.chatPosition;
    final double chatFontSize = chatSettings.fontSize.toDouble();
    final double verticalInterval =
        chatSettings.chatContainerVerticalInterval.toDouble();

    return _chewieController != null &&
            (_chewieController!.videoPlayerController.value.isInitialized)
        ? Stack(
            children: [
              // Main Screen
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
                            overlayType: OverlayType.main);
                  },
                  DpadAction.arrowUp: () {
                    videoFocusNode.unfocus();

                    ref
                        .read(controlOverlayTimerProvider.notifier)
                        .showOverlayAndStartTimer(
                          videoFocusNode: videoFocusNode,
                          overlayType: OverlayType.popular,
                        );
                  }
                },
                child: Center(
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: Chewie(controller: _chewieController!),
                  ),
                ),
              ),
              // OverlayChat
              if (screenMode == LiveStreamScreenMode.overlayChat)
                Align(
                  alignment: ChatPositionData
                      .chatPositionsData[chatPositionIndex].alignment,
                  child: Container(
                    color: AppColors.blackColor.withOpacity(opacity),
                    width: maxWidth * chatContainerWidth * 0.01,
                    height: maxHeight * chatContainerHeight * 0.01,
                    child: LiveChatStream(
                      liveDetail: widget.liveDetail,
                      fontSize: chatFontSize,
                      verticalInterval: verticalInterval,
                    ),
                  ),
                ),
              // Live Info
              if (currentOverlay == OverlayType.main)
                LiveStreamInfo(liveDetail: widget.liveDetail),
              // Controls
              switch (currentOverlay) {
                OverlayType.none => const SizedBox.shrink(),
                // Main Controls
                OverlayType.main => LiveStreamMainControlOverlay(
                    controller: _chewieController!,
                    videoFocusNode: videoFocusNode,
                    liveDetail: widget.liveDetail,
                  ),
                // Chat Settings
                OverlayType.chatSettings => LiveStreamChatControlOverlay(
                    videoFocusNode: videoFocusNode,
                  ),
                // Popular Channles
                OverlayType.popular => LiveStreamPopularList(
                    controller: _chewieController!,
                    videoFocusNode: videoFocusNode,
                  ),
                // Following Channels
                OverlayType.following => LiveStreamFollowingList(
                    controller: _chewieController!,
                    videoFocusNode: videoFocusNode,
                  ),
                // Category Live Channels
                OverlayType.category => LiveStreamCategoryLiveList(
                    controller: _chewieController!,
                    videoFocusNode: videoFocusNode,
                    liveDetail: widget.liveDetail,
                  ),
              }
            ],
          )
        : Center(
            child: Text(msg),
          );
  }
}
