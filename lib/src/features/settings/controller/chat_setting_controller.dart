import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/shared_preferences/shared_prefs.dart';
import '../model/chat_settings.dart';
import '../repository/chat_settings_repository.dart';

part 'chat_setting_controller.g.dart';

@riverpod
class ChatSettingsController extends _$ChatSettingsController {
  late ChatSettingsRepository _repository;

  @override
  ChatSettings build() {
    final prefs = ref.watch(sharedPrefsProvider);
    _repository = ChatSettingsRepository(prefs: prefs);

    return _repository.getValues();
  }

  Future<void> setChatPositionX(int value) async {
    await _updateInt(value, 0, 100, state.copyWith(chatPositionX: value));
  }

  Future<void> setChatPositionY(int value) async {
    await _updateInt(value, 0, 100, state.copyWith(chatPositionY: value));
  }

  Future<void> setChatContainerHeight(int value) async {
    await _updateInt(value, 5, 100, state.copyWith(chatContainerHeight: value));
  }

  Future<void> setChatContainerWidth(int value) async {
    await _updateInt(value, 5, 50, state.copyWith(chatContainerWidth: value));
  }

  Future<void> setFontSize(int value) async {
    await _updateInt(value, 4, 32, state.copyWith(chatFontSize: value));
  }

  Future<void> setEntireChatContainerTransparency(int value) async {
    await _updateInt(
      value,
      0,
      100,
      state.copyWith(entireChatContainerTransparency: value),
    );
  }

  Future<void> setSingleChatContainerTransparency(int value) async {
    await _updateInt(
      value,
      0,
      100,
      state.copyWith(singleChatContainerTransparency: value),
    );
  }

  Future<void> setChatContainerHorizontalMargin(int value) async {
    await _updateInt(
      value,
      0,
      15,
      state.copyWith(chatContainerHorizontalMargin: value),
    );
  }

  Future<void> setChatContainerVerticalMargin(int value) async {
    await _updateInt(
      value,
      0,
      15,
      state.copyWith(chatContainerVerticalMargin: value),
    );
  }

  Future<void> setBadgeCollectorHeight(int value) async {
    await _updateInt(
      value,
      0,
      100,
      state.copyWith(badgeCollectorHeight: value),
    );
  }

  Future<void> setShowChatTime(int value) async {
    await _updateInt(value, 0, 1, state.copyWith(showChatTime: value));
  }

  Future<void> setShowNickname(int value) async {
    await _updateInt(value, 0, 1, state.copyWith(showNickname: value));
  }

  Future<void> setShowDonation(int value) async {
    await _updateInt(value, 0, 1, state.copyWith(showDonation: value));
  }

  Future<void> setUseBadgeCollector(int value) async {
    await _updateInt(value, 0, 1, state.copyWith(useBadgeCollector: value));
  }

  /// Update int fields
  Future<void> _updateInt(
    int value,
    int min,
    int max,
    ChatSettings newSettings,
  ) async {
    if (value >= min && value <= max) {
      state = newSettings;
      await _repository.updateValue(newSettings);
    }
  }
}
