import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category_item.dart';
import '../../domain/entities/category_page.dart';
import '../../domain/repositories/category_repository.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

final class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({
    required this.repository,
  }) : super(const CategoryState()) {
    on<_Started>(_onStarted);
    on<_RetryRequested>(_onRetryRequested);
    on<_LoadMoreRequested>(_onLoadMoreRequested);
  }

  final CategoryRepository repository;
  var _initialRequestSerial = 0;
  var _paginationRequestSerial = 0;

  Future<void> _onStarted(
    _Started event,
    Emitter<CategoryState> emit,
  ) async {
    if (state.loadStatus != CategoryLoadStatus.initial) {
      return;
    }

    await _loadInitial(emit);
  }

  Future<void> _onRetryRequested(
    _RetryRequested event,
    Emitter<CategoryState> emit,
  ) {
    return _loadInitial(emit);
  }

  Future<void> _onLoadMoreRequested(
    _LoadMoreRequested event,
    Emitter<CategoryState> emit,
  ) async {
    if (state.loadStatus != CategoryLoadStatus.ready ||
        state.paginationStatus == CategoryPaginationStatus.loading ||
        state.paginationStatus == CategoryPaginationStatus.exhausted) {
      return;
    }

    final cursor = state.cursor;
    if (cursor == null) {
      emit(
        state.copyWith(
          paginationStatus: CategoryPaginationStatus.exhausted,
          feedbackType: CategoryFeedbackType.noMoreData,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
      return;
    }

    final requestSerial = ++_paginationRequestSerial;
    final items = state.items;
    emit(
      state.copyWith(
        paginationStatus: CategoryPaginationStatus.loading,
      ),
    );

    try {
      final page = await repository.fetchCategories(cursor: cursor);
      if (!_isCurrentPaginationRequest(emit, requestSerial)) {
        return;
      }

      emit(
        state.copyWith(
          items: [...items, ...page.items],
          cursor: page.cursor,
          paginationStatus: page.cursor == null
              ? CategoryPaginationStatus.exhausted
              : CategoryPaginationStatus.idle,
          feedbackType: page.cursor == null
              ? CategoryFeedbackType.noMoreData
              : state.feedbackType,
          feedbackSerial: page.cursor == null
              ? state.feedbackSerial + 1
              : state.feedbackSerial,
        ),
      );
    } on Object {
      if (!_isCurrentPaginationRequest(emit, requestSerial)) {
        return;
      }

      emit(
        state.copyWith(
          paginationStatus: CategoryPaginationStatus.failure,
          feedbackType: CategoryFeedbackType.loadMoreFailure,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    }
  }

  Future<void> _loadInitial(Emitter<CategoryState> emit) async {
    final requestSerial = ++_initialRequestSerial;
    _paginationRequestSerial += 1;
    emit(
      state.copyWith(
        loadStatus: CategoryLoadStatus.loading,
        items: const <CategoryItem>[],
        cursor: null,
        paginationStatus: CategoryPaginationStatus.idle,
        feedbackType: null,
      ),
    );

    try {
      final page = await repository.fetchCategories();
      if (!_isCurrentInitialRequest(emit, requestSerial)) {
        return;
      }

      emit(
        state.copyWith(
          loadStatus: CategoryLoadStatus.ready,
          items: page.items,
          cursor: page.cursor,
          paginationStatus: page.cursor == null
              ? CategoryPaginationStatus.exhausted
              : CategoryPaginationStatus.idle,
        ),
      );
    } on Object {
      if (!_isCurrentInitialRequest(emit, requestSerial)) {
        return;
      }

      emit(
        state.copyWith(
          loadStatus: CategoryLoadStatus.failure,
          items: const <CategoryItem>[],
          cursor: null,
          paginationStatus: CategoryPaginationStatus.idle,
        ),
      );
    }
  }

  bool _isCurrentInitialRequest(
    Emitter<CategoryState> emit,
    int requestSerial,
  ) {
    return !emit.isDone && _initialRequestSerial == requestSerial;
  }

  bool _isCurrentPaginationRequest(
    Emitter<CategoryState> emit,
    int requestSerial,
  ) {
    return !emit.isDone && _paginationRequestSerial == requestSerial;
  }
}
