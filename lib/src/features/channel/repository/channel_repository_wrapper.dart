import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/result/results.dart';
import '../../../utils/dio/base_repository.dart';
import '../../../utils/dio/dio_client.dart';
import '../model/channel.dart';
import 'channel_repository.dart';

part 'channel_repository_wrapper.g.dart';

/// A wrapper around [ChannelRepository] that provides Result-based error handling.
///
/// This class bridges the gap between the generated Retrofit repository
/// (which throws exceptions) and the Result pattern used throughout the app.
///
/// Usage:
/// ```dart
/// final result = await ref.read(channelRepositoryWrapperProvider).getChannel(
///   channelId: 'abc123',
/// );
/// result.when(
///   success: (channel) => handleChannel(channel),
///   failure: (error) => handleError(error),
/// );
/// ```
class ChannelRepositoryWrapper extends BaseRepository {
  final ChannelRepository _repository;

  ChannelRepositoryWrapper(this._repository);

  /// Fetches channel information by ID.
  ///
  /// Returns:
  /// - [Success<Channel>] if the channel is found
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<Channel?>> getChannel({required String channelId}) {
    return handleNullableApiCall(
      () => _repository.getChannel(channelId: channelId),
    );
  }

  /// Follows a channel.
  ///
  /// Returns:
  /// - [Success<Unit>] if follow succeeded
  /// - [Failure] with [AuthException] if not logged in
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<Unit>> follow({required String channelId}) async {
    final result = await handleApiCall(
      () => _repository.follow(channelId: channelId),
    );
    return result.map((_) => Unit.instance);
  }

  /// Unfollows a channel.
  ///
  /// Returns:
  /// - [Success<Unit>] if unfollow succeeded
  /// - [Failure] with [AuthException] if not logged in
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<Unit>> unFollow({required String channelId}) async {
    final result = await handleApiCall(
      () => _repository.unFollow(channelId: channelId),
    );
    return result.map((_) => Unit.instance);
  }

  /// Deletes channel notification setting.
  ///
  /// Returns:
  /// - [Success<Unit>] if deletion succeeded
  /// - [Failure] with [AuthException] if not logged in
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<Unit>> deleteNotification({required String channelId}) async {
    final result = await handleApiCall(
      () => _repository.deleteNotification(channelId: channelId),
    );
    return result.map((_) => Unit.instance);
  }
}

/// Provider for [ChannelRepositoryWrapper].
///
/// This provider creates a new wrapper instance using the DioClient,
/// ensuring proper dependency injection and lifecycle management.
@riverpod
ChannelRepositoryWrapper channelRepositoryWrapper(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  final repository = ChannelRepository(dio);
  return ChannelRepositoryWrapper(repository);
}
