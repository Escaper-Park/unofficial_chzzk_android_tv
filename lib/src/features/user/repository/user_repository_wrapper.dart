import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/exceptions/exceptions.dart';
import '../../../common/result/results.dart';
import '../../../utils/dio/base_repository.dart';
import '../../../utils/dio/dio_client.dart';
import '../model/user.dart';
import 'user_repository.dart';

part 'user_repository_wrapper.g.dart';

/// A wrapper around [UserRepository] that provides Result-based error handling.
///
/// This class bridges the gap between the generated Retrofit repository
/// (which throws exceptions) and the Result pattern used throughout the app.
///
/// Usage:
/// ```dart
/// final result = await ref.read(userRepositoryWrapperProvider).getUser();
/// result.when(
///   success: (user) => handleUser(user),
///   failure: (error) => handleError(error),
/// );
/// ```
class UserRepositoryWrapper extends BaseRepository {
  final UserRepository _repository;

  UserRepositoryWrapper(this._repository);

  /// Fetches the current user's profile.
  ///
  /// Returns:
  /// - [Success<User>] if the user is logged in and profile is retrieved
  /// - [Failure] with [AuthException] if not logged in or session expired
  /// - [Failure] with [NetworkException] if network error occurs
  Future<Result<User?>> getUser() {
    return handleNullableApiCall(() => _repository.getUser());
  }

  /// Fetches the list of blocked users for the current user.
  ///
  /// Returns:
  /// - [Success<List<String>>] with the list of blocked user IDs
  /// - [Failure] with appropriate exception on error
  Future<Result<List<String>>> getPrivateUserBlocks() {
    return handleApiCall(() => _repository.getPrivateUserBlocks());
  }
}

/// Provider for [UserRepositoryWrapper].
///
/// This provider creates a new wrapper instance using the DioClient,
/// ensuring proper dependency injection and lifecycle management.
@riverpod
UserRepositoryWrapper userRepositoryWrapper(UserRepositoryWrapperRef ref) {
  final dio = ref.watch(dioClientProvider);
  final repository = UserRepository(dio);
  return UserRepositoryWrapper(repository);
}
