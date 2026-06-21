part of 'vod_player_bloc.dart';

extension _VodPlayerBlocPreferencesHelpers on VodPlayerBloc {
  Future<void> _onPreferencesChanged(
    _PreferencesChanged event,
    Emitter<VodPlayerState> emit,
  ) async {
    final previousPreferences = state.settingsPreferences;
    final preferences = event.preferences;
    final shouldRefreshPlaybackSource = _shouldRefreshPlaybackSource(
      previousPreferences,
      preferences,
    );

    emit(state.copyWith(settingsPreferences: preferences));

    if (shouldRefreshPlaybackSource) {
      await _refreshActivePlaybackSource(emit, preferences);
    }

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
