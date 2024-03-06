import 'package:flutter/material.dart';

import '../../utils/video_player/vod_network_video.dart';
import '../vod/model/vod.dart';

class VodStreamingScreen extends StatelessWidget {
  const VodStreamingScreen({
    super.key,
    required this.vodPath,
    required this.vod,
  });

  final String vodPath;
  final Vod vod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VodStreamingNetworkVideo(
        vodPath: vodPath,
        vod: vod,
      ),
    );
  }
}
