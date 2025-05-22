import 'package:flutter/material.dart';

import '../../../../streaming/widgets/streaming_widgets.dart';
import '../../../../vod/model/vod.dart';
import '../../../../vod/widgets/vod_widgets.dart';

class VodStreamInfo extends StatelessWidget {
  const VodStreamInfo({super.key, required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    return StreamInfoContainer(
      streamInfoDetail: StreamInfoDetail(
        profileImageUrl: vod.channel!.channelImageUrl,
        isLive: false,
        channel: vod.channel!,
        videoTitle: vod.videoTitle,
        tagsWidget: VodTags(vod: vod),
        statusWidget: VodReadCountAndPublishDate(vod: vod),
      ),
    );
  }
}
