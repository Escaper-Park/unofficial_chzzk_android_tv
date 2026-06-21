import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_settings.dart';
import 'general_setting.dart';
import 'live_settings.dart';
import 'vod_settings.dart';

export 'chat_settings.dart';
export 'general_setting.dart';
export 'live_settings.dart';
export 'settings_category.dart';
export 'settings_preference.dart';
export 'vod_settings.dart';

part 'settings_preferences.freezed.dart';
part 'settings_preferences.g.dart';

@freezed
abstract class SettingsPreferences with _$SettingsPreferences {
  const SettingsPreferences._();

  const factory SettingsPreferences({
    @Default(defaultGeneralSetting) GeneralSetting generalSetting,
    @Default(defaultLiveSettings) LiveSettings liveSettings,
    @Default(defaultVodSettings) VodSettings vodSettings,
    @Default(defaultChatSettings) ChatSettings chatSettings,
  }) = _SettingsPreferences;

  factory SettingsPreferences.fromJson(Map<String, dynamic> json) =>
      _$SettingsPreferencesFromJson(json);
}

const defaultSettingsPreferences = SettingsPreferences();
