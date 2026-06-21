import 'dart:async';

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
  final StreamController<dynamic> _incoming = StreamController<dynamic>();
  final _FakeWebSocketSink fakeSink = _FakeWebSocketSink();

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
}

final class _FakeWebSocketSink implements WebSocketSink {
  final List<Object?> sent = <Object?>[];
  final Completer<void> _done = Completer<void>();
  bool closed = false;

  @override
  Future<void> get done => _done.future;

  @override
  void add(Object? data) {
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
    if (!_done.isCompleted) {
      _done.complete();
    }
  }
}
