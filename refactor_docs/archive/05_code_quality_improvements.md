# 코드 품질 개선사항

## 1. 테스트 코드 추가

### 현재 문제점
- 유닛 테스트가 거의 없음
- 위젯 테스트 부족
- Integration 테스트 미구현
- 테스트 가능한 구조로 설계되지 않음

### 개선 방안

#### A. 유닛 테스트 구조
```dart
// test/unit/repositories/user_repository_test.dart
void main() {
  group('UserRepository', () {
    late MockDio mockDio;
    late UserRepository repository;
    
    setUp(() {
      mockDio = MockDio();
      repository = UserRepository(mockDio);
    });
    
    test('getUser returns user when API call succeeds', () async {
      // Arrange
      final mockResponse = {
        'content': {
          'userIdHash': 'test123',
          'nickname': 'TestUser',
          'profileImageUrl': 'https://example.com/image.jpg',
        }
      };
      
      when(() => mockDio.fetch<Map<String, dynamic>>(any()))
          .thenAnswer((_) async => Response(
            data: mockResponse,
            statusCode: 200,
            requestOptions: RequestOptions(path: '/test'),
          ));
      
      // Act
      final result = await repository.getUser();
      
      // Assert
      expect(result, isA<User>());
      expect(result!.nickname, 'TestUser');
    });
    
    test('getUser returns null when API call fails', () async {
      // Arrange
      when(() => mockDio.fetch<Map<String, dynamic>>(any()))
          .thenThrow(DioException(
            requestOptions: RequestOptions(path: '/test'),
            type: DioExceptionType.connectionTimeout,
          ));
      
      // Act
      final result = await repository.getUser();
      
      // Assert
      expect(result, isNull);
    });
  });
}
```

#### B. Controller 테스트
```dart
// test/unit/controllers/user_controller_test.dart
void main() {
  group('UserController', () {
    late ProviderContainer container;
    late MockUserRepository mockRepository;
    
    setUp(() {
      mockRepository = MockUserRepository();
      container = ProviderContainer(
        overrides: [
          userRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
    });
    
    tearDown(() {
      container.dispose();
    });
    
    test('build returns user when repository call succeeds', () async {
      // Arrange
      final user = User(
        userIdHash: 'test123',
        nickname: 'TestUser',
        profileImageUrl: 'https://example.com/image.jpg',
      );
      
      when(() => mockRepository.getUser())
          .thenAnswer((_) async => Success(user));
      
      // Act
      final controller = container.read(userControllerProvider);
      
      // Assert
      await expectLater(
        controller.future,
        completion(equals(user)),
      );
    });
  });
}
```

#### C. 위젯 테스트
```dart
// test/widget/video_card_test.dart
void main() {
  group('VideoCard', () {
    testWidgets('displays video information correctly', (tester) async {
      // Arrange
      final video = Video(
        videoNo: 123,
        title: 'Test Video',
        thumbnailImageUrl: 'https://example.com/thumb.jpg',
        duration: 300,
        readCount: 1000,
      );
      
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: VideoCard(video: video, onTap: () {}),
        ),
      );
      
      // Assert
      expect(find.text('Test Video'), findsOneWidget);
      expect(find.text('05:00'), findsOneWidget); // duration formatted
      expect(find.text('1,000'), findsOneWidget); // view count
    });
    
    testWidgets('calls onTap when tapped', (tester) async {
      // Arrange
      bool tapped = false;
      final video = Video(/* ... */);
      
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: VideoCard(
            video: video, 
            onTap: () => tapped = true,
          ),
        ),
      );
      
      await tester.tap(find.byType(VideoCard));
      
      // Assert
      expect(tapped, isTrue);
    });
  });
}
```

## 2. 문서화 개선

### 현재 문제점
- 코드 주석이 부족함
- API 문서화 미흡
- 아키텍처 문서 부족

### 개선 방안

#### A. 코드 주석 표준화
```dart
/// 사용자 정보를 관리하는 컨트롤러
/// 
/// 로그인된 사용자의 정보를 가져오고 관리하며,
/// 인증 실패 시 자동으로 로그아웃 처리를 수행합니다.
/// 
/// 사용 예시:
/// ```dart
/// final user = ref.watch(userControllerProvider);
/// user.when(
///   data: (user) => Text(user?.nickname ?? 'Guest'),
///   loading: () => CircularProgressIndicator(),
///   error: (error, stack) => Text('Error: $error'),
/// );
/// ```
@riverpod
class UserController extends _$UserController {
  /// 사용자 정보를 초기화하고 반환합니다.
  /// 
  /// 인증 실패 시 null을 반환하며, 이 경우 자동으로 
  /// 인증 정보가 삭제됩니다.
  @override
  Future<User?> build() async {
    // Implementation
  }
  
  /// 로그인을 수행하고 사용자 정보를 업데이트합니다.
  /// 
  /// Throws [AuthenticationException] 로그인 실패 시
  Future<void> signIn() async {
    // Implementation
  }
}
```

#### B. README 개선
```markdown
# 치지직 Android TV (비공식)

## 📋 목차
- [프로젝트 개요](#프로젝트-개요)
- [기술 스택](#기술-스택)
- [아키텍처](#아키텍처)
- [설치 및 실행](#설치-및-실행)
- [개발 가이드](#개발-가이드)
- [테스트](#테스트)
- [기여하기](#기여하기)

## 🎯 프로젝트 개요
네이버 치지직 플랫폼을 Android TV에서 사용할 수 있도록 개발된 비공식 애플리케이션입니다.

## 🛠 기술 스택
- **Framework**: Flutter 3.5.4+
- **State Management**: Riverpod 2.6+
- **Networking**: Retrofit + Dio
- **Code Generation**: Freezed, Json Annotation
- **Architecture**: Clean Architecture + MVVM

## 🏗 아키텍처
```
lib/src/
├── domain/          # 비즈니스 로직 레이어
├── data/            # 데이터 레이어
├── presentation/    # UI 레이어
└── common/          # 공통 컴포넌트
```

자세한 아키텍처 정보는 [ARCHITECTURE.md](docs/ARCHITECTURE.md)를 참조하세요.
```

## 3. 타입 안전성 강화

### 현재 문제점
- dynamic 타입 과도한 사용
- null safety 활용 미흡
- 타입 캐스팅에 의존

### 개선 방안

#### A. 강타입 모델 정의
```dart
// Before
class Video {
  final dynamic videoNo;
  final String? title;
  final dynamic duration;
  
  Video({this.videoNo, this.title, this.duration});
  
  factory Video.fromJson(Map<String, dynamic> json) => Video(
    videoNo: json['videoNo'],
    title: json['title'],
    duration: json['duration'],
  );
}

// After
@freezed
class Video with _$Video {
  const factory Video({
    required int videoNo,
    required String title,
    required String thumbnailImageUrl,
    required Duration duration,
    required int readCount,
    required DateTime publishDate,
    required VideoStatus status,
  }) = _Video;
  
  factory Video.fromJson(Map<String, Object?> json) => _$VideoFromJson(json);
}

enum VideoStatus {
  @JsonValue('PUBLIC')
  public,
  @JsonValue('PRIVATE')
  private,
  @JsonValue('DELETED')
  deleted,
}
```

#### B. Result 타입 활용
```dart
// Repository 메서드의 반환 타입을 명확히 정의
abstract class VideoRepository {
  Future<Result<List<Video>>> getVideos({
    required int page,
    required int size,
    required VideoSortType sortType,
  });
  
  Future<Result<Video>> getVideoDetail(int videoNo);
  
  Future<Result<Unit>> deleteVideo(int videoNo);
}

// Unit 타입으로 void 반환 명시
class Unit {
  const Unit();
  static const instance = Unit();
}
```

## 4. 성능 모니터링

### 현재 문제점
- 성능 메트릭 수집 부족
- 메모리 사용량 모니터링 없음
- 네트워크 요청 추적 미흡

### 개선 방안

#### A. 성능 모니터링 시스템
```dart
class PerformanceMonitor {
  static final _instance = PerformanceMonitor._();
  static PerformanceMonitor get instance => _instance;
  
  PerformanceMonitor._();
  
  final List<PerformanceMetric> _metrics = [];
  
  void recordMetric(String name, Duration duration, {
    Map<String, dynamic>? metadata,
  }) {
    _metrics.add(PerformanceMetric(
      name: name,
      duration: duration,
      timestamp: DateTime.now(),
      metadata: metadata,
    ));
    
    // 일정 개수 이상 쌓이면 정리
    if (_metrics.length > 1000) {
      _metrics.removeRange(0, 500);
    }
  }
  
  Future<T> measure<T>(String name, Future<T> Function() operation) async {
    final stopwatch = Stopwatch()..start();
    try {
      final result = await operation();
      recordMetric(name, stopwatch.elapsed);
      return result;
    } catch (e) {
      recordMetric(name, stopwatch.elapsed, metadata: {
        'error': e.toString(),
      });
      rethrow;
    } finally {
      stopwatch.stop();
    }
  }
  
  List<PerformanceMetric> getMetrics({
    String? nameFilter,
    Duration? minDuration,
  }) {
    return _metrics.where((metric) {
      if (nameFilter != null && !metric.name.contains(nameFilter)) {
        return false;
      }
      if (minDuration != null && metric.duration < minDuration) {
        return false;
      }
      return true;
    }).toList();
  }
}
```

#### B. 네트워크 요청 추적
```dart
class NetworkTrackingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    PerformanceMonitor.instance.recordMetric(
      'network_request_start',
      Duration.zero,
      metadata: {
        'url': options.uri.toString(),
        'method': options.method,
      },
    );
    super.onRequest(options, handler);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    PerformanceMonitor.instance.recordMetric(
      'network_request_success',
      Duration.zero,
      metadata: {
        'url': response.requestOptions.uri.toString(),
        'statusCode': response.statusCode,
        'responseSize': response.data?.toString().length ?? 0,
      },
    );
    super.onResponse(response, handler);
  }
}
```

## 5. 코드 리팩토링 가이드

### 현재 문제점
- 긴 메서드와 클래스
- 중복 코드 존재
- 단일 책임 원칙 위반

### 개선 방안

#### A. 메서드 분리
```dart
// Before
class VideoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            width: 200,
            height: 150,
            child: CachedNetworkImage(
              imageUrl: video.thumbnailImageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[300],
                child: Icon(Icons.image),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[300],
                child: Icon(Icons.broken_image),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  '${_formatDuration(video.duration)} • ${_formatViewCount(video.readCount)}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// After
class VideoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _buildThumbnail(),
          _buildVideoInfo(),
        ],
      ),
    );
  }
  
  Widget _buildThumbnail() {
    return VideoThumbnail(
      imageUrl: video.thumbnailImageUrl,
      width: 200,
      height: 150,
    );
  }
  
  Widget _buildVideoInfo() {
    return VideoInfo(
      title: video.title,
      duration: video.duration,
      viewCount: video.readCount,
    );
  }
}
```

#### B. 공통 유틸리티 추출
```dart
// 공통 포맷팅 유틸리티
class FormatUtils {
  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
             '${minutes.toString().padLeft(2, '0')}:'
             '${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:'
             '${seconds.toString().padLeft(2, '0')}';
    }
  }
  
  static String formatViewCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    } else {
      return count.toString();
    }
  }
}
```

## 6. 코드 품질 도구 설정

### 개선 방안

#### A. 향상된 분석 규칙
```yaml
# analysis_options.yaml
include: package:flutter_lints/flutter.yaml

analyzer:
  strong-mode:
    implicit-casts: false
    implicit-dynamic: false
  
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
  
  plugins:
    - dart_code_metrics

dart_code_metrics:
  anti-patterns:
    - long-method
    - long-parameter-list
  
  metrics:
    cyclomatic-complexity: 20
    lines-of-executable-code: 50
    number-of-parameters: 4
    maximum-nesting-level: 5

linter:
  rules:
    # Dart 스타일 가이드
    - always_declare_return_types
    - always_specify_types
    - prefer_single_quotes
    - prefer_const_constructors
    - prefer_const_literals_to_create_immutables
    
    # 에러 방지
    - avoid_dynamic_calls
    - avoid_type_to_string
    - cancel_subscriptions
    - close_sinks
    
    # 성능
    - avoid_function_literals_in_foreach_calls
    - prefer_collection_literals
    - prefer_spread_collections
```

#### B. Pre-commit Hook 설정
```bash
#!/bin/bash
# .git/hooks/pre-commit

echo "Running pre-commit checks..."

# Dart analysis
dart analyze
if [ $? -ne 0 ]; then
  echo "❌ Dart analysis failed"
  exit 1
fi

# Code formatting
dart format --set-exit-if-changed .
if [ $? -ne 0 ]; then
  echo "❌ Code formatting check failed"
  exit 1
fi

# Tests
flutter test
if [ $? -ne 0 ]; then
  echo "❌ Tests failed"
  exit 1
fi

echo "✅ All checks passed"
``` 