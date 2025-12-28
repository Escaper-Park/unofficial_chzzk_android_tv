import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api.dart';
import '../../../common/result/results.dart';
import '../../../utils/dio/base_repository.dart';
import '../../../utils/dio/dio_client.dart';
import '../model/vod.dart';
import '../model/vod_chat_response.dart';
import '../model/vod_response.dart';
import 'vod_repository.dart';

part 'vod_repository_wrapper.g.dart';

/// A wrapper around [VodRepository] that provides Result-based error handling.
///
/// This class bridges the gap between the generated Retrofit repository
/// (which throws exceptions) and the Result pattern used throughout the app.
///
/// Usage:
/// ```dart
/// final result = await ref.read(vodRepositoryWrapperProvider).getVodDetail(
///   videoNo: 12345,
/// );
/// result.when(
///   success: (vod) => handleVod(vod),
///   failure: (error) => handleError(error),
/// );
/// ```
class VodRepositoryWrapper extends BaseRepository {
  final VodRepository _repository;
  final DioClient _dioClient;

  VodRepositoryWrapper(this._repository, this._dioClient);

  /// Fetches VOD detail by video number.
  ///
  /// Returns:
  /// - [Success<Vod?>] with VOD details
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<Vod?>> getVodDetail({
    required int videoNo,
  }) {
    return handleNullableApiCall(
      () => _repository.getVodDetail(videoNo: videoNo),
    );
  }

  /// Fetches all VODs with pagination.
  ///
  /// Returns:
  /// - [Success<VodResponse?>] with VOD list
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<VodResponse?>> getAllVods({
    required int size,
    required String sortType,
    int? publishDateAt,
    int? readCount,
  }) {
    return handleNullableApiCall(
      () => _repository.getAllVods(
        size: size,
        sortType: sortType,
        publishDateAt: publishDateAt,
        readCount: readCount,
      ),
    );
  }

  /// Fetches VODs for a specific channel.
  ///
  /// Returns:
  /// - [Success<ChannelVodResponse?>] with channel VOD list
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<ChannelVodResponse?>> getChannelVods({
    required String channelId,
    required String sortType,
    required String pagingType,
    required int page,
    required int size,
    int? publishDateAt,
    String? videoType,
  }) {
    return handleNullableApiCall(
      () => _repository.getChannelVods(
        channelId: channelId,
        sortType: sortType,
        pagingType: pagingType,
        page: page,
        size: size,
        publishDateAt: publishDateAt,
        videoType: videoType,
      ),
    );
  }

  /// Fetches following VODs.
  ///
  /// Returns:
  /// - [Success<FollowingVodResponse?>] with following VOD list
  /// - [Failure] with [AuthException] if not logged in
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<FollowingVodResponse?>> getFollowingVods({
    required int size,
    String? nextNo,
  }) {
    return handleNullableApiCall(
      () => _repository.getFollowingVods(
        size: size,
        nextNo: nextNo,
      ),
    );
  }

  /// Fetches VOD chat messages.
  ///
  /// Returns:
  /// - [Success<VodChatResponse?>] with chat messages
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<VodChatResponse?>> getVodChat({
    required int videoNo,
    required int playerMessageTime,
    int? previousVideoChatSize,
  }) {
    return handleNullableApiCall(
      () => _repository.getVodChat(
        videoNo: videoNo,
        playerMessageTime: playerMessageTime,
        previousVideoChatSize: previousVideoChatSize,
      ),
    );
  }

  /// Fetches VOD playback URL for classic VODs.
  ///
  /// This method is used when the VOD doesn't have liveRewindPlaybackJson.
  ///
  /// Returns:
  /// - [Success<String>] with m3u8 playback URL
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<String>> getVodPlaybackUrl({
    required String videoId,
    required String inKey,
    required Set? cookies,
  }) {
    return handleApiCall(() async {
      final baseDio = _dioClient.getBaseDio(cookies);

      final response = await baseDio.get(
        '${BaseUrl.vodPlayback}/$videoId',
        queryParameters: {
          'key': inKey,
          'sid': 2099,
          'devt': 'html5_pc',
          'st': 5,
          'lc': 'ko_KR',
          'cpl': 'ko_KR',
        },
      );

      final m3uAddress = response.data?['period'][0]['adaptationSet'][0]
          ['otherAttributes']['m3u'] as String;

      return m3uAddress;
    });
  }
}

/// Provider for [VodRepositoryWrapper].
///
/// This provider creates a new wrapper instance using the DioClient,
/// ensuring proper dependency injection and lifecycle management.
@riverpod
VodRepositoryWrapper vodRepositoryWrapper(
  VodRepositoryWrapperRef ref,
) {
  final dio = ref.watch(dioClientProvider);
  final dioClient = ref.watch(dioClientProvider.notifier);
  final repository = VodRepository(dio);
  return VodRepositoryWrapper(repository, dioClient);
}
