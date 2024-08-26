import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/shared_preferences/shared_prefs.dart';
import '../model/chat_settings.dart';
import '../repository/chat_settings_repository.dart';

part 'chat_settings_controller.g.dart';

@riverpod
class ChatSettingsController extends _$ChatSettingsController {
  late ChatSettingsRepository _repository;

  @override
  ChatSettings build() {
    final prefs = ref.watch(sharedPrefsProvider);
    _repository = ChatSettingsRepository(prefs: prefs);

    return _repository.getSettings();
  }

  Future<void> setChatPositionX(int value) async {
    final settings = state.copyWith(chatPositionX: value);
    await _updateInt(value, 0, 100, settings);
  }

  Future<void> setChatPositionY(int value) async {
    final settings = state.copyWith(chatPositionY: value);
    await _updateInt(value, 0, 100, settings);
  }

  Future<void> setChatContainerHeight(int value) async {
    final settings = state.copyWith(chatContainerHeight: value);
    await _updateInt(value, 5, 100, settings);
  }

  Future<void> setChatContainerWidth(int value) async {
    final settings = state.copyWith(chatContainerWidth: value);
    await _updateInt(value, 5, 50, settings);
  }

  Future<void> setFontSize(int value) async {
    final settings = state.copyWith(chatFontSize: value);
    await _updateInt(value, 4, 32, settings);
  }

  Future<void> setEntireChatContainerTransparency(int value) async {
    final settings = state.copyWith(entireChatContainerTransparency: value);
    await _updateInt(value, 0, 100, settings);
  }

  Future<void> setSingleChatContainerTransparency(int value) async {
    final settings = state.copyWith(singleChatContainerTransparency: value);
    await _updateInt(value, 0, 100, settings);
  }

  Future<void> setChatContainerVerticalMargin(int value) async {
    final settings = state.copyWith(chatContainerVerticalMargin: value);
    await _updateInt(value, 0, 15, settings);
  }

  Future<void> setBadgeCollectorHeight(int value) async {
    final settings = state.copyWith(badgeCollectorHeight: value);
    await _updateInt(value, 0, 100, settings);
  }

  Future<void> setShowChatTime(int value) async {
    final settings = state.copyWith(showChatTime: value);
    await _updateInt(value, 0, 1, settings);
  }

  Future<void> setShowNickname(int value) async {
    final settings = state.copyWith(showNickname: value);
    await _updateInt(value, 0, 1, settings);
  }

  Future<void> setUseBadgeCollector(int value) async {
    final settings = state.copyWith(useBadgeCollector: value);
    await _updateInt(value, 0, 1, settings);
  }

  /// Update int fields
  Future<void> _updateInt(
    int value,
    int min,
    int max,
    ChatSettings settings,
  ) async {
    if (value >= min && value <= max) {
      state = settings;
      await _repository.updateSettings(settings);
    }
  }
}
