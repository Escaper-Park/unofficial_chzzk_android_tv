import 'package:flutter/material.dart';

import '../channel.dart';
import '../model/channel.dart';
import 'channel_videos.dart';

class ChannelDetail extends StatelessWidget {
  const ChannelDetail({super.key, required this.channel});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (channel.openLive) _channelLive(),
            const MenuHeaderText(text: '동영상'),
            const SizedBox(height: 12.0),
            SizedBox(
              height: 300.0,
              child: ChannelVideos(channel.channelId),
            ),
          ],
        ),
      ),
    );
  }

  Widget _channelLive() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MenuHeaderText(text: '생방송'),
        const SizedBox(height: 12.0),
        ChannelLive(channel.channelId),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
