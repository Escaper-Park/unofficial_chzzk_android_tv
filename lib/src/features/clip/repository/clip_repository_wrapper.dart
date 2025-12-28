import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/result/results.dart';
import '../../../utils/dio/base_repository.dart';
import '../../../utils/dio/dio_client.dart';
import '../model/clip_response.dart';
import 'clip_repository.dart';

part 'clip_repository_wrapper.g.dart';

/// A wrapper around [ClipRepository] that provides Result-based error handling.
///
/// This class bridges the gap between the generated Retrofit repository
/// (which throws exceptions) and the Result pattern used throughout the app.
///
/// Usage:
/// ```dart
/// final result = await ref.read(clipRepositoryWrapperProvider).getChannelClips(
///   channelId: 'abc123',
///   filterType: 'ALL',
///   orderType: 'RECENT',
///   size: 15,
/// );
/// result.when(
///   success: (clips) => handleClips(clips),
///   failure: (error) => handleError(error),
/// );
/// ```
class ClipRepositoryWrapper extends BaseRepository {
  final ClipRepository _repository;

  ClipRepositoryWrapper(this._repository);

  /// Fetches clips for a specific channel.
  ///
  /// Returns:
  /// - [Success<ChannelClipResponse?>] with channel clip list
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<ChannelClipResponse?>> getChannelClips({
    required String channelId,
    required String filterType,
    required String orderType,
    required int size,
    String? clipUID,
    int? readCount,
  }) {
    return handleNullableApiCall(
      () => _repository.getChannelClipResponse(
        channelId: channelId,
        filterType: filterType,
        orderType: orderType,
        size: size,
        clipUID: clipUID,
        readCount: readCount,
      ),
    );
  }

  /// Fetches clips for a specific category.
  ///
  /// Returns:
  /// - [Success<CategoryClipResponse?>] with category clip list
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<CategoryClipResponse?>> getCategoryClips({
    required String categoryType,
    required String categoryId,
    required String filterType,
    required String orderType,
    required int size,
    String? clipUID,
    int? readCount,
  }) {
    return handleNullableApiCall(
      () => _repository.getCategoryClipResponse(
        categoryType: categoryType,
        categoryId: categoryId,
        filterType: filterType,
        orderType: orderType,
        size: size,
        clipUID: clipUID,
        readCount: readCount,
      ),
    );
  }

  /// Fetches popular clips.
  ///
  /// Returns:
  /// - [Success<PopularClipResponse?>] with popular clip list
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<PopularClipResponse?>> getPopularClips({
    required String filterType,
    required String orderType,
    String? next,
  }) {
    return handleNullableApiCall(
      () => _repository.getPopularClipResponse(
        filterType: filterType,
        orderType: orderType,
        next: next,
      ),
    );
  }
}

/// Provider for [ClipRepositoryWrapper].
///
/// This provider creates a new wrapper instance using the DioClient,
/// ensuring proper dependency injection and lifecycle management.
@riverpod
ClipRepositoryWrapper clipRepositoryWrapper(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  final repository = ClipRepository(dio);
  return ClipRepositoryWrapper(repository);
}
