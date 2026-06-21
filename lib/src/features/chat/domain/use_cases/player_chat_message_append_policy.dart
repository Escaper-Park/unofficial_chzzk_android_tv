import '../entities/chat.dart';

final class PlayerChatEmojiRegistry {
  final _emojis = <String, String>{};

  void clear() {
    _emojis.clear();
  }

  List<PlayerChatMessage> resolveMessages(List<PlayerChatMessage> messages) {
    final resolved = <PlayerChatMessage>[];
    for (final message in messages) {
      if (message.emojis.isNotEmpty) {
        _emojis.addAll(message.emojis);
        resolved.add(message);
        continue;
      }

      if (!_containsEmojiToken(message.content)) {
        resolved.add(message);
        continue;
      }

      resolved.add(message.withEmojis(_emojis));
    }

    return resolved;
  }

  bool _containsEmojiToken(String content) {
    return content.contains('{:') && content.contains(':}');
  }
}

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
