import 'package:flutter/material.dart';

import '../../../utils/network_video/network_video_vod.dart';

class VodScreen extends StatelessWidget {
  const VodScreen({super.key, required this.vodPath});

  final String vodPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NetworkVideoVod(vodPath: vodPath),
    );
  }
}
