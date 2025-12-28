# 구현 가이드 (Implementation Guide)

에러 핸들링 인프라, UX 개선, 성능 최적화의 구현 현황과 가이드입니다.

> **최종 업데이트**: 2025-12-28

## 📊 구현 현황

### 인프라스트럭처 (✅ 완료)

| 컴포넌트 | 파일 경로 | 상태 | 설명 |
|---------|---------|------|------|
| Result 패턴 | `lib/src/common/result/result.dart` | ✅ 완료 | Success/Failure sealed class |
| AppException | `lib/src/common/exceptions/app_exception.dart` | ✅ 완료 | 예외 계층 구조 |
| ErrorHandlingInterceptor | `lib/src/utils/dio/error_handling_interceptor.dart` | ✅ 완료 | Dio 에러 → AppException 변환 |
| BaseRepository | `lib/src/utils/dio/base_repository.dart` | ✅ 완료 | handleApiCall() 제공 |
| AppErrorWidget | `lib/src/common/widgets/error/app_error_widget.dart` | ✅ 완료 | 에러 UI 컴포넌트 |
| RequestDeduplicator | `lib/src/utils/network/request_deduplicator.dart` | ✅ 완료 | 중복 요청 방지 |
| OptimizedNetworkImage | `lib/src/utils/image/optimized_cached_image.dart` | ✅ 완료 | 최적화된 이미지 위젯 |
| InputValidator | `lib/src/utils/security/input_validator.dart` | ✅ 완료 | 입력 검증/새니타이징 |
| DioClient 수정 | `lib/src/utils/dio/dio_client.dart` | ✅ 완료 | 에러 전파 활성화 |

### UX 개선 (✅ 완료)

| 컴포넌트 | 파일 경로 | 상태 | 설명 |
|---------|---------|------|------|
| ToastService | `lib/src/common/widgets/toast/toast_service.dart` | ✅ 완료 | Riverpod 기반 토스트 서비스 |
| ToastOverlay | `lib/src/common/widgets/toast/toast_overlay.dart` | ✅ 완료 | 애니메이션 토스트 오버레이 |

### 성능 & 안정성 (✅ 완료)

| 컴포넌트 | 파일 경로 | 상태 | 설명 |
|---------|---------|------|------|
| LivePlayerController | `lib/src/features/live_stream/controller/` | ✅ 완료 | ref.onDispose() 보장된 정리 |
| VodPlayerController | `lib/src/features/vod_stream/controller/` | ✅ 완료 | ref.onDispose() 보장된 정리 |

### Repository Wrapper 현황 (✅ 완료 - 10개)

| Wrapper | 파일 경로 | 상태 |
|---------|---------|------|
| UserRepositoryWrapper | `lib/src/features/user/repository/` | ✅ 완료 |
| LiveRepositoryWrapper | `lib/src/features/live/repository/` | ✅ 완료 |
| ChannelRepositoryWrapper | `lib/src/features/channel/repository/` | ✅ 완료 |
| CategoryRepositoryWrapper | `lib/src/features/category/repository/` | ✅ 완료 |
| VodRepositoryWrapper | `lib/src/features/vod/repository/` | ✅ 완료 |
| ClipRepositoryWrapper | `lib/src/features/clip/repository/` | ✅ 완료 |
| FollowingRepositoryWrapper | `lib/src/features/following/repository/` | ✅ 완료 |
| SearchRepositoryWrapper | `lib/src/features/search/repository/` | ✅ 완료 |
| SearchTagRepositoryWrapper | `lib/src/features/search_tag/repository/` | ✅ 완료 |
| WatchingHistoryRepositoryWrapper | `lib/src/features/watching_history/repository/` | ✅ 완료 |

### 컨트롤러 마이그레이션 현황 (✅ 완료 - 31개)

모든 네트워크 API를 호출하는 컨트롤러가 Result 패턴으로 마이그레이션되었습니다.

#### User 관련
| 컨트롤러 | 상태 | 비고 |
|---------|------|------|
| UserController | ✅ 완료 | Result 패턴 적용, AuthException 처리 |
| PrivateUserBlocksController | ✅ 완료 | Result 패턴 적용 |

#### Live 관련
| 컨트롤러 | 상태 | 비고 |
|---------|------|------|
| LiveController | ✅ 완료 | Result 패턴 적용, StreamingException 처리 |
| LiveAllController | ✅ 완료 | Result 패턴 적용, 페이지네이션 지원 |

#### Channel 관련
| 컨트롤러 | 상태 | 비고 |
|---------|------|------|
| ChannelController | ✅ 완료 | Result 패턴 적용, follow/unfollow 지원 |
| ChannelLiveController | ✅ 완료 | LiveRepositoryWrapper 재사용 |
| ChannelVodController | ✅ 완료 | VodRepositoryWrapper 사용 |
| ChannelClipController | ✅ 완료 | ClipRepositoryWrapper 사용 |
| ChannelVodAllController | ✅ 완료 | 페이지네이션 지원 |
| ChannelClipAllController | ✅ 완료 | 페이지네이션 지원 |

#### Following 관련
| 컨트롤러 | 상태 | 비고 |
|---------|------|------|
| FollowingController | ✅ 완료 | ChannelRepositoryWrapper 재사용 |
| FollowingCategoryController | ✅ 완료 | CategoryRepositoryWrapper 재사용 |
| FollowingVodController | ✅ 완료 | VodRepositoryWrapper 사용 |

#### Category 관련
| 컨트롤러 | 상태 | 비고 |
|---------|------|------|
| CategoryController | ✅ 완료 | CategoryRepositoryWrapper 사용 |
| CategoryLiveController | ✅ 완료 | 페이지네이션 지원 |
| CategoryVodController | ✅ 완료 | 페이지네이션 지원 |
| CategoryClipController | ✅ 완료 | 페이지네이션 지원 |

#### VOD 관련
| 컨트롤러 | 상태 | 비고 |
|---------|------|------|
| VodController | ✅ 완료 | VodRepositoryWrapper 사용 |
| VodAllController | ✅ 완료 | 페이지네이션 지원 |

#### Clip 관련
| 컨트롤러 | 상태 | 비고 |
|---------|------|------|
| ClipPopularController | ✅ 완료 | ClipRepositoryWrapper 사용 |

#### Home 관련
| 컨트롤러 | 상태 | 비고 |
|---------|------|------|
| HomeFollowingLivesController | ✅ 완료 | FollowingRepositoryWrapper 사용 |
| HomePopularLivesController | ✅ 완료 | LiveRepositoryWrapper 사용 |

#### Search 관련
| 컨트롤러 | 상태 | 비고 |
|---------|------|------|
| AutoCompleteController | ✅ 완료 | SearchRepositoryWrapper 사용 |
| AutoCompleteTagController | ✅ 완료 | SearchTagRepositoryWrapper 사용 |
| SearchChannelController | ✅ 완료 | 블록 사용자 필터링 |
| SearchLiveController | ✅ 완료 | Channel 매핑 처리 |
| SearchVodController | ✅ 완료 | 블록 사용자 필터링 |
| SearchTagResultLiveController | ✅ 완료 | 페이지네이션 지원 |
| SearchTagResultVodController | ✅ 완료 | 페이지네이션 지원 |

#### History 관련
| 컨트롤러 | 상태 | 비고 |
|---------|------|------|
| WatchingHistoryController | ✅ 완료 | 페이지네이션 지원 |

### 마이그레이션 불필요 컨트롤러 (네트워크 API 미사용)

다음 컨트롤러들은 네트워크 API를 호출하지 않으므로 Result 패턴 마이그레이션이 불필요합니다:

#### 상태 관리 전용 컨트롤러
| 컨트롤러 | 용도 |
|---------|------|
| LiveModeController | 라이브 모드 상태 |
| LiveOverlayController | 오버레이 UI 상태 |
| LiveWindowController | 윈도우 레이아웃 상태 |
| LivePlaylistController | 재생목록 상태 |
| LiveStreamNavigatorController | 네비게이션 상태 |
| LiveStreamStatusController | 스트림 상태 |
| VodOverlayController | VOD 오버레이 상태 |
| VodWindowController | VOD 윈도우 상태 |
| VodPlaylistController | VOD 재생목록 상태 |
| VodSeekIndicatorController | 탐색 인디케이터 상태 |
| HomeRefreshController | 새로고침 상태 |
| PauseTimer | 타이머 상태 |

#### SharedPreferences 컨트롤러
| 컨트롤러 | 용도 |
|---------|------|
| StreamSettingsController | 스트림 설정 |
| ChatSettingController | 채팅 설정 |
| GroupController | 그룹 관리 |
| GroupDetailController | 그룹 상세 |
| SettingsScreenController | 설정 화면 |

#### 특수 목적 컨트롤러
| 컨트롤러 | 용도 |
|---------|------|
| AuthController | WebView 인증 처리 |
| LiveChatController | WebSocket 채팅 |
| VodChatController | WebSocket 채팅 |
| LivePlayerController | VideoPlayer 생명주기 (✅ dispose 보장) |
| VodPlayerController | VideoPlayer 생명주기 (✅ dispose 보장) |
| ClipController | 클립 URL 생성 |
| UpdateController | GitHub API (추후 마이그레이션 가능) |

### UI 통합 현황 (✅ Phase 3 완료)

| 컴포넌트 | 상태 | 사용처 |
|---------|------|------|
| OptimizedNetworkImage | ✅ 사용중 | 썸네일, 프로필 이미지, 카테고리 포스터, 채팅 이미지, 홈 카테고리 |
| AsyncValueErrorWidget | ✅ 적용됨 | AdaptiveGridViewWithAsyncValue, DpadListViewWithAsyncValue |
| AppErrorWidget | ✅ 적용됨 | AsyncValueErrorWidget을 통해 간접 사용 (AppException 타입에서 자동 활성화) |
| InputValidator | ✅ 적용됨 | 검색 입력 sanitization (SearchEvent, SearchTagEvent) |

#### Phase 3 구현 상세

1. **AsyncValueErrorWidget** (`lib/src/common/widgets/error/async_value_error_widget.dart`)
   - AsyncValue 에러 상태를 처리하는 브릿지 위젯
   - AppException인 경우 AppErrorWidget 사용 (아이콘, 재시도 버튼 포함)
   - 일반 에러인 경우 fallback 메시지 표시
   - compact 모드 지원

2. **AdaptiveGridViewWithAsyncValue 업데이트**
   - 에러 시 AsyncValueErrorWidget 사용
   - 시각적으로 향상된 에러 표시

3. **DpadListViewWithAsyncValue 업데이트**
   - useExceptionFallbackWidget=false일 때 AsyncValueErrorWidget 사용
   - onRetry 콜백 지원

4. **InputValidator 통합**
   - `SearchEvent.pushSearchResultWithKeyword()` - 검색어 sanitization
   - `SearchEvent.updateAutoComplete()` - 자동완성 입력 sanitization
   - `SearchTagEvent.pushSearchTagResult()` - 태그 검색어 sanitization
   - `SearchTagEvent.updateAutoComplete()` - 태그 자동완성 입력 sanitization

### Toast 알림 시스템 (✅ Phase 4 완료)

사용자에게 즉각적인 피드백을 제공하는 토스트 알림 시스템입니다.

| 컴포넌트 | 상태 | 설명 |
|---------|------|------|
| ToastService | ✅ 완료 | Riverpod 기반 토스트 상태 관리 |
| ToastOverlay | ✅ 완료 | 애니메이션(slide+fade) 오버레이 |
| ChannelController 통합 | ✅ 완료 | 팔로우/언팔로우 피드백 |

#### Phase 4 구현 상세

1. **ToastService** (`lib/src/common/widgets/toast/toast_service.dart`)
   - `showSuccess(message)` - 성공 메시지 (녹색)
   - `showError(message)` - 에러 메시지 (빨간색)
   - `showInfo(message)` - 정보 메시지 (회색)
   - 자동 3초 후 사라짐

2. **ToastOverlay** (`lib/src/common/widgets/toast/toast_overlay.dart`)
   - `MaterialApp`을 감싸는 오버레이 위젯
   - Slide + Fade 애니메이션
   - TV 화면 하단 중앙에 표시

3. **ChannelController 통합**
   - 팔로우 성공: "팔로우했습니다"
   - 언팔로우 성공: "팔로우를 해제했습니다"
   - 실패: "팔로우에 실패했습니다" / "팔로우 해제에 실패했습니다"

### VideoPlayer 생명주기 개선 (✅ Phase 5 완료)

VideoPlayer 리소스 누수를 방지하는 보장된 정리 메커니즘입니다.

| 컴포넌트 | 상태 | 설명 |
|---------|------|------|
| LivePlayerController | ✅ 완료 | ref.onDispose() 보장된 정리 |
| VodPlayerController | ✅ 완료 | ref.onDispose() 보장된 정리 |

#### Phase 5 구현 상세

1. **ref.onDispose() 콜백**
   - Provider가 폐기될 때 항상 실행되는 정리 콜백
   - VideoPlayerController.dispose() 보장
   - 부분 초기화 상태에서도 안전하게 정리

2. **_cleanupController() 메서드**
   - 컨트롤러 정리 로직 중앙화
   - null 체크 후 안전하게 dispose

3. **init() 에러 복구**
   - 초기화 중 에러 발생 시 부분적으로 생성된 리소스 정리
   - VideoPlayerController 생성 후 에러 시 즉시 dispose

---

## 🔧 마이그레이션 가이드

### Step 1: Repository Wrapper 생성

기존 Retrofit 인터페이스를 감싸는 Wrapper 클래스를 생성합니다.

```dart
// lib/src/features/<feature>/repository/<feature>_repository_wrapper.dart

import 'package:hooks_riverpod/hooks_riverpod.dart';
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
/// NOTE: Ref 타입 사용 (Riverpod 3.0 호환)
@riverpod
<Feature>RepositoryWrapper <feature>RepositoryWrapper(Ref ref) {
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
│   ├── channel_controller.dart      # Result 패턴 적용됨
│   └── channel_controller.g.dart    # 생성됨
├── model/
│   ├── channel.dart
│   ├── channel.freezed.dart
│   └── channel.g.dart
├── repository/
│   ├── channel_repository.dart      # 기존 Retrofit 인터페이스
│   ├── channel_repository.g.dart
│   ├── channel_repository_wrapper.dart   # Result 패턴 wrapper
│   └── channel_repository_wrapper.g.dart # 생성됨
└── widgets/
    └── ...
```

---

## 🔔 Toast 사용 가이드

### 기본 사용법

```dart
// Controller나 Widget에서 사용
final toastService = ref.read(toastServiceProvider.notifier);

// 성공 메시지
toastService.showSuccess('팔로우했습니다');

// 에러 메시지
toastService.showError('팔로우에 실패했습니다');

// 정보 메시지
toastService.showInfo('새로운 알림이 있습니다');
```

### 설정 (main.dart)

```dart
// ToastOverlay로 MaterialApp 감싸기
ProviderScope(
  child: ToastOverlay(
    child: MaterialApp.router(...),
  ),
)
```

### 새로운 기능에 Toast 추가하기

```dart
@riverpod
class MyController extends _$MyController {
  Future<void> doSomething() async {
    final result = await wrapper.doSomething();
    
    result.when(
      success: (_) {
        ref.read(toastServiceProvider.notifier).showSuccess('완료되었습니다');
      },
      failure: (e) {
        ref.read(toastServiceProvider.notifier).showError('실패했습니다');
      },
    );
  }
}
```

---

## 🎮 VideoPlayer 생명주기 가이드

### ref.onDispose() 패턴

```dart
@riverpod
class PlayerController extends _$PlayerController {
  VideoPlayerController? _controller;

  @override
  FutureOr<VideoPlayerValue> build() async {
    // 보장된 정리 콜백 등록
    ref.onDispose(_cleanupController);
    
    return await init();
  }

  void _cleanupController() {
    _controller?.dispose();
    _controller = null;
  }

  Future<VideoPlayerValue> init() async {
    try {
      _controller = VideoPlayerController.networkUrl(uri);
      await _controller!.initialize();
      return _controller!.value;
    } catch (e) {
      // 부분 초기화 상태 정리
      _cleanupController();
      rethrow;
    }
  }
}
```

### 핵심 원칙

1. **ref.onDispose() 먼저 등록**: build() 시작 시 정리 콜백 등록
2. **null 체크**: 컨트롤러가 null일 수 있으므로 안전하게 처리
3. **에러 시 정리**: try-catch에서 에러 발생 시 부분 리소스 정리
4. **중앙화된 정리**: _cleanupController() 메서드로 정리 로직 통합

---

## 🔄 Riverpod 3.0 준비 (✅ Phase 6 완료)

Riverpod 3.0 업그레이드를 위한 사전 준비 작업입니다.

### 변경 사항

| 항목 | 변경 전 | 변경 후 | 파일 수 |
|------|--------|--------|--------|
| Provider Ref 타입 | `*RepositoryWrapperRef` | `Ref` | 10개 |
| Color 접근자 | `.red`, `.green`, `.blue` | `.r`, `.g`, `.b` | 1개 |
| 코드 스타일 | 불일치 | 통일 | 4개 |

### Deprecated Ref 타입 교체

Riverpod 2.x에서 자동 생성되는 `*Ref` 타입은 3.0에서 제거됩니다.

```dart
// ❌ Before (deprecated in Riverpod 3.0)
@riverpod
UserRepositoryWrapper userRepositoryWrapper(UserRepositoryWrapperRef ref) {
  // ...
}

// ✅ After (Riverpod 3.0 compatible)
@riverpod
UserRepositoryWrapper userRepositoryWrapper(Ref ref) {
  // ...
}
```

**수정된 파일 (10개):**
- `category_repository_wrapper.dart`
- `channel_repository_wrapper.dart`
- `clip_repository_wrapper.dart`
- `following_repository_wrapper.dart`
- `live_repository_wrapper.dart`
- `search_repository_wrapper.dart`
- `search_tag_repository_wrapper.dart`
- `user_repository_wrapper.dart`
- `vod_repository_wrapper.dart`
- `watching_history_repository_wrapper.dart`

### Flutter 3.27+ Color 접근자

```dart
// ❌ Before (deprecated)
final int r = backgroundColor.red;
final int g = backgroundColor.green;
final int b = backgroundColor.blue;

// ✅ After (Flutter 3.27+)
final int r = (backgroundColor.r * 255.0).round() & 0xff;
final int g = (backgroundColor.g * 255.0).round() & 0xff;
final int b = (backgroundColor.b * 255.0).round() & 0xff;
```

### Lint 이슈 정리

| 이슈 유형 | 수정 전 | 수정 후 |
|----------|--------|--------|
| `deprecated_member_use` | 13개 | 0개 |
| `avoid_print` | 7개 | 0개 (ignore 처리) |
| `curly_braces_in_flow_control_structures` | 1개 | 0개 |
| `require_trailing_commas` | 1개 | 0개 |
| `unnecessary_brace_in_string_interps` | 4개 | 0개 |
| **총합** | **26개** | **0개** |

### 검증 결과

```bash
$ flutter analyze --no-fatal-infos
Analyzing unofficial_chzzk_android_tv...
No issues found! (ran in 7.1s)

$ flutter test
00:08 +100: All tests passed!
```

---

## 🔗 관련 문서

- [AGENTS.md](../AGENTS.md) - 코딩 가이드라인
- [archive/](archive/) - 추가 개선 아이디어 (미구현 제안서)
