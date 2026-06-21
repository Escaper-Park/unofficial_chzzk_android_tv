import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../live/domain/entities/live_sort.dart';
import '../../../vod/domain/entities/vod_sort.dart';
import '../../domain/entities/search_tag_feed.dart';
import '../../domain/repositories/search_tag_results_repository.dart';

part 'search_tag_results_bloc.freezed.dart';
part 'search_tag_results_event.dart';
part 'search_tag_results_bloc_helpers.dart';
part 'search_tag_results_bloc_load_helpers.dart';
part 'search_tag_results_bloc_pagination_helpers.dart';
part 'search_tag_results_state.dart';

final class SearchTagResultsBloc
    extends Bloc<SearchTagResultsEvent, SearchTagResultsState> {
  SearchTagResultsBloc({
    required this.repository,
  }) : super(SearchTagResultsState.initial()) {
    on<_Started>(_onStarted);
    on<_TabSelected>(_onTabSelected);
    on<_LiveSortSelected>(_onLiveSortSelected);
    on<_VodSortSelected>(_onVodSortSelected);
    on<_RetryRequested>(_onRetryRequested);
    on<_LoadMoreRequested>(_onLoadMoreRequested);
  }

  final SearchTagResultsRepository repository;

  static const _pageSize = 18;
  var _liveRequestSerial = 0;
  var _vodRequestSerial = 0;

  Future<void> _onStarted(
    _Started event,
    Emitter<SearchTagResultsState> emit,
  ) async {
    _invalidateSectionRequests();
    emit(
      state.copyWith(
        tag: _normalizeTag(event.tag),
        live: searchTagResultsPageInitial<SearchTagLive, SearchTagLiveCursor>(),
        vod:
            searchTagResultsPageInitial<SearchTagVideo, SearchTagVideoCursor>(),
      ),
    );
    await _loadSelectedTab(emit);
  }

  Future<void> _onTabSelected(
    _TabSelected event,
    Emitter<SearchTagResultsState> emit,
  ) async {
    if (event.tab == state.selectedTab) {
      return;
    }

    emit(state.copyWith(selectedTab: event.tab));
    await _loadSelectedTab(emit);
  }

  Future<void> _onLiveSortSelected(
    _LiveSortSelected event,
    Emitter<SearchTagResultsState> emit,
  ) async {
    if (state.selectedTab == SearchTagResultsTab.live &&
        state.liveSortOption == event.option) {
      return;
    }

    emit(
      state.copyWith(
        selectedTab: SearchTagResultsTab.live,
        liveSortOption: event.option,
        live: searchTagResultsPageLoading<SearchTagLive, SearchTagLiveCursor>(),
      ),
    );
    await _loadLive(emit);
  }

  Future<void> _onVodSortSelected(
    _VodSortSelected event,
    Emitter<SearchTagResultsState> emit,
  ) async {
    if (state.selectedTab == SearchTagResultsTab.vod &&
        state.vodSortOption == event.option) {
      return;
    }

    emit(
      state.copyWith(
        selectedTab: SearchTagResultsTab.vod,
        vodSortOption: event.option,
        vod:
            searchTagResultsPageLoading<SearchTagVideo, SearchTagVideoCursor>(),
      ),
    );
    await _loadVod(emit);
  }

  Future<void> _onRetryRequested(
    _RetryRequested event,
    Emitter<SearchTagResultsState> emit,
  ) {
    return _loadSelectedTab(emit);
  }

  Future<void> _onLoadMoreRequested(
    _LoadMoreRequested event,
    Emitter<SearchTagResultsState> emit,
  ) {
    return switch (state.selectedTab) {
      SearchTagResultsTab.live => _loadMoreLive(emit),
      SearchTagResultsTab.vod => _loadMoreVod(emit),
    };
  }
}
