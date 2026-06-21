import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_item.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_live.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_page.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/repositories/category_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/presentation/bloc/category_bloc.dart';

void main() {
  test('started loads the first category page', () async {
    final repository = _FakeCategoryRepository(
      pages: [
        CategoryPage(
          items: [_categoryItem('game')],
          cursor: const CategoryPageCursor(
            categoryType: 'GAME',
            categoryId: 'next',
          ),
          size: 18,
        ),
      ],
    );
    final bloc = CategoryBloc(repository: repository)
      ..add(const CategoryEvent.started());
    await pumpEventQueue();

    expect(bloc.state.loadStatus, CategoryLoadStatus.ready);
    expect(bloc.state.items.single.categoryId, 'game');
    expect(bloc.state.cursor?.categoryId, 'next');
    expect(repository.requestedCursors, [null]);

    await bloc.close();
  });

  test('ignores stale initial load completion after retry starts', () async {
    final firstRequestGate = Completer<void>();
    final repository = _FakeCategoryRepository(
      pages: [
        CategoryPage(items: [_categoryItem('old')], size: 18),
        CategoryPage(items: [_categoryItem('new')], size: 18),
      ],
      waitForRequest: ({required requestIndex, required cursor}) {
        if (requestIndex == 1) {
          return firstRequestGate.future;
        }

        return Future<void>.value();
      },
    );
    final bloc = CategoryBloc(repository: repository);
    addTearDown(bloc.close);

    bloc.add(const CategoryEvent.started());
    await pumpEventQueue();
    expect(bloc.state.loadStatus, CategoryLoadStatus.loading);

    bloc.add(const CategoryEvent.retryRequested());
    await pumpEventQueue();
    expect(bloc.state.loadStatus, CategoryLoadStatus.ready);
    expect(bloc.state.items.single.categoryId, 'new');

    firstRequestGate.complete();
    await pumpEventQueue();

    expect(bloc.state.loadStatus, CategoryLoadStatus.ready);
    expect(bloc.state.items.single.categoryId, 'new');
    expect(repository.requestedCursors, [null, null]);
  });

  test('load more appends items and emits no-more-data feedback', () async {
    const cursor = CategoryPageCursor(
      categoryType: 'GAME',
      categoryId: 'next',
    );
    final repository = _FakeCategoryRepository(
      pages: [
        CategoryPage(items: [_categoryItem('first')], cursor: cursor, size: 18),
        CategoryPage(items: [_categoryItem('second')], size: 18),
      ],
    );
    final bloc = CategoryBloc(repository: repository)
      ..add(const CategoryEvent.started());
    await pumpEventQueue();

    bloc.add(const CategoryEvent.loadMoreRequested());
    await pumpEventQueue();

    expect(
      [for (final item in bloc.state.items) item.categoryId],
      ['first', 'second'],
    );
    expect(bloc.state.cursor, isNull);
    expect(bloc.state.paginationStatus, CategoryPaginationStatus.exhausted);
    expect(bloc.state.feedbackType, CategoryFeedbackType.noMoreData);
    expect(repository.requestedCursors, [null, cursor]);

    await bloc.close();
  });

  test('load more failure keeps cursor and allows retry', () async {
    const cursor = CategoryPageCursor(
      categoryType: 'GAME',
      categoryId: 'next',
    );
    final repository = _FakeCategoryRepository(
      pages: [
        CategoryPage(items: [_categoryItem('first')], cursor: cursor, size: 18),
        CategoryPage(items: [_categoryItem('second')], size: 18),
      ],
      remainingLoadMoreFailures: 1,
    );
    final bloc = CategoryBloc(repository: repository)
      ..add(const CategoryEvent.started());
    await pumpEventQueue();

    bloc.add(const CategoryEvent.loadMoreRequested());
    await pumpEventQueue();

    expect(bloc.state.paginationStatus, CategoryPaginationStatus.failure);
    expect(bloc.state.cursor, cursor);
    expect(bloc.state.feedbackType, CategoryFeedbackType.loadMoreFailure);

    bloc.add(const CategoryEvent.loadMoreRequested());
    await pumpEventQueue();

    expect(
      [for (final item in bloc.state.items) item.categoryId],
      ['first', 'second'],
    );
    expect(bloc.state.paginationStatus, CategoryPaginationStatus.exhausted);
    expect(repository.requestedCursors, [null, cursor, cursor]);

    await bloc.close();
  });
}

CategoryItem _categoryItem(String id) {
  return CategoryItem(
    categoryType: 'GAME',
    categoryId: id,
    title: 'Category $id',
    openLiveCount: 12,
    concurrentUserCount: 345,
  );
}

final class _FakeCategoryRepository implements CategoryRepository {
  _FakeCategoryRepository({
    required List<CategoryPage> pages,
    this.remainingLoadMoreFailures = 0,
    this.waitForRequest,
  }) : _pages = [...pages];

  final List<CategoryPage> _pages;
  int remainingLoadMoreFailures;
  final Future<void> Function({
    required int requestIndex,
    required CategoryPageCursor? cursor,
  })?
  waitForRequest;
  final requestedCursors = <CategoryPageCursor?>[];

  @override
  Future<CategoryPage> fetchCategories({CategoryPageCursor? cursor}) async {
    requestedCursors.add(cursor);
    if (cursor != null && remainingLoadMoreFailures > 0) {
      remainingLoadMoreFailures -= 1;
      throw StateError('load more failed');
    }

    final page = _pages.removeAt(0);
    final wait = waitForRequest;
    if (wait != null) {
      await wait(requestIndex: requestedCursors.length, cursor: cursor);
    }

    return page;
  }

  @override
  Future<List<CategoryItem>> fetchFollowingCategories() async {
    return const [];
  }

  @override
  Future<CategoryInfo> fetchCategoryInfo({
    required String categoryType,
    required String categoryId,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.fetchCategoryInfo');
  }

  @override
  Future<CategoryLivePage> fetchCategoryLives({
    required String categoryType,
    required String categoryId,
    CategoryLiveCursor? cursor,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.fetchCategoryLives');
  }

  @override
  Future<CategoryVideoPage> fetchCategoryVideos({
    required String categoryType,
    required String categoryId,
    CategoryVideoCursor? cursor,
  }) {
    return _unsupportedFakeOperation('CategoryRepository.fetchCategoryVideos');
  }

  @override
  Future<void> followCategory({
    required String categoryType,
    required String categoryId,
  }) async {}

  @override
  Future<void> unfollowCategory({
    required String categoryType,
    required String categoryId,
  }) async {}
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
