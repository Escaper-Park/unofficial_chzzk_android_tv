part of 'category_detail_bloc.dart';

@freezed
sealed class CategoryDetailEvent with _$CategoryDetailEvent {
  const factory CategoryDetailEvent.started({
    required String categoryType,
    required String categoryId,
    required bool isSignedIn,
  }) = _Started;

  const factory CategoryDetailEvent.authStateChanged({
    required bool isSignedIn,
  }) = _AuthStateChanged;

  const factory CategoryDetailEvent.tabSelected(
    CategoryDetailTab tab,
  ) = _TabSelected;

  const factory CategoryDetailEvent.retryRequested() = _RetryRequested;

  const factory CategoryDetailEvent.loadMoreRequested() = _LoadMoreRequested;

  const factory CategoryDetailEvent.followToggled() = _FollowToggled;
}
