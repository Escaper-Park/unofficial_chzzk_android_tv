import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../vod/model/vod.dart';

class VodStreamMainControls extends StatelessWidget {
  const VodStreamMainControls({
    super.key,
    required this.controller,
    required this.videoFocusNode,
    required this.vod,
  });

  final VideoPlayerController controller;
  final FocusNode videoFocusNode;
  final Vod vod;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
