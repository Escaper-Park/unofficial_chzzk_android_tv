import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/enums.dart' show ChatWindowMode;
import '../../chat/widgets/chat_stream.dart';
import '../../live/model/live_detail.dart';
import '../../settings/model/chat_settings.dart';
import '../live_stream_event.dart';
import '../live_stream_state.dart';

class LiveChatStream extends ConsumerStatefulWidget {
  const LiveChatStream({
    super.key,
    required this.chatWindowMode,
    required this.liveDetail,
  });

  final ChatWindowMode chatWindowMode;
  final LiveDetail liveDetail;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LiveChatStreamState();
}

class _LiveChatStreamState extends ConsumerState<LiveChatStream>
    with LiveStreamEvent, LiveStreamState, WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.inactive:
        // disconnect Chat
        await disconnectChat(
          ref,
          channelId: widget.liveDetail.channel.channelId,
          chatChannelId: widget.liveDetail.chatChannelId,
        );
        break;
      case AppLifecycleState.hidden:
        // disconnect Chat
        await disconnectChat(
          ref,
          channelId: widget.liveDetail.channel.channelId,
          chatChannelId: widget.liveDetail.chatChannelId,
        );
        break;
      case AppLifecycleState.paused:
        // disconnect Chat
        await disconnectChat(
          ref,
          channelId: widget.liveDetail.channel.channelId,
          chatChannelId: widget.liveDetail.chatChannelId,
        );
        break;
      // Pause -> Resume
      case AppLifecycleState.resumed:
        await reconnectChat(
          ref,
          channelId: widget.liveDetail.channel.channelId,
          chatChannelId: widget.liveDetail.chatChannelId,
        );
        break;
      // System Ends
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatStream = getChatStream(
      ref,
      channelId: widget.liveDetail.channel.channelId,
      chatChannelId: widget.liveDetail.chatChannelId,
    );

    ChatSettings chatSettings = getChatSettings(ref);

    return ChatStream(
      chatStream: chatStream,
      chatWindowMode: widget.chatWindowMode,
      chatSettings: chatSettings,
    );
  }
}
