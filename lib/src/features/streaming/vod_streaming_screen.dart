import 'package:flutter/material.dart';

import '../video_player/vod/vod_player.dart';

class VodStreamingScreen extends StatelessWidget {
  const VodStreamingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VodPlayer(),
    );
  }
}
