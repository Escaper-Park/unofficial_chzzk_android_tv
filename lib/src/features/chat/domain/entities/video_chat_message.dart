part of 'chat.dart';

abstract interface class VideoChatMessage {
  String get chatChannelId;

  String get content;

  Object? get extras;

  String get messageStatusType;

  int get messageTime;

  int get messageTypeCode;

  int get playerMessageTime;

  Object? get profile;

  String get userIdHash;
}

final class VideoChatReplayMessage implements VideoChatMessage {
  const VideoChatReplayMessage({
    required this.chatChannelId,
    required this.content,
    required this.extras,
    required this.messageStatusType,
    required this.messageTime,
    required this.messageTypeCode,
    required this.playerMessageTime,
    required this.profile,
    required this.userIdHash,
  });

  @override
  final String chatChannelId;

  @override
  final String content;

  @override
  final Object? extras;

  @override
  final String messageStatusType;

  @override
  final int messageTime;

  @override
  final int messageTypeCode;

  @override
  final int playerMessageTime;

  @override
  final Object? profile;

  @override
  final String userIdHash;
}
