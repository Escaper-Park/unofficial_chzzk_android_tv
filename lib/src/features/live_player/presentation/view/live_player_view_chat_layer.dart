part of 'live_player_view.dart';

bool _livePlayerHasChatLayer(LivePlayerState state) {
  return _livePlayerChatLayerInputSnapshotFor(state) != null;
}

final class _LivePlayerChatLayerSelector extends StatelessWidget {
  const _LivePlayerChatLayerSelector({
    required this.playbackPaused,
    required this.appPlaybackSuspended,
    required this.connectLiveChat,
  });

  final ValueListenable<bool> playbackPaused;
  final bool appPlaybackSuspended;
  final ConnectLiveChat connectLiveChat;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      LivePlayerBloc,
      LivePlayerState,
      _LivePlayerChatLayerInputSnapshot?
    >(
      selector: _livePlayerChatLayerInputSnapshotFor,
      builder: (context, snapshot) {
        if (snapshot == null) {
          return const SizedBox.shrink();
        }

        return _LivePlayerChatLayerPlaybackBoundary(
          channelId: snapshot.channelId,
          chatChannelId: snapshot.chatChannelId,
          presentationModeIndex: snapshot.presentationModeIndex,
          chatSettings: snapshot.chatSettings,
          slotPlaying: snapshot.slotPlaying,
          messageSnapshotInterval: snapshot.messageSnapshotInterval,
          playbackPaused: playbackPaused,
          appPlaybackSuspended: appPlaybackSuspended,
          connectLiveChat: connectLiveChat,
        );
      },
    );
  }
}

_LivePlayerChatLayerInputSnapshot? _livePlayerChatLayerInputSnapshotFor(
  LivePlayerState state,
) {
  final slot = state.activeSlot;
  final liveChatRequest = LiveChatSessionRequest.tryCreate(
    channelId: slot.channelId,
    chatChannelId: slot.chatChannelId,
  );
  if (liveChatRequest == null) {
    return null;
  }

  final presentationModeIndex = livePlayerEffectiveChatPresentationModeIndex(
    state,
  );
  if (presentationModeIndex == liveChatWindowHiddenIndex) {
    return null;
  }

  return _LivePlayerChatLayerInputSnapshot(
    channelId: liveChatRequest.channelId,
    chatChannelId: liveChatRequest.chatChannelId,
    presentationModeIndex: presentationModeIndex,
    chatSettings: livePlayerEffectiveChatSettings(state),
    slotPlaying:
        slot.status == LivePlayerSlotStatus.playing && slot.playbackUri != null,
    messageSnapshotInterval: _liveChatMessageSnapshotInterval,
  );
}

@immutable
final class _LivePlayerChatLayerInputSnapshot {
  const _LivePlayerChatLayerInputSnapshot({
    required this.channelId,
    required this.chatChannelId,
    required this.presentationModeIndex,
    required this.chatSettings,
    required this.slotPlaying,
    required this.messageSnapshotInterval,
  });

  final String channelId;
  final String chatChannelId;
  final int presentationModeIndex;
  final ChatSettings chatSettings;
  final bool slotPlaying;
  final Duration messageSnapshotInterval;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LivePlayerChatLayerInputSnapshot &&
            other.channelId == channelId &&
            other.chatChannelId == chatChannelId &&
            other.presentationModeIndex == presentationModeIndex &&
            other.chatSettings == chatSettings &&
            other.slotPlaying == slotPlaying &&
            other.messageSnapshotInterval == messageSnapshotInterval;
  }

  @override
  int get hashCode => Object.hash(
    channelId,
    chatChannelId,
    presentationModeIndex,
    chatSettings,
    slotPlaying,
    messageSnapshotInterval,
  );
}

final class _LivePlayerChatLayerPlaybackBoundary extends StatelessWidget {
  const _LivePlayerChatLayerPlaybackBoundary({
    required this.channelId,
    required this.chatChannelId,
    required this.presentationModeIndex,
    required this.chatSettings,
    required this.slotPlaying,
    required this.messageSnapshotInterval,
    required this.playbackPaused,
    required this.appPlaybackSuspended,
    required this.connectLiveChat,
  });

  final String channelId;
  final String chatChannelId;
  final int presentationModeIndex;
  final ChatSettings chatSettings;
  final bool slotPlaying;
  final Duration messageSnapshotInterval;
  final ValueListenable<bool> playbackPaused;
  final bool appPlaybackSuspended;
  final ConnectLiveChat connectLiveChat;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: playbackPaused,
      builder: (context, playbackPaused, _) {
        return LivePlayerChatLayer(
          channelId: channelId,
          chatChannelId: chatChannelId,
          presentationModeIndex: presentationModeIndex,
          chatSettings: chatSettings,
          playbackActive:
              slotPlaying && !playbackPaused && !appPlaybackSuspended,
          connectLiveChat: connectLiveChat,
          messageSnapshotInterval: messageSnapshotInterval,
          disconnectImmediatelyWhenInactive: appPlaybackSuspended,
        );
      },
    );
  }
}

// liveChatMessageSnapshotsFromBatches already publishes at a bounded 500 ms
// cadence. A second timer here only adds latency and allocation churn.
const _liveChatMessageSnapshotInterval = Duration.zero;
