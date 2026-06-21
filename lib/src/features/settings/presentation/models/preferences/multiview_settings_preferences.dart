import 'package:flutter/material.dart';

import '../../../domain/entities/settings_preferences.dart';
import '../../settings_screen_string.dart';
import '../settings_preference_models.dart';

final multiviewSettingsPreferences = <SettingsPreferenceItem>[
  livePreference(
    title: SettingsScreenString.liveMultiviewMaxCountTitle,
    description: SettingsScreenString.liveMultiviewMaxCountDescription,
    optionSet: settingsMultiviewMaxCountOptionSet,
    read: (settings) => settings.multiviewMaxCount,
    write: (settings, value) => settings.copyWith(multiviewMaxCount: value),
    label: SettingsScreenString.rawValue,
  ),
  livePreference(
    title: SettingsScreenString.liveMultiviewResolutionTitle,
    description: SettingsScreenString.liveMultiviewResolutionDescription,
    optionSet: settingsResolutionOptionSet,
    read: (settings) => settings.multiviewResolutionIndex,
    write: (settings, value) => settings.copyWith(
      multiviewResolutionIndex: value,
    ),
    label: SettingsScreenString.resolutionLabel,
  ),
  livePreference(
    title: SettingsScreenString.liveMultiviewScreenModeTitle,
    description: SettingsScreenString.liveMultiviewScreenModeDescription,
    optionSet: settingsMultiviewScreenModeOptionSet,
    read: (settings) => settings.multiviewScreenModeIndex,
    write: (settings, value) => settings.copyWith(
      multiviewScreenModeIndex: value,
    ),
    label: SettingsScreenString.multiviewScreenModeLabel,
  ),
  livePreference(
    title: SettingsScreenString.liveMultiviewChatWindowTitle,
    description: SettingsScreenString.liveMultiviewChatWindowDescription,
    optionSet: settingsMultiviewChatWindowOptionSet,
    read: (settings) => settings.multiviewChatWindowIndex,
    write: (settings, value) => settings.copyWith(
      multiviewChatWindowIndex: value,
    ),
    label: SettingsScreenString.multiviewChatWindowLabel,
  ),
  livePreference(
    title: SettingsScreenString.liveMultiviewChatPositionXTitle,
    description: SettingsScreenString.liveMultiviewChatPositionXDescription,
    optionSet: settingsPositionOptionSet,
    read: (settings) => settings.multiviewChatPositionX,
    write: (settings, value) => settings.copyWith(
      multiviewChatPositionX: value,
    ),
    label: SettingsScreenString.percent,
    actionIcon: Icons.open_with,
  ),
  livePreference(
    title: SettingsScreenString.liveMultiviewChatPositionYTitle,
    description: SettingsScreenString.liveMultiviewChatPositionYDescription,
    optionSet: settingsPositionOptionSet,
    read: (settings) => settings.multiviewChatPositionY,
    write: (settings, value) => settings.copyWith(
      multiviewChatPositionY: value,
    ),
    label: SettingsScreenString.percent,
    actionIcon: Icons.open_with,
  ),
  livePreference(
    title: SettingsScreenString.liveMultiviewPipLayoutTitle,
    description: SettingsScreenString.liveMultiviewPipLayoutDescription,
    optionSet: settingsMultiviewPipLayoutOptionSet,
    read: (settings) => settings.multiviewPipLayoutIndex,
    write: (settings, value) => settings.copyWith(
      multiviewPipLayoutIndex: value,
    ),
    label: SettingsScreenString.multiviewPipLayoutLabel,
  ),
  livePreference(
    title: SettingsScreenString.liveMultiviewPipPositionXTitle,
    description: SettingsScreenString.liveMultiviewPipPositionXDescription,
    optionSet: settingsPositionOptionSet,
    read: (settings) => settings.multiviewPipPositionX,
    write: (settings, value) => settings.copyWith(multiviewPipPositionX: value),
    label: SettingsScreenString.percent,
    actionIcon: Icons.open_with,
  ),
  livePreference(
    title: SettingsScreenString.liveMultiviewPipPositionYTitle,
    description: SettingsScreenString.liveMultiviewPipPositionYDescription,
    optionSet: settingsPositionOptionSet,
    read: (settings) => settings.multiviewPipPositionY,
    write: (settings, value) => settings.copyWith(multiviewPipPositionY: value),
    label: SettingsScreenString.percent,
    actionIcon: Icons.open_with,
  ),
  livePreference(
    title: SettingsScreenString.liveMultiviewPipSizeTitle,
    description: SettingsScreenString.liveMultiviewPipSizeDescription,
    optionSet: settingsMultiviewPipSizeOptionSet,
    read: (settings) => settings.multiviewPipSize,
    write: (settings, value) => settings.copyWith(multiviewPipSize: value),
    label: SettingsScreenString.percent,
    actionIcon: Icons.aspect_ratio,
  ),
];
