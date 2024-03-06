import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/base_scaffold.dart';
import './widgets/channel_header.dart';
import './widgets/channel_live_container.dart';
import 'model/channel.dart';
import 'widgets/channel_vod_list.dart';

class ChannelScreen extends HookConsumerWidget {
  const ChannelScreen({super.key, required this.channel});

  final Channel channel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return Builder(
      builder: (BuildContext context) {
        final List<Widget> channelItems = [
          // Header
          ChannelHeader(channel: channel),
          // Live
          if (channel.openLive == true)
            ChannelLiveContainer(
              channelId: channel.channelId,
              focusNode: liveContainerFocusNode,
            ),
          // Vod
          ChannelVodList(
            channelId: channel.channelId,
            channelName: channel.channelName,
          ),
        ];

        return BaseScaffold(
          body: ListView.builder(
            controller: scrollController,
            itemCount: channelItems.length,
            itemBuilder: (context, index) {
              return channelItems[index];
            },
          ),
        );
      },
    );
  }
}
