import '../../../domain/entities/settings_preferences.dart';
import '../../settings_screen_string.dart';
import '../settings_preference_models.dart';

final liveSettingsPreferences = <SettingsPreferenceItem>[
  livePreference(
    title: SettingsScreenString.liveLatencyTitle,
    description: SettingsScreenString.liveLatencyDescription,
    optionSet: settingsLatencyOptionSet,
    read: (settings) => settings.latencyIndex,
    write: (settings, value) => settings.copyWith(latencyIndex: value),
    label: SettingsScreenString.latencyLabel,
  ),
  livePreference(
    title: SettingsScreenString.liveShowGroupControlsTitle,
    description: SettingsScreenString.liveShowGroupControlsDescription,
    optionSet: settingsToggleOptionSet,
    read: (settings) => settings.showGroupInVideoPlayer,
    write: (settings, value) => settings.copyWith(
      showGroupInVideoPlayer: value,
    ),
    label: SettingsScreenString.toggleLabel,
  ),
  livePreference(
    title: SettingsScreenString.liveDefaultResolutionTitle,
    description: SettingsScreenString.liveDefaultResolutionDescription,
    optionSet: settingsResolutionOptionSet,
    read: (settings) => settings.resolutionIndex,
    write: (settings, value) => settings.copyWith(resolutionIndex: value),
    label: SettingsScreenString.resolutionLabel,
  ),
  livePreference(
    title: SettingsScreenString.liveChatWindowTitle,
    description: SettingsScreenString.liveChatWindowDescription,
    optionSet: settingsChatWindowOptionSet,
    read: (settings) => settings.chatWindowIndex,
    write: (settings, value) => settings.copyWith(chatWindowIndex: value),
    label: SettingsScreenString.chatWindowLabel,
  ),
];
