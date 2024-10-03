import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SingleVodPlayer extends StatelessWidget {
  const SingleVodPlayer({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      ),
    );
  }
}
