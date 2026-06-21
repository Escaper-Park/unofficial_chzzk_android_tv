part of 'live_player_bloc.dart';

extension _LivePlayerBlocBrowseFetchHelpers on LivePlayerBloc {
  Future<LivePlayerBrowseLoadResult> _fetchBrowseSection(
    LivePlayerBrowseSection section, {
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
      ),
    );
  }
}
