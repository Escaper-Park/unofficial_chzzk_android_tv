part of 'channel_bloc.dart';

extension _ChannelBlocLoadMoreHelpers on ChannelBloc {
  Future<void> _loadMoreVod(Emitter<ChannelState> emit) async {
    if (state.selectedTab != ChannelTab.vod) {
      return;
    }

    final vod = state.vod;
    if (vod.status != ChannelLoadStatus.ready ||
        vod.paginationStatus == ChannelPaginationStatus.loading ||
        vod.paginationStatus == ChannelPaginationStatus.exhausted) {
      return;
    }

    final nextPage = vod.nextPage;
    if (nextPage == null) {
      emit(
        state.copyWith(
          vod: vod.copyWith(
            paginationStatus: ChannelPaginationStatus.exhausted,
          ),
          feedbackType: ChannelFeedbackType.noMoreData,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        vod: vod.copyWith(paginationStatus: ChannelPaginationStatus.loading),
      ),
    );

    try {
      final profile = await _profileForMapping(emit);
      final page = await channelRepository.getChannelVideos(
        channelId: channelId,
        sortType: state.vodSortOption.sort,
        page: nextPage,
        size: ChannelBloc._vodPageSize,
      );
      final items = vodsFromChannelVideos(page.items, profile);
      final next = _nextPageFor(page);

      emit(
        state.copyWith(
          vod: ChannelPageData<Vod>(
            status: ChannelLoadStatus.ready,
            items: [...state.vod.items, ...items],
            nextPage: next,
            paginationStatus: next == null
                ? ChannelPaginationStatus.exhausted
                : ChannelPaginationStatus.idle,
          ),
          feedbackType: next == null
              ? ChannelFeedbackType.noMoreData
              : state.feedbackType,
          feedbackSerial: next == null
              ? state.feedbackSerial + 1
              : state.feedbackSerial,
        ),
      );
    } on Object {
      emit(
        state.copyWith(
          vod: state.vod.copyWith(
            paginationStatus: ChannelPaginationStatus.failure,
          ),
        ),
      );
    }
  }
}
