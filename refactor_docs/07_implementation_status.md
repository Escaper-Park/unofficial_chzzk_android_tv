# 07. 구현 현황 및 마이그레이션 가이드

이 문서는 에러 핸들링 인프라의 구현 현황과 컨트롤러 마이그레이션 가이드를 제공합니다.

## 📊 구현 현황

### 인프라스트럭처 (완료)

| 컴포넌트 | 파일 경로 | 상태 | 설명 |
|---------|---------|------|------|
| Result 패턴 | `lib/src/common/result/result.dart` | ✅ 완료 | Success/Failure sealed class |
| AppException | `lib/src/common/exceptions/app_exception.dart` | ✅ 완료 | 예외 계층 구조 |
| ErrorHandlingInterceptor | `lib/src/utils/dio/error_handling_interceptor.dart` | ✅ 완료 | Dio 에러 → AppException 변환 |
| BaseRepository | `lib/src/utils/dio/base_repository.dart` | ✅ 완료 | handleApiCall() 제공 |
| AppErrorWidget | `lib/src/common/widgets/error/app_error_widget.dart` | ✅ 완료 | 에러 UI 컴포넌트 |
| RequestDeduplicator | `lib/src/utils/network/request_deduplicator.dart` | ✅ 완료 | 중복 요청 방지 |
| OptimizedCachedImage | `lib/src/utils/image/optimized_cached_image.dart` | ✅ 완료 | 최적화된 이미지 위젯 |
| InputValidator | `lib/src/utils/security/input_validator.dart` | ✅ 완료 | 입력 검증/새니타이징 |
| DioClient 수정 | `lib/src/utils/dio/dio_client.dart` | ✅ 완료 | 에러 전파 활성화 |

### 컨트롤러 마이그레이션 현황

| 컨트롤러 | 상태 | 비고 |
|---------|------|------|
| UserController | ✅ 완료 | Result 패턴 적용, AuthException 처리 |
| LiveController | ✅ 완료 | Result 패턴 적용, StreamingException 처리 |
| ChannelController | ✅ 완료 | Result 패턴 적용, follow/unfollow 지원 |
| ChannelLiveController | ✅ 완료 | LiveRepositoryWrapper 재사용 |
| FollowingController | ✅ 완료 | Result 패턴 적용, ChannelRepositoryWrapper 재사용 |
| CategoryController | ❌ 미적용 | |
| SearchController | ❌ 미적용 | |
| VodController | ❌ 미적용 | |
| 기타 컨트롤러 | ❌ 미적용 | |

### UI 통합 현황

| 컴포넌트 | 상태 | 비고 |
|---------|------|------|
| AppErrorWidget | ❌ 미적용 | 화면에 아직 사용되지 않음 |
| OptimizedCachedImage | ❌ 미적용 | 썸네일에 아직 사용되지 않음 |

---

## 🔧 마이그레이션 가이드

### Step 1: Repository Wrapper 생성

기존 Retrofit 인터페이스를 감싸는 Wrapper 클래스를 생성합니다.

```dart
// lib/src/features/<feature>/repository/<feature>_repository_wrapper.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/result/results.dart';
import '../../../utils/dio/base_repository.dart';
import '../../../utils/dio/dio_client.dart';
import '../model/<model>.dart';
import '<feature>_repository.dart';

part '<feature>_repository_wrapper.g.dart';

/// Repository wrapper that provides Result-based error handling.
class <Feature>RepositoryWrapper extends BaseRepository {
  final <Feature>Repository _repository;

  <Feature>RepositoryWrapper(this._repository);

  /// 예시: 데이터 조회 메서드
  Future<Result<Model?>> getData(String id) {
    return handleNullableApiCall(() => _repository.getData(id));
  }

  /// 예시: 목록 조회 메서드 (non-nullable)
  Future<Result<List<Model>>> getList() {
    return handleApiCall(() => _repository.getList());
  }
}

/// Provider for repository wrapper
@riverpod
<Feature>RepositoryWrapper <feature>RepositoryWrapper(<Feature>RepositoryWrapperRef ref) {
  final dio = ref.watch(dioClientProvider);
  final repository = <Feature>Repository(dio);
  return <Feature>RepositoryWrapper(repository);
}
```

### Step 2: Controller 업데이트

Controller에서 Result 패턴을 사용하도록 수정합니다.

```dart
// lib/src/features/<feature>/controller/<feature>_controller.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/exceptions/exceptions.dart';
import '../model/<model>.dart';
import '../repository/<feature>_repository_wrapper.dart';

part '<feature>_controller.g.dart';

@riverpod
class <Feature>Controller extends _$<Feature>Controller {
  @override
  FutureOr<Model?> build() async {
    return await fetchData();
  }

  Future<Model?> fetchData() async {
    final wrapper = ref.read(<feature>RepositoryWrapperProvider);
    final result = await wrapper.getData();

    return result.when(
      success: (data) {
        // 성공 처리
        return data;
      },
      failure: (exception) {
        // 에러 타입별 처리
        if (exception is AuthException) {
          // 인증 에러 처리 (예: 로그아웃)
          _handleAuthError();
        }
        
        // 디버그 로깅
        assert(() {
          print('<Feature>Controller error: ${exception.message}');
          return true;
        }());

        return null;
      },
    );
  }

  void _handleAuthError() {
    // 인증 에러 처리 로직
  }
}
```

### Step 3: 코드 생성 실행

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Step 4: 테스트 및 검증

```bash
# 분석 실행
flutter analyze --no-fatal-infos

# 테스트 실행
flutter test
```

---

## 📝 주요 클래스 참조

### Result 패턴

```dart
// Success/Failure 처리
result.when(
  success: (data) => handleSuccess(data),
  failure: (exception) => handleError(exception),
);

// Nullable 값 접근
final data = result.dataOrNull;
final error = result.exceptionOrNull;

// Boolean 체크
if (result.isSuccess) { ... }
if (result.isFailure) { ... }

// 기본값 반환
final data = result.getOrElse(defaultValue);

// 예외 던지기
final data = result.getOrThrow();

// 변환
final mapped = result.map((data) => transform(data));
```

### Exception 계층

```dart
// 네트워크 에러
NetworkException(
  message: '연결 실패',
  type: NetworkExceptionType.noConnection,
  statusCode: 500,
);

// 인증 에러
AuthException.sessionExpired();
AuthException.loginRequired();

// 스트리밍 에러
StreamingException.liveEnded();
StreamingException.ageRestricted();

// 캐시 에러
CacheException.readError();
CacheException.writeError();
```

### BaseRepository 메서드

```dart
// Non-nullable 반환
Future<Result<T>> handleApiCall<T>(Future<T> Function() apiCall);

// Nullable 반환
Future<Result<T?>> handleNullableApiCall<T>(Future<T?> Function() apiCall);

// 재시도 로직 포함
Future<Result<T>> handleApiCallWithRetry<T>(
  Future<T> Function() apiCall, {
  int maxRetries = 3,
  Duration retryDelay = const Duration(seconds: 1),
});
```

---

## 🎯 마이그레이션 우선순위

### 높음 (핵심 기능)
1. **LiveController** ✅ - 라이브 스트리밍 (앱의 핵심 기능)
2. **ChannelController** ✅ - 채널 정보 조회, follow/unfollow 지원
3. **FollowingController** ✅ - 팔로잉 목록

### 중간 (주요 기능)
4. **CategoryController** - 카테고리 브라우징
5. **SearchController** - 검색 기능
6. **VodController** - VOD 재생

### 낮음 (부가 기능)
7. **SettingsController** - 설정
8. **WatchingHistoryController** - 시청 기록

---

## ⚠️ 주의사항

### 하위 호환성 유지
- 기존 API 시그니처를 최대한 유지
- 필요한 경우 deprecated 어노테이션 사용

### 에러 처리 원칙
- 모든 에러는 `AppException` 계층으로 변환
- 사용자에게는 친화적인 메시지 표시 (한국어)
- 개발자에게는 상세한 로그 제공

### 테스트 작성
- 새로운 Wrapper마다 단위 테스트 추가
- 에러 케이스 테스트 포함

---

## 📁 파일 구조 예시

```
lib/src/features/channel/
├── controller/
│   ├── channel_controller.dart      # 수정됨
│   └── channel_controller.g.dart    # 생성됨
├── model/
│   ├── channel.dart
│   ├── channel.freezed.dart
│   └── channel.g.dart
├── repository/
│   ├── channel_repository.dart      # 기존 Retrofit 인터페이스
│   ├── channel_repository.g.dart
│   ├── channel_repository_wrapper.dart   # 새로 추가
│   └── channel_repository_wrapper.g.dart # 생성됨
└── widgets/
    └── ...
```

---

## 🔗 관련 문서

- [02. 에러 핸들링 개선사항](02_error_handling_improvements.md)
- [05. 코드 품질 개선사항](05_code_quality_improvements.md)
- [AGENTS.md](../AGENTS.md) - 코딩 가이드라인
