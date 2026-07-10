import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/entities/chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/use_cases/live_chat_service.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/player_chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_chat_layer.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/chat_settings.dart';

void main() {
  testWidgets('does not connect when chatChannelId is missing', (tester) async {
    var connectCount = 0;

    await tester.pumpWidget(
      _Harness(
        child: LivePlayerChatLayer(
          channelId: 'channel-a',
          chatChannelId: null,
          presentationModeIndex: 1,
          chatSettings: const ChatSettings(),
          playbackActive: true,
          connectLiveChat: (request) {
            connectCount += 1;
            throw StateError('should not connect');
          },
        ),
      ),
    );
    await tester.pump();

    expect(connectCount, 0);
    expect(find.text(PlayerChatString.loading), findsNothing);
  });

  testWidgets('connects with live source and applies chat settings', (
    tester,
  ) async {
    final connection = _FakeLiveChatConnection();
    addTearDown(connection.dispose);
    LiveChatSessionRequest? requested;

    await tester.pumpWidget(
      _Harness(
        child: LivePlayerChatLayer(
          channelId: 'channel-a',
          chatChannelId: 'chat-a',
          presentationModeIndex: 1,
          chatSettings: const ChatSettings(chatMessageFontSize: 18),
          playbackActive: true,
          connectLiveChat: (request) async {
            requested = request;
            return connection;
          },
        ),
      ),
    );
    await tester.pump();

    expect(requested?.channelId, 'channel-a');
    expect(requested?.chatChannelId, 'chat-a');
    expect(find.text(PlayerChatString.loading), findsNothing);
    expect(find.text(PlayerChatString.empty), findsOneWidget);

    connection.add(
      LiveChatMessageBatch(
        messages: [
          PlayerChatMessage.fromLivePayload(
            messageTime: 1718500000000,
            messageTypeCode: 1,
            content: '안녕하세요',
            userIdHash: 'user-a',
            nickname: '테스터',
          ),
        ],
        replaceExisting: true,
      ),
    );
    await tester.pump();
    await tester.pump();

    final messageFinder = find.byWidgetPredicate(
      (widget) => widget is Text && _plainText(widget) == '안녕하세요',
    );
    expect(messageFinder, findsOneWidget);

    final text = tester.widget<Text>(messageFinder);
    expect(text.style?.fontFamily, 'KCC-Hanbit');
    expect(text.style?.fontSize, 18);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.idle();
    expect(connection.disposed, isTrue);
  });

  testWidgets(
    'keeps live chat session when only presentation settings change',
    (
      tester,
    ) async {
      final connection = _FakeLiveChatConnection();
      addTearDown(connection.dispose);
      var connectCount = 0;

      Widget buildLayer({
        required int presentationModeIndex,
        required ChatSettings chatSettings,
      }) {
        return _Harness(
          child: LivePlayerChatLayer(
            channelId: 'channel-a',
            chatChannelId: 'chat-a',
            presentationModeIndex: presentationModeIndex,
            chatSettings: chatSettings,
            playbackActive: true,
            connectLiveChat: (_) async {
              connectCount += 1;
              return connection;
            },
          ),
        );
      }

      await tester.pumpWidget(
        buildLayer(
          presentationModeIndex: 1,
          chatSettings: const ChatSettings(chatMessageFontSize: 18),
        ),
      );
      await tester.pump();

      connection.add(
        LiveChatMessageBatch(
          messages: [
            PlayerChatMessage.fromLivePayload(
              messageTime: 1718500000000,
              messageTypeCode: 1,
              content: '유지되는 채팅',
              userIdHash: 'user-a',
              nickname: '테스터',
            ),
          ],
          replaceExisting: true,
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(connectCount, 1);
      expect(connection.disposed, isFalse);
      expect(find.textContaining('유지되는 채팅'), findsOneWidget);

      await tester.pumpWidget(
        buildLayer(
          presentationModeIndex: 2,
          chatSettings: const ChatSettings(chatMessageFontSize: 20),
        ),
      );
      await tester.pump();

      expect(connectCount, 1);
      expect(connection.disposed, isFalse);
      expect(find.textContaining('유지되는 채팅'), findsOneWidget);
    },
  );

  testWidgets('retries once after a failed live chat connection', (
    tester,
  ) async {
    final connection = _FakeLiveChatConnection();
    addTearDown(connection.dispose);
    var connectCount = 0;

    await tester.pumpWidget(
      _Harness(
        child: LivePlayerChatLayer(
          channelId: 'channel-a',
          chatChannelId: 'chat-a',
          presentationModeIndex: 1,
          chatSettings: const ChatSettings(),
          playbackActive: true,
          connectLiveChat: (_) async {
            connectCount += 1;
            if (connectCount == 1) {
              throw StateError('temporary failure');
            }

            return connection;
          },
        ),
      ),
    );
    await tester.pump();

    expect(connectCount, 1);
    expect(find.text(PlayerChatString.loading), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 699));
    expect(connectCount, 1);

    await tester.pump(const Duration(milliseconds: 1));
    await tester.pump();

    expect(connectCount, 2);
    expect(find.text(PlayerChatString.loading), findsNothing);
    expect(find.text(PlayerChatString.empty), findsOneWidget);
  });

  testWidgets('keeps chat connected during the inactive grace period', (
    tester,
  ) async {
    final connection = _FakeLiveChatConnection();
    addTearDown(connection.dispose);

    Widget buildLayer({required bool playbackActive}) {
      return _Harness(
        child: LivePlayerChatLayer(
          channelId: 'channel-a',
          chatChannelId: 'chat-a',
          presentationModeIndex: 1,
          chatSettings: const ChatSettings(),
          playbackActive: playbackActive,
          connectLiveChat: (_) async => connection,
        ),
      );
    }

    await tester.pumpWidget(buildLayer(playbackActive: true));
    await tester.pump();

    expect(connection.disposed, isFalse);
    expect(find.text(PlayerChatString.empty), findsOneWidget);

    await tester.pumpWidget(buildLayer(playbackActive: false));
    await tester.pump();
    await tester.pump(const Duration(seconds: 7, milliseconds: 999));

    expect(connection.disposed, isFalse);
    expect(find.text(PlayerChatString.empty), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1));
    await tester.idle();

    expect(connection.disposed, isTrue);
    expect(find.text(PlayerChatString.empty), findsNothing);
    expect(find.text(PlayerChatString.loading), findsNothing);
  });

  testWidgets('disconnects immediately when inactive is forced', (
    tester,
  ) async {
    final connection = _FakeLiveChatConnection();
    addTearDown(connection.dispose);

    Widget buildLayer({
      required bool playbackActive,
      required bool disconnectImmediatelyWhenInactive,
    }) {
      return _Harness(
        child: LivePlayerChatLayer(
          channelId: 'channel-a',
          chatChannelId: 'chat-a',
          presentationModeIndex: 1,
          chatSettings: const ChatSettings(),
          playbackActive: playbackActive,
          connectLiveChat: (_) async => connection,
          disconnectImmediatelyWhenInactive: disconnectImmediatelyWhenInactive,
        ),
      );
    }

    await tester.pumpWidget(
      buildLayer(
        playbackActive: true,
        disconnectImmediatelyWhenInactive: false,
      ),
    );
    await tester.pump();

    expect(connection.disposed, isFalse);
    expect(find.text(PlayerChatString.loading), findsNothing);
    expect(find.text(PlayerChatString.empty), findsOneWidget);

    await tester.pumpWidget(
      buildLayer(
        playbackActive: false,
        disconnectImmediatelyWhenInactive: true,
      ),
    );
    await tester.pump();
    await tester.idle();

    expect(connection.disposed, isTrue);
    expect(find.text(PlayerChatString.loading), findsNothing);
  });

  testWidgets('browse throttling keeps chat visible and reuses its session', (
    tester,
  ) async {
    final connection = _FakeLiveChatConnection();
    addTearDown(connection.dispose);
    var connectCount = 0;

    Widget buildLayer({required Duration messageSnapshotInterval}) {
      return _Harness(
        child: LivePlayerChatLayer(
          channelId: 'channel-a',
          chatChannelId: 'chat-a',
          presentationModeIndex: 1,
          chatSettings: const ChatSettings(),
          playbackActive: true,
          messageSnapshotInterval: messageSnapshotInterval,
          connectLiveChat: (_) async {
            connectCount += 1;
            return connection;
          },
        ),
      );
    }

    await tester.pumpWidget(
      buildLayer(messageSnapshotInterval: Duration.zero),
    );
    await tester.pump();

    expect(connectCount, 1);
    expect(connection.disposed, isFalse);

    connection.add(
      LiveChatMessageBatch(
        messages: [_liveMessage(id: 'first', content: 'first message')],
        replaceExisting: true,
      ),
    );
    await tester.pump();
    await tester.pump();
    expect(find.text('first message'), findsOneWidget);

    await tester.pumpWidget(
      buildLayer(
        messageSnapshotInterval: const Duration(milliseconds: 500),
      ),
    );
    await tester.pump();

    expect(connectCount, 1);
    expect(connection.disposed, isFalse);
    expect(find.text('first message'), findsOneWidget);

    connection.add(
      LiveChatMessageBatch(
        messages: [_liveMessage(id: 'second', content: 'second message')],
        replaceExisting: true,
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    connection.add(
      LiveChatMessageBatch(
        messages: [_liveMessage(id: 'latest', content: 'latest message')],
        replaceExisting: true,
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 399));

    expect(find.text('first message'), findsOneWidget);
    expect(find.text('second message'), findsNothing);
    expect(find.text('latest message'), findsNothing);

    await tester.pump(const Duration(milliseconds: 1));
    expect(find.text('first message'), findsNothing);
    expect(find.text('second message'), findsNothing);
    expect(find.text('latest message'), findsOneWidget);
    expect(connectCount, 1);
    expect(connection.disposed, isFalse);

    connection.add(
      LiveChatMessageBatch(
        messages: [_liveMessage(id: 'flush', content: 'flush message')],
        replaceExisting: true,
      ),
    );
    await tester.pump();
    await tester.pumpWidget(
      buildLayer(messageSnapshotInterval: Duration.zero),
    );
    await tester.pump();

    expect(find.text('latest message'), findsNothing);
    expect(find.text('flush message'), findsOneWidget);
    expect(connectCount, 1);
    expect(connection.disposed, isFalse);

    await tester.pumpWidget(
      buildLayer(
        messageSnapshotInterval: const Duration(milliseconds: 500),
      ),
    );
    connection.add(
      LiveChatMessageBatch(
        messages: [_liveMessage(id: 'pending', content: 'pending message')],
        replaceExisting: true,
      ),
    );
    await tester.pump();
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 500));
    await tester.idle();
    expect(connection.disposed, isTrue);
  });

  testWidgets(
    'browse rebuild keeps one chat session and continues publishing messages',
    (tester) async {
      final connection = _FakeLiveChatConnection();
      addTearDown(connection.dispose);
      final layerKey = GlobalKey();
      var connectCount = 0;

      Widget buildLayer({required bool browseOpen}) {
        return _Harness(
          child: Stack(
            children: [
              TickerMode(
                enabled: !browseOpen,
                child: LivePlayerChatLayer(
                  key: layerKey,
                  channelId: 'channel-a',
                  chatChannelId: 'chat-a',
                  presentationModeIndex: 1,
                  chatSettings: const ChatSettings(),
                  playbackActive: true,
                  messageSnapshotInterval: const Duration(milliseconds: 500),
                  connectLiveChat: (_) async {
                    connectCount += 1;
                    return connection;
                  },
                ),
              ),
              if (browseOpen) const Text('browse overlay'),
            ],
          ),
        );
      }

      await tester.pumpWidget(buildLayer(browseOpen: false));
      await tester.pump();
      final stateBeforeBrowse = layerKey.currentState;
      connection.add(
        LiveChatMessageBatch(
          messages: [_liveMessage(id: 'before', content: 'before browse')],
          replaceExisting: true,
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.text('before browse'), findsOneWidget);

      await tester.pumpWidget(buildLayer(browseOpen: true));
      await tester.pump();
      expect(layerKey.currentState, same(stateBeforeBrowse));
      expect(connectCount, 1);
      expect(connection.disposed, isFalse);

      connection.add(
        LiveChatMessageBatch(
          messages: [_liveMessage(id: 'during', content: 'during browse')],
          replaceExisting: true,
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('before browse'), findsNothing);
      expect(find.text('during browse'), findsOneWidget);
      expect(connectCount, 1);
      expect(connection.disposed, isFalse);
    },
  );

  testWidgets('waits for previous live chat cleanup before reconnecting', (
    tester,
  ) async {
    final firstDispose = Completer<void>();
    final firstConnection = _FakeLiveChatConnection(
      disposeCompleter: firstDispose,
    );
    final secondConnection = _FakeLiveChatConnection();
    addTearDown(() {
      if (!firstDispose.isCompleted) {
        firstDispose.complete();
      }
    });
    addTearDown(firstConnection.dispose);
    addTearDown(secondConnection.dispose);
    final requests = <LiveChatSessionRequest>[];

    Widget buildLayer(String chatChannelId) {
      return _Harness(
        child: LivePlayerChatLayer(
          channelId: 'channel-a',
          chatChannelId: chatChannelId,
          presentationModeIndex: 1,
          chatSettings: const ChatSettings(),
          playbackActive: true,
          connectLiveChat: (request) async {
            requests.add(request);
            return requests.length == 1 ? firstConnection : secondConnection;
          },
        ),
      );
    }

    await tester.pumpWidget(buildLayer('chat-a'));
    await tester.pump();

    expect(requests.map((request) => request.chatChannelId), ['chat-a']);

    await tester.pumpWidget(buildLayer('chat-b'));
    await tester.pump();
    await tester.idle();

    expect(firstConnection.disposed, isTrue);
    expect(requests.map((request) => request.chatChannelId), ['chat-a']);

    firstDispose.complete();
    await tester.idle();
    await tester.pump();

    expect(requests.map((request) => request.chatChannelId), [
      'chat-a',
      'chat-b',
    ]);
  });

  testWidgets('reconnects when previous live chat cleanup never completes', (
    tester,
  ) async {
    final blockedDispose = Completer<void>();
    final firstConnection = _FakeLiveChatConnection(
      disposeCompleter: blockedDispose,
    );
    final secondConnection = _FakeLiveChatConnection();
    addTearDown(() {
      if (!blockedDispose.isCompleted) {
        blockedDispose.complete();
      }
    });
    addTearDown(firstConnection.dispose);
    addTearDown(secondConnection.dispose);
    var connectCount = 0;

    Widget buildLayer(String chatChannelId) {
      return _Harness(
        child: LivePlayerChatLayer(
          channelId: 'channel-a',
          chatChannelId: chatChannelId,
          presentationModeIndex: 1,
          chatSettings: const ChatSettings(),
          playbackActive: true,
          connectLiveChat: (_) async {
            connectCount += 1;
            return connectCount == 1 ? firstConnection : secondConnection;
          },
        ),
      );
    }

    await tester.pumpWidget(buildLayer('chat-a'));
    await tester.pump();
    await tester.pumpWidget(buildLayer('chat-b'));
    await tester.pump();

    expect(connectCount, 1);
    await tester.pump(const Duration(seconds: 3));
    await tester.pump();

    expect(connectCount, 2);
  });
}

class _Harness extends StatelessWidget {
  const _Harness({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 960,
          height: 540,
          child: child,
        ),
      ),
    );
  }
}

final class _FakeLiveChatConnection implements LiveChatConnection {
  _FakeLiveChatConnection({
    this.disposeCompleter,
  });

  final StreamController<LiveChatMessageBatch> _controller =
      StreamController<LiveChatMessageBatch>.broadcast();
  final Completer<void>? disposeCompleter;
  bool disposed = false;

  @override
  Stream<LiveChatMessageBatch> get batches => _controller.stream;

  void add(LiveChatMessageBatch batch) {
    _controller.add(batch);
  }

  @override
  Future<void> dispose() async {
    if (disposed) {
      return;
    }

    disposed = true;
    final completer = disposeCompleter;
    if (completer != null) {
      await completer.future;
    }

    await _controller.close();
  }
}

String? _plainText(Text widget) {
  return widget.data ?? widget.textSpan?.toPlainText();
}

PlayerChatMessage _liveMessage({required String id, required String content}) {
  return PlayerChatMessage.fromLivePayload(
    messageTime: 1718500000000,
    messageTypeCode: 1,
    content: content,
    userIdHash: id,
    nickname: id,
  );
}
