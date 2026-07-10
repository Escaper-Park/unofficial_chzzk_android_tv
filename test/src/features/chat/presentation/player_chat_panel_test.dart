import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ScrollCacheExtent;
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/entities/chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/view/player_chat_formatters.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/view/player_chat_message_bubble.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/view/player_chat_panel.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/view/player_chat_panel_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/view/player_chat_panel_style.dart';

void main() {
  test('formats chat timestamps and donation amounts', () {
    expect(
      playerChatTimeLabel(
        const PlayerChatMessage(
          source: PlayerChatMessageSource.vod,
          id: 'vod-message',
          messageTime: 0,
          messageTypeCode: 1,
          playerMessageTime: 65000,
          content: 'vod',
        ),
      ),
      '01:05',
    );
    expect(
      playerChatTimeLabel(
        const PlayerChatMessage(
          source: PlayerChatMessageSource.vod,
          id: 'long-vod-message',
          messageTime: 0,
          messageTypeCode: 1,
          playerMessageTime: 3661000,
          content: 'vod',
        ),
      ),
      '1:01:01',
    );
    expect(
      playerChatTimeLabel(
        const PlayerChatMessage(
          source: PlayerChatMessageSource.live,
          id: 'live-message',
          messageTime: 0,
          messageTypeCode: 1,
          content: 'live',
        ),
      ),
      '09:00',
    );
    expect(formatPlayerChatDonationAmount(1234567), '1,234,567');
  });

  testWidgets('chat images keep their layout slot while loading or failed', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _ChatHarness(
        child: SizedBox(
          width: 320,
          height: 120,
          child: PlayerChatPanel(
            showTitle: false,
            style: PlayerChatPanelStyle(
              showPanelContainer: false,
              showUserBadges: true,
            ),
            messages: [
              PlayerChatMessage(
                source: PlayerChatMessageSource.live,
                id: 'message-1',
                messageTime: 1,
                messageTypeCode: 1,
                nickname: 'tester',
                content: 'hello {:smile:} world',
                nicknameBadgeImageUrl: 'https://example.com/nickname.png',
                userBadgeImageUrls: ['https://example.com/viewer.png'],
                emojis: {'smile': 'https://example.com/smile.png'},
              ),
            ],
          ),
        ),
      ),
    );

    _expectChatImageSlots(tester);

    await tester.pump();

    _expectChatImageSlots(tester);
  });

  testWidgets('user badges setting hides viewer badges only', (tester) async {
    await tester.pumpWidget(
      const _ChatHarness(
        child: SizedBox(
          width: 320,
          height: 120,
          child: PlayerChatPanel(
            showTitle: false,
            style: PlayerChatPanelStyle(
              showPanelContainer: false,
              showUserBadges: false,
            ),
            messages: [
              PlayerChatMessage(
                source: PlayerChatMessageSource.live,
                id: 'message-1',
                messageTime: 1,
                messageTypeCode: 1,
                nickname: 'tester',
                content: 'hello {:smile:}',
                verifiedMark: true,
                nicknameBadgeImageUrl: 'https://example.com/nickname.png',
                userBadgeImageUrls: ['https://example.com/viewer.png'],
                emojis: {'smile': 'https://example.com/smile.png'},
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(OptimizedImage), findsNWidgets(3));
  });

  testWidgets('nickname setting hides nickname marks', (tester) async {
    await tester.pumpWidget(
      const _ChatHarness(
        child: SizedBox(
          width: 320,
          height: 120,
          child: PlayerChatPanel(
            showTitle: false,
            style: PlayerChatPanelStyle(
              showPanelContainer: false,
              showNickname: false,
              showUserBadges: true,
            ),
            messages: [
              PlayerChatMessage(
                source: PlayerChatMessageSource.live,
                id: 'message-1',
                messageTime: 1,
                messageTypeCode: 1,
                nickname: 'tester',
                content: 'hello {:smile:}',
                verifiedMark: true,
                nicknameBadgeImageUrl: 'https://example.com/nickname.png',
                userBadgeImageUrls: ['https://example.com/viewer.png'],
                emojis: {'smile': 'https://example.com/smile.png'},
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('tester'), findsNothing);
    expect(find.byType(OptimizedImage), findsNWidgets(2));
  });

  testWidgets('renders every registered emoji in a single message', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _ChatHarness(
        child: SizedBox(
          width: 640,
          height: 120,
          child: PlayerChatPanel(
            showTitle: false,
            style: PlayerChatPanelStyle(showPanelContainer: false),
            messages: [
              PlayerChatMessage(
                source: PlayerChatMessageSource.live,
                id: 'emoji-spam',
                messageTime: 1,
                messageTypeCode: 1,
                content: '{:one:}{:two:}{:three:}{:four:}{:five:}{:six:}',
                emojis: {
                  'one': 'https://example.com/one.gif',
                  'two': 'https://example.com/two.gif',
                  'three': 'https://example.com/three.gif',
                  'four': 'https://example.com/four.gif',
                  'five': 'https://example.com/five.gif',
                  'six': 'https://example.com/six.gif',
                },
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(OptimizedImage), findsNWidgets(6));
    expect(find.textContaining('{:'), findsNothing);
  });

  testWidgets('preserves message state when newer chat items are prepended', (
    tester,
  ) async {
    const first = PlayerChatMessage(
      source: PlayerChatMessageSource.live,
      id: 'first',
      messageTime: 1,
      messageTypeCode: 1,
      content: 'first',
    );
    const second = PlayerChatMessage(
      source: PlayerChatMessageSource.live,
      id: 'second',
      messageTime: 2,
      messageTypeCode: 1,
      content: 'second',
    );
    const third = PlayerChatMessage(
      source: PlayerChatMessageSource.live,
      id: 'third',
      messageTime: 3,
      messageTypeCode: 1,
      content: 'third',
    );

    Widget panel(List<PlayerChatMessage> messages) {
      return _ChatHarness(
        child: SizedBox(
          width: 320,
          height: 240,
          child: PlayerChatPanel(
            showTitle: false,
            style: const PlayerChatPanelStyle(showPanelContainer: false),
            messages: messages,
          ),
        ),
      );
    }

    await tester.pumpWidget(panel(const [first, second]));
    final firstBubble = find.descendant(
      of: find.byKey(const ValueKey('first')),
      matching: find.byType(PlayerChatMessageBubble),
    );
    final firstState = tester.state(firstBubble);

    await tester.pumpWidget(panel(const [first, second, third]));
    final updatedFirstBubble = find.descendant(
      of: find.byKey(const ValueKey('first')),
      matching: find.byType(PlayerChatMessageBubble),
    );

    expect(tester.state(updatedFirstBubble), same(firstState));
  });

  testWidgets('builds no offscreen chat cache and bounds animated rows', (
    tester,
  ) async {
    final messages = [
      for (var index = 0; index < 6; index += 1)
        PlayerChatMessage(
          source: PlayerChatMessageSource.live,
          id: 'message-$index',
          messageTime: index,
          messageTypeCode: 1,
          content: 'message $index',
        ),
    ];

    await tester.pumpWidget(
      _ChatHarness(
        child: SizedBox(
          width: 320,
          height: 800,
          child: PlayerChatPanel(
            showTitle: false,
            style: const PlayerChatPanelStyle(showPanelContainer: false),
            messages: messages,
          ),
        ),
      ),
    );

    final list = tester.widget<ListView>(find.byType(ListView));
    expect(list.scrollCacheExtent, const ScrollCacheExtent.pixels(0));
    for (var index = 0; index < messages.length; index += 1) {
      final bubble = find.descendant(
        of: find.byKey(ValueKey('message-$index')),
        matching: find.byType(PlayerChatMessageBubble),
      );
      expect(bubble, findsOneWidget);
      expect(
        TickerMode.valuesOf(tester.element(bubble)).enabled,
        index >= messages.length - PlayerChatPanelDesign.maxAnimatedMessageRows,
      );
    }
  });

  testWidgets('does not build distant historical chat rows', (tester) async {
    final messages = [
      for (var index = 0; index < 60; index += 1)
        PlayerChatMessage(
          source: PlayerChatMessageSource.live,
          id: 'history-$index',
          messageTime: index,
          messageTypeCode: 1,
          content: 'history $index',
        ),
    ];

    await tester.pumpWidget(
      _ChatHarness(
        child: SizedBox(
          width: 320,
          height: 120,
          child: PlayerChatPanel(
            showTitle: false,
            style: const PlayerChatPanelStyle(showPanelContainer: false),
            messages: messages,
          ),
        ),
      ),
    );

    expect(find.byKey(const ValueKey('history-59')), findsOneWidget);
    expect(find.byKey(const ValueKey('history-0')), findsNothing);
  });
}

void _expectChatImageSlots(WidgetTester tester) {
  final images = find.byType(OptimizedImage);

  expect(images, findsNWidgets(3));
  expect(tester.getSize(images.at(0)), const Size.square(16));
  expect(tester.getSize(images.at(1)), const Size.square(16));
  expect(tester.getSize(images.at(2)).width, moreOrLessEquals(20.3));
  expect(tester.getSize(images.at(2)).height, moreOrLessEquals(20.3));
}

class _ChatHarness extends StatelessWidget {
  const _ChatHarness({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: child,
      ),
    );
  }
}
