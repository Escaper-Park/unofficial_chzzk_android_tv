/// Result type for handling success and failure cases in a type-safe way.
///
/// This sealed class provides a functional approach to error handling,
/// eliminating the need for try-catch blocks and null checks in business logic.
///
/// Example usage:
/// ```dart
/// Future<Result<User>> getUser(String id) async {
///   try {
///     final user = await api.fetchUser(id);
///     return Success(user);
///   } on DioException catch (e) {
///     return Failure(NetworkException.fromDioError(e));
///   }
/// }
///
/// // Using the result
/// final result = await getUser('123');
/// result.when(
///   success: (user) => print('Got user: ${user.name}'),
///   failure: (error) => print('Error: ${error.message}'),
/// );
/// ```
sealed class Result<T> {
  const Result();

  /// Returns true if this is a [Success] result.
  bool get isSuccess => this is Success<T>;

  /// Returns true if this is a [Failure] result.
  bool get isFailure => this is Failure<T>;

  /// Returns the data if this is a [Success], otherwise returns null.
  T? get dataOrNull => switch (this) {
        Success<T>(:final data) => data,
        Failure<T>() => null,
      };

  /// Returns the exception if this is a [Failure], otherwise returns null.
  AppException? get exceptionOrNull => switch (this) {
        Success<T>() => null,
        Failure<T>(:final exception) => exception,
      };

  /// Pattern matches on the result and executes the appropriate callback.
  R when<R>({
    required R Function(T data) success,
    required R Function(AppException exception) failure,
  }) {
    return switch (this) {
      Success<T>(:final data) => success(data),
      Failure<T>(:final exception) => failure(exception),
    };
  }

  /// Pattern matches on the result and executes the appropriate callback,
  /// with optional handlers that default to null.
  R? whenOrNull<R>({
    R Function(T data)? success,
    R Function(AppException exception)? failure,
  }) {
    return switch (this) {
      Success<T>(:final data) => success?.call(data),
      Failure<T>(:final exception) => failure?.call(exception),
    };
  }

  /// Maps the success value to a new type.
  Result<R> map<R>(R Function(T data) mapper) {
    return switch (this) {
      Success<T>(:final data) => Success(mapper(data)),
      Failure<T>(:final exception) => Failure(exception),
    };
  }

  /// Flat maps the success value to a new Result.
  Result<R> flatMap<R>(Result<R> Function(T data) mapper) {
    return switch (this) {
      Success<T>(:final data) => mapper(data),
      Failure<T>(:final exception) => Failure(exception),
    };
  }

  /// Returns the data if success, otherwise returns the provided default value.
  T getOrElse(T defaultValue) {
    return switch (this) {
      Success<T>(:final data) => data,
      Failure<T>() => defaultValue,
    };
  }

  /// Returns the data if success, otherwise throws the exception.
  T getOrThrow() {
    return switch (this) {
      Success<T>(:final data) => data,
      Failure<T>(:final exception) => throw exception,
    };
  }
}

/// Represents a successful result containing data.
final class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<T> &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'Success($data)';
}

/// Represents a failed result containing an exception.
final class Failure<T> extends Result<T> {
  final AppException exception;

  const Failure(this.exception);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure<T> &&
          runtimeType == other.runtimeType &&
          exception == other.exception;

  @override
  int get hashCode => exception.hashCode;

  @override
  String toString() => 'Failure($exception)';
}

/// Base class for all application exceptions.
/// Import from exceptions/app_exception.dart for full implementation.
abstract class AppException implements Exception {
  String get message;
  String? get code;
  dynamic get originalError;
}
