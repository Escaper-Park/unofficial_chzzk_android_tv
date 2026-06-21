import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/presentation/view/player_chat_single_view_layout.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';

void main() {
  testWidgets('side chat can render on the left side', (tester) async {
    _setViewport(tester);

    await tester.pumpWidget(
      const _Harness(
        chatSettings: ChatSettings(
          chatSidePanelWidth: 25,
          chatSidePanelPositionX: 0,
        ),
      ),
    );

    expect(
      tester.getRect(find.byKey(_playbackKey)),
      const Rect.fromLTWH(60, 0, 180, 120),
    );
    expect(
      tester.getRect(find.byKey(_chatKey)),
      const Rect.fromLTWH(0, 0, 60, 120),
    );
  });

  testWidgets('side chat can render on the right side', (tester) async {
    _setViewport(tester);

    await tester.pumpWidget(
      const _Harness(
        chatSettings: ChatSettings(
          chatSidePanelWidth: 25,
          chatSidePanelPositionX: 100,
        ),
      ),
    );

    expect(
      tester.getRect(find.byKey(_playbackKey)),
      const Rect.fromLTWH(0, 0, 180, 120),
    );
    expect(
      tester.getRect(find.byKey(_chatKey)),
      const Rect.fromLTWH(180, 0, 60, 120),
    );
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
    required this.chatSettings,
  });

  final ChatSettings chatSettings;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: 240,
        height: 120,
        child: PlayerChatSingleViewLayout(
          chatPresentationModeIndex: 2,
          chatSettings: chatSettings,
          playback: const ColoredBox(
            key: _playbackKey,
            color: Colors.black,
          ),
          chat: const ColoredBox(
            key: _chatKey,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

const _playbackKey = ValueKey('playback');
const _chatKey = ValueKey('chat');
