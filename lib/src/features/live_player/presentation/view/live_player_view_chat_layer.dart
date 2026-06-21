part of 'live_player_view.dart';

Widget? _livePlayerChatLayerFor({
  required LivePlayerState state,
  required LivePlayerSlotState slot,
  required bool playbackPaused,
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

  return LivePlayerChatLayer(
    channelId: liveChatRequest.channelId,
    chatChannelId: liveChatRequest.chatChannelId,
    presentationModeIndex: presentationModeIndex,
    chatSettings: livePlayerEffectiveChatSettings(state),
    playbackActive:
        slot.status == LivePlayerSlotStatus.playing &&
        slot.playbackUri != null &&
        !playbackPaused,
    connectLiveChat: connectLiveChat,
    disconnectImmediatelyWhenInactive: appPlaybackSuspended,
  );
}
