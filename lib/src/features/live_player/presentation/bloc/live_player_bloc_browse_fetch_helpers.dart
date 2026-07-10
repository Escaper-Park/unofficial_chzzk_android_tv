part of 'live_player_bloc.dart';

extension _LivePlayerBlocBrowseFetchHelpers on LivePlayerBloc {
  Future<LivePlayerBrowseLoadResult> _fetchBrowseSection(
    LivePlayerBrowseSection section, {
    int? requestSerial,
    LiveCursor? liveCursor,
    CategoryLiveCursor? categoryCursor,
  }) async {
    final slot = state.activeSlot;
    return _browseLoader.load(
      LivePlayerBrowseRequest(
        section: section,
        liveCursor: liveCursor,
        categoryCursor: categoryCursor,
        categoryType: slot.categoryType,
        categoryId: slot.categoryId,
        recentLiveChannelIds: List.unmodifiable(_recentLiveChannelIds),
        groupMemberChannelIds:
            state.activeGroup?.memberChannelIds ?? const <String>[],
        isCancelled: requestSerial == null
            ? null
            : () =>
                  isClosed ||
                  requestSerial != _browseRequestSerial ||
                  state.overlayMode != LivePlayerOverlayMode.browse ||
                  state.browseSection != section,
      ),
    );
  }
}
