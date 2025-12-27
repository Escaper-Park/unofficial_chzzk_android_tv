# 테스트 가이드

이 프로젝트의 테스트 코드는 Flutter의 공식 테스트 프레임워크를 사용하여 작성되었습니다.

## 테스트 구조

```
test/
├── widget_test.dart              # 기본 앱 위젯 테스트
├── test_helper.dart              # 테스트 헬퍼 함수들
├── README.md                     # 이 파일
├── unit/                         # 단위 테스트
│   ├── auth/
│   │   └── auth_test.dart        # 인증 관련 테스트
│   ├── user/
│   │   └── user_test.dart        # 사용자 모델 테스트
│   └── utils/
│       ├── custom_formatter_test.dart    # 포맷터 테스트
│       └── custom_extensions_test.dart   # 확장 함수 테스트
├── widget/                       # 위젯 테스트
│   └── common_widgets_test.dart  # 공통 위젯 테스트
└── integration/                  # 통합 테스트
    └── app_integration_test.dart # 앱 전체 통합 테스트
```

## 테스트 실행 방법

### 모든 테스트 실행
```bash
flutter test
```

### 특정 테스트 파일 실행
```bash
# 단위 테스트만 실행
flutter test test/unit/

# 위젯 테스트만 실행
flutter test test/widget/

# 통합 테스트만 실행
flutter test test/integration/

# 특정 파일 실행
flutter test test/unit/auth/auth_test.dart
```

### 테스트 커버리지 확인
```bash
flutter test --coverage
```

커버리지 리포트는 `coverage/lcov.info` 파일에 생성됩니다.

### 커버리지 HTML 리포트 생성 (선택사항)
```bash
# genhtml 설치 필요 (macOS: brew install lcov, Ubuntu: sudo apt-get install lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## 테스트 종류별 설명

### 1. 단위 테스트 (Unit Tests)
- **위치**: `test/unit/`
- **목적**: 개별 함수, 클래스, 메서드의 동작을 검증
- **포함 내용**:
  - 모델 클래스의 직렬화/역직렬화
  - 유틸리티 함수들
  - 비즈니스 로직
  - 상태 관리 (Riverpod Provider)

### 2. 위젯 테스트 (Widget Tests)
- **위치**: `test/widget/`
- **목적**: UI 위젯의 렌더링과 상호작용을 검증
- **포함 내용**:
  - 커스텀 위젯의 렌더링
  - 사용자 상호작용 (탭, 스크롤 등)
  - 위젯 상태 변화

### 3. 통합 테스트 (Integration Tests)
- **위치**: `test/integration/`
- **목적**: 앱의 전체적인 동작과 여러 컴포넌트 간의 상호작용을 검증
- **포함 내용**:
  - 앱 초기화
  - 라우팅
  - 상태 관리 통합

## 테스트 작성 가이드라인

### 1. 테스트 명명 규칙
- 한국어로 명확하게 작성
- "무엇을 테스트하는지" 명시
- 예: `'Auth 객체 생성 및 쿠키 생성 테스트'`

### 2. 테스트 구조 (AAA 패턴)
```dart
test('테스트 설명', () {
  // Given (준비)
  const testData = TestData();
  
  // When (실행)
  final result = functionToTest(testData);
  
  // Then (검증)
  expect(result, expectedValue);
});
```

### 3. 테스트 헬퍼 사용
`test_helper.dart`의 헬퍼 함수들을 활용하여 중복 코드를 줄이세요:

```dart
// SharedPreferences 모킹
final sharedPrefs = await TestHelper.setupMockSharedPreferences();

// 테스트용 앱 래퍼
await tester.pumpWidget(
  TestHelper.createTestApp(
    child: MyWidget(),
    sharedPrefs: sharedPrefs,
  ),
);
```

## 테스트 커버리지 목표

- **단위 테스트**: 90% 이상
- **위젯 테스트**: 주요 UI 컴포넌트 100%
- **통합 테스트**: 핵심 사용자 플로우 100%

## 주의사항

### 1. 비동기 테스트
```dart
testWidgets('비동기 위젯 테스트', (WidgetTester tester) async {
  await tester.pumpWidget(MyAsyncWidget());
  await tester.pumpAndSettle(); // 모든 애니메이션 완료 대기
  
  expect(find.text('로딩 완료'), findsOneWidget);
});
```

### 2. Provider 테스트
```dart
test('Provider 테스트', () {
  final container = ProviderContainer();
  addTearDown(container.dispose); // 메모리 누수 방지
  
  final result = container.read(myProvider);
  expect(result, expectedValue);
});
```

### 3. 모킹 (Mocking)
외부 의존성이 있는 경우 모킹을 사용하세요:
```dart
// SharedPreferences 모킹
SharedPreferences.setMockInitialValues({'key': 'value'});
```

## 지속적 통합 (CI)

GitHub Actions나 다른 CI 도구에서 테스트를 자동으로 실행하려면:

```yaml
# .github/workflows/test.yml
name: Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter test --coverage
      - run: flutter test --machine > test-results.json
```

## 문제 해결

### 자주 발생하는 오류

1. **`ProviderContainer` 관련 오류**
   - `addTearDown(container.dispose)`를 추가하세요

2. **위젯 테스트에서 `MediaQuery` 오류**
   - `MaterialApp`으로 위젯을 감싸세요

3. **비동기 테스트 타임아웃**
   - `pumpAndSettle()` 대신 `pump()`를 여러 번 호출하거나 타임아웃을 늘리세요

## 추가 리소스

- [Flutter 테스트 공식 문서](https://docs.flutter.dev/testing)
- [Riverpod 테스트 가이드](https://riverpod.dev/docs/essentials/testing)
- [Widget 테스트 가이드](https://docs.flutter.dev/testing/widget-tests) 