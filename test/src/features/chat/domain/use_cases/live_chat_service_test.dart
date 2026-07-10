import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:stream_channel/stream_channel.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/entities/chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/use_cases/live_chat_message_parser.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/use_cases/live_chat_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  test('emits an error when live chat heartbeat times out', () async {
    final channel = _FakeWebSocketChannel();
    final service = LiveChatService(
      chatRepository: const _FakeChatRepository(),
      createWebSocketChannel: (_) => channel,
      idFactory: () => 'client-a',
      pingInterval: const Duration(milliseconds: 5),
      pongTimeout: const Duration(milliseconds: 5),
    );
    final connection = await service.connect(
      const LiveChatSessionRequest(
        channelId: 'channel-a',
        chatChannelId: 'chat-a',
      ),
    );
    final error = Completer<Object>();
    final done = Completer<void>();
    final subscription = connection.batches.listen(
      (_) {},
      onError: (Object value, StackTrace stackTrace) {
        if (!error.isCompleted) {
          error.complete(value);
        }
      },
      onDone: done.complete,
    );
    addTearDown(subscription.cancel);
    addTearDown(connection.dispose);

    expect(
      await error.future.timeout(const Duration(seconds: 1)),
      isA<StateError>(),
    );
    await done.future.timeout(const Duration(seconds: 1));
    expect(channel.fakeSink.closed, isTrue);
  });

  test('server frames clear pending live chat heartbeat timeout', () async {
    final channel = _FakeWebSocketChannel();
    final service = LiveChatService(
      chatRepository: const _FakeChatRepository(),
      createWebSocketChannel: (_) => channel,
      idFactory: () => 'client-a',
      pingInterval: const Duration(milliseconds: 20),
      pongTimeout: const Duration(milliseconds: 50),
    );
    final connection = await service.connect(
      const LiveChatSessionRequest(
        channelId: 'channel-a',
        chatChannelId: 'chat-a',
      ),
    );
    final errors = <Object>[];
    final subscription = connection.batches.listen(
      (_) {},
      onError: (Object value, StackTrace stackTrace) {
        errors.add(value);
      },
    );
    addTearDown(subscription.cancel);
    addTearDown(connection.dispose);

    await Future<void>.delayed(const Duration(milliseconds: 25));
    channel.addIncoming({
      'cmd': LiveChatMessageParser.pongCommand,
    });
    await Future<void>.delayed(const Duration(milliseconds: 35));

    expect(errors, isEmpty);
    expect(channel.fakeSink.closed, isFalse);
  });

  test('frequent inbound frames postpone ping without timer churn', () async {
    final channel = _FakeWebSocketChannel();
    final service = LiveChatService(
      chatRepository: const _FakeChatRepository(),
      createWebSocketChannel: (_) => channel,
      idFactory: () => 'client-a',
      pingInterval: const Duration(milliseconds: 30),
      pongTimeout: const Duration(milliseconds: 100),
    );
    final connection = await service.connect(
      const LiveChatSessionRequest(
        channelId: 'channel-a',
        chatChannelId: 'chat-a',
      ),
    );
    addTearDown(connection.dispose);

    int pingCount() => channel.fakeSink.sent.where((frame) {
      return frame is String && frame.contains('"cmd":0');
    }).length;

    for (var index = 0; index < 5; index += 1) {
      await Future<void>.delayed(const Duration(milliseconds: 10));
      channel.addIncoming({'cmd': LiveChatMessageParser.pongCommand});
    }
    await Future<void>.delayed(Duration.zero);
    expect(pingCount(), 0);

    await Future<void>.delayed(const Duration(milliseconds: 35));
    expect(pingCount(), 1);
    channel.addIncoming({'cmd': LiveChatMessageParser.pongCommand});
  });

  test('concurrent connection disposal shares one cleanup operation', () async {
    final channel = _FakeWebSocketChannel();
    final service = LiveChatService(
      chatRepository: const _FakeChatRepository(),
      createWebSocketChannel: (_) => channel,
      idFactory: () => 'client-a',
    );
    final connection = await service.connect(
      const LiveChatSessionRequest(
        channelId: 'channel-a',
        chatChannelId: 'chat-a',
      ),
    );

    final firstDispose = connection.dispose();
    final secondDispose = connection.dispose();

    expect(secondDispose, same(firstDispose));
    await firstDispose;
    expect(channel.fakeSink.closed, isTrue);
  });

  test('synchronous connect send failure closes for a late listener', () async {
    final channel = _FakeWebSocketChannel(throwOnAdd: true);
    final service = LiveChatService(
      chatRepository: const _FakeChatRepository(),
      createWebSocketChannel: (_) => channel,
      idFactory: () => 'client-a',
      disposeStepTimeout: const Duration(milliseconds: 50),
    );

    final connection = await service.connect(
      const LiveChatSessionRequest(
        channelId: 'channel-a',
        chatChannelId: 'chat-a',
      ),
    );
    await Future<void>.delayed(Duration.zero);

    await expectLater(
      connection.batches
          .handleError((Object _) {})
          .drain<void>()
          .timeout(const Duration(seconds: 1)),
      completes,
    );
    expect(channel.fakeSink.closed, isTrue);
  });

  test(
    'websocket done before batch subscription still closes connection',
    () async {
      final channel = _FakeWebSocketChannel();
      final service = LiveChatService(
        chatRepository: const _FakeChatRepository(),
        createWebSocketChannel: (_) => channel,
        idFactory: () => 'client-a',
        disposeStepTimeout: const Duration(milliseconds: 50),
      );
      final connection = await service.connect(
        const LiveChatSessionRequest(
          channelId: 'channel-a',
          chatChannelId: 'chat-a',
        ),
      );

      await channel.closeIncoming();
      await Future<void>.delayed(Duration.zero);

      await expectLater(
        connection.batches
            .handleError((Object _) {})
            .drain<void>()
            .timeout(const Duration(seconds: 1)),
        completes,
      );
      expect(channel.fakeSink.closed, isTrue);
    },
  );

  test(
    'socket disposal returns when closing the sink never completes',
    () async {
      final channel = _FakeWebSocketChannel(hangOnClose: true);
      final service = LiveChatService(
        chatRepository: const _FakeChatRepository(),
        createWebSocketChannel: (_) => channel,
        idFactory: () => 'client-a',
        disposeStepTimeout: const Duration(milliseconds: 5),
      );
      final connection = await service.connect(
        const LiveChatSessionRequest(
          channelId: 'channel-a',
          chatChannelId: 'chat-a',
        ),
      );

      await expectLater(
        connection.dispose().timeout(const Duration(seconds: 1)),
        completes,
      );
      expect(channel.fakeSink.closed, isTrue);
    },
  );

  test('string frames preserve decode order and command actions', () async {
    final channel = _FakeWebSocketChannel();
    final service = LiveChatService(
      chatRepository: const _FakeChatRepository(),
      createWebSocketChannel: (_) => channel,
      idFactory: () => 'client-a',
    );
    final connection = await service.connect(
      const LiveChatSessionRequest(
        channelId: 'channel-a',
        chatChannelId: 'chat-a',
      ),
    );
    addTearDown(connection.dispose);

    final batchesFuture = connection.batches.take(2).toList();
    channel
      ..addIncoming(
        jsonEncode(
          _realtimeFrame(
            content: 'first',
            extraFrameValue: List.filled(256 * 1024, 'x').join(),
          ),
        ),
      )
      ..addIncoming(jsonEncode(_realtimeFrame(content: 'second')));

    final batches = await batchesFuture.timeout(const Duration(seconds: 2));
    expect(
      batches
          .expand((batch) => batch.messages)
          .map((message) => message.content),
      <String>['first', 'second'],
    );
  });

  test('worker parses nested profile and extras before emitting', () async {
    final channel = _FakeWebSocketChannel();
    final service = LiveChatService(
      chatRepository: const _FakeChatRepository(),
      createWebSocketChannel: (_) => channel,
      idFactory: () => 'client-a',
    );
    final connection = await service.connect(
      const LiveChatSessionRequest(
        channelId: 'channel-a',
        chatChannelId: 'chat-a',
      ),
    );
    addTearDown(connection.dispose);

    final batchFuture = connection.batches.first;
    channel.addIncoming(
      jsonEncode(
        _realtimeFrame(
          content: 'nested',
          messageTypeCode: 10,
          profile: jsonEncode(<String, Object?>{
            'userIdHash': 'profile-user',
            'nickname': 'worker-user',
            'verifiedMark': true,
            'viewerBadges': <Object?>[
              <String, Object?>{
                'badge': <String, Object?>{
                  'imageUrl': 'https://example.com/viewer.png',
                },
              },
            ],
          }),
          extras: jsonEncode(<String, Object?>{
            'emojis': <String, String>{
              'smile': 'https://example.com/smile.png',
            },
            'isAnonymous': true,
            'payAmount': 10000,
          }),
        ),
      ),
    );

    final message = (await batchFuture.timeout(
      const Duration(seconds: 2),
    )).messages.single;
    expect(message.userIdHash, 'profile-user');
    expect(message.nickname, 'worker-user');
    expect(message.verifiedMark, isTrue);
    expect(message.userBadgeImageUrls, ['https://example.com/viewer.png']);
    expect(message.emojis, {
      'smile': 'https://example.com/smile.png',
    });
    expect(message.isAnonymous, isTrue);
    expect(message.payAmount, 10000);
  });

  test(
    'one connection worker survives malformed and repeated frames',
    () async {
      final channel = _FakeWebSocketChannel();
      final service = LiveChatService(
        chatRepository: const _FakeChatRepository(),
        createWebSocketChannel: (_) => channel,
        idFactory: () => 'client-a',
      );
      final connection = await service.connect(
        const LiveChatSessionRequest(
          channelId: 'channel-a',
          chatChannelId: 'chat-a',
        ),
      );
      addTearDown(connection.dispose);

      final batchesFuture = connection.batches.take(3).toList();
      channel.addIncoming('{malformed');
      for (var index = 0; index < 3; index += 1) {
        channel.addIncoming(
          jsonEncode(_realtimeFrame(content: 'message-$index')),
        );
        await Future<void>.delayed(Duration.zero);
      }

      final batches = await batchesFuture.timeout(const Duration(seconds: 2));
      expect(
        batches.map((batch) => batch.messages.single.content),
        <String>['message-0', 'message-1', 'message-2'],
      );
    },
  );

  test('decoded actions are applied on the main side in frame order', () async {
    final channel = _FakeWebSocketChannel();
    final service = LiveChatService(
      chatRepository: const _FakeChatRepository(),
      createWebSocketChannel: (_) => channel,
      idFactory: () => 'client-a',
    );
    final connection = await service.connect(
      const LiveChatSessionRequest(
        channelId: 'channel-a',
        chatChannelId: 'chat-a',
      ),
    );
    addTearDown(connection.dispose);

    final batchFuture = connection.batches.first;
    channel.addIncoming(
      jsonEncode(<Object?>[
        <String, Object?>{'cmd': LiveChatMessageParser.pingCommand},
        <String, Object?>{
          'cmd': LiveChatMessageParser.connectedCommand,
          'bdy': <String, Object?>{'sid': 'session-a'},
        },
        _realtimeFrame(content: 'after-control-frames'),
      ]),
    );
    await batchFuture.timeout(const Duration(seconds: 2));

    final sentCommands = channel.fakeSink.sent
        .whereType<String>()
        .map(jsonDecode)
        .whereType<Map<String, dynamic>>()
        .map((frame) => frame['cmd'])
        .toList();
    expect(sentCommands, <Object?>[
      LiveChatMessageParser.connectCommand,
      LiveChatMessageParser.pongCommand,
      LiveChatMessageParser.requestRecentCommand,
    ]);
  });

  test('disposal completes while a large worker decode is pending', () async {
    final channel = _FakeWebSocketChannel();
    final service = LiveChatService(
      chatRepository: const _FakeChatRepository(),
      createWebSocketChannel: (_) => channel,
      idFactory: () => 'client-a',
      disposeStepTimeout: const Duration(milliseconds: 50),
    );
    final connection = await service.connect(
      const LiveChatSessionRequest(
        channelId: 'channel-a',
        chatChannelId: 'chat-a',
      ),
    );

    channel.addIncoming(
      jsonEncode(<String, Object?>{
        'cmd': LiveChatMessageParser.liveChatCommand,
        'bdy': List<Object?>.generate(
          10000,
          (index) => <String, Object?>{
            'msgTime': index,
            'msgTypeCode': 1,
            'msg': 'pending-$index',
            'profile': '{"nickname":"worker"}',
            'extras': '{"emojis":{}}',
          },
        ),
      }),
    );
    await Future<void>.delayed(Duration.zero);

    await expectLater(
      connection.dispose().timeout(const Duration(seconds: 1)),
      completes,
    );
    expect(channel.fakeSink.closed, isTrue);
  });
}

Map<String, Object?> _realtimeFrame({
  required String content,
  int messageTypeCode = 1,
  Object? profile,
  Object? extras,
  Object? extraFrameValue,
}) {
  final message = <String, Object?>{
    'msgTime': 1718500000000,
    'msgTypeCode': messageTypeCode,
    'msg': content,
  };
  if (profile != null) {
    message['profile'] = profile;
  }
  if (extras != null) {
    message['extras'] = extras;
  }

  final frame = <String, Object?>{
    'cmd': LiveChatMessageParser.liveChatCommand,
    'bdy': <Object?>[message],
  };
  if (extraFrameValue != null) {
    frame['testPadding'] = extraFrameValue;
  }
  return frame;
}

final class _FakeChatRepository implements ChatRepository {
  const _FakeChatRepository();

  @override
  Future<ChatAccessToken> fetchAccessToken({
    required String channelId,
    String? chatType,
  }) async {
    return const _FakeChatAccessToken();
  }

  @override
  Future<VideoChatPage> fetchVideoChats({
    required int videoNo,
    required int playerMessageTime,
    int? previousVideoChatSize,
  }) async {
    return const VideoChatPage();
  }
}

final class _FakeChatAccessToken implements ChatAccessToken {
  const _FakeChatAccessToken();

  @override
  String get accessToken => 'access-token';

  @override
  String get extraToken => 'extra-token';
}

final class _FakeWebSocketChannel extends StreamChannelMixin<dynamic>
    implements WebSocketChannel {
  _FakeWebSocketChannel({bool hangOnClose = false, bool throwOnAdd = false})
    : fakeSink = _FakeWebSocketSink(
        hangOnClose: hangOnClose,
        throwOnAdd: throwOnAdd,
      );

  final StreamController<dynamic> _incoming = StreamController<dynamic>();
  final _FakeWebSocketSink fakeSink;

  @override
  Stream<dynamic> get stream => _incoming.stream;

  @override
  WebSocketSink get sink => fakeSink;

  @override
  Future<void> get ready => Future<void>.value();

  @override
  String? get protocol => null;

  @override
  int? get closeCode => null;

  @override
  String? get closeReason => null;

  void addIncoming(Object frame) {
    _incoming.add(frame);
  }

  Future<void> closeIncoming() => _incoming.close();
}

final class _FakeWebSocketSink implements WebSocketSink {
  _FakeWebSocketSink({
    required this.hangOnClose,
    required this.throwOnAdd,
  });

  final bool hangOnClose;
  final bool throwOnAdd;
  final List<Object?> sent = <Object?>[];
  final Completer<void> _done = Completer<void>();
  bool closed = false;

  @override
  Future<void> get done => _done.future;

  @override
  void add(Object? data) {
    if (throwOnAdd) {
      throw StateError('sink add failed');
    }
    if (!closed) {
      sent.add(data);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {}

  @override
  Future<void> addStream(Stream<dynamic> stream) async {
    await stream.forEach(add);
  }

  @override
  Future<void> close([int? closeCode, String? closeReason]) async {
    closed = true;
    if (hangOnClose) {
      await Completer<void>().future;
    }
    if (!_done.isCompleted) {
      _done.complete();
    }
  }
}
