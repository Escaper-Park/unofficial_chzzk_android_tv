part of 'settings_bloc.dart';

enum SettingsLoadStatus {
  initial,
  loading,
  ready,
  failure,
}

enum SettingsSaveStatus {
  idle,
  saving,
  failure,
}

enum SettingsUpdateStatus {
  idle,
  checking,
  success,
  failure,
}

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(SettingsLoadStatus.initial) SettingsLoadStatus loadStatus,
    @Default(SettingsSaveStatus.idle) SettingsSaveStatus saveStatus,
    @Default(SettingsUpdateStatus.idle) SettingsUpdateStatus updateStatus,
    @Default(SettingsCategoryId.general) SettingsCategoryId selectedCategory,
    @Default(defaultSettingsPreferences) SettingsPreferences preferences,
    SettingsPreferenceRef? activeEditor,
    SettingsUpdateInfo? latestRelease,
  }) = _SettingsState;
}
