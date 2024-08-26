import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/widgets/center_widgets.dart';
import '../../../../chat/controller/chat_controller.dart';
import '../../../../chat/widgets/badge_collector.dart';
import '../../../../chat/widgets/chat_list.dart';
import '../../../../live/model/live.dart';
import '../../../../setting/controller/chat_settings_controller.dart';
import '../../../../setting/model/chat_settings.dart';
import '../../controller/live_player_controller.dart';

class LiveChatStream extends ConsumerStatefulWidget {
  const LiveChatStream({
    super.key,
    required this.screenMode,
    required this.liveDetail,
  });

  final LivePlayerScreenMode screenMode;
  final LiveDetail liveDetail;

  @override
  ConsumerState<LiveChatStream> createState() => _LiveChatStreamState();
}

class _LiveChatStreamState extends ConsumerState<LiveChatStream>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    // add observer for detecting App Life cycle
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    print('dispose chatstream');
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        break;
      // Pause
      case AppLifecycleState.paused:
        // disconnect Chat
        await ref
            .read(chatControllerProvider(
              channelId: widget.liveDetail.channel.channelId,
              chatChannelId: widget.liveDetail.chatChannelId,
            ).notifier)
            .disconnect();
        break;
      // Pause -> Resume
      case AppLifecycleState.resumed:
        ref.invalidate(chatControllerProvider);
        break;
      // System Ends
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatStream = ref.watch(chatControllerProvider(
      channelId: widget.liveDetail.channel.channelId,
      chatChannelId: widget.liveDetail.chatChannelId,
    ));

    ChatSettings chatSettings = ref.watch(chatSettingsControllerProvider);

    if (widget.screenMode == LivePlayerScreenMode.singleChat) {
      chatSettings = chatSettings.copyWith(
        entireChatContainerTransparency: 100,
        singleChatContainerTransparency: 100,
      );
    }

    // For Positioned
    final screenSize = MediaQuery.of(context).size;
    final overlayChatContainerWidth =
        screenSize.width * chatSettings.chatContainerWidth * 0.01;
    final overlayChatContainerHeight =
        screenSize.height * chatSettings.chatContainerHeight * 0.01;

    final overlayChatContainerPositionX =
        (screenSize.width - overlayChatContainerWidth) *
            chatSettings.chatPositionX *
            0.01;
    final overlayChatContainerPositionY =
        (screenSize.height - overlayChatContainerHeight) *
            chatSettings.chatPositionY *
            0.01;

    return widget.screenMode == LivePlayerScreenMode.singleChat
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: _chatStream(chatStream, chatSettings),
          )
        : Positioned(
            width: overlayChatContainerWidth,
            height: overlayChatContainerHeight,
            left: overlayChatContainerPositionX,
            top: overlayChatContainerPositionY,
            child: _chatStream(chatStream, chatSettings),
          );
  }

  Widget _chatStream(
    AsyncValue<List<dynamic>> chatStream,
    ChatSettings chatSettings,
  ) {
    return chatStream.when(
      data: (chatList) {
        final badgesChatList = chatList.where((chat) {
          return (chat.profile?.userRoleCode != "common_user") ||
              (chat.profile?.verifiedMark == true);
        }).toList();

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Normal chat
            if (chatSettings.badgeCollectorHeight != 100)
              Expanded(
                flex: 100 - chatSettings.badgeCollectorHeight,
                child: ChatList(
                  chatList: chatList,
                  chatSettings: chatSettings,
                ),
              ),
            if (chatSettings.useBadgeCollector == 1 &&
                widget.screenMode == LivePlayerScreenMode.singleChat)
              const Divider(),
            if (chatSettings.useBadgeCollector == 1)
              // Badge Collector
              Expanded(
                flex: chatSettings.badgeCollectorHeight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: BadgeCollector(
                    chatList: badgesChatList,
                    chatSettings: chatSettings,
                  ),
                ),
              ),
          ],
        );
      },
      error: (_, __) => const CenteredText(text: '채팅을 불러올 수 없습니다'),
      loading: () => const SizedBox.shrink(),
    );
  }
}
