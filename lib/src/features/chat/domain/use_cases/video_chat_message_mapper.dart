import 'dart:convert';

import '../entities/chat.dart';

PlayerChatMessagePage playerChatMessagePageFromVideoChatPage(
  VideoChatPage page,
) {
  return PlayerChatMessagePage(
    nextPlayerMessageTime: page.nextPlayerMessageTime,
    previousMessages: page.previousMessages
        .map(playerChatMessageFromVideoChatMessage)
        .toList(growable: false),
    messages: page.messages
        .map(playerChatMessageFromVideoChatMessage)
        .toList(growable: false),
  );
}

PlayerChatMessage playerChatMessageFromVideoChatMessage(
  VideoChatMessage message,
) {
  final profile = _VideoChatProfile.fromJsonLike(message.profile);
  final extras = _VideoChatExtras.fromJsonLike(message.extras);

  return PlayerChatMessage.fromVodPayload(
    messageTime: message.messageTime,
    playerMessageTime: message.playerMessageTime,
    messageTypeCode: message.messageTypeCode,
    content: message.content,
    messageStatusType: message.messageStatusType,
    userIdHash: message.userIdHash,
    profileUserIdHash: profile?.userIdHash,
    nickname: profile?.nickname,
    userRoleCode: profile?.userRoleCode,
    verifiedMark: profile?.verifiedMark ?? false,
    nicknameBadgeImageUrl: profile?.nicknameBadgeImageUrl,
    userBadgeImageUrls: profile?.userBadgeImageUrls ?? const <String>[],
    emojis: extras.emojis,
    isAnonymous: extras.isAnonymous,
    payAmount: extras.payAmount,
  );
}

final class _VideoChatProfile {
  const _VideoChatProfile({
    this.userIdHash,
    this.nickname,
    this.userRoleCode,
    this.verifiedMark = false,
    this.nicknameBadgeImageUrl,
    this.userBadgeImageUrls = const <String>[],
  });

  final String? userIdHash;
  final String? nickname;
  final String? userRoleCode;
  final bool verifiedMark;
  final String? nicknameBadgeImageUrl;
  final List<String> userBadgeImageUrls;

  static _VideoChatProfile? fromJsonLike(Object? value) {
    final json = _parseJsonLikeMap(value);
    if (json == null) {
      return null;
    }

    final seen = <String>{};
    final badgeImageUrls = <String>[];

    void addBadgeImageUrl(String? imageUrl) {
      final trimmed = imageUrl?.trim();
      if (trimmed == null || trimmed.isEmpty || !seen.add(trimmed)) {
        return;
      }

      badgeImageUrls.add(trimmed);
    }

    final streamingProperty = _readMap(json['streamingProperty']);
    final subscription = _readMap(streamingProperty?['subscription']);
    final subscriptionBadge = _readMap(subscription?['badge']);
    addBadgeImageUrl(_readMapString(subscriptionBadge, 'imageUrl'));

    final viewerBadges = json['viewerBadges'];
    if (viewerBadges is List) {
      for (final viewerBadge in viewerBadges) {
        final badge = _readMap(_readMap(viewerBadge)?['badge']);
        addBadgeImageUrl(_readMapString(badge, 'imageUrl'));
      }
    }

    return _VideoChatProfile(
      userIdHash: _readMapString(json, 'userIdHash'),
      nickname: _readMapString(json, 'nickname'),
      userRoleCode: _readMapString(json, 'userRoleCode'),
      verifiedMark: json['verifiedMark'] == true,
      nicknameBadgeImageUrl: _readMapString(
        _readMap(json['badge']),
        'imageUrl',
      ),
      userBadgeImageUrls: List.unmodifiable(badgeImageUrls),
    );
  }
}

final class _VideoChatExtras {
  const _VideoChatExtras({
    this.emojis = const <String, String>{},
    this.isAnonymous = false,
    this.payAmount,
  });

  final Map<String, String> emojis;
  final bool isAnonymous;
  final int? payAmount;

  static _VideoChatExtras fromJsonLike(Object? value) {
    final json = _parseJsonLikeMap(value);
    if (json == null) {
      return const _VideoChatExtras();
    }

    final rawEmojis = json['emojis'];
    final emojis = rawEmojis is Map
        ? rawEmojis.map((key, value) => MapEntry('$key', '$value'))
        : const <String, String>{};

    return _VideoChatExtras(
      emojis: emojis,
      isAnonymous: json['isAnonymous'] == true,
      payAmount: _readInt(json['payAmount']),
    );
  }
}

Map<String, dynamic>? _parseJsonLikeMap(Object? value) {
  if (value is String) {
    if (value.isEmpty) {
      return null;
    }

    try {
      return _readMap(jsonDecode(value));
    } on FormatException {
      return null;
    }
  }

  return _readMap(value);
}

Map<String, dynamic>? _readMap(Object? value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  if (value is Map) {
    return Map<String, dynamic>.from(value);
  }

  return null;
}

String? _readMapString(Map<String, dynamic>? json, String key) {
  final value = json?[key];
  return value is String ? value : null;
}

int? _readInt(Object? value) {
  return switch (value) {
    final int number => number,
    final num number => number.toInt(),
    final String text => int.tryParse(text),
    _ => null,
  };
}
