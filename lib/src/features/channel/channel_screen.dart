import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'widgets/channel_data/channel_data_widgets.dart';
import './model/channel.dart';

class ChannelScreen extends HookWidget {
  const ChannelScreen({
    super.key,
    required this.channel,
    required this.channelListFSN,
    required this.channelDataFSN,
  });

  final Channel channel;

  /// List of channels such as search results or followings.
  final FocusScopeNode channelListFSN;
  final FocusScopeNode channelDataFSN;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    // FocusScopeNodes to move scroll position and change focus.
    // Create a list of nodes for dynamic use, depending on the user login state.
    final nodes = List.generate(4, (_) => useFocusScopeNode());

    // Add scroll position controller.
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        final offsets = [
          0.0,
          0.0,
          scrollController.position.maxScrollExtent,
          scrollController.position.maxScrollExtent
        ];

        for (int i = 0; i < nodes.length; i++) {
          final node = nodes[i];
          node.addListener(
            () {
              if (node.hasFocus) {
                scrollController.animateTo(
                  offsets[i],
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              }
            },
          );
        }
      },
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: FocusScope(
        node: channelDataFSN,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                // Header
                ChannelHeader(channel: channel),
                // Following Button
                ChannelFollowingButton(
                  channel: channel,
                  followingButtonFSN: nodes[0],
                  channelListFSN: channelListFSN,
                  belowFSN: nodes[1],
                ),
              ]),
              // Live
              if (channel.openLive == true)
                ChannelLiveContainer(
                  channel: channel,
                  channelLiveFSN: nodes[1],
                  channelListFSN: channelListFSN,
                  aboveFSN: nodes[0],
                  belowFSN: nodes[2],
                ),
              // Vod show more
              ChannelVodShowMoreButton(
                autofocus: channel.openLive == true ? false : true,
                channel: channel,
                showMoreButtonFSN:
                    channel.openLive == true ? nodes[2] : nodes[1],
                channelListFSN: channelListFSN,
                aboveFSN: channel.openLive == true ? nodes[1] : nodes[0],
                vodListFSN: nodes[3],
              ),
              ChannelVodList(
                channel: channel,
                vodListFSN: nodes[3],
                channelListFSN: channelListFSN,
                showMoreFSN: channel.openLive == true ? nodes[2] : nodes[1],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
