import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/entities/chat.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/view/player_chat_layer_body.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/view/player_chat_layer_geometry.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/view/player_chat_layer_style_mapper.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/view/player_chat_panel_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/view/player_chat_presentation_mode.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/chat_settings.dart';

void main() {
  test('calculates chat overlay geometry from percentage settings', () {
    final constraints = BoxConstraints.tight(const Size(240, 120));
    const settings = ChatSettings(
      overlayChatPanelWidth: 50,
      overlayChatPanelHeight: 25,
      overlayChatPositionX: 100,
      overlayChatPositionY: 0,
      badgeCollectorPanelHeight: 40,
      overlayBadgeCollectorPositionX: 0,
      overlayBadgeCollectorPositionY: 100,
    );

    expect(
      playerChatOverlayChatRect(
        constraints: constraints,
        chatSettings: settings,
      ),
      const Rect.fromLTWH(120, 0, 120, 30),
    );
    expect(
      playerChatOverlayBadgeCollectorRect(
        constraints: constraints,
        chatSettings: settings,
      ),
      const Rect.fromLTWH(0, 72, 120, 48),
    );
    expect(
      playerChatCollectorHeight(
        maxHeight: 120,
        chatSettings: settings,
      ),
      48,
    );
  });

  test('caps combined chat and badge collector overlay height', () {
    final layout = playerChatWithBadgeOverlayLayout(
      constraints: BoxConstraints.tight(const Size(200, 100)),
      chatSettings: const ChatSettings(
        overlayChatPanelWidth: 50,
        overlayChatPanelHeight: 80,
        overlayChatPositionX: 50,
        overlayChatPositionY: 50,
        badgeCollectorPanelHeight: 50,
      ),
    );

    expect(layout.rect, const Rect.fromLTWH(50, 0, 100, 100));
    expect(layout.chatHeight, 50);
    expect(layout.collectorHeight, 50);
    expect(layout.gap, 0);
    expect(
      showsPlayerChatBadgeCollector(
        const ChatSettings(useBadgeCollector: 1),
      ),
      true,
    );
    expect(
      showsPlayerChatBadgeCollector(
        const ChatSettings(useBadgeCollector: 1, badgeCollectorPanelHeight: 0),
      ),
      false,
    );
  });

  test('maps chat settings to overlay and side panel styles', () {
    final overlayStyle = playerChatPanelStyleFromSettings(
      const ChatSettings(
        useChatPanelContainer: 1,
        chatContainerHorizontalMargin: -4,
        chatContainerVerticalMargin: 9,
        chatBubbleVerticalGap: -3,
        chatMessageFontSize: 0,
        showChatTime: 1,
        showNickname: 0,
        showDonation: 0,
        showUserBadges: 0,
      ),
      mode: PlayerChatPresentationMode.overlay,
    );

    expect(overlayStyle.showPanelContainer, true);
    expect(overlayStyle.showMessageContainer, false);
    expect(overlayStyle.panelMargin, const EdgeInsets.symmetric(vertical: 9));
    expect(overlayStyle.messageGap, 0);
    expect(overlayStyle.messageFontSize, 1);
    expect(overlayStyle.showTime, true);
    expect(overlayStyle.showNickname, false);
    expect(overlayStyle.showDonation, false);
    expect(overlayStyle.showUserBadges, false);

    final sidePanelStyle = playerChatPanelStyleFromSettings(
      const ChatSettings(
        useChatPanelContainer: 1,
        chatBubbleTransparency: 100,
      ),
      mode: PlayerChatPresentationMode.sidePanel,
    );

    expect(sidePanelStyle.showPanelContainer, false);
    expect(sidePanelStyle.showMessageContainer, false);
    expect(sidePanelStyle.panelPadding, PlayerChatPanelDesign.panelPadding);
    expect(sidePanelStyle.bubbleColor, PlayerChatPanelDesign.bubbleColor);
  });

  testWidgets('badge collector only overlay applies chat container margin', (
    tester,
  ) async {
    _setViewport(tester);

    await tester.pumpWidget(
      const _Harness(
        chatSettings: ChatSettings(
          useBadgeCollector: 2,
          overlayChatPanelWidth: 50,
          badgeCollectorPanelHeight: 50,
          overlayBadgeCollectorPositionX: 0,
          overlayBadgeCollectorPositionY: 0,
          chatContainerHorizontalMargin: 12,
          chatContainerVerticalMargin: 7,
        ),
      ),
    );

    expect(
      tester.getRect(find.byType(ListView)),
      const Rect.fromLTWH(12, 7, 96, 46),
    );
  });

  testWidgets('side chat with badge collector shows divider between panels', (
    tester,
  ) async {
    _setViewport(tester);

    await tester.pumpWidget(
      const _Harness(
        mode: PlayerChatPresentationMode.sidePanel,
        chatSettings: ChatSettings(
          useBadgeCollector: 1,
          badgeCollectorPanelHeight: 40,
        ),
      ),
    );

    final divider = find.byType(Divider);

    expect(divider, findsOneWidget);
    expect(
      tester.getRect(divider),
      const Rect.fromLTWH(0, 66, 240, 6),
    );
  });

  testWidgets('hidden chat does not read messages', (tester) async {
    _setViewport(tester);

    await tester.pumpWidget(
      _Harness(
        mode: PlayerChatPresentationMode.hidden,
        chatSettings: const ChatSettings(),
        messages: _ThrowingMessages(),
      ),
    );

    expect(find.byType(ListView), findsNothing);
  });
}

void _setViewport(WidgetTester tester) {
  tester.view.physicalSize = const Size(240, 120);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

class _Harness extends StatelessWidget {
  const _Harness({
    this.mode = PlayerChatPresentationMode.overlay,
    required this.chatSettings,
    this.messages = const [
      PlayerChatMessage(
        source: PlayerChatMessageSource.live,
        id: 'normal-message',
        messageTime: 1,
        messageTypeCode: 1,
        content: 'normal',
        nickname: 'viewer',
      ),
      PlayerChatMessage(
        source: PlayerChatMessageSource.live,
        id: 'collector-message',
        messageTime: 2,
        messageTypeCode: 1,
        content: 'collector',
        nickname: 'manager',
        userRoleCode: 'streamer',
      ),
    ],
  });

  final PlayerChatPresentationMode mode;
  final ChatSettings chatSettings;
  final List<PlayerChatMessage> messages;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 240,
          height: 120,
          child: PlayerChatLayerBody(
            mode: mode,
            chatSettings: chatSettings,
            messages: messages,
            statusText: null,
          ),
        ),
      ),
    );
  }
}

final class _ThrowingMessages extends ListBase<PlayerChatMessage> {
  @override
  int get length => throw StateError('messages should not be read');

  @override
  set length(int value) {
    throw UnsupportedError('read-only test list');
  }

  @override
  PlayerChatMessage operator [](int index) {
    throw StateError('messages should not be read');
  }

  @override
  void operator []=(int index, PlayerChatMessage value) {
    throw UnsupportedError('read-only test list');
  }
}
