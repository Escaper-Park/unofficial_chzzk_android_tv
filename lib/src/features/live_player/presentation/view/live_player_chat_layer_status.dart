part of 'live_player_chat_layer.dart';

enum _LivePlayerChatLayerStatus {
  data,
  loading,
  error,
}

String? _livePlayerChatLayerStatusText(
  _LivePlayerChatLayerStatus status,
  List<PlayerChatMessage> messages,
) {
  return switch (status) {
    _LivePlayerChatLayerStatus.data =>
      messages.isEmpty ? PlayerChatString.empty : null,
    _LivePlayerChatLayerStatus.loading => PlayerChatString.loading,
    _LivePlayerChatLayerStatus.error => PlayerChatString.failure,
  };
}
