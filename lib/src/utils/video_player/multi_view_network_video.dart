import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../common/widgets/center_text.dart';
import '../../features/live/model/live.dart';
import '../focus/dpad_widget.dart';
import './controller/network_video_controller.dart';
import './widgets/multi_view/multi_view_control_overlay.dart';
import './widgets/multi_view/multi_view_dynamic_screens.dart';
import './controller/multi_view_stream_controller.dart';

class MultiViewNetworkVideos extends StatefulHookConsumerWidget {
  const MultiViewNetworkVideos({
    super.key,
    required this.liveDetails,
    required this.initialVolumeSettings,
    required this.profileImageUrls,
  });

  final List<LiveDetail> liveDetails;
  final List<double> initialVolumeSettings;
  final List<String?> profileImageUrls;

  @override
  ConsumerState<MultiViewNetworkVideos> createState() =>
      _MultiViewNetworkVideosState();
}

class _MultiViewNetworkVideosState extends ConsumerState<MultiViewNetworkVideos>
    with WidgetsBindingObserver {
  List<VideoPlayerController> videoPlayerControllers = [];
  List<ChewieController>? _chewieControllers;

  int? bufferDelay = 1000;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    initialize();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    disposeAllVideoControllers();
    WakelockPlus.disable();
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
        ref.read(pauseTimerProvider.notifier).cancelTimer();
        WakelockPlus.disable();
        break;
      case AppLifecycleState.resumed:
        ref.read(multiViewStreamControllerProvider.notifier).restartMultiView(
              context: context,
              liveDetails: widget.liveDetails,
            );

        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  Future<void> initialize() async {
    // int index = 0;
    for (LiveDetail liveDetail in widget.liveDetails) {
      // final livePath720p =
      //     await HlsParser(liveDetail.livePath!).getMediaPlaylistUrls();

      videoPlayerControllers.add(
        VideoPlayerController.networkUrl(
          // widget.initialVolumeSettings[index] > 0.99
          //     ? Uri.parse(liveDetail.livePath!)
          //     : livePath720p![1]!,
          Uri.parse(liveDetail.livePath!),
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
        ),
      );
      // index += 1;
    }

    List<Future> initializeFutures = List.generate(
      widget.liveDetails.length,
      (index) => videoPlayerControllers[index].initialize(),
    );

    await Future.wait(initializeFutures);

    if (!await WakelockPlus.enabled) {
      await WakelockPlus.enable();
    }

    _createChewieControllers();

    if (context.mounted) {
      setState(() {});
    }
  }

  void disposeAllVideoControllers() {
    for (var controller in videoPlayerControllers) {
      controller.dispose();
    }
    for (var controller in _chewieControllers!) {
      controller.dispose();
    }
  }

  void _createChewieControllers() {
    _chewieControllers = List.generate(
      widget.liveDetails.length,
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
    final videoFocusNode = useFocusNode();
    final currentOverlay = ref.watch(overlayControllerProvider);

    bool allVideoControllsAreInitialized = videoPlayerControllers
        .every((controller) => controller.value.isInitialized == true);

    return _chewieControllers != null && allVideoControllsAreInitialized
        ? Stack(
            children: [
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
                  child: MultiViewDynamicScreens(
                    chewieControllers: _chewieControllers!,
                  ),
                ),
              ),
              if (currentOverlay == OverlayType.main)
                MultiViewControlOverlay(
                  controllers: _chewieControllers!,
                  videoFocusNode: videoFocusNode,
                  profileImageUrls: widget.profileImageUrls,
                ),
            ],
          )
        : const CenterText(text: '멀티뷰 로딩중...');
  }
}
