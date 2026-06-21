part of 'settings_bloc.dart';

@freezed
sealed class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.started() = _Started;

  const factory SettingsEvent.menuSelected(SettingsCategoryId category) =
      _MenuSelected;

  const factory SettingsEvent.toggleRequested(SettingsPreferenceRef ref) =
      _ToggleRequested;

  const factory SettingsEvent.editorOpened(SettingsPreferenceRef ref) =
      _EditorOpened;

  const factory SettingsEvent.editorClosed() = _EditorClosed;

  const factory SettingsEvent.optionSelected({
    required SettingsPreferenceRef ref,
    required int value,
  }) = _OptionSelected;

  const factory SettingsEvent.sliderChanged({
    required SettingsPreferenceRef ref,
    required int value,
  }) = _SliderChanged;

  const factory SettingsEvent.sliderChangeCommitted() = _SliderChangeCommitted;

  const factory SettingsEvent.sliderSaveDebounceElapsed() =
      _SliderSaveDebounceElapsed;

  const factory SettingsEvent.resetRequested() = _ResetRequested;

  const factory SettingsEvent.updateCheckRequested() = _UpdateCheckRequested;
}
