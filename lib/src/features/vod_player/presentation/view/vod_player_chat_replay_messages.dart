import 'dart:math' as math;

import '../../../chat/domain/entities/chat.dart';
import '../../../chat/domain/use_cases/player_chat_message_append_policy.dart';

int vodChatReplayMessagePositionMs(PlayerChatMessage message) {
  return message.playerMessageTime ?? message.messageTime;
}

List<PlayerChatMessage> mergeVodChatReplayVisibleMessages({
  required List<PlayerChatMessage> currentMessages,
  required List<PlayerChatMessage> dueMessages,
}) {
  if (dueMessages.length >= playerChatMessageBufferSize) {
    return List.unmodifiable(
      dueMessages.sublist(dueMessages.length - playerChatMessageBufferSize),
    );
  }

  final removeFromCurrent = math.max(
    0,
    currentMessages.length + dueMessages.length - playerChatMessageBufferSize,
  );
  return List.unmodifiable(<PlayerChatMessage>[
    ...currentMessages.skip(removeFromCurrent),
    ...dueMessages,
  ]);
}

List<PlayerChatMessage> trimVodChatReplayVisibleMessages(
  List<PlayerChatMessage> messages,
) {
  if (messages.length <= playerChatMessageBufferSize) {
    return List.unmodifiable(messages);
  }

  return List.unmodifiable(
    messages.sublist(messages.length - playerChatMessageBufferSize),
  );
}

int lowerBoundVodChatReplayMessagesByPosition(
  List<PlayerChatMessage> messages,
  int targetMs,
) {
  var low = 0;
  var high = messages.length;
  while (low < high) {
    final mid = (low + high) >> 1;
    if (vodChatReplayMessagePositionMs(messages[mid]) < targetMs) {
      low = mid + 1;
    } else {
      high = mid;
    }
  }

  return low;
}

int upperBoundVodChatReplayMessagesByPosition(
  List<PlayerChatMessage> messages,
  int targetMs,
) {
  var low = 0;
  var high = messages.length;
  while (low < high) {
    final mid = (low + high) >> 1;
    if (vodChatReplayMessagePositionMs(messages[mid]) <= targetMs) {
      low = mid + 1;
    } else {
      high = mid;
    }
  }

  return low;
}
