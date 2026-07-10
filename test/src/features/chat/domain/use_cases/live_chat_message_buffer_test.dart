import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/entities/chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/use_cases/live_chat_message_buffer.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/use_cases/live_chat_service.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/use_cases/player_chat_message_append_policy.dart';

void main() {
  test('replaces recent messages and appends realtime messages', () async {
    final source = StreamController<LiveChatMessageBatch>();
    final snapshots = <List<PlayerChatMessage>>[];
    final subscription = liveChatMessageSnapshotsFromBatches(
      source.stream,
    ).listen(snapshots.add);
    addTearDown(() async {
      await source.close();
      await subscription.cancel();
    });

    source.add(
      LiveChatMessageBatch(
        messages: [
          _message('one', time: 1),
          _message('two', time: 2),
        ],
        replaceExisting: true,
      ),
    );
    await pumpEventQueue();

    expect(
      snapshots.single.map((message) => message.content),
      ['one', 'two'],
    );

    source.add(
      LiveChatMessageBatch(
        messages: [_message('three', time: 3)],
        replaceExisting: false,
      ),
    );
    await Future<void>.delayed(const Duration(milliseconds: 520));

    expect(
      snapshots.last.map((message) => message.content),
      ['one', 'two', 'three'],
    );
    expect(
      snapshots.first.map((message) => message.content),
      ['one', 'two'],
    );
  });

  test('emoji registry attaches only emojis used by each message', () {
    final registry = PlayerChatEmojiRegistry();

    final seeded = registry.resolveMessages([
      _message(
        '{:one:}',
        time: 1,
        emojis: const {
          'one': 'https://example.com/one.png',
          'two': 'https://example.com/two.png',
        },
      ),
    ]);
    final resolved = registry.resolveMessages([
      _message('{:one:} {:missing:}', time: 2),
    ]);

    expect(seeded.single.emojis, {
      'one': 'https://example.com/one.png',
    });
    expect(resolved.single.emojis, {
      'one': 'https://example.com/one.png',
    });
  });

  test('emoji registry evicts older entries beyond its limit', () {
    final registry = PlayerChatEmojiRegistry();
    const newestIndex = PlayerChatEmojiRegistry.maxRegistrySize + 1;

    registry.resolveMessages([
      for (var index = 0; index <= newestIndex; index += 1)
        _message(
          'seed-$index',
          time: index + 1,
          emojis: {
            'emoji-$index': 'https://example.com/$index.png',
          },
        ),
    ]);

    final resolved = registry.resolveMessages([
      _message('{:emoji-0:} {:emoji-$newestIndex:}', time: newestIndex + 2),
    ]);

    expect(resolved.single.emojis, {
      'emoji-$newestIndex': 'https://example.com/$newestIndex.png',
    });
  });

  test('bounds a realtime burst before paced rendering catches up', () async {
    final source = StreamController<LiveChatMessageBatch>();
    final firstSnapshot = liveChatMessageSnapshotsFromBatches(
      source.stream,
    ).first;
    addTearDown(source.close);

    source.add(
      LiveChatMessageBatch(
        messages: [
          for (
            var index = 0;
            index <= playerChatPendingMessageBufferSize;
            index += 1
          )
            _message('message-$index', time: index),
        ],
        replaceExisting: false,
      ),
    );

    final snapshot = await firstSnapshot.timeout(const Duration(seconds: 1));

    expect(snapshot, isNotEmpty);
    expect(snapshot.first.content, 'message-1');
  });

  test('keeps burst rendering cadence bounded while draining in batches', () {
    expect(
      playerChatAppendIntervalForPendingCount(1000),
      playerChatAppendInterval,
    );
    expect(playerChatAppendBatchSizeForPendingCount(1000), 64);
  });

  test('emits burst snapshots no faster than twice per second', () async {
    final source = StreamController<LiveChatMessageBatch>();
    final snapshots = <List<PlayerChatMessage>>[];
    final subscription = liveChatMessageSnapshotsFromBatches(
      source.stream,
    ).listen(snapshots.add);
    addTearDown(() async {
      await subscription.cancel();
      await source.close();
    });

    source.add(
      LiveChatMessageBatch(
        messages: [
          for (var index = 0; index < 100; index += 1)
            _message('burst-$index', time: index),
        ],
        replaceExisting: false,
      ),
    );
    await Future<void>.delayed(const Duration(milliseconds: 400));
    expect(snapshots, isEmpty);

    await Future<void>.delayed(const Duration(milliseconds: 150));
    expect(snapshots, hasLength(1));
    expect(snapshots.single, hasLength(64));

    await Future<void>.delayed(const Duration(milliseconds: 500));
    expect(snapshots.last, hasLength(100));
    expect(snapshots.last.last.content, 'burst-99');
  });

  test('preserves burst order while removing duplicate messages', () async {
    final source = StreamController<LiveChatMessageBatch>();
    final firstSnapshot = liveChatMessageSnapshotsFromBatches(
      source.stream,
    ).first;
    addTearDown(source.close);
    final messages = [
      for (var index = 0; index < 30; index += 1)
        _message('ordered-$index', time: index),
    ];

    source.add(
      LiveChatMessageBatch(
        messages: [
          ...messages,
          messages[5],
          messages[0],
        ],
        replaceExisting: false,
      ),
    );

    final snapshot = await firstSnapshot.timeout(const Duration(seconds: 1));

    expect(
      snapshot.map((message) => message.content),
      [for (var index = 0; index < 30; index += 1) 'ordered-$index'],
    );
    expect(snapshot.map((message) => message.id).toSet(), hasLength(30));
  });
}

PlayerChatMessage _message(
  String content, {
  required int time,
  Map<String, String> emojis = const <String, String>{},
}) {
  return PlayerChatMessage.fromLivePayload(
    messageTime: time,
    messageTypeCode: 1,
    content: content,
    userIdHash: 'user-$content',
    emojis: emojis,
  );
}
