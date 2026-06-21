import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/entities/chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/use_cases/live_chat_message_buffer.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/use_cases/live_chat_service.dart';

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
    await Future<void>.delayed(const Duration(milliseconds: 220));

    expect(
      snapshots.last.map((message) => message.content),
      ['one', 'two', 'three'],
    );
    expect(
      snapshots.first.map((message) => message.content),
      ['one', 'two'],
    );
  });
}

PlayerChatMessage _message(String content, {required int time}) {
  return PlayerChatMessage.fromLivePayload(
    messageTime: time,
    messageTypeCode: 1,
    content: content,
    userIdHash: 'user-$content',
  );
}
