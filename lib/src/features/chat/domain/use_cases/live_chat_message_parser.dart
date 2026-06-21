import 'dart:convert';

import '../entities/chat.dart';

part 'live_chat_message_parser_profile.dart';
part 'live_chat_message_parser_readers.dart';
part 'live_chat_message_parser_values.dart';

abstract final class LiveChatMessageParser {
  static const connectCommand = 100;
  static const connectedCommand = 10100;
  static const requestRecentCommand = 5101;
  static const recentMessagesCommand = 15101;
  static const pingCommand = 0;
  static const pongCommand = 10000;
  static const liveChatCommand = 93101;
  static const donationChatCommand = 93102;

  static String? parseSessionId(Map<String, dynamic> frame) {
    final body = _asStringKeyedMap(frame['bdy']);
    final sid = body?['sid'];
    return sid is String && sid.isNotEmpty ? sid : null;
  }

  static List<PlayerChatMessage> parseRecentMessages(
    Map<String, dynamic> frame,
  ) {
    final messages = <PlayerChatMessage>[];
    for (final messageJson in _recentMessageMaps(frame['bdy'])) {
      final message = _parseRecentMessage(messageJson);
      if (message != null) {
        messages.add(message);
      }
    }

    return _chronological(messages, newestFirst: true);
  }

  static List<PlayerChatMessage> parseRealtimeMessages(
    Map<String, dynamic> frame,
  ) {
    final body = frame['bdy'];
    if (body is! List) {
      return const <PlayerChatMessage>[];
    }

    final messages = <PlayerChatMessage>[];
    for (final entry in body) {
      final json = _asStringKeyedMap(entry);
      if (json == null) {
        continue;
      }

      final message = _parseRealtimeMessage(json);
      if (message != null) {
        messages.add(message);
      }
    }

    return messages;
  }

  static Iterable<Map<String, dynamic>> _recentMessageMaps(Object? body) sync* {
    final bodyMap = _asStringKeyedMap(body);
    if (bodyMap != null) {
      final messageList = bodyMap['messageList'];
      if (messageList is List) {
        for (final entry in messageList) {
          final json = _asStringKeyedMap(entry);
          if (json != null) {
            yield json;
          }
        }
      }
      return;
    }

    if (body is! List) {
      return;
    }

    for (final bodyEntry in body) {
      final entryMap = _asStringKeyedMap(bodyEntry);
      final messageList = entryMap?['messageList'];
      if (messageList is! List) {
        continue;
      }

      for (final messageEntry in messageList) {
        final json = _asStringKeyedMap(messageEntry);
        if (json != null) {
          yield json;
        }
      }
    }
  }

  static PlayerChatMessage? _parseRecentMessage(Map<String, dynamic> json) {
    return _parseMessage(
      messageTime: json['messageTime'],
      messageTypeCode: json['messageTypeCode'],
      content: json['content'],
      profile: json['profile'],
      extras: json['extras'],
      messageStatusType: json['messageStatusType'],
      userIdHash: json['userId'] ?? json['userIdHash'],
    );
  }

  static PlayerChatMessage? _parseRealtimeMessage(Map<String, dynamic> json) {
    return _parseMessage(
      messageTime: json['msgTime'] ?? json['messageTime'],
      messageTypeCode: json['msgTypeCode'] ?? json['messageTypeCode'],
      content: json['msg'] ?? json['content'],
      profile: json['profile'],
      extras: json['extras'],
      messageStatusType: json['msgStatusType'] ?? json['messageStatusType'],
      userIdHash: json['uid'] ?? json['userIdHash'],
    );
  }

  static PlayerChatMessage? _parseMessage({
    required Object? messageTime,
    required Object? messageTypeCode,
    required Object? content,
    required Object? profile,
    required Object? extras,
    required Object? messageStatusType,
    required Object? userIdHash,
  }) {
    final resolvedMessageTime = _readInt(messageTime);
    final resolvedMessageTypeCode = _readInt(messageTypeCode);
    final resolvedContent = _readString(content);
    if (resolvedMessageTime == null ||
        resolvedMessageTypeCode == null ||
        resolvedContent == null) {
      return null;
    }

    final resolvedProfile = _parseProfile(profile);
    final resolvedExtras = _parseExtras(extras);

    return PlayerChatMessage.fromLivePayload(
      messageTime: resolvedMessageTime,
      messageTypeCode: resolvedMessageTypeCode,
      content: resolvedContent,
      messageStatusType: _readString(messageStatusType),
      userIdHash: _readString(userIdHash),
      profileUserIdHash: resolvedProfile?.userIdHash,
      nickname: resolvedProfile?.nickname,
      userRoleCode: resolvedProfile?.userRoleCode,
      verifiedMark: resolvedProfile?.verifiedMark ?? false,
      nicknameBadgeImageUrl: resolvedProfile?.nicknameBadgeImageUrl,
      userBadgeImageUrls:
          resolvedProfile?.userBadgeImageUrls ?? const <String>[],
      emojis: resolvedExtras.emojis,
      isAnonymous: resolvedExtras.isAnonymous,
      payAmount: resolvedExtras.payAmount,
    );
  }

  static _LiveChatProfile? _parseProfile(Object? value) {
    final json = _parseLiveChatJsonLikeMap(value);
    if (json == null) {
      return null;
    }

    return _LiveChatProfile.fromJson(json);
  }

  static _LiveChatExtras _parseExtras(Object? value) {
    final json = _parseLiveChatJsonLikeMap(value);
    if (json == null) {
      return const _LiveChatExtras();
    }

    final rawEmojis = json['emojis'];
    final emojis = rawEmojis is Map
        ? rawEmojis.map((key, value) => MapEntry('$key', '$value'))
        : const <String, String>{};

    return _LiveChatExtras(
      emojis: emojis,
      isAnonymous: json['isAnonymous'] == true,
      payAmount: _readInt(json['payAmount']),
    );
  }

  static Map<String, dynamic>? _asStringKeyedMap(Object? value) {
    return _asLiveChatStringKeyedMap(value);
  }
}
