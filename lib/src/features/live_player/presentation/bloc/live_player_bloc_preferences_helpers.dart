part of 'live_player_bloc.dart';

extension _LivePlayerBlocPreferencesHelpers on LivePlayerBloc {
  Future<void> _onPreferencesChanged(
    _PreferencesChanged event,
    Emitter<LivePlayerState> emit,
  ) async {
    final previousPreferences = state.settingsPreferences;
    final preferences = event.preferences;
    final wasMultiview = state.isMultiview;
    final multiviewLayoutMode = _multiviewLayoutModeForIndex(
      preferences.liveSettings.multiviewScreenModeIndex,
    );
    final enteringPipLayout =
        wasMultiview &&
        state.multiviewLayoutMode != LivePlayerMultiviewLayoutMode.pip &&
        multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip;
    final shouldRefreshPlaybackSource = wasMultiview
        ? _shouldRefreshMultiviewPlaybackSources(
            previousPreferences,
            preferences,
          )
        : _shouldRefreshSinglePlaybackSource(previousPreferences, preferences);

    emit(
      state.copyWith(
        settingsPreferences: preferences,
        multiviewLayoutMode: multiviewLayoutMode,
      ),
    );

    if (shouldRefreshPlaybackSource || enteringPipLayout) {
      if (wasMultiview) {
        await _refreshMultiviewPlaybackSources(emit, preferences);
      } else {
        await _refreshActivePlaybackSource(emit, preferences);
      }
    }

    await _savePersistentPreferences(preferences);
  }

  Future<void> _savePersistentPreferences(
    SettingsPreferences preferences,
  ) async {
    final preferencesToSave = _preferencesForPersistentSave(
      preferences,
      persisted: _persistedSettingsPreferences,
    );
    if (preferencesToSave == _persistedSettingsPreferences) {
      return;
    }

    try {
      await settingsPreferencesRepository.save(preferencesToSave);
      _persistedSettingsPreferences = preferencesToSave;
    } on Object {
      // Keep optimistic UI state; settings screen can surface persistence errors.
    }
  }
}
