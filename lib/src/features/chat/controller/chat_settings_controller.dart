import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/shared_preferences/shared_prefs.dart';
import '../../settings/repository/settings_repository.dart';
import '../model/chat_settings.dart';

part 'chat_settings_controller.g.dart';

@Riverpod(keepAlive: true)
class ChatSettingsController extends _$ChatSettingsController {
  late SettingsRepository _settingRepository;

  @override
  ChatSettings build() {
    final SharedPreferences sharedPreferences = ref.read(sharedPrefsProvider);
    _settingRepository = SettingsRepository(sharedPreferences);

    return _settingRepository.getChatSettingPrefs();
  }

  Future<void> setChatDelaySec(int value) async {
    if (value <= 15 && value >= 0) {
      await _settingRepository.setChatDelaySec(value);
    }
  }

  int getChatDelaySec() {
    return _settingRepository.getChatDelaySec();
  }

  Future<void> setFontSize(int value) async {
    if (value <= 32 && value >= 8) {
      await _settingRepository.setChatFontSize(value);
      state = state.copyWith(fontSize: value);
    }
  }

  Future<void> setContainerHeight(int value) async {
    if (value <= 100 && value >= 5) {
      await _settingRepository.setChatContainerHeight(value);
      state = state.copyWith(chatContainerHeight: value);
    }
  }

  Future<void> setContainerWidth(int value) async {
    if (value <= 50 && value >= 5) {
      await _settingRepository.setChatContainerWidth(value);
      state = state.copyWith(chatContainerWidth: value);
    }
  }

  Future<void> setChatContainerTransparency(int value) async {
    if (value <= 100 && value >= 0) {
      await _settingRepository.setChatContainerTransparency(value);
      state = state.copyWith(chatContainerTransparency: value);
    }
  }

  Future<void> setChatPosition(int value) async {
    final int indexValue = value % 8;

    if (indexValue <= 7 && indexValue >= 0) {
      await _settingRepository.setChatPosition(indexValue);
      state = state.copyWith(chatPosition: indexValue);
    }
  }

  Future<void> setChatVerticalInterval(int value) async {
    if (value <= 15 && value >= 0) {
      await _settingRepository.setChatVerticalInterval(value);
      state = state.copyWith(chatContainerVerticalInterval: value);
    }
  }
}
