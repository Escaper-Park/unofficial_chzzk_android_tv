import 'package:flutter/widgets.dart';

import '../../domain/entities/settings_preferences.dart';

typedef SettingsValueReader = int Function(SettingsPreferences preferences);
typedef SettingsValueWriter =
    SettingsPreferences Function(SettingsPreferences preferences, int value);
typedef SettingsValueLabel = String Function(int value);
typedef SettingsValueIcon = IconData? Function(int value);
typedef SettingsValueIconAlignment = Alignment Function(int value);

@immutable
final class SettingsPreferenceRef {
  const SettingsPreferenceRef({
    required this.category,
    required this.index,
  });

  final SettingsCategoryId category;
  final int index;

  @override
  bool operator ==(Object other) {
    return other is SettingsPreferenceRef &&
        other.category == category &&
        other.index == index;
  }

  @override
  int get hashCode => Object.hash(category, index);
}

final class SettingsPreferenceItem {
  const SettingsPreferenceItem({
    required this.title,
    required this.description,
    required this.optionSet,
    required this.read,
    required this.write,
    required this.label,
    this.actionIcon,
    this.icon,
    this.iconAlignment,
    this.wrapSlider = false,
  });

  final String title;
  final String description;
  final SettingsPreferenceOptionSet optionSet;
  final SettingsValueReader read;
  final SettingsValueWriter write;
  final SettingsValueLabel label;
  final IconData? actionIcon;
  final SettingsValueIcon? icon;
  final SettingsValueIconAlignment? iconAlignment;
  final bool wrapSlider;

  SettingsPreferences writeNormalized(
    SettingsPreferences preferences,
    int value,
  ) {
    return write(preferences, optionSet.normalize(value));
  }

  SettingsPreferences reset(SettingsPreferences preferences) {
    return writeNormalized(preferences, read(defaultSettingsPreferences));
  }
}

SettingsPreferenceItem generalPreference({
  required String title,
  required String description,
  required SettingsPreferenceOptionSet optionSet,
  required int Function(GeneralSetting settings) read,
  required GeneralSetting Function(GeneralSetting settings, int value) write,
  required SettingsValueLabel label,
  IconData? actionIcon,
  SettingsValueIcon? icon,
  SettingsValueIconAlignment? iconAlignment,
  bool wrapSlider = false,
}) {
  return SettingsPreferenceItem(
    title: title,
    description: description,
    optionSet: optionSet,
    read: (preferences) => read(preferences.generalSetting),
    write: (preferences, value) => preferences.copyWith(
      generalSetting: write(preferences.generalSetting, value),
    ),
    label: label,
    actionIcon: actionIcon,
    icon: icon,
    iconAlignment: iconAlignment,
    wrapSlider: wrapSlider,
  );
}

SettingsPreferenceItem livePreference({
  required String title,
  required String description,
  required SettingsPreferenceOptionSet optionSet,
  required int Function(LiveSettings settings) read,
  required LiveSettings Function(LiveSettings settings, int value) write,
  required SettingsValueLabel label,
  IconData? actionIcon,
  SettingsValueIcon? icon,
  SettingsValueIconAlignment? iconAlignment,
  bool wrapSlider = false,
}) {
  return SettingsPreferenceItem(
    title: title,
    description: description,
    optionSet: optionSet,
    read: (preferences) => read(preferences.liveSettings),
    write: (preferences, value) => preferences.copyWith(
      liveSettings: write(preferences.liveSettings, value),
    ),
    label: label,
    actionIcon: actionIcon,
    icon: icon,
    iconAlignment: iconAlignment,
    wrapSlider: wrapSlider,
  );
}

SettingsPreferenceItem vodPreference({
  required String title,
  required String description,
  required SettingsPreferenceOptionSet optionSet,
  required int Function(VodSettings settings) read,
  required VodSettings Function(VodSettings settings, int value) write,
  required SettingsValueLabel label,
  IconData? actionIcon,
  SettingsValueIcon? icon,
  SettingsValueIconAlignment? iconAlignment,
  bool wrapSlider = false,
}) {
  return SettingsPreferenceItem(
    title: title,
    description: description,
    optionSet: optionSet,
    read: (preferences) => read(preferences.vodSettings),
    write: (preferences, value) => preferences.copyWith(
      vodSettings: write(preferences.vodSettings, value),
    ),
    label: label,
    actionIcon: actionIcon,
    icon: icon,
    iconAlignment: iconAlignment,
    wrapSlider: wrapSlider,
  );
}

SettingsPreferenceItem chatPreference({
  required String title,
  required String description,
  required SettingsPreferenceOptionSet optionSet,
  required int Function(ChatSettings settings) read,
  required ChatSettings Function(ChatSettings settings, int value) write,
  required SettingsValueLabel label,
  IconData? actionIcon,
  SettingsValueIcon? icon,
  SettingsValueIconAlignment? iconAlignment,
  bool wrapSlider = false,
}) {
  return SettingsPreferenceItem(
    title: title,
    description: description,
    optionSet: optionSet,
    read: (preferences) => read(preferences.chatSettings),
    write: (preferences, value) => preferences.copyWith(
      chatSettings: write(preferences.chatSettings, value),
    ),
    label: label,
    actionIcon: actionIcon,
    icon: icon,
    iconAlignment: iconAlignment,
    wrapSlider: wrapSlider,
  );
}
