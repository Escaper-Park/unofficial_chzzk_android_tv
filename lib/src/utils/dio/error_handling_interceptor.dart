import 'package:dio/dio.dart';

import '../../common/exceptions/exceptions.dart';
import '../../common/result/results.dart';

/// Interceptor that converts DioException to typed AppException.
///
/// This interceptor provides centralized error handling for all HTTP requests,
/// converting network errors into domain-specific exception types that can be
/// handled uniformly throughout the application.
///
/// Usage:
/// ```dart
/// dio.interceptors.add(ErrorHandlingInterceptor());
/// ```
class ErrorHandlingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = _mapDioExceptionToAppException(err);

    // Attach the AppException to the DioException for downstream handling
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: exception,
        stackTrace: err.stackTrace,
        message: exception.message,
      ),
    );
  }

  /// Maps a [DioException] to an appropriate [AppException] subtype.
  AppException _mapDioExceptionToAppException(DioException err) {
    // Handle response errors (HTTP status codes)
    if (err.type == DioExceptionType.badResponse && err.response != null) {
      return _handleHttpError(err.response!.statusCode, err);
    }

    // Handle connection and timeout errors
    return _handleConnectionError(err);
  }

  /// Handles HTTP status code errors.
  AppException _handleHttpError(int? statusCode, DioException err) {
    // Handle null status code
    if (statusCode == null) {
      return NetworkException(
        message: '네트워크 오류가 발생했습니다.',
        type: NetworkExceptionType.unknown,
        originalError: err,
      );
    }

    return switch (statusCode) {
      400 => NetworkException(
          message: '잘못된 요청입니다.',
          statusCode: statusCode,
          type: NetworkExceptionType.serverError,
          originalError: err,
        ),
      401 => AuthException(
          message: '인증이 만료되었습니다. 다시 로그인해주세요.',
          type: AuthExceptionType.sessionExpired,
          originalError: err,
        ),
      403 => AuthException(
          message: '접근 권한이 없습니다.',
          type: AuthExceptionType.loginRequired,
          originalError: err,
        ),
      404 => NetworkException(
          message: '요청한 리소스를 찾을 수 없습니다.',
          statusCode: statusCode,
          type: NetworkExceptionType.serverError,
          originalError: err,
        ),
      429 => NetworkException(
          message: '요청이 너무 많습니다. 잠시 후 다시 시도해주세요.',
          statusCode: statusCode,
          type: NetworkExceptionType.serverError,
          originalError: err,
        ),
      500 || 501 || 502 || 503 || 504 => NetworkException(
          message: '서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.',
          statusCode: statusCode,
          type: NetworkExceptionType.serverError,
          originalError: err,
        ),
      _ => NetworkException(
          message: '네트워크 오류가 발생했습니다.',
          statusCode: statusCode,
          type: NetworkExceptionType.unknown,
          originalError: err,
        ),
    };
  }

  /// Handles connection-related errors.
  AppException _handleConnectionError(DioException err) {
    return switch (err.type) {
      DioExceptionType.connectionTimeout => NetworkException(
          message: '연결 시간이 초과되었습니다. 네트워크 상태를 확인해주세요.',
          type: NetworkExceptionType.timeout,
          originalError: err,
        ),
      DioExceptionType.sendTimeout => NetworkException(
          message: '요청 전송 시간이 초과되었습니다.',
          type: NetworkExceptionType.timeout,
          originalError: err,
        ),
      DioExceptionType.receiveTimeout => NetworkException(
          message: '응답 수신 시간이 초과되었습니다.',
          type: NetworkExceptionType.timeout,
          originalError: err,
        ),
      DioExceptionType.connectionError => NetworkException(
          message: '인터넷 연결을 확인해주세요.',
          type: NetworkExceptionType.noConnection,
          originalError: err,
        ),
      DioExceptionType.badCertificate => NetworkException(
          message: '보안 인증서 오류가 발생했습니다.',
          type: NetworkExceptionType.security,
          originalError: err,
        ),
      DioExceptionType.cancel => NetworkException(
          message: '요청이 취소되었습니다.',
          type: NetworkExceptionType.cancelled,
          originalError: err,
        ),
      _ => UnknownException(
          message: '알 수 없는 네트워크 오류가 발생했습니다.',
          originalError: err,
        ),
    };
  }
}

/// Extension to extract AppException from DioException.
extension DioExceptionExtension on DioException {
  /// Returns the attached [AppException] if available, otherwise creates one.
  AppException get appException {
    if (error is AppException) {
      return error as AppException;
    }
    return NetworkException.fromDioError(this);
  }
}
