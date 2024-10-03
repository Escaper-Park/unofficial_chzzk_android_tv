import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../setting/controller/stream_settings_controller.dart';
import '../../common/chat/chat_window_mode.dart';

part 'live_mode_controller.g.dart';

enum LiveMode {
  singleView,
  multiView,
}

@riverpod
class ChatWindowModeController extends _$ChatWindowModeController {
  late ChatWindowMode _lastSelectedMode;

  @override
  ChatWindowMode build() {
    final chatWindowStateIndex = ref.read(streamSettingsControllerProvider
        .select((value) => value.liveChatWindowStateIndex));

    _lastSelectedMode = _getChatWindowModeFromIndex(chatWindowStateIndex);

    return _lastSelectedMode;
  }

  void toggleOverlayChat() {
    switch (state) {
      case ChatWindowMode.off:
        state = ChatWindowMode.overlay;
      case ChatWindowMode.overlay:
        state = ChatWindowMode.off;
      case ChatWindowMode.side:
        state = _lastSelectedMode == ChatWindowMode.side
            ? ChatWindowMode.overlay
            : _lastSelectedMode;
    }

    _lastSelectedMode = state;

    _updateSettings(_lastSelectedMode);
  }

  void toggleViewMode() {
    switch (state) {
      case ChatWindowMode.off:
        state = ChatWindowMode.side;
      case ChatWindowMode.overlay:
        state = ChatWindowMode.side;
      case ChatWindowMode.side:
        state = _lastSelectedMode == ChatWindowMode.side
            ? ChatWindowMode.off
            : _lastSelectedMode;
    }

    _updateSettings(state);
  }

  void toggleLiveMode(LiveMode liveMode) {
    state = liveMode == LiveMode.singleView
        ? _lastSelectedMode
        : ChatWindowMode.off;
  }

  ChatWindowMode _getChatWindowModeFromIndex(int index) {
    return switch (index) {
      0 => ChatWindowMode.off,
      1 => ChatWindowMode.overlay,
      2 => ChatWindowMode.side,
      _ => ChatWindowMode.off,
    };
  }

  int _getIndexFromChatWindowMode(ChatWindowMode mode) {
    return switch (mode) {
      ChatWindowMode.off => 0,
      ChatWindowMode.overlay => 1,
      ChatWindowMode.side => 2,
    };
  }

  // save chat window settings in local storage
  void _updateSettings(ChatWindowMode mode) {
    final int chatWindowIndex = _getIndexFromChatWindowMode(mode);

    ref
        .read(streamSettingsControllerProvider.notifier)
        .setLiveChatWindowStateIndex(chatWindowIndex);
  }
}

@Riverpod(keepAlive: true)
class LiveModeController extends _$LiveModeController {
  @override
  LiveMode build() {
    return LiveMode.singleView;
  }

  void reset() {
    state = LiveMode.singleView;
  }

  void changeMode() {
    state =
        state == LiveMode.singleView ? LiveMode.multiView : LiveMode.singleView;
  }
}
