import 'package:flutter/material.dart';

import '../../../../utils/video_player/network_video.dart';

class SingleViewVideoLive extends StatelessWidget {
  const SingleViewVideoLive({
    super.key,
    required this.videoPath,
    required this.openDate,
    required this.channelId,
  });

  final String videoPath;
  final String openDate;
  final String channelId;

  @override
  Widget build(BuildContext context) {
    return NetworkVideo(
      videoPath: videoPath,
      isLive: true,
      openDate: openDate,
      channelId: channelId,
    );
  }
}
