import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/entities/chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/view/player_chat_formatters.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/view/player_chat_panel.dart';
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
