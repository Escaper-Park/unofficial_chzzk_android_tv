import '../../domain/entities/settings_preferences.dart';
import 'preferences/chat_settings_preferences.dart';
import 'preferences/general_setting_preferences.dart';
import 'preferences/live_settings_preferences.dart';
import 'preferences/multiview_settings_preferences.dart';
import 'preferences/vod_settings_preferences.dart';
import 'settings_preference_models.dart';

export 'settings_preference_models.dart';

List<SettingsPreferenceItem> settingsPreferencesFor(
  SettingsCategoryId category,
) {
  return switch (category) {
    SettingsCategoryId.general => generalSettingPreferences,
    SettingsCategoryId.liveStreaming => liveSettingsPreferences,
    SettingsCategoryId.multiview => multiviewSettingsPreferences,
    SettingsCategoryId.vodStreaming => vodSettingsPreferences,
    SettingsCategoryId.chat => chatSettingsPreferences,
    SettingsCategoryId.updates ||
    SettingsCategoryId.faq ||
    SettingsCategoryId.appInfo => const [],
  };
}

SettingsPreferenceItem? settingsPreferenceByRef(SettingsPreferenceRef ref) {
  final items = settingsPreferencesFor(ref.category);
  if (ref.index < 0 || ref.index >= items.length) {
    return null;
  }

  return items[ref.index];
}
