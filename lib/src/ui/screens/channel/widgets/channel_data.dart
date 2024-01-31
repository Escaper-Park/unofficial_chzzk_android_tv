import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../model/channel/channel.dart';

import './channel_header.dart';
import './channel_live_container.dart';
import './channel_videos.dart';

class ChannelData extends HookWidget {
  const ChannelData({super.key, required this.channel});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final liveContainerFocusNode = useFocusNode();

    // show agian the top header info.
    useEffect(() {
      liveContainerFocusNode.addListener(() {
        if (liveContainerFocusNode.hasFocus) scrollController.jumpTo(0);
      });
      return () => scrollController.removeListener(
            () {},
          );
    }, [scrollController]);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 12.0,
      ),
      child: ListView(
        controller: scrollController,
        children: [
          ChannelHeader(channel: channel),
          const SizedBox(height: 10.0),
          if (channel.openLive == true)
            ChannelLiveContainer(
              channelId: channel.channelId,
              focusNode: liveContainerFocusNode,
            ),
          ChannelVideos(channelId: channel.channelId),
        ],
      ),
    );
  }
}
