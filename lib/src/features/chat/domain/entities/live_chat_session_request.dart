part of 'chat.dart';

@immutable
final class LiveChatSessionRequest {
  const LiveChatSessionRequest({
    required this.channelId,
    required this.chatChannelId,
  });

  final String channelId;
  final String chatChannelId;

  static LiveChatSessionRequest? tryCreate({
    required String? channelId,
    required String? chatChannelId,
  }) {
    final trimmedChannelId = channelId?.trim();
    final trimmedChatChannelId = chatChannelId?.trim();
    if (trimmedChannelId == null ||
        trimmedChannelId.isEmpty ||
        trimmedChatChannelId == null ||
        trimmedChatChannelId.isEmpty) {
      return null;
    }

    return LiveChatSessionRequest(
      channelId: trimmedChannelId,
      chatChannelId: trimmedChatChannelId,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is LiveChatSessionRequest &&
            channelId == other.channelId &&
            chatChannelId == other.chatChannelId;
  }

  @override
  int get hashCode => Object.hash(channelId, chatChannelId);
}
