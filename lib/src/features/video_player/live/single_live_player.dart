import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../common/widgets/center_widgets.dart';

class SingleLivePlayer extends StatefulWidget {
  const SingleLivePlayer({super.key, required this.controller});

  final VideoPlayerController controller;

  @override
  State<SingleLivePlayer> createState() => _SingleLivePlayerState();
}

class _SingleLivePlayerState extends State<SingleLivePlayer> {
  // Show current state.
  String msg = '라이브 로딩 중...';

  @override
  void initState() {
    super.initState();

    initialize();
  }

  Future<void> initialize() async {
    print('dispose init');
    widget.controller.addListener(_checkVideoEnds);
    widget.controller.initialize().then((_) => setState(() {}));

    widget.controller.play();
  }

  void _checkVideoEnds() {
    final value = widget.controller.value;

    // Sometimes this package detects the end of video as an error situation.
    final bool checkEnds = value.hasError == true || // Error
        // Ends
        (value.isInitialized &&
            (value.position >= value.duration) &&
            !value.isPlaying);

    if (checkEnds) {
      setState(() {
        msg = '방송이 종료되었습니다.';
      });
    }
  }

  @override
  void dispose() {
    widget.controller.pause(); // To avoid android errors.
    widget.controller.removeListener(_checkVideoEnds);
    widget.controller.dispose();

    print('dispose');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.controller.value.isInitialized
        ? Center(
            child: AspectRatio(
              aspectRatio: widget.controller.value.aspectRatio,
              child: VideoPlayer(widget.controller),
            ),
          )
        : CenteredText(text: msg);
  }
}
