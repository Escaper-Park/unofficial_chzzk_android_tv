import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../../live/model/live.dart';
import '../../vod/model/vod.dart';
import '../model/category.dart';
import '../repository/category_repository.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  late CategoryRepository _repository;

  // infinite scrolling
  CategoryPage? _next;

  @override
  FutureOr<List<Category>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = CategoryRepository(dio);

    return await _initFetch();
  }

  Future<List<Category>?> _initFetch() async {
    final categoryResponse = await _repository.getCategories(
      size: 20,
      categoryId: null,
      concurrentUserCount: null,
      openLiveCount: null,
    );

    _next = categoryResponse?.next;

    return categoryResponse?.data;
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      final prev = state.value;

      state = await AsyncValue.guard(() async {
        final categoryReponse = await _repository.getCategories(
          size: 20,
          categoryId: _next!.categoryId,
          concurrentUserCount: _next!.concurrentUserCount,
          openLiveCount: _next!.openLiveCount,
        );

        _next = categoryReponse?.next;

        if (categoryReponse?.data == null || _next == null) {
          return [...prev!];
        }

        return [...prev!, ...categoryReponse!.data];
      });
    }
  }
}

@riverpod
class CategoryLivesController extends _$CategoryLivesController {
  late CategoryRepository _repository;
  LivePage? _next;

  @override
  FutureOr<List<LiveInfo>?> build({required Category category}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = CategoryRepository(dio);

    return await _initFetch();
  }

  Future<List<LiveInfo>?> _initFetch() async {
    final LiveResponse? liveResponse = await _repository.getCategoryLives(
      categoryType: category.categoryType,
      categoryId: category.categoryId,
      size: 18,
      concurrentUserCount: null,
      liveId: null,
    );

    _next = liveResponse?.next;

    return liveResponse?.data;
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      ref.read(categoryFetchMoreLoadingStateProvider.notifier).setState(true);
      final prev = state.value;

      state = await AsyncValue.guard(() async {
        final liveRespnse = await _repository.getCategoryLives(
          categoryType: category.categoryType,
          categoryId: category.categoryId,
          size: 18,
          concurrentUserCount: _next!.concurrentUserCount,
          liveId: _next!.liveId,
        );

        _next = liveRespnse?.next;

        if (liveRespnse?.data == null || _next == null) {
          return [...prev!];
        }

        ref
            .read(categoryFetchMoreLoadingStateProvider.notifier)
            .setState(false);
        return [...prev!, ...liveRespnse!.data];
      });
    }
  }
}

@riverpod
class CategoryVodsController extends _$CategoryVodsController {
  late CategoryRepository _repository;
  CategoryVodPage? _next;

  @override
  FutureOr<List<Vod>?> build({required Category category}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = CategoryRepository(dio);

    return await _initFetch();
  }

  Future<List<Vod>?> _initFetch() async {
    final categoryVodResponse = await _repository.getCategoryVods(
      categoryType: category.categoryType,
      categoryId: category.categoryId,
      size: 18,
      publishDateAt: null,
      readCount: null,
    );

    _next = categoryVodResponse?.next;

    return categoryVodResponse?.data;
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      ref.read(categoryFetchMoreLoadingStateProvider.notifier).setState(true);
      final prev = state.value;

      state = await AsyncValue.guard(() async {
        final categoryVodResponse = await _repository.getCategoryVods(
          categoryType: category.categoryType,
          categoryId: category.categoryId,
          size: 18,
          publishDateAt: _next!.publishDateAt,
          readCount: _next!.readCount,
        );

        _next = categoryVodResponse?.next;

        if (categoryVodResponse?.data == null || _next == null) {
          return [...prev!];
        }

        ref
            .read(categoryFetchMoreLoadingStateProvider.notifier)
            .setState(false);
        return [...prev!, ...categoryVodResponse!.data];
      });
    }
  }
}

@riverpod
class FollowingCategoriesController extends _$FollowingCategoriesController {
  late CategoryRepository _repository;

  /// Get List of following Categories in.
  ///
  /// It's used for home screen or checking already followed.
  @override
  FutureOr<List<Category>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = CategoryRepository(dio);

    return await fetchFollowingCategories();
  }

  Future<List<Category>?> fetchFollowingCategories() async {
    final response = await _repository.getFollowingCategories();

    return response?.followingList;
  }

  Future<bool> follow(Category category) async {
    final response = await _repository
        .follow(
          categoryType: category.categoryType,
          categoryId: category.categoryId,
        )
        .then((_) => true)
        .catchError((_) => false);

    return response;
  }

  Future<bool> unfollow(Category category) async {
    final response = await _repository
        .unfollow(
          categoryType: category.categoryType,
          categoryId: category.categoryId,
        )
        .then((_) => true)
        .catchError((_) => false);

    return response;
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        return await fetchFollowingCategories();
      },
    );
  }
}

@riverpod
class CategoryFetchMoreLoadingState extends _$CategoryFetchMoreLoadingState {
  @override
  bool build() {
    return false;
  }

  void setState(bool value) {
    state = value;
  }
}
