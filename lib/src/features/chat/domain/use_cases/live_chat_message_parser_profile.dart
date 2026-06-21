part of 'live_chat_message_parser.dart';

final class _LiveChatProfile {
  const _LiveChatProfile({
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

  static _LiveChatProfile fromJson(Map<String, dynamic> json) {
    final seen = <String>{};
    final badgeImageUrls = <String>[];

    void addBadgeImageUrl(String? imageUrl) {
      if (imageUrl == null || imageUrl.isEmpty || !seen.add(imageUrl)) {
        return;
      }

      badgeImageUrls.add(imageUrl);
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

    return _LiveChatProfile(
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

  static Map<String, dynamic>? _readMap(Object? value) {
    return _asLiveChatStringKeyedMap(value);
  }

  static String? _readMapString(Map<String, dynamic>? json, String key) {
    final value = json?[key];
    return value is String ? value : null;
  }
}

final class _LiveChatExtras {
  const _LiveChatExtras({
    this.emojis = const <String, String>{},
    this.isAnonymous = false,
    this.payAmount,
  });

  final Map<String, String> emojis;
  final bool isAnonymous;
  final int? payAmount;
}
