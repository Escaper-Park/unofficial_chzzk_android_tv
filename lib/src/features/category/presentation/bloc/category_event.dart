part of 'category_bloc.dart';

@freezed
sealed class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.started() = _Started;

  const factory CategoryEvent.retryRequested() = _RetryRequested;

  const factory CategoryEvent.loadMoreRequested() = _LoadMoreRequested;
}
