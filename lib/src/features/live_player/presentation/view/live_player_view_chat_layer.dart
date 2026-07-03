part of 'live_player_view.dart';

Widget? _livePlayerChatLayerFor({
  required LivePlayerState state,
  required LivePlayerSlotState slot,
  required ValueListenable<bool> playbackPaused,
  required bool appPlaybackSuspended,
  required ConnectLiveChat connectLiveChat,
}) {
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

  return _LivePlayerChatLayerPlaybackBoundary(
    channelId: liveChatRequest.channelId,
    chatChannelId: liveChatRequest.chatChannelId,
    presentationModeIndex: presentationModeIndex,
    chatSettings: livePlayerEffectiveChatSettings(state),
    slotPlaying:
        slot.status == LivePlayerSlotStatus.playing && slot.playbackUri != null,
    playbackPaused: playbackPaused,
    appPlaybackSuspended: appPlaybackSuspended,
    connectLiveChat: connectLiveChat,
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
