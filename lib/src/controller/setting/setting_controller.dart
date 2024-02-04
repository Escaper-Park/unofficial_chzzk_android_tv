import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/setting/chat_setting.dart';
import '../../service/setting/setting_repository.dart';
import '../../utils/shared_preferences/shared_preferences_utils.dart';

part 'setting_controller.g.dart';

@riverpod
class SettingController extends _$SettingController {
  late SettingRepository _settingRepository;

  @override
  void build() {
    final SharedPreferences sharedPreferences = ref.read(sharedPrefsProvider);
    _settingRepository = SettingRepository(sharedPreferences);
    return;
  }

  Future<void> setNaverIdPrefs(String naverId) async {
    await _settingRepository.setNaverIdPrefs(naverId);
  }

  String? getNaverIdPrefs() {
    return _settingRepository.getNaverIdPrefs();
  }

  Future<void> setChatDelaySec(int value) async {
    if (value <= 15 && value >= 0) {
      await _settingRepository.setChatDelaySec(value);
    }
  }

  int getChatDelaySec() {
    return _settingRepository.getChatDelaySec();
  }
}

@Riverpod(keepAlive: true)
class ChatSettingController extends _$ChatSettingController {
  late SettingRepository _settingRepository;

  @override
  ChatSetting build() {
    final SharedPreferences sharedPreferences = ref.read(sharedPrefsProvider);
    _settingRepository = SettingRepository(sharedPreferences);

    return _settingRepository.getChatSettingPrefs();
  }

  Future<void> setFontSize(int value) async {
    if (value <= 32 && value >= 8) {
      await _settingRepository.setChatFontSize(value);
      state = state.copyWith(fontSize: value);
    }
  }

  Future<void> setChatPosition(int value) async {
    final int indexValue = value % 8;

    if (indexValue <= 7 && indexValue >= 0) {
      await _settingRepository.setChatPosition(indexValue);
      state = state.copyWith(chatPosition: indexValue);
    }
  }

  Future<void> setChatContainerTransparency(int value) async {
    if (value <= 100 && value >= 0) {
      await _settingRepository.setChatContainerTransparency(value);
      state = state.copyWith(chatContainerTransparency: value);
    }
  }

  Future<void> setContainerHeight(int value) async {
    if (value <= 100 && value >= 20) {
      await _settingRepository.setChatContainerHeight(value);
      state = state.copyWith(chatContainerHeight: value);
    }
  }

  Future<void> setContainerWidth(int value) async {
    if (value <= 50 && value >= 20) {
      await _settingRepository.setChatContainerWidth(value);
      state = state.copyWith(chatContainerWidth: value);
    }
  }
}
