import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/result/results.dart';
import '../../../utils/dio/base_repository.dart';
import '../../../utils/dio/dio_client.dart';
import '../model/following_response.dart';
import 'following_repository.dart';

part 'following_repository_wrapper.g.dart';

/// A wrapper around [FollowingRepository] that provides Result-based error handling.
///
/// This class bridges the gap between the generated Retrofit repository
/// (which throws exceptions) and the Result pattern used throughout the app.
///
/// Usage:
/// ```dart
/// final result = await ref.read(followingRepositoryWrapperProvider).getFollowings(
///   size: 505,
///   page: 0,
/// );
/// result.when(
///   success: (response) => handleFollowings(response),
///   failure: (error) => handleError(error),
/// );
/// ```
class FollowingRepositoryWrapper extends BaseRepository {
  final FollowingRepository _repository;

  FollowingRepositoryWrapper(this._repository);

  /// Fetches the list of following channels.
  ///
  /// Parameters:
  /// - [size]: Number of items per page (default: 505)
  /// - [page]: Page number (default: 0)
  ///
  /// Returns:
  /// - [Success<FollowingResponse?>] with the following list
  /// - [Failure] with [AuthException] if not logged in
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<FollowingResponse?>> getFollowings({
    required int size,
    required int page,
  }) {
    return handleNullableApiCall(
      () => _repository.getFollowings(size: size, page: page),
    );
  }

  /// Fetches the list of following live streams.
  ///
  /// Parameters:
  /// - [sortType]: Sort type for the live streams
  ///
  /// Returns:
  /// - [Success<FollowingResponse?>] with the live following list
  /// - [Failure] with [AuthException] if not logged in
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<FollowingResponse?>> getFollowingLives({
    required String sortType,
  }) {
    return handleNullableApiCall(
      () => _repository.getFollowingLives(sortType: sortType),
    );
  }
}

/// Provider for [FollowingRepositoryWrapper].
///
/// This provider creates a new wrapper instance using the DioClient,
/// ensuring proper dependency injection and lifecycle management.
@riverpod
FollowingRepositoryWrapper followingRepositoryWrapper(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  final repository = FollowingRepository(dio);
  return FollowingRepositoryWrapper(repository);
}
