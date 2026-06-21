import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_item.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_live.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_page.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/entities/category_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/repositories/category_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category_detail/presentation/bloc/category_detail_bloc.dart';

void main() {
  test('started loads category metadata and the first Live page', () async {
    const cursor = CategoryLiveCursor(liveId: 11);
    final repository = _FakeCategoryRepository(
      info: _categoryInfo(following: true),
      livePages: [
        CategoryLivePage(items: [_categoryLive(1)], cursor: cursor),
      ],
    );
    final bloc = CategoryDetailBloc(repository: repository)
      ..add(
        const CategoryDetailEvent.started(
          categoryType: 'GAME',
          categoryId: 'game',
          isSignedIn: false,
        ),
      );
    await pumpEventQueue();

    expect(bloc.state.info?.title, 'Game');
    expect(bloc.state.isFollowing, true);
    expect(bloc.state.live.status, CategoryDetailLoadStatus.ready);
    expect(bloc.state.live.items.single.liveId, 1);
    expect(bloc.state.live.cursor, cursor);
    expect(repository.infoCalls.single.categoryId, 'game');
    expect(repository.liveCursors, [null]);

    await bloc.close();
  });

  test('ignores stale live completion after category changes', () async {
    final oldCategoryGate = Completer<void>();
    final repository = _FakeCategoryRepository(
      waitForLives:
          ({
            required categoryType,
            required categoryId,
            required cursor,
          }) {
            if (categoryId == 'old') {
              return oldCategoryGate.future;
            }

            return Future<void>.value();
          },
      livePageForRequest:
          ({
            required categoryType,
            required categoryId,
            required cursor,
          }) {
            return CategoryLivePage(
              items: [_categoryLive(categoryId == 'new' ? 2 : 1)],
            );
          },
    );
    final bloc = CategoryDetailBloc(repository: repository);
    addTearDown(bloc.close);

    bloc.add(
      const CategoryDetailEvent.started(
        categoryType: 'GAME',
        categoryId: 'old',
        isSignedIn: false,
      ),
    );
    await pumpEventQueue();
    expect(bloc.state.categoryId, 'old');
    expect(bloc.state.live.status, CategoryDetailLoadStatus.loading);

    bloc.add(
      const CategoryDetailEvent.started(
        categoryType: 'GAME',
        categoryId: 'new',
        isSignedIn: false,
      ),
    );
    await pumpEventQueue();
    expect(bloc.state.categoryId, 'new');
    expect(bloc.state.live.status, CategoryDetailLoadStatus.ready);
    expect(bloc.state.live.items.single.liveId, 2);

    oldCategoryGate.complete();
    await pumpEventQueue();

    expect(bloc.state.categoryId, 'new');
    expect(bloc.state.live.status, CategoryDetailLoadStatus.ready);
    expect(bloc.state.live.items.single.liveId, 2);
  });

  test('VOD tab selection loads category videos', () async {
    final repository = _FakeCategoryRepository(
      livePages: const [CategoryLivePage()],
      videoPages: [
        CategoryVideoPage(items: [_categoryVideo(7)]),
      ],
    );
    final bloc = CategoryDetailBloc(repository: repository)
      ..add(
        const CategoryDetailEvent.started(
          categoryType: 'GAME',
          categoryId: 'game',
          isSignedIn: false,
        ),
      );
    await pumpEventQueue();

    bloc.add(const CategoryDetailEvent.tabSelected(CategoryDetailTab.vod));
    await pumpEventQueue();

    expect(bloc.state.selectedTab, CategoryDetailTab.vod);
    expect(bloc.state.vod.status, CategoryDetailLoadStatus.ready);
    expect(bloc.state.vod.items.single.videoNo, 7);
    expect(repository.videoCursors, [null]);

    await bloc.close();
  });

  test('metadata failure still loads the selected feed', () async {
    final repository = _FakeCategoryRepository(
      throwOnInfo: true,
      livePages: [
        CategoryLivePage(items: [_categoryLive(1)]),
      ],
    );
    final bloc = CategoryDetailBloc(repository: repository)
      ..add(
        const CategoryDetailEvent.started(
          categoryType: 'GAME',
          categoryId: 'game',
          isSignedIn: false,
        ),
      );
    await pumpEventQueue();

    expect(bloc.state.info, isNull);
    expect(bloc.state.live.status, CategoryDetailLoadStatus.ready);
    expect(bloc.state.live.items.single.liveId, 1);
    expect(repository.infoCalls, hasLength(1));
    expect(repository.liveCursors, [null]);

    await bloc.close();
  });

  test('load more appends lives and emits no-more-data feedback', () async {
    const cursor = CategoryLiveCursor(liveId: 1, concurrentUserCount: 10);
    final repository = _FakeCategoryRepository(
      livePages: [
        CategoryLivePage(items: [_categoryLive(1)], cursor: cursor),
        CategoryLivePage(items: [_categoryLive(2)]),
      ],
    );
    final bloc = CategoryDetailBloc(repository: repository)
      ..add(
        const CategoryDetailEvent.started(
          categoryType: 'GAME',
          categoryId: 'game',
          isSignedIn: false,
        ),
      );
    await pumpEventQueue();

    bloc.add(const CategoryDetailEvent.loadMoreRequested());
    await pumpEventQueue();

    expect(
      [for (final item in bloc.state.live.items) item.liveId],
      [1, 2],
    );
    expect(
      bloc.state.live.paginationStatus,
      CategoryDetailPaginationStatus.exhausted,
    );
    expect(bloc.state.feedbackType, CategoryDetailFeedbackType.noMoreData);
    expect(repository.liveCursors, [null, cursor]);

    await bloc.close();
  });

  test('load more failure keeps cursor and allows retry', () async {
    const cursor = CategoryLiveCursor(liveId: 1, concurrentUserCount: 10);
    final repository = _FakeCategoryRepository(
      livePages: [
        CategoryLivePage(items: [_categoryLive(1)], cursor: cursor),
        CategoryLivePage(items: [_categoryLive(2)]),
      ],
      remainingLiveLoadMoreFailures: 1,
    );
    final bloc = CategoryDetailBloc(repository: repository)
      ..add(
        const CategoryDetailEvent.started(
          categoryType: 'GAME',
          categoryId: 'game',
          isSignedIn: false,
        ),
      );
    await pumpEventQueue();

    bloc.add(const CategoryDetailEvent.loadMoreRequested());
    await pumpEventQueue();

    expect(
      bloc.state.live.paginationStatus,
      CategoryDetailPaginationStatus.failure,
    );
    expect(bloc.state.live.cursor, cursor);
    expect(
      bloc.state.feedbackType,
      CategoryDetailFeedbackType.loadMoreFailure,
    );

    bloc.add(const CategoryDetailEvent.loadMoreRequested());
    await pumpEventQueue();

    expect(
      [for (final item in bloc.state.live.items) item.liveId],
      [1, 2],
    );
    expect(
      bloc.state.live.paginationStatus,
      CategoryDetailPaginationStatus.exhausted,
    );
    expect(repository.liveCursors, [null, cursor, cursor]);

    await bloc.close();
  });

  test('signed-in follow action refreshes category info feedback', () async {
    final repository = _FakeCategoryRepository(
      info: _categoryInfo(following: false),
      livePages: const [CategoryLivePage()],
    );
    final bloc =
        CategoryDetailBloc(
          repository: repository,
          initialIsSignedIn: true,
        )..add(
          const CategoryDetailEvent.started(
            categoryType: 'GAME',
            categoryId: 'game',
            isSignedIn: true,
          ),
        );
    await pumpEventQueue();

    bloc.add(const CategoryDetailEvent.followToggled());
    await pumpEventQueue();

    expect(bloc.state.isFollowing, true);
    expect(repository.followCalls, ['game']);
    expect(repository.infoCalls, hasLength(2));
    expect(bloc.state.feedbackType, CategoryDetailFeedbackType.followSuccess);

    bloc.add(const CategoryDetailEvent.followToggled());
    await pumpEventQueue();

    expect(bloc.state.isFollowing, false);
    expect(repository.unfollowCalls, ['game']);
    expect(repository.infoCalls, hasLength(3));
    expect(bloc.state.feedbackType, CategoryDetailFeedbackType.unfollowSuccess);

    await bloc.close();
  });
}

CategoryInfo _categoryInfo({required bool following}) {
  return CategoryInfo(
    categoryId: 'game',
    categoryType: 'GAME',
    title: 'Game',
    openLiveCount: 12,
    concurrentUserCount: 345,
    following: following,
  );
}

CategoryLive _categoryLive(int id) {
  return CategoryLive(
    liveId: id,
    title: 'Live $id',
    concurrentUserCount: id * 10,
    adult: false,
  );
}

CategoryVideo _categoryVideo(int id) {
  return CategoryVideo(
    videoNo: id,
    title: 'Video $id',
    videoType: 'REPLAY',
    publishDate: '2026-06-13',
    duration: 60,
    readCount: id,
    publishDateAt: id,
    adult: false,
    livePv: 0,
  );
}

final class _FakeCategoryRepository implements CategoryRepository {
  _FakeCategoryRepository({
    CategoryInfo? info,
    List<CategoryLivePage> livePages = const [CategoryLivePage()],
    List<CategoryVideoPage> videoPages = const [CategoryVideoPage()],
    this.throwOnInfo = false,
    this.remainingLiveLoadMoreFailures = 0,
    this.waitForLives,
    this.livePageForRequest,
  }) : _info = info ?? _categoryInfo(following: false),
       _livePages = [...livePages],
       _videoPages = [...videoPages];

  CategoryInfo _info;
  final List<CategoryLivePage> _livePages;
  final List<CategoryVideoPage> _videoPages;
  int remainingLiveLoadMoreFailures;
  final bool throwOnInfo;
  final Future<void> Function({
    required String categoryType,
    required String categoryId,
    required CategoryLiveCursor? cursor,
  })?
  waitForLives;
  final CategoryLivePage Function({
    required String categoryType,
    required String categoryId,
    required CategoryLiveCursor? cursor,
  })?
  livePageForRequest;
  final infoCalls = <({String categoryType, String categoryId})>[];
  final liveCursors = <CategoryLiveCursor?>[];
  final videoCursors = <CategoryVideoCursor?>[];
  final followCalls = <String>[];
  final unfollowCalls = <String>[];

  @override
  Future<CategoryPage> fetchCategories({CategoryPageCursor? cursor}) {
    return _unsupportedFakeOperation('CategoryRepository.fetchCategories');
  }

  @override
  Future<List<CategoryItem>> fetchFollowingCategories() async {
    return const [];
  }

  @override
  Future<CategoryInfo> fetchCategoryInfo({
    required String categoryType,
    required String categoryId,
  }) async {
    infoCalls.add((categoryType: categoryType, categoryId: categoryId));
    if (throwOnInfo) {
      throw StateError('info failed');
    }

    return _info;
  }

  @override
  Future<CategoryLivePage> fetchCategoryLives({
    required String categoryType,
    required String categoryId,
    CategoryLiveCursor? cursor,
  }) async {
    liveCursors.add(cursor);
    if (cursor != null && remainingLiveLoadMoreFailures > 0) {
      remainingLiveLoadMoreFailures -= 1;
      throw StateError('live load more failed');
    }

    final wait = waitForLives;
    if (wait != null) {
      await wait(
        categoryType: categoryType,
        categoryId: categoryId,
        cursor: cursor,
      );
    }

    final pageForRequest = livePageForRequest;
    if (pageForRequest != null) {
      return pageForRequest(
        categoryType: categoryType,
        categoryId: categoryId,
        cursor: cursor,
      );
    }

    if (_livePages.isEmpty) {
      return const CategoryLivePage();
    }

    return _livePages.removeAt(0);
  }

  @override
  Future<CategoryVideoPage> fetchCategoryVideos({
    required String categoryType,
    required String categoryId,
    CategoryVideoCursor? cursor,
  }) async {
    videoCursors.add(cursor);
    if (_videoPages.isEmpty) {
      return const CategoryVideoPage();
    }

    return _videoPages.removeAt(0);
  }

  @override
  Future<void> followCategory({
    required String categoryType,
    required String categoryId,
  }) async {
    followCalls.add(categoryId);
    _info = _info.copyWith(following: true);
  }

  @override
  Future<void> unfollowCategory({
    required String categoryType,
    required String categoryId,
  }) async {
    unfollowCalls.add(categoryId);
    _info = _info.copyWith(following: false);
  }
}

Never _unsupportedFakeOperation(String operation) {
  throw UnsupportedError(
    'Unsupported fake operation: $operation. Provide a focused fake '
    'implementation for this test.',
  );
}
