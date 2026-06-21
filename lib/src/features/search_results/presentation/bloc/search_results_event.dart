part of 'search_results_bloc.dart';

@freezed
sealed class SearchResultsEvent with _$SearchResultsEvent {
  const factory SearchResultsEvent.started({
    required String query,
  }) = _Started;

  const factory SearchResultsEvent.retryRequested() = _RetryRequested;
}
