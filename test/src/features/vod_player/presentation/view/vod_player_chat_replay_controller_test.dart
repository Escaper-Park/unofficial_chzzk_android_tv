import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/entities/chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/player_chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/view/vod_player_chat_replay_controller.dart';

void main() {
  test('replays only messages due at the current VOD position', () async {
    final requests = <({int playerMessageTime, int? previousVideoChatSize})>[];
    final controller = VodPlayerChatReplayController(
      videoNo: 123,
      isChatEnabled: true,
      chatChannelId: 'chat-a',
      initialPresentationMode: PlayerChatPresentationMode.overlay,
      fetchPage:
          ({
            required videoNo,
            required playerMessageTime,
            previousVideoChatSize,
          }) async {
            expect(videoNo, 123);
            requests.add((
              playerMessageTime: playerMessageTime,
              previousVideoChatSize: previousVideoChatSize,
            ));
            return VideoChatPage(
              messages: [
                _message('one', playerMessageTime: 1000),
                _message('two', playerMessageTime: 2000),
              ],
            );
          },
    );
    addTearDown(controller.dispose);

    await controller.syncToPosition(const Duration(milliseconds: 1500));

    expect(requests.single.playerMessageTime, 1500);
    expect(requests.single.previousVideoChatSize, 50);
    expect(
      controller.state.messages.map((message) => message.content),
      ['one'],
    );

    await controller.seekCommitted(
      const Duration(milliseconds: 2500),
      previousPosition: const Duration(milliseconds: 1500),
    );

    expect(
      controller.state.messages.map((message) => message.content),
      ['one', 'two'],
    );
  });

  test('does not fetch when VOD chat is unavailable', () async {
    var fetchCount = 0;
    final controller = VodPlayerChatReplayController(
      videoNo: 123,
      isChatEnabled: false,
      chatChannelId: null,
      initialPresentationMode: PlayerChatPresentationMode.overlay,
      fetchPage:
          ({
            required videoNo,
            required playerMessageTime,
            previousVideoChatSize,
          }) async {
            fetchCount += 1;
            return const VideoChatPage();
          },
    );
    addTearDown(controller.dispose);

    await controller.syncToPosition(const Duration(seconds: 1));

    expect(fetchCount, 0);
    expect(controller.state.phase, VodPlayerChatReplayPhase.unavailable);
  });

  test('does not notify identical ready state for empty chat pages', () async {
    final phases = <VodPlayerChatReplayPhase>[];
    final controller = VodPlayerChatReplayController(
      videoNo: 123,
      isChatEnabled: true,
      chatChannelId: 'chat-a',
      initialPresentationMode: PlayerChatPresentationMode.overlay,
      fetchPage:
          ({
            required videoNo,
            required playerMessageTime,
            previousVideoChatSize,
          }) async {
            return const VideoChatPage();
          },
    );
    addTearDown(controller.dispose);
    controller.addListener(() {
      phases.add(controller.state.phase);
    });

    await controller.syncToPosition(const Duration(seconds: 1));

    expect(phases, [
      VodPlayerChatReplayPhase.loading,
      VodPlayerChatReplayPhase.ready,
    ]);
  });

  test('replays pending sync after in-flight fetch completes', () async {
    final requests = <({int playerMessageTime, int? previousVideoChatSize})>[];
    final firstFetch = Completer<VideoChatPage>();
    final controller = VodPlayerChatReplayController(
      videoNo: 123,
      isChatEnabled: true,
      chatChannelId: 'chat-a',
      initialPresentationMode: PlayerChatPresentationMode.overlay,
      fetchPage:
          ({
            required videoNo,
            required playerMessageTime,
            previousVideoChatSize,
          }) async {
            requests.add((
              playerMessageTime: playerMessageTime,
              previousVideoChatSize: previousVideoChatSize,
            ));
            if (requests.length == 1) {
              return firstFetch.future;
            }

            return VideoChatPage(
              messages: [
                _message('two', playerMessageTime: 5000),
              ],
            );
          },
    );
    addTearDown(controller.dispose);

    final firstSync = controller.syncToPosition(const Duration(seconds: 1));
    await Future<void>.delayed(Duration.zero);

    expect(requests.single.playerMessageTime, 1000);

    await controller.syncToPosition(const Duration(seconds: 5));
    expect(requests, hasLength(1));

    firstFetch.complete(
      VideoChatPage(
        nextPlayerMessageTime: 2000,
        messages: [
          _message('one', playerMessageTime: 1000),
        ],
      ),
    );
    await firstSync;
    await Future<void>.delayed(Duration.zero);

    expect(requests, hasLength(2));
    expect(requests.last.playerMessageTime, 2000);
    expect(
      controller.state.messages.map((message) => message.content),
      ['one', 'two'],
    );
  });

  test('backs off failed VOD chat replay fetches between sync ticks', () async {
    var now = DateTime(2026);
    var fetchCount = 0;
    var failuresRemaining = 2;
    final controller = VodPlayerChatReplayController(
      videoNo: 123,
      isChatEnabled: true,
      chatChannelId: 'chat-a',
      initialPresentationMode: PlayerChatPresentationMode.overlay,
      retryClock: () => now,
      fetchPage:
          ({
            required videoNo,
            required playerMessageTime,
            previousVideoChatSize,
          }) async {
            fetchCount += 1;
            if (failuresRemaining > 0) {
              failuresRemaining -= 1;
              throw StateError('temporary chat failure');
            }

            return const VideoChatPage();
          },
    );
    addTearDown(controller.dispose);

    await controller.syncToPosition(const Duration(seconds: 1));
    expect(fetchCount, 1);
    expect(controller.state.phase, VodPlayerChatReplayPhase.error);

    await controller.syncToPosition(const Duration(seconds: 1));
    expect(fetchCount, 1);

    now = now.add(const Duration(milliseconds: 999));
    await controller.syncToPosition(const Duration(seconds: 1));
    expect(fetchCount, 1);

    now = now.add(const Duration(milliseconds: 1));
    await controller.syncToPosition(const Duration(seconds: 1));
    expect(fetchCount, 2);

    await controller.syncToPosition(const Duration(seconds: 1));
    expect(fetchCount, 2);

    now = now.add(const Duration(seconds: 2));
    await controller.syncToPosition(const Duration(seconds: 1));
    expect(fetchCount, 3);
    expect(controller.state.phase, VodPlayerChatReplayPhase.ready);
  });

  test(
    'bounds dense raw chat history and refetches trimmed positions',
    () async {
      var fetchCount = 0;
      final controller = VodPlayerChatReplayController(
        videoNo: 123,
        isChatEnabled: true,
        chatChannelId: 'chat-a',
        initialPresentationMode: PlayerChatPresentationMode.overlay,
        fetchPage:
            ({
              required videoNo,
              required playerMessageTime,
              previousVideoChatSize,
            }) async {
              fetchCount += 1;
              if (playerMessageTime == 0) {
                return VideoChatPage(
                  messages: [_message('zero', playerMessageTime: 0)],
                );
              }

              return VideoChatPage(
                messages: [
                  for (var index = 0; index < 3000; index += 1)
                    _message('dense-$index', playerMessageTime: index),
                ],
              );
            },
      );
      addTearDown(controller.dispose);

      await controller.syncToPosition(
        const Duration(milliseconds: 2999),
      );
      expect(fetchCount, 1);

      await controller.syncToPosition(Duration.zero);

      expect(fetchCount, 2);
      expect(controller.state.messages.single.content, 'zero');
    },
  );

  test('backs off repeated tail prefetch failures', () async {
    var now = DateTime(2026);
    var fetchCount = 0;
    final controller = VodPlayerChatReplayController(
      videoNo: 123,
      isChatEnabled: true,
      chatChannelId: 'chat-a',
      initialPresentationMode: PlayerChatPresentationMode.overlay,
      retryClock: () => now,
      fetchPage:
          ({
            required videoNo,
            required playerMessageTime,
            previousVideoChatSize,
          }) async {
            fetchCount += 1;
            if (fetchCount > 1) {
              throw StateError('tail prefetch failure');
            }

            return VideoChatPage(
              nextPlayerMessageTime: 2000,
              messages: [_message('one', playerMessageTime: 1000)],
            );
          },
    );
    addTearDown(controller.dispose);

    await controller.syncToPosition(const Duration(milliseconds: 1000));
    await Future<void>.delayed(Duration.zero);
    expect(fetchCount, 2);

    await controller.syncToPosition(const Duration(milliseconds: 1000));
    now = now.add(const Duration(milliseconds: 999));
    await controller.syncToPosition(const Duration(milliseconds: 1000));
    expect(fetchCount, 2);

    now = now.add(const Duration(milliseconds: 1));
    await controller.syncToPosition(const Duration(milliseconds: 1000));
    await Future<void>.delayed(Duration.zero);

    expect(fetchCount, 3);
  });

  test(
    'suspends fetch and resumes from the latest playback position',
    () async {
      final requestedPositions = <int>[];
      final controller = VodPlayerChatReplayController(
        videoNo: 123,
        isChatEnabled: true,
        chatChannelId: 'chat-a',
        initialPresentationMode: PlayerChatPresentationMode.overlay,
        fetchPage:
            ({
              required videoNo,
              required playerMessageTime,
              previousVideoChatSize,
            }) async {
              requestedPositions.add(playerMessageTime);
              return VideoChatPage(
                messages: [
                  _message('resumed', playerMessageTime: playerMessageTime),
                ],
              );
            },
      );
      addTearDown(controller.dispose);

      controller.setSuspended(suspended: true);
      await controller.syncToPosition(const Duration(seconds: 12));
      expect(requestedPositions, isEmpty);

      controller.setSuspended(suspended: false);
      await Future<void>.delayed(Duration.zero);

      expect(requestedPositions, [12000]);
      expect(controller.state.messages.single.content, 'resumed');
    },
  );
}

VideoChatMessage _message(String content, {required int playerMessageTime}) {
  return VideoChatReplayMessage(
    chatChannelId: 'chat-a',
    content: content,
    extras: null,
    messageStatusType: 'NORMAL',
    messageTime: playerMessageTime,
    messageTypeCode: 1,
    playerMessageTime: playerMessageTime,
    profile: null,
    userIdHash: 'user-$content',
  );
}
