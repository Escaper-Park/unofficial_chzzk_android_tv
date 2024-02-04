import 'package:shared_preferences/shared_preferences.dart';

import '../../model/setting/chat_setting.dart';
import '../../utils/shared_preferences/shared_preferences_utils.dart';

class SettingRepository {
  final SharedPreferences _sharedPreferences;

  SettingRepository(this._sharedPreferences);

  Future<void> setNaverIdPrefs(String naverId) async {
    await _sharedPreferences.setString(
      SharedPrefencesKey.naverId,
      naverId,
    );
  }

  String? getNaverIdPrefs() {
    return _sharedPreferences.getString(SharedPrefencesKey.naverId);
  }

  Future<void> setChatPosition(int value) async {
    await _sharedPreferences.setInt(
      SharedPrefencesKey.chatPosition,
      value,
    );
  }

  Future<void> setChatContainerHeight(int value) async {
    await _sharedPreferences.setInt(
      SharedPrefencesKey.chatContainerHeight,
      value,
    );
  }

  Future<void> setChatContainerWidth(int value) async {
    await _sharedPreferences.setInt(
      SharedPrefencesKey.chatContainerWidth,
      value,
    );
  }

  Future<void> setChatFontSize(int value) async {
    await _sharedPreferences.setInt(
      SharedPrefencesKey.chatFontSize,
      value,
    );
  }

  Future<void> setChatContainerTransparency(int value) async {
    await _sharedPreferences.setInt(
      SharedPrefencesKey.chatContainerTransparency,
      value,
    );
  }

  ChatSetting getChatSettingPrefs() {
    final int fontSize =
        _sharedPreferences.getInt(SharedPrefencesKey.chatFontSize) ?? 16;

    final int height =
        _sharedPreferences.getInt(SharedPrefencesKey.chatContainerHeight) ?? 80;

    final int width =
        _sharedPreferences.getInt(SharedPrefencesKey.chatContainerWidth) ?? 25;

    final int position =
        _sharedPreferences.getInt(SharedPrefencesKey.chatPosition) ?? 3;

    final int transparency = _sharedPreferences
            .getInt(SharedPrefencesKey.chatContainerTransparency) ??
        30;

    return ChatSetting(
      fontSize: fontSize,
      chatContainerHeight: height,
      chatContainerWidth: width,
      chatContainerTransparency: transparency,
      chatPosition: position,
    );
  }

  Future<void> setChatDelaySec(int value) async {
    await _sharedPreferences.setInt(
      SharedPrefencesKey.chatDelaySec,
      value,
    );
  }

  int getChatDelaySec() {
    return _sharedPreferences.getInt(SharedPrefencesKey.chatDelaySec) ?? 0;
  }
}
