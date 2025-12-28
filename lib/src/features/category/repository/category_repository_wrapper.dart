import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/result/results.dart';
import '../../../utils/dio/base_repository.dart';
import '../../../utils/dio/dio_client.dart';
import '../../live/model/live_response.dart';
import '../../vod/model/vod_response.dart';
import '../model/category.dart';
import '../model/category_response.dart';
import 'category_repository.dart';

part 'category_repository_wrapper.g.dart';

/// A wrapper around [CategoryRepository] that provides Result-based error handling.
///
/// This class bridges the gap between the generated Retrofit repository
/// (which throws exceptions) and the Result pattern used throughout the app.
///
/// Usage:
/// ```dart
/// final result = await ref.read(categoryRepositoryWrapperProvider).getCategories(
///   size: 20,
/// );
/// result.when(
///   success: (response) => handleCategories(response),
///   failure: (error) => handleError(error),
/// );
/// ```
class CategoryRepositoryWrapper extends BaseRepository {
  final CategoryRepository _repository;

  CategoryRepositoryWrapper(this._repository);

  /// Fetches paginated list of categories.
  ///
  /// Returns:
  /// - [Success<CategoryResponse?>] with category list
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<CategoryResponse?>> getCategories({
    String? categoryId,
    int? concurrentUserCount,
    int? openLiveCount,
    required int size,
  }) {
    return handleNullableApiCall(
      () => _repository.getCategories(
        categoryId: categoryId,
        concurrentUserCount: concurrentUserCount,
        openLiveCount: openLiveCount,
        size: size,
      ),
    );
  }

  /// Fetches category information by type and ID.
  ///
  /// Returns:
  /// - [Success<Category?>] if the category is found
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<Category?>> getCategoryInfo({
    required String categoryType,
    required String categoryId,
  }) {
    return handleNullableApiCall(
      () => _repository.getCategoryInfo(
        categoryType: categoryType,
        categoryId: categoryId,
      ),
    );
  }

  /// Fetches lives for a category.
  ///
  /// Returns:
  /// - [Success<LiveResponse?>] with live list
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<LiveResponse?>> getCategoryLives({
    required String categoryType,
    required String categoryId,
    int? concurrentUserCount,
    int? liveId,
    int? size,
  }) {
    return handleNullableApiCall(
      () => _repository.getCategoryLives(
        categoryType: categoryType,
        categoryId: categoryId,
        concurrentUserCount: concurrentUserCount,
        liveId: liveId,
        size: size,
      ),
    );
  }

  /// Fetches VODs for a category.
  ///
  /// Returns:
  /// - [Success<CategoryVodResponse?>] with VOD list
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<CategoryVodResponse?>> getCategoryVods({
    required String categoryType,
    required String categoryId,
    int? publishDateAt,
    int? readCount,
    int? size,
  }) {
    return handleNullableApiCall(
      () => _repository.getCategoryVods(
        categoryType: categoryType,
        categoryId: categoryId,
        publishDateAt: publishDateAt,
        readCount: readCount,
        size: size,
      ),
    );
  }

  /// Fetches user's following categories.
  ///
  /// Returns:
  /// - [Success<FollowingCategoryResponse?>] with following list
  /// - [Failure] with [AuthException] if not logged in
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<FollowingCategoryResponse?>> getFollowingCategories() {
    return handleNullableApiCall(
      () => _repository.getFollowingCategories(),
    );
  }

  /// Follows a category.
  ///
  /// Returns:
  /// - [Success<Unit>] if follow succeeded
  /// - [Failure] with [AuthException] if not logged in
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<Unit>> follow({
    required String categoryType,
    required String categoryId,
  }) async {
    final result = await handleApiCall(
      () => _repository.follow(
        categoryType: categoryType,
        categoryId: categoryId,
      ),
    );
    return result.map((_) => Unit.instance);
  }

  /// Unfollows a category.
  ///
  /// Returns:
  /// - [Success<Unit>] if unfollow succeeded
  /// - [Failure] with [AuthException] if not logged in
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<Unit>> unFollow({
    required String categoryType,
    required String categoryId,
  }) async {
    final result = await handleApiCall(
      () => _repository.unFollow(
        categoryType: categoryType,
        categoryId: categoryId,
      ),
    );
    return result.map((_) => Unit.instance);
  }
}

/// Provider for [CategoryRepositoryWrapper].
///
/// This provider creates a new wrapper instance using the DioClient,
/// ensuring proper dependency injection and lifecycle management.
@riverpod
CategoryRepositoryWrapper categoryRepositoryWrapper(
  CategoryRepositoryWrapperRef ref,
) {
  final dio = ref.watch(dioClientProvider);
  final repository = CategoryRepository(dio);
  return CategoryRepositoryWrapper(repository);
}
