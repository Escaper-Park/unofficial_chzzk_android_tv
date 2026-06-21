part of 'following_bloc.dart';

extension _FollowingBlocPaginationHelpers on FollowingBloc {
  Future<void> _loadMoreVod(Emitter<FollowingState> emit) async {
    if (!state.isSignedIn || state.selectedTab != FollowingTab.vod) {
      return;
    }

    final vod = state.vod;
    if (vod.status != FollowingLoadStatus.ready ||
        vod.paginationStatus == FollowingPaginationStatus.loading ||
        vod.paginationStatus == FollowingPaginationStatus.exhausted) {
      return;
    }

    final cursor = vod.cursor;
    if (cursor == null) {
      emit(
        state.copyWith(
          vod: vod.copyWith(
            paginationStatus: FollowingPaginationStatus.exhausted,
          ),
          feedbackType: FollowingFeedbackType.noMoreData,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
      return;
    }

    final requestSerial = ++_vodRequestSerial;
    final items = state.vod.items;
    emit(
      state.copyWith(
        vod: vod.copyWith(paginationStatus: FollowingPaginationStatus.loading),
      ),
    );

    try {
      final page = await vodRepository.getFollowingVods(
        size: FollowingBloc._vodPageSize,
        cursor: cursor,
      );
      if (!_isCurrentTabRequest(
        emit,
        tab: FollowingTab.vod,
        requestSerial: requestSerial,
      )) {
        return;
      }

      emit(
        state.copyWith(
          vod: FollowingVodSectionData(
            status: FollowingLoadStatus.ready,
            items: [...items, ...page.items],
            cursor: page.cursor,
            paginationStatus: page.cursor == null
                ? FollowingPaginationStatus.exhausted
                : FollowingPaginationStatus.idle,
          ),
          feedbackType: page.cursor == null
              ? FollowingFeedbackType.noMoreData
              : state.feedbackType,
          feedbackSerial: page.cursor == null
              ? state.feedbackSerial + 1
              : state.feedbackSerial,
        ),
      );
    } on Object {
      if (!_isCurrentTabRequest(
        emit,
        tab: FollowingTab.vod,
        requestSerial: requestSerial,
      )) {
        return;
      }

      emit(
        state.copyWith(
          vod: state.vod.copyWith(
            paginationStatus: FollowingPaginationStatus.failure,
          ),
        ),
      );
    }
  }
}
