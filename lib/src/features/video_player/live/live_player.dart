import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../live/model/live_stream.dart';
import './controller/live_player_controller.dart';
import './live_controls_overlay.dart';
import './widgets/chat/live_chat_stream.dart';
import './multiview_screen.dart';

class LivePlayer extends ConsumerStatefulWidget {
  const LivePlayer({
    super.key,
    required this.liveStream,
  });

  /// List of live stream data [LiveDetail] and [Uri].
  final List<LiveStream> liveStream;

  @override
  ConsumerState<LivePlayer> createState() => _LivePlayerState();
}

class _LivePlayerState extends ConsumerState<LivePlayer>
    with WidgetsBindingObserver {
  List<VideoPlayerController> videoPlayerControllers = [];
  List<bool> allVideoEnds = [];

  @override
  void initState() {
    super.initState();

    initialize();
  }

  Future<void> initialize() async {
    WidgetsBinding.instance.addObserver(this);

    if (!await WakelockPlus.enabled) {
      await WakelockPlus.enable();
    }

    // Check all video ends
    final firstController = _addVideoPlayerController(0);
    videoPlayerControllers.add(firstController);

    if (context.mounted) setState(() {});
  }

  /// Add a new video player
  VideoPlayerController _addVideoPlayerController(int index) {
    final controller = VideoPlayerController.networkUrl(
      widget.liveStream[index].uris[0]!,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    allVideoEnds.add(false);

    controller.addListener(() {
      _checkVideoEnds(index);
    });

    return controller;
  }

  void _checkVideoEnds(int index) {
    final value = videoPlayerControllers[index].value;

    // Sometimes this package detects the end of video as an error situation.
    final bool checkEnds = value.hasError == true || // Error
        // Ends
        (value.isInitialized &&
            (value.position >= value.duration) &&
            !value.isPlaying);

    if (checkEnds) {
      allVideoEnds[index] = true;

      // TODO : REMOVE INDEX == 0
      // List<String> msg 전달?
      if (index == 0) {
        bool allEnds = allVideoEnds.every(
          (element) => element == true,
        );

        if (allEnds) {
          WakelockPlus.disable().then(
            (_) {
              print('allEnds disabled');
              WakelockPlus.enabled.then((value) => print(value));
            },
          );
        }
      }

      setState(() {});
    }
  }

  @override
  void didUpdateWidget(covariant LivePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // change screen mode to singleview
    if (oldWidget.liveStream.length != 1 && widget.liveStream.length == 1) {
      videoPlayerControllers = [videoPlayerControllers.first];

      setState(() {});
      return;
    }

    // Add a live with multiview mode
    if (oldWidget.liveStream.length < widget.liveStream.length) {
      videoPlayerControllers
          .add(_addVideoPlayerController(widget.liveStream.length - 1));

      setState(() {});
      return;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    WakelockPlus.disable().then(
      (_) {
        print('allEnds dispose ${WakelockPlus.enabled}');
      },
    );

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
        WakelockPlus.disable();
        break;
      // Pause -> Resume
      case AppLifecycleState.resumed:
        await WakelockPlus.enable();
        break;
      // System Ends
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenMode = ref.watch(livePlayerScreenModeControllerProvider);

    return videoPlayerControllers.isNotEmpty
        ? Stack(
            children: [
              Center(
                child: Row(children: [
                  Expanded(
                    flex: 3,
                    child: MultiviewScreen(
                      controllers: videoPlayerControllers,
                      liveDetail: widget.liveStream[0].liveDetail,
                    ),
                  ),
                  // TODO : Selected
                  if (screenMode == LivePlayerScreenMode.singleChat)
                    Expanded(
                      flex: 1,
                      child: LiveChatStream(
                        screenMode: screenMode,
                        liveDetail: widget.liveStream[0].liveDetail,
                      ),
                    ),
                ]),
              ),
              LiveControlsOverlay(
                liveStream: widget.liveStream,
                controllers: videoPlayerControllers,
              ),
              if (screenMode == LivePlayerScreenMode.singleOverlayChat)
                LiveChatStream(
                  screenMode: screenMode,
                  liveDetail: widget.liveStream[0].liveDetail,
                ),
            ],
          )
        : const SizedBox.shrink();
  }
}
