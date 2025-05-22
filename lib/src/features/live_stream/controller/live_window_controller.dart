import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show ChatWindowMode, LiveMode;
import '../../settings/controller/stream_setting_controller.dart';

part 'live_window_controller.g.dart';

@riverpod
class LiveWindowController extends _$LiveWindowController {
  late ChatWindowMode _lastSelectedMode;
  @override
  ChatWindowMode build() {
    final chatWindowModeStateIndex = ref.read(
      streamSettingsControllerProvider.select(
        (value) => value.liveChatWindowIndex,
      ),
    );
    _lastSelectedMode = _getChatWindowModeFromIndex(chatWindowModeStateIndex);

    return _lastSelectedMode;
  }

  ChatWindowMode _getChatWindowModeFromIndex(int index) {
    return switch (index) {
      0 => ChatWindowMode.off,
      1 => ChatWindowMode.overlay,
      2 => ChatWindowMode.side,
      _ => ChatWindowMode.off,
    };
  }

  Future<void> toggleOverlayChat() async {
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

  Future<void> toggleViewMode() async {
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

    await _updateSettings(state);
  }

  void toggleLiveMode(LiveMode liveMode) {
    state =
        liveMode == LiveMode.single ? _lastSelectedMode : ChatWindowMode.off;
  }

  int _getIndexFromChatWindowMode(ChatWindowMode mode) {
    return switch (mode) {
      ChatWindowMode.off => 0,
      ChatWindowMode.overlay => 1,
      ChatWindowMode.side => 2,
    };
  }

  // save chat window settings in local storage
  Future<void> _updateSettings(ChatWindowMode mode) async {
    final int chatWindowIndex = _getIndexFromChatWindowMode(mode);

    await ref
        .read(streamSettingsControllerProvider.notifier)
        .setLiveChatWindowIndex(chatWindowIndex);
  }
}

