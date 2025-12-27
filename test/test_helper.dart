import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:unofficial_chzzk_android_tv/src/utils/shared_preferences/shared_prefs.dart';

/// 테스트용 공통 설정 및 헬퍼 함수들
class TestHelper {
  /// SharedPreferences 모킹 설정
  static Future<SharedPreferences> setupMockSharedPreferences([
    Map<String, Object>? initialValues,
  ]) async {
    SharedPreferences.setMockInitialValues(initialValues ?? {});
    return await SharedPreferences.getInstance();
  }

  /// 테스트용 ProviderScope 생성
  static ProviderScope createTestProviderScope({
    required Widget child,
    SharedPreferences? sharedPrefs,
    List<Override> additionalOverrides = const [],
  }) {
    final overrides = <Override>[
      if (sharedPrefs != null) sharedPrefsProvider.overrideWithValue(sharedPrefs),
      ...additionalOverrides,
    ];

    return ProviderScope(
      overrides: overrides,
      child: child,
    );
  }

  /// 테스트용 MaterialApp 래퍼
  static Widget createTestApp({
    required Widget child,
    SharedPreferences? sharedPrefs,
    List<Override> additionalOverrides = const [],
  }) {
    return createTestProviderScope(
      sharedPrefs: sharedPrefs,
      additionalOverrides: additionalOverrides,
      child: MaterialApp(
        home: Scaffold(body: child),
      ),
    );
  }

  /// 테스트 데이터 생성 헬퍼
  static Map<String, dynamic> createTestUserJson({
    bool hasProfile = true,
    String? userIdHash = 'test_user_id',
    String nickname = 'TestUser',
    String? profileImageUrl = 'https://example.com/profile.jpg',
    bool verifiedMark = false,
  }) {
    return {
      'hasProfile': hasProfile,
      'userIdHash': userIdHash,
      'nickname': nickname,
      'profileImageUrl': profileImageUrl,
      'verifiedMark': verifiedMark,
    };
  }

  /// 테스트 Auth 데이터 생성
  static Map<String, dynamic> createTestAuthJson({
    String nidAuth = 'test_nid_auth',
    String nidSession = 'test_nid_session',
  }) {
    return {
      'nidAuth': nidAuth,
      'nidSession': nidSession,
    };
  }
}

/// 테스트용 확장 함수들
extension WidgetTesterExtensions on WidgetTester {
  /// 위젯을 빌드하고 모든 애니메이션이 완료될 때까지 대기
  Future<void> pumpAndSettleWidget(Widget widget) async {
    await pumpWidget(widget);
    await pumpAndSettle();
  }

  /// 특정 타입의 위젯을 찾고 캐스팅
  T findWidgetByType<T extends Widget>() {
    return widget<T>(find.byType(T));
  }

  /// 텍스트로 위젯 찾기 (부분 일치)
  Finder findTextContaining(String text) {
    return find.byWidgetPredicate(
      (widget) => widget is Text && widget.data?.contains(text) == true,
    );
  }
}

/// 테스트용 Mock 클래스들
class MockNavigatorObserver extends NavigatorObserver {
  final List<Route<dynamic>> pushedRoutes = [];
  final List<Route<dynamic>> poppedRoutes = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pushedRoutes.add(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    poppedRoutes.add(route);
    super.didPop(route, previousRoute);
  }
}

/// 테스트 상수들
class TestConstants {
  static const String testUserId = 'test_user_id_123';
  static const String testUserNickname = 'TestUser';
  static const String testProfileImageUrl = 'https://example.com/profile.jpg';
  static const String testNidAuth = 'test_nid_auth_token';
  static const String testNidSession = 'test_nid_session_token';
  
  // 테스트용 시간 상수들
  static const int testTimestamp = 1704110400000; // 2024-01-01 14:00:00 UTC
  static const Duration testDuration = Duration(hours: 1, minutes: 30, seconds: 45);
  
  // 테스트용 숫자 상수들
  static const int testViewCount = 12345;
  static const int testFollowerCount = 50000;
}

