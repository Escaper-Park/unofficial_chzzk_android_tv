import 'package:flutter/material.dart';

import '../video_player/vod/vod_player.dart';
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
      body: VodPlayer(vodPath: vodPath, vod: vod),
    );
  }
}
