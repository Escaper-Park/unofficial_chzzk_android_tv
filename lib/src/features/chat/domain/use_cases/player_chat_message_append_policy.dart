import '../entities/chat.dart';

final class PlayerChatEmojiRegistry {
  static const maxRegistrySize = 1024;

  final _emojis = <String, String>{};

  void clear() {
    _emojis.clear();
  }

  List<PlayerChatMessage> resolveMessages(List<PlayerChatMessage> messages) {
    final resolved = <PlayerChatMessage>[];
    for (final message in messages) {
      if (message.emojis.isNotEmpty) {
        _rememberEmojis(message.emojis);
      }

      if (!_containsEmojiToken(message.content)) {
        resolved.add(message);
        continue;
      }

      final emojis = _emojisForContent(message.content);
      if (emojis.isEmpty) {
        resolved.add(message);
        continue;
      }

      resolved.add(message.withEmojis(emojis));
    }

    return resolved;
  }

  bool _containsEmojiToken(String content) {
    return content.contains('{:') && content.contains(':}');
  }

  void _rememberEmojis(Map<String, String> emojis) {
    _emojis.addAll(emojis);
    final overflow = _emojis.length - maxRegistrySize;
    if (overflow <= 0) {
      return;
    }

    _emojis.keys
        .take(overflow)
        .toList(growable: false)
        .forEach(
          _emojis.remove,
        );
  }

  Map<String, String> _emojisForContent(String content) {
    final emojis = <String, String>{};
    for (final match in _emojiTokenPattern.allMatches(content)) {
      final key = match.group(1);
      if (key == null || emojis.containsKey(key)) {
        continue;
      }

      final imageUrl = _emojis[key];
      if (imageUrl != null && imageUrl.isNotEmpty) {
        emojis[key] = imageUrl;
      }
    }

    return emojis;
  }
}

final _emojiTokenPattern = RegExp(r'\{:([^}]+):\}');

const playerChatMessageBufferSize = 160;
const playerChatBadgeCollectorBufferSize = 80;
const playerChatAppendInterval = Duration(milliseconds: 200);
const playerChatAppendMediumInterval = Duration(milliseconds: 80);
const playerChatAppendFastInterval = Duration(milliseconds: 50);
const playerChatAppendBurstInterval = Duration(milliseconds: 50);

Duration playerChatAppendIntervalForPendingCount(int pendingMessageCount) {
  if (pendingMessageCount >= 80) {
    return playerChatAppendBurstInterval;
  }

  if (pendingMessageCount >= 24) {
    return playerChatAppendFastInterval;
  }

  if (pendingMessageCount >= 4) {
    return playerChatAppendMediumInterval;
  }

  return playerChatAppendInterval;
}

int playerChatAppendBatchSizeForPendingCount(int pendingMessageCount) {
  if (pendingMessageCount >= 80) {
    return 12;
  }

  if (pendingMessageCount >= 24) {
    return 6;
  }

  if (pendingMessageCount >= 8) {
    return 2;
  }

  return 1;
}
