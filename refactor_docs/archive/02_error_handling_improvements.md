# 에러 핸들링 개선사항

## 1. 중앙화된 에러 처리

### 현재 문제점
- Repository에서 단순한 `rethrow` 사용
- Controller에서 null 체크만으로 에러 처리
- 사용자에게 구체적인 에러 메시지 제공 부족
- 네트워크 오류, API 오류, 파싱 오류 등이 구분되지 않음

### 개선 방안

#### A. 에러 타입 정의
```dart
abstract class AppException implements Exception {
  final String message;
  final int? statusCode;
  
  const AppException(this.message, {this.statusCode});
}

class NetworkException extends AppException {
  const NetworkException(super.message, {super.statusCode});
}

class ApiException extends AppException {
  const ApiException(super.message, {super.statusCode});
}

class ParsingException extends AppException {
  const ParsingException(super.message, {super.statusCode});
}

class AuthenticationException extends AppException {
  const AuthenticationException(super.message, {super.statusCode});
}
```

#### B. Result 패턴 구현
```dart
sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends Result<T> {
  final AppException exception;
  const Error(this.exception);
}

// Extension for easy handling
extension ResultExtension<T> on Result<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(AppException exception) error,
  }) {
    return switch (this) {
      Success(data: final data) => success(data),
      Error(exception: final exception) => error(exception),
    };
  }
}
```

## 2. Dio Interceptor 개선

### 현재 문제점
- 에러 발생 시 단순히 null 반환
- HTTP 상태 코드별 세분화된 처리 부족
- 토큰 만료 등 인증 관련 에러 자동 처리 없음

### 개선 방안

#### A. 에러 처리 Interceptor
```dart
class ErrorHandlingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppException exception;
    
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        exception = NetworkException('네트워크 연결에 실패했습니다.');
        break;
        
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        switch (statusCode) {
          case 401:
            exception = AuthenticationException('인증이 만료되었습니다.');
            break;
          case 403:
            exception = AuthenticationException('접근 권한이 없습니다.');
            break;
          case 404:
            exception = ApiException('요청한 리소스를 찾을 수 없습니다.');
            break;
          case 500:
            exception = ApiException('서버에 오류가 발생했습니다.');
            break;
          default:
            exception = ApiException('알 수 없는 오류가 발생했습니다.', statusCode: statusCode);
        }
        break;
        
      default:
        exception = NetworkException('네트워크 오류가 발생했습니다.');
    }
    
    handler.reject(DioException(
      requestOptions: err.requestOptions,
      error: exception,
    ));
  }
}
```

#### B. Repository 에러 처리 개선
```dart
abstract class BaseRepository {
  Future<Result<T>> handleApiCall<T>(Future<T?> apiCall) async {
    try {
      final result = await apiCall;
      if (result == null) {
        return const Error(ApiException('데이터를 불러올 수 없습니다.'));
      }
      return Success(result);
    } on DioException catch (e) {
      if (e.error is AppException) {
        return Error(e.error as AppException);
      }
      return const Error(NetworkException('네트워크 오류가 발생했습니다.'));
    } catch (e) {
      return Error(ParsingException('데이터 처리 중 오류가 발생했습니다: ${e.toString()}'));
    }
  }
}

class UserRepository extends BaseRepository {
  Future<Result<User>> getUser() async {
    return handleApiCall(() => _userRepository.getUser());
  }
}
```

## 3. Controller 에러 처리 개선

### 현재 문제점
- 에러 상태를 제대로 사용자에게 전달하지 않음
- AsyncValue.error 사용이 일관성이 없음

### 개선 방안

#### A. 에러 상태 통합 관리
```dart
@riverpod
class UserController extends _$UserController {
  @override
  Future<User?> build() async {
    final repository = ref.watch(userRepositoryProvider);
    final result = await repository.getUser();
    
    return result.when(
      success: (user) => user,
      error: (exception) {
        // 로깅
        ref.read(loggerProvider).error('User fetch failed', exception);
        
        // 인증 에러인 경우 자동 로그아웃
        if (exception is AuthenticationException) {
          ref.read(authControllerProvider.notifier).signOut();
        }
        
        // AsyncValue.error로 상태 설정
        throw exception;
      },
    );
  }
}
```

## 4. 사용자 친화적 에러 메시지

### 현재 문제점
- 기술적인 에러 메시지가 사용자에게 그대로 노출
- 에러 발생 시 복구 방법 제시 부족

### 개선 방안

#### A. 에러 메시지 국제화
```dart
class ErrorMessages {
  static const Map<Type, String> _messages = {
    NetworkException: '인터넷 연결을 확인해주세요',
    AuthenticationException: '다시 로그인해주세요',
    ApiException: '잠시 후 다시 시도해주세요',
  };
  
  static String getDisplayMessage(AppException exception) {
    return _messages[exception.runtimeType] ?? '알 수 없는 오류가 발생했습니다';
  }
}
```

#### B. 에러 UI 컴포넌트
```dart
class ErrorWidget extends StatelessWidget {
  final AppException exception;
  final VoidCallback? onRetry;
  
  const ErrorWidget({
    super.key,
    required this.exception,
    this.onRetry,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _getErrorIcon(exception),
          size: 64,
          color: AppColors.greyColor,
        ),
        const SizedBox(height: 16),
        Text(
          ErrorMessages.getDisplayMessage(exception),
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        if (onRetry != null) ...[
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('다시 시도'),
          ),
        ],
      ],
    );
  }
  
  IconData _getErrorIcon(AppException exception) {
    return switch (exception.runtimeType) {
      NetworkException => Icons.wifi_off,
      AuthenticationException => Icons.lock_outline,
      _ => Icons.error_outline,
    };
  }
}
```

## 5. 로깅 및 모니터링

### 현재 문제점
- 에러 발생 시 적절한 로깅 부족
- 디버깅을 위한 정보 수집 미흡

### 개선 방안

#### A. 구조화된 로깅
```dart
@riverpod
class Logger extends _$Logger {
  late final logger.Logger _logger;
  
  @override
  logger.Logger build() {
    _logger = logger.Logger();
    return _logger;
  }
  
  void error(String message, AppException exception, [StackTrace? stackTrace]) {
    _logger.e(
      'Error: $message',
      error: exception,
      stackTrace: stackTrace,
      time: DateTime.now(),
    );
    
    // 프로덕션에서는 크래시 분석 도구로 전송
    if (kReleaseMode) {
      _sendToCrashlytics(message, exception, stackTrace);
    }
  }
}
```

#### B. 에러 복구 전략
```dart
class RetryableRepository extends BaseRepository {
  Future<Result<T>> retryableApiCall<T>(
    Future<T?> Function() apiCall, {
    int maxRetries = 3,
    Duration delay = const Duration(seconds: 1),
  }) async {
    for (int attempt = 0; attempt <= maxRetries; attempt++) {
      final result = await handleApiCall(apiCall);
      
      if (result is Success || attempt == maxRetries) {
        return result;
      }
      
      if (result is Error && result.exception is NetworkException) {
        await Future.delayed(delay * (attempt + 1));
        continue;
      }
      
      return result;
    }
    
    return const Error(NetworkException('재시도 후에도 연결할 수 없습니다'));
  }
}
``` 