part of 'chat.dart';

enum PlayerChatMessageSource {
  live,
  vod,
}

final class PlayerChatMessage {
  const PlayerChatMessage({
    required this.source,
    required this.id,
    required this.messageTime,
    required this.messageTypeCode,
    required this.content,
    this.playerMessageTime,
    this.messageStatusType,
    this.userIdHash,
    this.nickname,
    this.userRoleCode,
    this.verifiedMark = false,
    this.nicknameBadgeImageUrl,
    this.userBadgeImageUrls = const <String>[],
    this.emojis = const <String, String>{},
    this.isAnonymous = false,
    this.payAmount,
  });

  factory PlayerChatMessage.fromLivePayload({
    required int messageTime,
    required int messageTypeCode,
    required String content,
    String? messageStatusType,
    String? userIdHash,
    String? profileUserIdHash,
    String? nickname,
    String? userRoleCode,
    bool verifiedMark = false,
    String? nicknameBadgeImageUrl,
    List<String> userBadgeImageUrls = const <String>[],
    Map<String, String> emojis = const <String, String>{},
    bool isAnonymous = false,
    int? payAmount,
  }) {
    final resolvedUserIdHash = _nonEmpty(profileUserIdHash) ?? userIdHash;

    return PlayerChatMessage(
      source: PlayerChatMessageSource.live,
      id: _chatMessageId(
        source: PlayerChatMessageSource.live,
        messageTime: messageTime,
        messageTypeCode: messageTypeCode,
        content: content,
        userIdHash: resolvedUserIdHash,
      ),
      messageTime: messageTime,
      messageTypeCode: messageTypeCode,
      content: content,
      messageStatusType: _nonEmpty(messageStatusType),
      userIdHash: _nonEmpty(resolvedUserIdHash),
      nickname: _nonEmpty(nickname),
      userRoleCode: _nonEmpty(userRoleCode),
      verifiedMark: verifiedMark,
      nicknameBadgeImageUrl: _nonEmpty(nicknameBadgeImageUrl),
      userBadgeImageUrls: List.unmodifiable(userBadgeImageUrls),
      emojis: Map.unmodifiable(emojis),
      isAnonymous: isAnonymous,
      payAmount: payAmount,
    );
  }

  factory PlayerChatMessage.fromVodPayload({
    required int messageTime,
    required int playerMessageTime,
    required int messageTypeCode,
    required String content,
    String? messageStatusType,
    String? userIdHash,
    String? profileUserIdHash,
    String? nickname,
    String? userRoleCode,
    bool verifiedMark = false,
    String? nicknameBadgeImageUrl,
    List<String> userBadgeImageUrls = const <String>[],
    Map<String, String> emojis = const <String, String>{},
    bool isAnonymous = false,
    int? payAmount,
  }) {
    final resolvedUserIdHash = _nonEmpty(profileUserIdHash) ?? userIdHash;

    return PlayerChatMessage(
      source: PlayerChatMessageSource.vod,
      id: _chatMessageId(
        source: PlayerChatMessageSource.vod,
        messageTime: messageTime,
        messageTypeCode: messageTypeCode,
        content: content,
        userIdHash: resolvedUserIdHash,
        playerMessageTime: playerMessageTime,
      ),
      messageTime: messageTime,
      playerMessageTime: playerMessageTime,
      messageTypeCode: messageTypeCode,
      content: content,
      messageStatusType: _nonEmpty(messageStatusType),
      userIdHash: _nonEmpty(resolvedUserIdHash),
      nickname: _nonEmpty(nickname),
      userRoleCode: _nonEmpty(userRoleCode),
      verifiedMark: verifiedMark,
      nicknameBadgeImageUrl: _nonEmpty(nicknameBadgeImageUrl),
      userBadgeImageUrls: List.unmodifiable(userBadgeImageUrls),
      emojis: Map.unmodifiable(emojis),
      isAnonymous: isAnonymous,
      payAmount: payAmount,
    );
  }

  final String id;
  final PlayerChatMessageSource source;
  final int messageTime;
  final int? playerMessageTime;
  final int messageTypeCode;
  final String content;
  final String? messageStatusType;
  final String? userIdHash;
  final String? nickname;
  final String? userRoleCode;
  final bool verifiedMark;
  final String? nicknameBadgeImageUrl;
  final List<String> userBadgeImageUrls;
  final Map<String, String> emojis;
  final bool isAnonymous;
  final int? payAmount;

  bool get isBlind => messageStatusType == 'BLIND';

  bool get isDonation => messageTypeCode == 10 || (payAmount ?? 0) > 0;

  bool get isBadgeCollectorProfile {
    if (verifiedMark) {
      return true;
    }

    final roleCode = userRoleCode?.trim().toLowerCase();
    return roleCode != null && _badgeCollectorRoleCodes.contains(roleCode);
  }

  PlayerChatMessage withEmojis(Map<String, String> emojis) {
    return PlayerChatMessage(
      source: source,
      id: id,
      messageTime: messageTime,
      playerMessageTime: playerMessageTime,
      messageTypeCode: messageTypeCode,
      content: content,
      messageStatusType: messageStatusType,
      userIdHash: userIdHash,
      nickname: nickname,
      userRoleCode: userRoleCode,
      verifiedMark: verifiedMark,
      nicknameBadgeImageUrl: nicknameBadgeImageUrl,
      userBadgeImageUrls: userBadgeImageUrls,
      emojis: Map.unmodifiable(emojis),
      isAnonymous: isAnonymous,
      payAmount: payAmount,
    );
  }
}

final class PlayerChatMessagePage {
  const PlayerChatMessagePage({
    this.nextPlayerMessageTime,
    this.previousMessages = const <PlayerChatMessage>[],
    this.messages = const <PlayerChatMessage>[],
  });

  final int? nextPlayerMessageTime;
  final List<PlayerChatMessage> previousMessages;
  final List<PlayerChatMessage> messages;
}

String _chatMessageId({
  required PlayerChatMessageSource source,
  required int messageTime,
  required int messageTypeCode,
  required String content,
  required String? userIdHash,
  int? playerMessageTime,
}) {
  return [
    source.name,
    playerMessageTime ?? '',
    userIdHash ?? '',
    messageTime,
    messageTypeCode,
    content,
  ].join('|');
}

String? _nonEmpty(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  return trimmed;
}

const _badgeCollectorRoleCodes = <String>{
  'streamer',
  'manager',
  'streaming_channel_manager',
  'streaming_chat_manager',
};
