import 'dart:async';
import 'dart:collection';

import '../entities/chat.dart';
import 'live_chat_service.dart';
import 'player_chat_message_append_policy.dart';

Stream<List<PlayerChatMessage>> liveChatMessageSnapshotsFromBatches(
  Stream<LiveChatMessageBatch> batches,
) {
  late final StreamController<List<PlayerChatMessage>> output;
  var messages = <PlayerChatMessage>[];
  final seenIds = <String>{};
  final pendingMessages = Queue<PlayerChatMessage>();
  final emojiRegistry = PlayerChatEmojiRegistry();
  StreamSubscription<LiveChatMessageBatch>? subscription;
  Timer? appendTimer;
  Duration? appendTimerInterval;
  var sourceDone = false;

  void syncSeenIdsToRetainedMessages() {
    seenIds
      ..clear()
      ..addAll(messages.map((message) => message.id))
      ..addAll(pendingMessages.map((message) => message.id));
  }

  void trimMessageBuffer() {
    if (messages.length <= playerChatMessageBufferSize) {
      return;
    }

    final visibleMessages = messages.sublist(
      messages.length - playerChatMessageBufferSize,
    );
    final visibleIds = visibleMessages.map((message) => message.id).toSet();
    final retainedCollectorMessages = <PlayerChatMessage>[];
    for (final message in messages.reversed) {
      if (retainedCollectorMessages.length >=
          playerChatBadgeCollectorBufferSize) {
        break;
      }
      if (!message.isBadgeCollectorProfile || visibleIds.contains(message.id)) {
        continue;
      }

      retainedCollectorMessages.add(message);
    }

    messages = <PlayerChatMessage>[
      ...retainedCollectorMessages.reversed,
      ...visibleMessages,
    ];
    syncSeenIdsToRetainedMessages();
  }

  void emitMessages() {
    if (!output.isClosed) {
      output.add(List.unmodifiable(messages));
    }
  }

  void clearAppendTimer() {
    appendTimer?.cancel();
    appendTimer = null;
    appendTimerInterval = null;
  }

  void releaseBuffers() {
    messages = <PlayerChatMessage>[];
    seenIds.clear();
    pendingMessages.clear();
    emojiRegistry.clear();
  }

  void closeIfDone() {
    if (sourceDone && pendingMessages.isEmpty && appendTimer == null) {
      releaseBuffers();
      unawaited(output.close());
    }
  }

  late final void Function() appendNextMessage;

  void scheduleNextMessage() {
    if (output.isClosed || pendingMessages.isEmpty) {
      closeIfDone();
      return;
    }

    final interval = playerChatAppendIntervalForPendingCount(
      pendingMessages.length,
    );
    if (appendTimer != null) {
      if ((appendTimerInterval ?? playerChatAppendInterval) <= interval) {
        return;
      }

      clearAppendTimer();
    }

    appendTimerInterval = interval;
    appendTimer = Timer(interval, () {
      appendTimer = null;
      appendTimerInterval = null;
      appendNextMessage();
      scheduleNextMessage();
    });
  }

  appendNextMessage = () {
    if (output.isClosed || pendingMessages.isEmpty) {
      closeIfDone();
      return;
    }

    final appendCount = playerChatAppendBatchSizeForPendingCount(
      pendingMessages.length,
    );
    for (
      var index = 0;
      index < appendCount && pendingMessages.isNotEmpty;
      index += 1
    ) {
      messages.add(pendingMessages.removeFirst());
    }
    trimMessageBuffer();
    emitMessages();
  };

  void addRealtimeMessages(List<PlayerChatMessage> nextMessages) {
    for (final message in emojiRegistry.resolveMessages(nextMessages)) {
      if (seenIds.add(message.id)) {
        pendingMessages.add(message);
      }
    }

    while (pendingMessages.length > playerChatPendingMessageBufferSize) {
      seenIds.remove(pendingMessages.removeFirst().id);
    }

    scheduleNextMessage();
  }

  void replaceMessages(List<PlayerChatMessage> nextMessages) {
    clearAppendTimer();
    emojiRegistry.clear();
    pendingMessages.clear();
    messages = <PlayerChatMessage>[];
    seenIds.clear();
    for (final message in emojiRegistry.resolveMessages(nextMessages)) {
      if (seenIds.add(message.id)) {
        messages.add(message);
      }
    }
    trimMessageBuffer();
    emitMessages();
  }

  output = StreamController<List<PlayerChatMessage>>(
    onListen: () {
      subscription = batches.listen(
        (batch) {
          if (batch.replaceExisting) {
            replaceMessages(batch.messages);
            return;
          }

          addRealtimeMessages(batch.messages);
        },
        onError: output.addError,
        onDone: () {
          sourceDone = true;
          closeIfDone();
        },
      );
    },
    onCancel: () async {
      clearAppendTimer();
      releaseBuffers();
      final activeSubscription = subscription;
      subscription = null;
      await activeSubscription?.cancel();
    },
  );

  return output.stream;
}
