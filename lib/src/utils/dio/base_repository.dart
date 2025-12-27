import 'package:dio/dio.dart';

import '../../common/exceptions/exceptions.dart';
import '../../common/result/results.dart';
import 'error_handling_interceptor.dart';

/// Base class for all repositories that make API calls.
///
/// Provides a unified way to handle API calls and convert them to [Result] types.
/// This ensures consistent error handling across all repositories.
///
/// Example usage:
/// ```dart
/// class UserRepository extends BaseRepository {
///   final UserApi _api;
///
///   UserRepository(this._api);
///
///   Future<Result<User>> getUser(String id) {
///     return handleApiCall(() => _api.getUser(id));
///   }
/// }
/// ```
abstract class BaseRepository {
  /// Wraps an API call in proper error handling and returns a [Result].
  ///
  /// This method catches all exceptions and converts them to appropriate
  /// [AppException] types, returning them wrapped in a [Failure] result.
  ///
  /// - [apiCall]: A function that performs the API call and returns a value.
  /// - Returns: [Success] with the data if successful, [Failure] with exception otherwise.
  Future<Result<T>> handleApiCall<T>(Future<T> Function() apiCall) async {
    try {
      final result = await apiCall();
      return Success(result);
    } on DioException catch (e) {
      return Failure(e.appException);
    } on AppException catch (e) {
      return Failure(e);
    } catch (e, stackTrace) {
      // Log unexpected errors in debug mode
      assert(() {
        // ignore: avoid_print
        print('Unexpected error in API call: $e\n$stackTrace');
        return true;
      }());
      return Failure(UnknownException.fromError(e));
    }
  }

  /// Wraps an API call that may return null.
  ///
  /// Similar to [handleApiCall] but handles nullable return types.
  /// If the API returns null, returns [Success] with null value.
  ///
  /// - [apiCall]: A function that performs the API call and returns a nullable value.
  /// - Returns: [Success] with the data (or null) if successful, [Failure] with exception otherwise.
  Future<Result<T?>> handleNullableApiCall<T>(
    Future<T?> Function() apiCall,
  ) async {
    try {
      final result = await apiCall();
      return Success(result);
    } on DioException catch (e) {
      return Failure(e.appException);
    } on AppException catch (e) {
      return Failure(e);
    } catch (e, stackTrace) {
      assert(() {
        // ignore: avoid_print
        print('Unexpected error in API call: $e\n$stackTrace');
        return true;
      }());
      return Failure(UnknownException.fromError(e));
    }
  }

  /// Wraps an API call with automatic retry on transient failures.
  ///
  /// Retries the API call up to [maxRetries] times if the error is retryable
  /// (typically network timeouts and connection errors).
  ///
  /// - [apiCall]: A function that performs the API call.
  /// - [maxRetries]: Maximum number of retry attempts (default: 3).
  /// - [retryDelay]: Base delay between retries, increases exponentially (default: 1 second).
  /// - Returns: [Success] if eventually successful, [Failure] with the last error otherwise.
  Future<Result<T>> handleApiCallWithRetry<T>(
    Future<T> Function() apiCall, {
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    AppException? lastException;

    for (int attempt = 0; attempt <= maxRetries; attempt++) {
      final result = await handleApiCall(apiCall);

      if (result.isSuccess) {
        return result;
      }

      // Check if the error is retryable
      final exception = result.exceptionOrNull;
      if (exception is NetworkException && exception.isRetryable) {
        lastException = exception;

        // Don't wait on the last attempt
        if (attempt < maxRetries) {
          // Exponential backoff
          await Future.delayed(retryDelay * (attempt + 1));
          continue;
        }
      }

      // Non-retryable error, return immediately
      return result;
    }

    return Failure(
      lastException ??
          const NetworkException(
            message: '재시도 후에도 연결할 수 없습니다.',
            type: NetworkExceptionType.unknown,
          ),
    );
  }
}

/// A simple unit type for operations that don't return meaningful data.
///
/// Use this for API calls like DELETE or POST that only need to indicate success/failure.
class Unit {
  const Unit._();

  /// Singleton instance of [Unit].
  static const instance = Unit._();

  @override
  String toString() => 'Unit';

  @override
  bool operator ==(Object other) => other is Unit;

  @override
  int get hashCode => 0;
}
