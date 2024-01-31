import 'package:flutter/material.dart';

import '../../../utils/video_player/network_video.dart';

class SingleViewVodScreen extends StatelessWidget {
  const SingleViewVodScreen({super.key, required this.vodPath});

  final String vodPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NetworkVideo(
        videoPath: vodPath,
        isLive: false,
      ),
    );
  }
}
