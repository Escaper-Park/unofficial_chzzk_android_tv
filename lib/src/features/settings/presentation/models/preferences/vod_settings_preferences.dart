import '../../../domain/entities/settings_preferences.dart';
import '../../settings_screen_string.dart';
import '../settings_preference_models.dart';

final vodSettingsPreferences = <SettingsPreferenceItem>[
  vodPreference(
    title: SettingsScreenString.vodDefaultResolutionTitle,
    description: SettingsScreenString.vodDefaultResolutionDescription,
    optionSet: settingsResolutionOptionSet,
    read: (settings) => settings.resolutionIndex,
    write: (settings, value) => settings.copyWith(resolutionIndex: value),
    label: SettingsScreenString.resolutionLabel,
  ),
  vodPreference(
    title: SettingsScreenString.vodChatWindowTitle,
    description: SettingsScreenString.vodChatWindowDescription,
    optionSet: settingsChatWindowOptionSet,
    read: (settings) => settings.chatWindowIndex,
    write: (settings, value) => settings.copyWith(chatWindowIndex: value),
    label: SettingsScreenString.chatWindowLabel,
  ),
  vodPreference(
    title: SettingsScreenString.vodPlaybackIntervalTitle,
    description: SettingsScreenString.vodPlaybackIntervalDescription,
    optionSet: settingsVodPlaybackIntervalOptionSet,
    read: (settings) => settings.playbackIntervalIndex,
    write: (settings, value) => settings.copyWith(
      playbackIntervalIndex: value,
    ),
    label: SettingsScreenString.vodPlaybackIntervalLabel,
  ),
];
