# 아키텍처 개선사항

## 1. Repository Pattern 개선

### 현재 문제점
- Repository 레이어와 Controller 레이어 사이의 의존성 관리가 일관성이 없음
- Retrofit 기반 Repository들이 직접적으로 Dio 인스턴스를 받아서 사용하는 구조
- 에러 핸들링이 Repository 레벨에서 `rethrow`로만 처리되어 중앙화된 에러 처리 부족

### 개선 방안

#### A. Repository Provider 패턴 도입
```dart
// 현재
final Dio dio = ref.watch(dioClientProvider);
_repository = UserRepository(dio);

// 개선안
@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  final dio = ref.watch(dioClientProvider);
  return UserRepository(dio);
}
```

#### B. 에러 핸들링 레이어 추가
```dart
abstract class ApiResult<T> {
  const ApiResult();
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final String message;
  final int? statusCode;
  const Failure(this.message, {this.statusCode});
}
```

## 2. Clean Architecture 레이어 분리

### 현재 문제점
- Domain 레이어가 명시적으로 분리되지 않음
- Business Logic이 Controller와 Repository에 산재됨
- Use Case 패턴 미사용으로 비즈니스 로직 재사용성 부족

### 개선 방안

#### A. Domain 레이어 도입
```
lib/src/
├── domain/
│   ├── entities/       # 순수한 비즈니스 엔티티
│   ├── repositories/   # Repository 인터페이스
│   └── usecases/       # Use Case 클래스들
├── data/
│   ├── models/         # API 응답 모델 (현재 model 폴더)
│   ├── repositories/   # Repository 구현체
│   └── datasources/    # 외부 데이터 소스
└── presentation/
    ├── controllers/    # UI 상태 관리
    └── widgets/        # UI 컴포넌트
```

#### B. Use Case 패턴 적용
```dart
abstract class UseCase<Type, Params> {
  Future<ApiResult<Type>> call(Params params);
}

class GetUserUseCase implements UseCase<User, NoParams> {
  final UserRepository repository;
  
  GetUserUseCase(this.repository);
  
  @override
  Future<ApiResult<User>> call(NoParams params) async {
    // 비즈니스 로직 구현
  }
}
```

## 3. 의존성 주입 개선

### 현재 문제점
- Controller 내부에서 직접 Repository 인스턴스 생성
- Provider 간의 의존성이 명시적이지 않음

### 개선 방안

#### A. Riverpod Generator 활용한 DI
```dart
@riverpod
class UserController extends _$UserController {
  @override
  FutureOr<User?> build() async {
    final useCase = ref.watch(getUserUseCaseProvider);
    final result = await useCase(NoParams());
    
    return result.when(
      success: (user) => user,
      failure: (message, statusCode) {
        // 에러 핸들링
        return null;
      },
    );
  }
}
```

## 4. 상태 관리 최적화

### 현재 문제점
- 너무 많은 AutoDispose Provider 사용으로 인한 불필요한 재생성
- Family Provider의 과도한 사용

### 개선 방안

#### A. Provider Scope 최적화
```dart
// 전역적으로 필요한 데이터는 keepAlive 사용
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  // ...
}

// 지역적 상태만 AutoDispose 사용
@riverpod
class SearchQueryController extends _$SearchQueryController {
  // ...
}
```

#### B. State Caching 전략
```dart
@riverpod
class CacheableDataController extends _$CacheableDataController {
  Timer? _cacheTimer;
  
  @override
  Future<Data> build() async {
    _cacheTimer?.cancel();
    _cacheTimer = Timer(Duration(minutes: 5), () {
      ref.invalidateSelf();
    });
    
    return fetchData();
  }
}
```

## 5. 코드 생성 최적화

### 현재 문제점
- Generated 파일들이 너무 많은 보일러플레이트 코드 생성
- Build Runner 실행 시간이 길어질 가능성

### 개선 방안

#### A. 코드 생성 최적화
- 불필요한 Generator 사용 줄이기
- Part 파일 구조 개선
- Build 캐시 활용 최대화 