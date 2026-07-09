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
  });

  final String channelId;
  final String chatChannelId;
  final int presentationModeIndex;
  final ChatSettings chatSettings;
  final bool slotPlaying;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LivePlayerChatLayerInputSnapshot &&
            other.channelId == channelId &&
            other.chatChannelId == chatChannelId &&
            other.presentationModeIndex == presentationModeIndex &&
            other.chatSettings == chatSettings &&
            other.slotPlaying == slotPlaying;
  }

  @override
  int get hashCode => Object.hash(
    channelId,
    chatChannelId,
    presentationModeIndex,
    chatSettings,
    slotPlaying,
  );
}

final class _LivePlayerChatLayerPlaybackBoundary extends StatelessWidget {
  const _LivePlayerChatLayerPlaybackBoundary({
    required this.channelId,
    required this.chatChannelId,
    required this.presentationModeIndex,
    required this.chatSettings,
    required this.slotPlaying,
    required this.playbackPaused,
    required this.appPlaybackSuspended,
    required this.connectLiveChat,
  });

  final String channelId;
  final String chatChannelId;
  final int presentationModeIndex;
  final ChatSettings chatSettings;
  final bool slotPlaying;
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
          disconnectImmediatelyWhenInactive: appPlaybackSuspended,
        );
      },
    );
  }
}
