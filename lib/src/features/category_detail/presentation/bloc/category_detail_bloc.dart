import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../category/domain/entities/category_info.dart';
import '../../../category/domain/entities/category_live.dart';
import '../../../category/domain/entities/category_video.dart';
import '../../../category/domain/repositories/category_repository.dart';

part 'category_detail_bloc.freezed.dart';
part 'category_detail_event.dart';
part 'category_detail_bloc_helpers.dart';
part 'category_detail_bloc_load_helpers.dart';
part 'category_detail_bloc_load_more_helpers.dart';
part 'category_detail_state.dart';

final class CategoryDetailBloc
    extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  CategoryDetailBloc({
    required this.repository,
    bool initialIsSignedIn = false,
  }) : super(CategoryDetailState.initial(isSignedIn: initialIsSignedIn)) {
    on<_Started>(_onStarted);
    on<_AuthStateChanged>(_onAuthStateChanged);
    on<_TabSelected>(_onTabSelected);
    on<_RetryRequested>(_onRetryRequested);
    on<_LoadMoreRequested>(_onLoadMoreRequested);
    on<_FollowToggled>(_onFollowToggled);
  }

  final CategoryRepository repository;
  var _liveRequestSerial = 0;
  var _vodRequestSerial = 0;

  Future<void> _onStarted(
    _Started event,
    Emitter<CategoryDetailState> emit,
  ) async {
    _invalidateFeedRequests();
    emit(
      CategoryDetailState.initial(isSignedIn: event.isSignedIn).copyWith(
        categoryType: event.categoryType.trim(),
        categoryId: event.categoryId.trim(),
      ),
    );
    await _loadSelectedTab(emit, refreshInfo: true);
  }

  Future<void> _onAuthStateChanged(
    _AuthStateChanged event,
    Emitter<CategoryDetailState> emit,
  ) async {
    emit(state.copyWith(isSignedIn: event.isSignedIn));

    if (!state.hasCategory) {
      return;
    }

    try {
      final key = _currentRequestKey();
      final info = await _fetchInfo(key);
      if (!_isCurrentCategoryRequest(emit, key)) {
        return;
      }

      emit(state.copyWith(info: info));
    } on Object {
      // Feed content remains usable even if auth-specific metadata refresh fails.
    }
  }

  Future<void> _onTabSelected(
    _TabSelected event,
    Emitter<CategoryDetailState> emit,
  ) async {
    if (event.tab == state.selectedTab) {
      return;
    }

    emit(state.copyWith(selectedTab: event.tab));

    if (_pageFor(event.tab).status == CategoryDetailLoadStatus.initial) {
      await _loadSelectedTab(emit);
    }
  }

  Future<void> _onRetryRequested(
    _RetryRequested event,
    Emitter<CategoryDetailState> emit,
  ) {
    return _loadSelectedTab(emit, refreshInfo: state.info == null);
  }

  Future<void> _onLoadMoreRequested(
    _LoadMoreRequested event,
    Emitter<CategoryDetailState> emit,
  ) {
    return switch (state.selectedTab) {
      CategoryDetailTab.live => _loadMoreLive(emit),
      CategoryDetailTab.vod => _loadMoreVod(emit),
    };
  }

  Future<void> _onFollowToggled(
    _FollowToggled event,
    Emitter<CategoryDetailState> emit,
  ) async {
    final info = state.info;
    if (!state.canUseFollowAction || info == null) {
      return;
    }

    final key = _currentRequestKey();
    final wasFollowing = info.following;
    try {
      if (wasFollowing) {
        await repository.unfollowCategory(
          categoryType: key.categoryType,
          categoryId: key.categoryId,
        );
      } else {
        await repository.followCategory(
          categoryType: key.categoryType,
          categoryId: key.categoryId,
        );
      }

      final updatedInfo = await _fetchInfo(key);
      if (!_isCurrentCategoryRequest(emit, key)) {
        return;
      }

      emit(
        state.copyWith(
          info: updatedInfo,
          feedbackType: wasFollowing
              ? CategoryDetailFeedbackType.unfollowSuccess
              : CategoryDetailFeedbackType.followSuccess,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    } on Object {
      if (!_isCurrentCategoryRequest(emit, key)) {
        return;
      }

      emit(
        _stateWithFeedback(
          wasFollowing
              ? CategoryDetailFeedbackType.unfollowFailure
              : CategoryDetailFeedbackType.followFailure,
        ),
      );
    }
  }
}
