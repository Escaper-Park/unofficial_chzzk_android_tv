part of 'vod_player_bloc.dart';

const _browsePageSize = 12;

extension _VodPlayerBlocBrowseHelpers on VodPlayerBloc {
  Future<void> _onBrowseRequested(
    _BrowseRequested event,
    Emitter<VodPlayerState> emit,
  ) async {
    final channelId = state.activeSlot.channelId;
    if (channelId == null) {
      return;
    }

    final requestSerial = ++_browseRequestSerial;
    emit(_browseLoadingState(state));

    await _loadBrowsePage(
      emit,
      channelId: channelId,
      page: 0,
      requestSerial: requestSerial,
      existingItems: const [],
    );
  }

  void _onBrowseClosed(
    _BrowseClosed event,
    Emitter<VodPlayerState> emit,
  ) {
    ++_browseRequestSerial;
    emit(
      state.copyWith(
        overlayMode: VodPlayerOverlayMode.none,
        browseLoadingMore: false,
      ),
    );
  }

  void _onBrowseFallbackPressed(
    _BrowseFallbackPressed event,
    Emitter<VodPlayerState> emit,
  ) {
    if (state.overlayMode != VodPlayerOverlayMode.browse ||
        state.browseFallbackAction !=
            VodPlayerBrowseFallbackAction.closeBrowse) {
      return;
    }

    add(const VodPlayerEvent.browseClosed());
  }

  Future<void> _onBrowseLoadMoreRequested(
    _BrowseLoadMoreRequested event,
    Emitter<VodPlayerState> emit,
  ) async {
    if (state.overlayMode != VodPlayerOverlayMode.browse ||
        state.browseLoadingMore ||
        !state.browseHasMore) {
      return;
    }

    final channelId = state.activeSlot.channelId;
    final nextPage = state.browseNextPage;
    if (channelId == null || nextPage == null) {
      return;
    }

    final requestSerial = _browseRequestSerial;
    final existingItems = state.browseItems;
    emit(state.copyWith(browseLoadingMore: true));

    await _loadBrowsePage(
      emit,
      channelId: channelId,
      page: nextPage,
      requestSerial: requestSerial,
      existingItems: existingItems,
      loadingMore: true,
    );
  }

  Future<void> _onBrowseVodSelected(
    _BrowseVodSelected event,
    Emitter<VodPlayerState> emit,
  ) async {
    ++_browseRequestSerial;
    emit(
      state.copyWith(
        overlayMode: VodPlayerOverlayMode.none,
        browseLoadingMore: false,
      ),
    );

    await _loadTarget(emit, event.target);
  }
}
