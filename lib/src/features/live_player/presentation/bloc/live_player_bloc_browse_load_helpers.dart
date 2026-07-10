part of 'live_player_bloc.dart';

extension _LivePlayerBlocBrowseLoadHelpers on LivePlayerBloc {
  Future<void> _switchBrowseSection(
    Emitter<LivePlayerState> emit,
    LivePlayerBrowseSection section,
  ) async {
    final requestSerial = ++_browseRequestSerial;
    final effectiveSection = state.effectiveBrowseSection(section);
    emit(_browseLoadingState(state, effectiveSection));
    await _loadBrowseSection(
      emit,
      effectiveSection,
      requestSerial: requestSerial,
    );
  }

  Future<void> _loadBrowseSection(
    Emitter<LivePlayerState> emit,
    LivePlayerBrowseSection section, {
    required int requestSerial,
  }) async {
    try {
      final result = await _fetchBrowseSection(
        section,
        requestSerial: requestSerial,
      );
      if (emit.isDone ||
          isClosed ||
          requestSerial != _browseRequestSerial ||
          state.overlayMode != LivePlayerOverlayMode.browse ||
          state.browseSection != section) {
        return;
      }

      if (result.items.isEmpty) {
        if (section == LivePlayerBrowseSection.popular) {
          emit(
            state.copyWith(
              overlayMode: LivePlayerOverlayMode.none,
              browseStatus: LivePlayerBrowseLoadStatus.empty,
              browseItems: const [],
              browseLiveCursor: null,
              browseCategoryCursor: null,
              browseHasMore: false,
              browseLoadingMore: false,
              browseFallbackAction: LivePlayerBrowseFallbackAction.closeBrowse,
            ),
          );
          return;
        }

        emit(
          state.copyWith(
            browseStatus: LivePlayerBrowseLoadStatus.empty,
            browseItems: const [],
            browseLiveCursor: null,
            browseCategoryCursor: null,
            browseHasMore: false,
            browseLoadingMore: false,
            browseFallbackAction: _fallbackActionFor(section),
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          browseStatus: LivePlayerBrowseLoadStatus.success,
          browseItems: result.items,
          browseLiveCursor: result.liveCursor,
          browseCategoryCursor: result.categoryCursor,
          browseHasMore: result.hasMore,
          browseLoadingMore: false,
          browseFallbackAction: LivePlayerBrowseFallbackAction.none,
        ),
      );
    } on Object {
      if (emit.isDone ||
          isClosed ||
          requestSerial != _browseRequestSerial ||
          state.overlayMode != LivePlayerOverlayMode.browse ||
          state.browseSection != section) {
        return;
      }

      emit(
        state.copyWith(
          browseStatus: LivePlayerBrowseLoadStatus.failure,
          browseItems: const [],
          browseLiveCursor: null,
          browseCategoryCursor: null,
          browseHasMore: false,
          browseLoadingMore: false,
          browseFallbackAction: _fallbackActionFor(section),
        ),
      );
    }
  }
}

LivePlayerState _browseLoadingState(
  LivePlayerState state,
  LivePlayerBrowseSection section,
) {
  return state.copyWith(
    overlayMode: LivePlayerOverlayMode.browse,
    browseSection: section,
    browseStatus: LivePlayerBrowseLoadStatus.loading,
    browseItems: const [],
    browseLiveCursor: null,
    browseCategoryCursor: null,
    browseHasMore: false,
    browseLoadingMore: false,
    browseFallbackAction: LivePlayerBrowseFallbackAction.none,
  );
}

LivePlayerBrowseFallbackAction _fallbackActionFor(
  LivePlayerBrowseSection section,
) {
  return switch (section) {
    LivePlayerBrowseSection.following =>
      LivePlayerBrowseFallbackAction.showPopular,
    LivePlayerBrowseSection.popular =>
      LivePlayerBrowseFallbackAction.closeBrowse,
    LivePlayerBrowseSection.category =>
      LivePlayerBrowseFallbackAction.showPopular,
    LivePlayerBrowseSection.recent =>
      LivePlayerBrowseFallbackAction.showPopular,
    LivePlayerBrowseSection.group => LivePlayerBrowseFallbackAction.showPopular,
  };
}

int _wrappedIndex(int index, int length) {
  final wrapped = index % length;
  return wrapped < 0 ? wrapped + length : wrapped;
}
