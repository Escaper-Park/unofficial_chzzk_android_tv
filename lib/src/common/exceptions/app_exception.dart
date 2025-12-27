import 'package:dio/dio.dart';

import '../result/result.dart' show AppException;

/// Network-related exceptions for API calls.
class NetworkException implements AppException {
  @override
  final String message;

  @override
  final String? code;

  @override
  final dynamic originalError;

  final int? statusCode;
  final NetworkExceptionType type;

  const NetworkException({
    required this.message,
    this.code,
    this.originalError,
    this.statusCode,
    this.type = NetworkExceptionType.unknown,
  });

  /// Creates a [NetworkException] from a [DioException].
  factory NetworkException.fromDioError(DioException error) {
    final statusCode = error.response?.statusCode;
    final type = _mapDioExceptionType(error.type);
    final message = _getMessageFromDioError(error);

    return NetworkException(
      message: message,
      code: statusCode?.toString(),
      originalError: error,
      statusCode: statusCode,
      type: type,
    );
  }

  static NetworkExceptionType _mapDioExceptionType(DioExceptionType type) {
    return switch (type) {
      DioExceptionType.connectionTimeout => NetworkExceptionType.timeout,
      DioExceptionType.sendTimeout => NetworkExceptionType.timeout,
      DioExceptionType.receiveTimeout => NetworkExceptionType.timeout,
      DioExceptionType.connectionError => NetworkExceptionType.noConnection,
      DioExceptionType.badCertificate => NetworkExceptionType.security,
      DioExceptionType.badResponse => NetworkExceptionType.serverError,
      DioExceptionType.cancel => NetworkExceptionType.cancelled,
      DioExceptionType.unknown => NetworkExceptionType.unknown,
    };
  }

  static String _getMessageFromDioError(DioException error) {
    final statusCode = error.response?.statusCode;

    // Handle specific HTTP status codes
    if (statusCode != null) {
      return switch (statusCode) {
        400 => '잘못된 요청입니다.',
        401 => '인증이 필요합니다. 다시 로그인해주세요.',
        403 => '접근 권한이 없습니다.',
        404 => '요청한 리소스를 찾을 수 없습니다.',
        429 => '요청이 너무 많습니다. 잠시 후 다시 시도해주세요.',
        500 => '서버 오류가 발생했습니다.',
        502 => '서버가 응답하지 않습니다.',
        503 => '서비스를 일시적으로 사용할 수 없습니다.',
        _ => '네트워크 오류가 발생했습니다. (코드: $statusCode)',
      };
    }

    // Handle connection errors
    return switch (error.type) {
      DioExceptionType.connectionTimeout => '연결 시간이 초과되었습니다.',
      DioExceptionType.sendTimeout => '요청 전송 시간이 초과되었습니다.',
      DioExceptionType.receiveTimeout => '응답 수신 시간이 초과되었습니다.',
      DioExceptionType.connectionError => '인터넷 연결을 확인해주세요.',
      DioExceptionType.cancel => '요청이 취소되었습니다.',
      _ => '알 수 없는 오류가 발생했습니다.',
    };
  }

  /// User-friendly message for display in UI.
  String get displayMessage => message;

  /// Whether this error is recoverable (can retry).
  bool get isRetryable => switch (type) {
        NetworkExceptionType.timeout => true,
        NetworkExceptionType.noConnection => true,
        NetworkExceptionType.serverError =>
          statusCode != 400 && statusCode != 401,
        _ => false,
      };

  @override
  String toString() => 'NetworkException: $message (code: $code, type: $type)';
}

/// Types of network exceptions.
enum NetworkExceptionType {
  /// Connection timeout, send timeout, or receive timeout.
  timeout,

  /// No internet connection or DNS resolution failed.
  noConnection,

  /// Server returned an error response (4xx, 5xx).
  serverError,

  /// SSL/TLS certificate error.
  security,

  /// Request was cancelled.
  cancelled,

  /// Unknown error.
  unknown,
}

/// Authentication-related exceptions.
class AuthException implements AppException {
  @override
  final String message;

  @override
  final String? code;

  @override
  final dynamic originalError;

  final AuthExceptionType type;

  const AuthException({
    required this.message,
    this.code,
    this.originalError,
    this.type = AuthExceptionType.unknown,
  });

  /// Creates an [AuthException] for session expiration.
  factory AuthException.sessionExpired() => const AuthException(
        message: '세션이 만료되었습니다. 다시 로그인해주세요.',
        type: AuthExceptionType.sessionExpired,
      );

  /// Creates an [AuthException] for invalid credentials.
  factory AuthException.invalidCredentials() => const AuthException(
        message: '로그인 정보가 올바르지 않습니다.',
        type: AuthExceptionType.invalidCredentials,
      );

  /// Creates an [AuthException] for login required.
  factory AuthException.loginRequired() => const AuthException(
        message: '로그인이 필요합니다.',
        type: AuthExceptionType.loginRequired,
      );

  @override
  String toString() => 'AuthException: $message (type: $type)';
}

/// Types of authentication exceptions.
enum AuthExceptionType {
  sessionExpired,
  invalidCredentials,
  loginRequired,
  unknown,
}

/// Cache/Storage related exceptions.
class CacheException implements AppException {
  @override
  final String message;

  @override
  final String? code;

  @override
  final dynamic originalError;

  const CacheException({
    required this.message,
    this.code,
    this.originalError,
  });

  factory CacheException.readError() => const CacheException(
        message: '캐시 데이터를 읽는 중 오류가 발생했습니다.',
      );

  factory CacheException.writeError() => const CacheException(
        message: '캐시 데이터를 저장하는 중 오류가 발생했습니다.',
      );

  @override
  String toString() => 'CacheException: $message';
}

/// Video/Streaming related exceptions.
class StreamingException implements AppException {
  @override
  final String message;

  @override
  final String? code;

  @override
  final dynamic originalError;

  final StreamingExceptionType type;

  const StreamingException({
    required this.message,
    this.code,
    this.originalError,
    this.type = StreamingExceptionType.unknown,
  });

  factory StreamingException.liveEnded() => const StreamingException(
        message: '라이브 방송이 종료되었습니다.',
        type: StreamingExceptionType.liveEnded,
      );

  factory StreamingException.playbackFailed() => const StreamingException(
        message: '재생 중 오류가 발생했습니다.',
        type: StreamingExceptionType.playbackFailed,
      );

  factory StreamingException.ageRestricted() => const StreamingException(
        message: '연령 제한 콘텐츠입니다.',
        type: StreamingExceptionType.ageRestricted,
      );

  factory StreamingException.regionRestricted() => const StreamingException(
        message: '해외에서는 시청할 수 없는 콘텐츠입니다.',
        type: StreamingExceptionType.regionRestricted,
      );

  @override
  String toString() => 'StreamingException: $message (type: $type)';
}

/// Types of streaming exceptions.
enum StreamingExceptionType {
  liveEnded,
  playbackFailed,
  ageRestricted,
  regionRestricted,
  unknown,
}

/// General/Unknown exceptions.
class UnknownException implements AppException {
  @override
  final String message;

  @override
  final String? code;

  @override
  final dynamic originalError;

  const UnknownException({
    this.message = '알 수 없는 오류가 발생했습니다.',
    this.code,
    this.originalError,
  });

  factory UnknownException.fromError(dynamic error) => UnknownException(
        message: error?.toString() ?? '알 수 없는 오류가 발생했습니다.',
        originalError: error,
      );

  @override
  String toString() => 'UnknownException: $message';
}
