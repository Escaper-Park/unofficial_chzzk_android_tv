import 'dart:async';

import 'package:flutter/widgets.dart';

import '../../../chat/domain/entities/chat.dart';
import '../../../chat/domain/use_cases/live_chat_message_buffer.dart';
import '../../../chat/domain/use_cases/live_chat_service.dart';
import '../../../chat/presentation/player_chat.dart';
import '../../../settings/domain/entities/chat_settings.dart';

part 'live_player_chat_layer_connection.dart';
part 'live_player_chat_layer_connection_helpers.dart';
part 'live_player_chat_layer_status.dart';
part 'live_player_chat_layer_timers.dart';

typedef ConnectLiveChat =
    Future<LiveChatConnection> Function(
      LiveChatSessionRequest request,
    );

class LivePlayerChatLayer extends StatefulWidget {
  const LivePlayerChatLayer({
    super.key,
    required this.channelId,
    required this.chatChannelId,
    required this.presentationModeIndex,
    required this.chatSettings,
    required this.playbackActive,
    required this.connectLiveChat,
    this.messageSnapshotInterval = Duration.zero,
    this.disconnectImmediatelyWhenInactive = false,
  });

  final String? channelId;
  final String? chatChannelId;
  final int presentationModeIndex;
  final ChatSettings chatSettings;
  final bool playbackActive;
  final ConnectLiveChat connectLiveChat;
  final Duration messageSnapshotInterval;
  final bool disconnectImmediatelyWhenInactive;

  @override
  State<LivePlayerChatLayer> createState() => _LivePlayerChatLayerState();
}

class _LivePlayerChatLayerState extends State<LivePlayerChatLayer>
    with _LivePlayerChatLayerConnection {
  @override
  void initState() {
    super.initState();
    _syncSession(notify: false);
  }

  @override
  void didUpdateWidget(covariant LivePlayerChatLayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    _syncSession(notify: true);
    if (oldWidget.messageSnapshotInterval != widget.messageSnapshotInterval) {
      _syncMessageSnapshotInterval();
    }
  }

  @override
  void dispose() {
    _chatLayerTimers.cancelAll();
    _messageSnapshotTimer?.cancel();
    _connectSerial += 1;
    unawaited(_disposeConnection());
    _chatSnapshot.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mode = PlayerChatPresentationMode.fromLiveSettingsIndex(
      widget.presentationModeIndex,
    );
    if (!_sessionActive || mode == PlayerChatPresentationMode.hidden) {
      return const SizedBox.shrink();
    }

    return ValueListenableBuilder<_LivePlayerChatLayerSnapshot>(
      valueListenable: _chatSnapshot,
      builder: (context, snapshot, _) {
        return PlayerChatLayerBody(
          key: ValueKey(
            'live-chat-layer-${widget.channelId}-${widget.chatChannelId}',
          ),
          mode: mode,
          chatSettings: widget.chatSettings,
          messages: snapshot.messages,
          statusText: _livePlayerChatLayerStatusText(
            snapshot.status,
            snapshot.messages,
          ),
        );
      },
    );
  }
}
