import 'package:flutter/material.dart';

import '../single_view.dart';

class SingleViewScreen extends StatelessWidget {
  const SingleViewScreen({super.key, required this.videoPath});

  final String videoPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NetworkVideoLive(videoPath: videoPath),
    );
  }
}
