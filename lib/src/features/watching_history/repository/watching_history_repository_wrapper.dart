import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/result/results.dart';
import '../../../utils/dio/base_repository.dart';
import '../../../utils/dio/dio_client.dart';
import '../model/watching_history_response.dart';
import 'watching_history_repository.dart';

part 'watching_history_repository_wrapper.g.dart';

/// A wrapper around [WatchingHistoryRepository] that provides Result-based error handling.
///
/// This class bridges the gap between the generated Retrofit repository
/// (which throws exceptions) and the Result pattern used throughout the app.
class WatchingHistoryRepositoryWrapper extends BaseRepository {
  final WatchingHistoryRepository _repository;

  WatchingHistoryRepositoryWrapper(this._repository);

  /// Fetches watching history for the current user.
  ///
  /// Returns:
  /// - [Success<WatchingHistoryResponse>] with the watching history
  /// - [Failure] with [AuthException] if not logged in
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<WatchingHistoryResponse?>> getWatchingHistories({
    required int size,
    required int? lastTime,
  }) {
    return handleNullableApiCall(
      () => _repository.getWatchingHistories(
        size: size,
        lastTime: lastTime,
      ),
    );
  }
}

/// Provider for [WatchingHistoryRepositoryWrapper].
///
/// This provider creates a new wrapper instance using the DioClient,
/// ensuring proper dependency injection and lifecycle management.
@riverpod
WatchingHistoryRepositoryWrapper watchingHistoryRepositoryWrapper(
  WatchingHistoryRepositoryWrapperRef ref,
) {
  final dio = ref.watch(dioClientProvider);
  final repository = WatchingHistoryRepository(dio);
  return WatchingHistoryRepositoryWrapper(repository);
}
