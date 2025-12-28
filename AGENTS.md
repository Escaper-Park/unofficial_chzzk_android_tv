# AGENTS.md - Chzzk Android TV App

Guidelines for AI agents working in this Flutter/Dart codebase.

## Quick Reference

```bash
# Install dependencies
flutter pub get

# Generate code (Freezed, Riverpod, Retrofit) - REQUIRED after model/provider changes
dart run build_runner build --delete-conflicting-outputs

# Lint (CI uses this exact command)
flutter analyze --no-fatal-infos

# Format check
dart format --set-exit-if-changed lib/

# Run all tests
flutter test

# Run single test file
flutter test test/unit/auth/auth_test.dart

# Run tests by directory
flutter test test/unit/
flutter test test/widget/
flutter test test/integration/

# Run tests with coverage
flutter test --coverage

# Build APK
flutter build apk --debug
```

## Project Structure

```
lib/
├── main.dart                    # App entry point
└── src/
    ├── common/                  # Shared code
    │   ├── constants/           # API URLs, styles, dimensions
    │   ├── exceptions/          # AppException hierarchy
    │   ├── result/              # Result pattern (Success/Failure)
    │   └── widgets/             # Reusable widgets
    ├── features/                # Feature modules
    │   └── <feature>/
    │       ├── controller/      # Riverpod controllers (*_controller.dart)
    │       ├── model/           # Freezed data classes
    │       ├── repository/      # Retrofit API clients
    │       └── widgets/         # Feature-specific widgets
    └── utils/                   # Utilities (dio, router, extensions)
```

## Tech Stack

| Purpose | Library |
|---------|---------|
| State Management | Riverpod 2.x with `riverpod_annotation` |
| Immutable Models | Freezed + `freezed_annotation` |
| API Client | Retrofit + Dio |
| Routing | go_router |
| Code Generation | build_runner |

## Code Style

### Formatting
- **Line width**: 80 characters
- **Trailing commas**: Required (`require_trailing_commas: true`)
- **Formatter**: `dart format`

### Import Order
```dart
// 1. Dart SDK
import 'dart:async';
// 2. Flutter SDK
import 'package:flutter/material.dart';
// 3. External packages
import 'package:riverpod_annotation/riverpod_annotation.dart';
// 4. Relative imports (project files)
import '../model/user.dart';
```

### Naming Conventions
| Type | Convention | Example |
|------|------------|---------|
| Classes | PascalCase | `UserController`, `LiveDetail` |
| Files | snake_case | `user_controller.dart` |
| Variables | camelCase | `channelId`, `liveStatus` |
| Constants | camelCase | `static const String baseUrl` |
| Private | underscore prefix | `_repository`, `_init()` |
| Generated | suffix | `*.g.dart`, `*.freezed.dart` |
| Providers | camelCase + Provider | `userControllerProvider` |

### Abstract Classes for Constants
```dart
abstract class BaseUrl {
  const BaseUrl._();  // Private constructor prevents instantiation
  static const String chzzk = 'https://api.chzzk.naver.com';
}
```

## Error Handling

### Result Pattern (REQUIRED for new repository code)
```dart
Future<Result<User?>> getUser() {
  return handleNullableApiCall(() => _repository.getUser());
}
// Handle with when()
result.when(
  success: (user) => handleUser(user),
  failure: (exception) => handleError(exception),
);
```

### Exception Hierarchy
- `AppException` (base) -> `NetworkException`, `AuthException`, `CacheException`, `StreamingException`, `UnknownException`

### Forbidden Patterns
```dart
dynamic data = response;  // BAD - no type suppression
try { ... } catch (e) {}  // BAD - no empty catch blocks
```

## Riverpod Patterns

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  FutureOr<User?> build() async => await fetchUser();
}
```

## Freezed Models

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String nickname,
    String? profileImageUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
```

## Testing

### Test Structure (AAA Pattern)
```dart
test('User 객체 생성 테스트', () {
  // Given
  const nickname = 'TestUser';
  // When
  final user = User(id: '123', nickname: nickname);
  // Then
  expect(user.nickname, nickname);
});
```

### Provider Testing
```dart
test('Provider 테스트', () {
  final container = ProviderContainer();
  addTearDown(container.dispose);  // REQUIRED - prevent memory leaks
  final result = container.read(myProvider);
  expect(result, expectedValue);
});
```

## Git Workflow

**IMPORTANT**: This is a fork of `Escaper-Park/unofficial_chzzk_android_tv`.

- **NEVER** create PRs to upstream (`Escaper-Park/unofficial_chzzk_android_tv`)
- **ONLY** commit and push to `gbk1414/unofficial_chzzk_android_tv`
- PRs should be within this fork only (e.g., feature branch → main)
- Use `origin` remote (gbk1414), not `upstream` (Escaper-Park)

## Critical Reminders

1. **Run build_runner** after changing `@freezed`, `@riverpod`, or `@RestApi` files
2. **Generated files** (`*.g.dart`, `*.freezed.dart`) should be committed
3. **User-facing strings** are in Korean (한국어)
4. **Target platform**: Android TV with remote control navigation
5. **CI validates**: `flutter analyze --no-fatal-infos` must pass
6. **Git**: Only push to `gbk1414` fork, never to upstream

## Common Issues

| Issue | Solution |
|-------|----------|
| Missing generated code | Run `dart run build_runner build --delete-conflicting-outputs` |
| Provider not found | Check `part` directive and run build_runner |
| Freezed copyWith not working | Ensure `part '*.freezed.dart'` is included |
