import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/shared_preferences/shared_prefs.dart';
import '../../../utils/video_player/controller/live_stream_controller.dart';
import '../../chat/model/chat_settings.dart';

class SettingsRepository {
  final SharedPreferences _sharedPreferences;

  SettingsRepository(this._sharedPreferences);

  // Naver Id
  Future<void> setNaverIdPrefs(String naverId) async {
    await _sharedPreferences.setString(
      SharedPrefencesKey.naverId,
      naverId,
    );
  }

  String? getNaverIdPrefs() {
    return _sharedPreferences.getString(SharedPrefencesKey.naverId);
  }

  // Chat
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

  Future<void> setChatVerticalInterval(int value) async {
    await _sharedPreferences.setInt(
      SharedPrefencesKey.chatContainerVerticalInterval,
      value,
    );
  }

  ChatSettings getChatSettingPrefs() {
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

    final int chatContainerVerticalInterval = _sharedPreferences
            .getInt(SharedPrefencesKey.chatContainerVerticalInterval) ??
        5;

    return ChatSettings(
      fontSize: fontSize,
      chatContainerHeight: height,
      chatContainerWidth: width,
      chatContainerTransparency: transparency,
      chatPosition: position,
      chatContainerVerticalInterval: chatContainerVerticalInterval,
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

  // ScreenMode
  Future<void> setScreenMode(String value) async {
    await _sharedPreferences.setString(SharedPrefencesKey.screenMode, value);
  }

  String getScreenMode() {
    return _sharedPreferences.getString(SharedPrefencesKey.screenMode) ??
        LiveStreamScreenMode.full.screenMode;
  }

  // Popular Channels
  Future<void> setPopularChannelsLength(int value) async {
    await _sharedPreferences.setInt(
      SharedPrefencesKey.popularChannelsLength,
      value,
    );
  }

  int getPopularChannelsLength() {
    return _sharedPreferences
            .getInt(SharedPrefencesKey.popularChannelsLength) ??
        20;
  }
}
