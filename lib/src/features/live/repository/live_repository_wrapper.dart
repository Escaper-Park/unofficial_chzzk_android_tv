import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/result/results.dart';
import '../../../utils/dio/base_repository.dart';
import '../../../utils/dio/dio_client.dart';
import '../model/live_detail.dart';
import '../model/live_response.dart';
import '../model/live_status.dart';
import 'live_repository.dart';

part 'live_repository_wrapper.g.dart';

/// A wrapper around [LiveRepository] that provides Result-based error handling.
///
/// This class bridges the gap between the generated Retrofit repository
/// (which throws exceptions) and the Result pattern used throughout the app.
///
/// Usage:
/// ```dart
/// final result = await ref.read(liveRepositoryWrapperProvider).getLiveDetail(
///   channelId: 'abc123',
/// );
/// result.when(
///   success: (liveDetail) => handleLiveDetail(liveDetail),
///   failure: (error) => handleError(error),
/// );
/// ```
class LiveRepositoryWrapper extends BaseRepository {
  final LiveRepository _liveRepository;
  final LiveStatusRepository _statusRepository;

  LiveRepositoryWrapper(this._liveRepository, this._statusRepository);

  /// Fetches live stream list with pagination.
  ///
  /// Returns:
  /// - [Success<LiveResponse>] with live stream list
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<LiveResponse?>> getLiveResponse({
    required int size,
    required String sortType,
    int? concurrentUserCount,
    int? liveId,
  }) {
    return handleNullableApiCall(
      () => _liveRepository.getLiveResponse(
        size: size,
        sortType: sortType,
        concurrentUserCount: concurrentUserCount,
        liveId: liveId,
      ),
    );
  }

  /// Fetches live stream detail for playback.
  ///
  /// Returns:
  /// - [Success<LiveDetail>] if the live stream is found and accessible
  /// - [Failure] with [StreamingException] if:
  ///   - Live stream has ended (liveEnded)
  ///   - Age restricted content (ageRestricted)
  ///   - Region restricted content (regionRestricted)
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<LiveDetail?>> getLiveDetail({required String channelId}) {
    return handleNullableApiCall(
      () => _liveRepository.getLiveDetail(channelId: channelId),
    );
  }

  /// Fetches live stream status (for currently playing streams).
  ///
  /// Returns:
  /// - [Success<LiveStatus>] with current live stream status
  /// - [Failure] with [StreamingException.liveEnded] if stream has ended
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<LiveStatus?>> getLiveStatus({
    required String channelId,
    bool includePlayerRecommendContent = false,
  }) {
    return handleNullableApiCall(
      () => _statusRepository.getLiveStatus(
        channelId: channelId,
        includePlayerRecommendContent: includePlayerRecommendContent,
      ),
    );
  }
}

/// Provider for [LiveRepositoryWrapper].
///
/// This provider creates a new wrapper instance using the DioClient,
/// ensuring proper dependency injection and lifecycle management.
@riverpod
LiveRepositoryWrapper liveRepositoryWrapper(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  final liveRepository = LiveRepository(dio);
  final statusRepository = LiveStatusRepository(dio);
  return LiveRepositoryWrapper(liveRepository, statusRepository);
}
