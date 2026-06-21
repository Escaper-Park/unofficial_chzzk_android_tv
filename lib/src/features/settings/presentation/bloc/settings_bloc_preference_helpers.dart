part of 'settings_bloc.dart';

extension _SettingsBlocPreferenceHelpers on SettingsBloc {
  Future<void> _onStarted(
    _Started event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(loadStatus: SettingsLoadStatus.loading));

    try {
      final preferences = await preferencesRepository.read();
      _persistedPreferences = preferences;
      emit(
        state.copyWith(
          loadStatus: SettingsLoadStatus.ready,
          saveStatus: SettingsSaveStatus.idle,
          preferences: preferences,
        ),
      );
    } on Object {
      emit(state.copyWith(loadStatus: SettingsLoadStatus.failure));
    }
  }

  void _onMenuSelected(
    _MenuSelected event,
    Emitter<SettingsState> emit,
  ) {
    if (event.category == state.selectedCategory) {
      return;
    }

    emit(
      state.copyWith(
        selectedCategory: event.category,
        activeEditor: null,
      ),
    );
  }

  Future<void> _onToggleRequested(
    _ToggleRequested event,
    Emitter<SettingsState> emit,
  ) async {
    final item = settingsPreferenceByRef(event.ref);
    if (item == null ||
        item.optionSet.controlType != SettingsPreferenceControlType.toggle) {
      return;
    }

    final currentValue = item.read(state.preferences);
    final updated = item.writeNormalized(
      state.preferences,
      currentValue == 0 ? 1 : 0,
    );
    await _savePreferences(updated, emit);
  }

  void _onEditorOpened(
    _EditorOpened event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(activeEditor: event.ref));
  }

  Future<void> _onEditorClosed(
    _EditorClosed event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(activeEditor: null));
    await _flushPendingSliderSave(emit);
  }

  Future<void> _onOptionSelected(
    _OptionSelected event,
    Emitter<SettingsState> emit,
  ) async {
    final item = settingsPreferenceByRef(event.ref);
    if (item == null) {
      return;
    }

    await _savePreferences(
      item.writeNormalized(state.preferences, event.value),
      emit,
      closeEditor: true,
    );
  }

  void _onSliderChanged(
    _SliderChanged event,
    Emitter<SettingsState> emit,
  ) {
    final item = settingsPreferenceByRef(event.ref);
    if (item == null ||
        item.optionSet.controlType != SettingsPreferenceControlType.slider) {
      return;
    }

    final updated = item.writeNormalized(state.preferences, event.value);
    _sliderPreferencesCommit.setPendingValue(updated);
    emit(state.copyWith(preferences: updated));
  }

  void _onSliderChangeCommitted(
    _SliderChangeCommitted event,
    Emitter<SettingsState> emit,
  ) {
    _schedulePendingSliderSave();
  }

  Future<void> _onSliderSaveDebounceElapsed(
    _SliderSaveDebounceElapsed event,
    Emitter<SettingsState> emit,
  ) async {
    await _flushPendingSliderSave(emit);
  }

  Future<void> _onResetRequested(
    _ResetRequested event,
    Emitter<SettingsState> emit,
  ) async {
    var preferences = state.preferences;
    for (final item in settingsPreferencesFor(state.selectedCategory)) {
      preferences = item.reset(preferences);
    }

    await _savePreferences(preferences, emit);
  }

  void _schedulePendingSliderSave() {
    _sliderPreferencesCommit.schedule();
  }

  Future<void> _flushPendingSliderSave(Emitter<SettingsState> emit) async {
    if (!_sliderPreferencesCommit.hasPendingValue) {
      return;
    }

    final pendingPreferences = _sliderPreferencesCommit.takePendingValue();
    await _savePreferences(pendingPreferences, emit);
  }

  void _clearPendingSliderSave() {
    _sliderPreferencesCommit.clear();
  }

  Future<void> _savePreferences(
    SettingsPreferences preferences,
    Emitter<SettingsState> emit, {
    bool closeEditor = false,
  }) async {
    _clearPendingSliderSave();
    final previousActiveEditor = state.activeEditor;

    emit(
      state.copyWith(
        preferences: preferences,
        saveStatus: SettingsSaveStatus.saving,
        activeEditor: closeEditor ? null : state.activeEditor,
      ),
    );

    try {
      await preferencesRepository.save(preferences);
      _persistedPreferences = preferences;
      emit(state.copyWith(saveStatus: SettingsSaveStatus.idle));
    } on Object {
      emit(
        state.copyWith(
          preferences: _persistedPreferences,
          saveStatus: SettingsSaveStatus.failure,
          activeEditor: closeEditor ? previousActiveEditor : state.activeEditor,
        ),
      );
    }
  }
}
