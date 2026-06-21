import '../../../domain/entities/settings_preferences.dart';
import '../../settings_screen_string.dart';
import '../settings_preference_models.dart';

final generalSettingPreferences = <SettingsPreferenceItem>[
  generalPreference(
    title: SettingsScreenString.generalShowImmersiveTitle,
    description: SettingsScreenString.generalShowImmersiveDescription,
    optionSet: settingsToggleOptionSet,
    read: (settings) => settings.showImmersive,
    write: (settings, value) => settings.copyWith(showImmersive: value),
    label: SettingsScreenString.toggleLabel,
  ),
  generalPreference(
    title: SettingsScreenString.generalShowFollowingLiveTitle,
    description: SettingsScreenString.generalShowFollowingLiveDescription,
    optionSet: settingsToggleOptionSet,
    read: (settings) => settings.showFollowingLive,
    write: (settings, value) => settings.copyWith(
      showFollowingLive: value,
    ),
    label: SettingsScreenString.toggleLabel,
  ),
  generalPreference(
    title: SettingsScreenString.generalShowPopularLiveTitle,
    description: SettingsScreenString.generalShowPopularLiveDescription,
    optionSet: settingsToggleOptionSet,
    read: (settings) => settings.showPopularLive,
    write: (settings, value) => settings.copyWith(showPopularLive: value),
    label: SettingsScreenString.toggleLabel,
  ),
  generalPreference(
    title: SettingsScreenString.generalShowWatchingHistoryTitle,
    description: SettingsScreenString.generalShowWatchingHistoryDescription,
    optionSet: settingsToggleOptionSet,
    read: (settings) => settings.showWatchingHistory,
    write: (settings, value) => settings.copyWith(
      showWatchingHistory: value,
    ),
    label: SettingsScreenString.toggleLabel,
  ),
  generalPreference(
    title: SettingsScreenString.generalShowPopularVodTitle,
    description: SettingsScreenString.generalShowPopularVodDescription,
    optionSet: settingsToggleOptionSet,
    read: (settings) => settings.showPopularVod,
    write: (settings, value) => settings.copyWith(showPopularVod: value),
    label: SettingsScreenString.toggleLabel,
  ),
  generalPreference(
    title: SettingsScreenString.generalShowFollowingCategoryTitle,
    description: SettingsScreenString.generalShowFollowingCategoryDescription,
    optionSet: settingsToggleOptionSet,
    read: (settings) => settings.showFollowingCategory,
    write: (settings, value) => settings.copyWith(
      showFollowingCategory: value,
    ),
    label: SettingsScreenString.toggleLabel,
  ),
  generalPreference(
    title: SettingsScreenString.generalShowTrendingCategoryTitle,
    description: SettingsScreenString.generalShowTrendingCategoryDescription,
    optionSet: settingsToggleOptionSet,
    read: (settings) => settings.showTrendingCategory,
    write: (settings, value) => settings.copyWith(
      showTrendingCategory: value,
    ),
    label: SettingsScreenString.toggleLabel,
  ),
  generalPreference(
    title: SettingsScreenString.generalStreamingPreviewTitle,
    description: SettingsScreenString.generalStreamingPreviewDescription,
    optionSet: settingsToggleOptionSet,
    read: (settings) => settings.streamingPreview,
    write: (settings, value) => settings.copyWith(streamingPreview: value),
    label: SettingsScreenString.toggleLabel,
  ),
  generalPreference(
    title: SettingsScreenString.generalStreamingPreviewAudioTitle,
    description: SettingsScreenString.generalStreamingPreviewAudioDescription,
    optionSet: settingsToggleOptionSet,
    read: (settings) => settings.streamingPreviewAudioEnabled,
    write: (settings, value) => settings.copyWith(
      streamingPreviewAudioEnabled: value,
    ),
    label: SettingsScreenString.toggleLabel,
  ),
  generalPreference(
    title: SettingsScreenString.generalStreamingPreviewDelayTitle,
    description: SettingsScreenString.generalStreamingPreviewDelayDescription,
    optionSet: settingsStreamingPreviewSecondsOptionSet,
    read: (settings) => settings.streamingPreviewSeconds,
    write: (settings, value) => settings.copyWith(
      streamingPreviewSeconds: value,
    ),
    label: SettingsScreenString.seconds,
  ),
  generalPreference(
    title: SettingsScreenString.generalStreamingPreviewDurationTitle,
    description:
        SettingsScreenString.generalStreamingPreviewDurationDescription,
    optionSet: settingsStreamingPreviewDurationOptionSet,
    read: (settings) => settings.streamingPreviewDurationIndex,
    write: (settings, value) => settings.copyWith(
      streamingPreviewDurationIndex: value,
    ),
    label: SettingsScreenString.streamingPreviewDurationLabel,
  ),
  generalPreference(
    title: SettingsScreenString.generalImmersivePreviewResolutionTitle,
    description:
        SettingsScreenString.generalImmersivePreviewResolutionDescription,
    optionSet: settingsResolutionOptionSet,
    read: (settings) => settings.streamingPreviewResolutionIndex,
    write: (settings, value) => settings.copyWith(
      streamingPreviewResolutionIndex: value,
    ),
    label: SettingsScreenString.resolutionLabel,
  ),
  generalPreference(
    title: SettingsScreenString.generalLiveCardPreviewResolutionTitle,
    description:
        SettingsScreenString.generalLiveCardPreviewResolutionDescription,
    optionSet: settingsResolutionOptionSet,
    read: (settings) => settings.liveCardPreviewResolutionIndex,
    write: (settings, value) => settings.copyWith(
      liveCardPreviewResolutionIndex: value,
    ),
    label: SettingsScreenString.resolutionLabel,
  ),
  generalPreference(
    title: SettingsScreenString.generalOverlayControlsDisplayTimeTitle,
    description:
        SettingsScreenString.generalOverlayControlsDisplayTimeDescription,
    optionSet: settingsOverlayControlsDisplayTimeOptionSet,
    read: (settings) => settings.overlayControlsDisplayTime,
    write: (settings, value) => settings.copyWith(
      overlayControlsDisplayTime: value,
    ),
    label: SettingsScreenString.seconds,
  ),
  generalPreference(
    title: SettingsScreenString.generalVideoViewTypeTitle,
    description: SettingsScreenString.generalVideoViewTypeDescription,
    optionSet: settingsVideoViewTypeOptionSet,
    read: (settings) => settings.videoViewTypeIndex,
    write: (settings, value) => settings.copyWith(videoViewTypeIndex: value),
    label: SettingsScreenString.videoViewTypeLabel,
  ),
];
