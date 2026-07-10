part of 'live_player_bloc.dart';

extension _LivePlayerBlocPreferencesHelpers on LivePlayerBloc {
  Future<void> _onPreferencesChanged(
    _PreferencesChanged event,
    Emitter<LivePlayerState> emit,
  ) async {
    final before = state;
    final transitionSerial = _beginMultiviewPlaybackTransition();
    final previousPreferences = before.settingsPreferences;
    final preferences = event.preferences;
    final wasMultiview = before.isMultiview;
    final multiviewLayoutMode = _multiviewLayoutModeForIndex(
      preferences.liveSettings.multiviewScreenModeIndex,
    );
    final enteringPipLayout =
        wasMultiview &&
        before.multiviewLayoutMode != LivePlayerMultiviewLayoutMode.pip &&
        multiviewLayoutMode == LivePlayerMultiviewLayoutMode.pip;
    final shouldRefreshPlaybackSource = wasMultiview
        ? _shouldRefreshMultiviewPlaybackSources(
            previousPreferences,
            preferences,
          )
        : _shouldRefreshSinglePlaybackSource(previousPreferences, preferences);

    if (shouldRefreshPlaybackSource || enteringPipLayout) {
      final projectedState = before.copyWith(
        settingsPreferences: preferences,
        multiviewLayoutMode: multiviewLayoutMode,
      );
      final updates = await _resolveMultiviewPlaybackSourceBatch(
        projectedState: projectedState,
        preferences: preferences,
      );
      if (updates == null ||
          emit.isDone ||
          !_multiviewPlaybackTransitionStillCurrent(
            before,
            transitionSerial,
          )) {
        return;
      }

      final latest = state;
      emit(
        latest.copyWith(
          settingsPreferences: preferences,
          multiviewLayoutMode: multiviewLayoutMode,
          slots: _applyPlaybackSourceBatch(latest.slots, updates),
        ),
      );
      await _savePersistentPreferences(preferences);
      return;
    }

    emit(
      before.copyWith(
        settingsPreferences: preferences,
        multiviewLayoutMode: multiviewLayoutMode,
      ),
    );

    await _savePersistentPreferences(preferences);
  }

  Future<void> _savePersistentPreferences(
    SettingsPreferences preferences,
  ) {
    final queuedSave = _preferencesSaveQueue.then<void>((_) async {
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
    });
    _preferencesSaveQueue = queuedSave;
    return queuedSave;
  }
}
