part of 'live_player_bloc.dart';

extension _LivePlayerBlocBrowseHelpers on LivePlayerBloc {
  Future<void> _onBrowseRequested(
    _BrowseRequested event,
    Emitter<LivePlayerState> emit,
  ) async {
    final slot = state.activeSlot;
    if (slot.channelId == null) {
      return;
    }

    final requestSerial = ++_browseRequestSerial;
    final openingState = state.copyWith(
      overlayMode: LivePlayerOverlayMode.browse,
      isSignedIn: event.isSignedIn,
    );
    final openingSection = openingState.initialBrowseSection;
    emit(_browseLoadingState(openingState, openingSection));

    var preferences = state.settingsPreferences;
    try {
      preferences = await settingsPreferencesRepository.read();
      if (requestSerial != _browseRequestSerial) {
        return;
      }

      _persistedSettingsPreferences = preferences;
    } on Object {
      // Keep the existing preferences if reading them fails.
    }
    if (requestSerial != _browseRequestSerial) {
      return;
    }

    var groupCollection = state.groupCollection;
    try {
      groupCollection = await groupRepository.read();
      if (requestSerial != _browseRequestSerial) {
        return;
      }
    } on Object {
      // Keep the existing group state if reading it fails.
    }
    if (requestSerial != _browseRequestSerial) {
      return;
    }

    final refreshedState = state.copyWith(
      settingsPreferences: preferences,
      groupCollection: groupCollection,
    );
    final section = refreshedState.effectiveBrowseSection(openingSection);
    emit(_browseLoadingState(refreshedState, section));
    await _loadBrowseSection(
      emit,
      section,
      requestSerial: requestSerial,
    );
  }

  void _onBrowseClosed(
    _BrowseClosed event,
    Emitter<LivePlayerState> emit,
  ) {
    ++_browseRequestSerial;
    emit(
      state.copyWith(
        overlayMode: LivePlayerOverlayMode.none,
        browseLoadingMore: false,
        pendingReplacementLive: null,
      ),
    );
  }

  Future<void> _onBrowseNextSectionRequested(
    _BrowseNextSectionRequested event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (state.overlayMode != LivePlayerOverlayMode.browse) {
      return;
    }

    await _switchBrowseSection(emit, state.nextBrowseSection);
  }

  Future<void> _onBrowsePreviousSectionRequested(
    _BrowsePreviousSectionRequested event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (state.overlayMode != LivePlayerOverlayMode.browse) {
      return;
    }

    await _switchBrowseSection(emit, state.previousBrowseSection);
  }

  Future<void> _onBrowseFallbackPressed(
    _BrowseFallbackPressed event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (state.overlayMode != LivePlayerOverlayMode.browse) {
      return;
    }

    switch (state.browseFallbackAction) {
      case LivePlayerBrowseFallbackAction.none:
        return;
      case LivePlayerBrowseFallbackAction.showPopular:
        await _switchBrowseSection(emit, LivePlayerBrowseSection.popular);
      case LivePlayerBrowseFallbackAction.closeBrowse:
        add(const LivePlayerEvent.browseClosed());
    }
  }

  Future<void> _onBrowseLoadMoreRequested(
    _BrowseLoadMoreRequested event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (state.overlayMode != LivePlayerOverlayMode.browse ||
        state.browseLoadingMore ||
        !state.browseHasMore) {
      return;
    }

    final section = state.browseSection;
    if (section != LivePlayerBrowseSection.popular &&
        section != LivePlayerBrowseSection.category) {
      return;
    }

    final requestSerial = _browseRequestSerial;
    final existingItems = state.browseItems;
    emit(state.copyWith(browseLoadingMore: true));

    try {
      final result = await _fetchBrowseSection(
        section,
        liveCursor: state.browseLiveCursor,
        categoryCursor: state.browseCategoryCursor,
      );
      if (requestSerial != _browseRequestSerial ||
          state.overlayMode != LivePlayerOverlayMode.browse ||
          state.browseSection != section) {
        return;
      }

      emit(
        state.copyWith(
          browseStatus: LivePlayerBrowseLoadStatus.success,
          browseItems: [...existingItems, ...result.items],
          browseLiveCursor: result.liveCursor,
          browseCategoryCursor: result.categoryCursor,
          browseHasMore: result.hasMore,
          browseLoadingMore: false,
          browseFallbackAction: LivePlayerBrowseFallbackAction.none,
        ),
      );
    } on Object {
      if (requestSerial != _browseRequestSerial ||
          state.overlayMode != LivePlayerOverlayMode.browse ||
          state.browseSection != section) {
        return;
      }

      emit(
        state.copyWith(
          browseHasMore: false,
          browseLoadingMore: false,
        ),
      );
    }
  }
}
