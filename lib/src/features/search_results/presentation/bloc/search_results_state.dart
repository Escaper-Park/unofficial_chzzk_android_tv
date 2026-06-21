part of 'search_results_bloc.dart';

enum SearchResultsLoadStatus {
  initial,
  loading,
  ready,
  failure,
}

@freezed
abstract class SearchResultsState with _$SearchResultsState {
  const SearchResultsState._();

  const factory SearchResultsState({
    required String query,
    required SearchResultsLoadStatus status,
    required List<SearchChannelResult> channels,
    required List<SearchLiveResult> lives,
    required List<SearchVideoResult> videos,
  }) = _SearchResultsState;

  factory SearchResultsState.initial() {
    return const SearchResultsState(
      query: '',
      status: SearchResultsLoadStatus.initial,
      channels: <SearchChannelResult>[],
      lives: <SearchLiveResult>[],
      videos: <SearchVideoResult>[],
    );
  }

  bool get isEmpty {
    return channels.isEmpty && lives.isEmpty && videos.isEmpty;
  }
}
