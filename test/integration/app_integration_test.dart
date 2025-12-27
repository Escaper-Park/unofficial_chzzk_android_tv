import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:unofficial_chzzk_android_tv/main.dart';
import 'package:unofficial_chzzk_android_tv/src/utils/shared_preferences/shared_prefs.dart';

void main() {
  group('앱 통합 테스트', () {
    testWidgets('앱 시작 및 초기 화면 로딩 테스트', (WidgetTester tester) async {
      // SharedPreferences 모킹 설정
      SharedPreferences.setMockInitialValues({});
      final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

      // 앱 실행
      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPrefsProvider.overrideWithValue(sharedPrefs)],
          child: const ChzzkTV(),
        ),
      );

      // 앱이 빌드되기를 기다림
      await tester.pumpAndSettle();

      // MaterialApp이 로드되었는지 확인
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('다크 테마 적용 확인', (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPrefsProvider.overrideWithValue(sharedPrefs)],
          child: const ChzzkTV(),
        ),
      );

      await tester.pumpAndSettle();

      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      
      // 다크 테마가 적용되었는지 확인
      expect(app.theme?.brightness, Brightness.dark);
    });

    testWidgets('Provider 스코프 테스트', (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPrefsProvider.overrideWithValue(sharedPrefs)],
          child: const ChzzkTV(),
        ),
      );

      await tester.pumpAndSettle();

      // ProviderScope가 정상적으로 설정되었는지 확인
      expect(find.byType(ProviderScope), findsOneWidget);
    });

    testWidgets('앱 라우터 설정 확인', (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPrefsProvider.overrideWithValue(sharedPrefs)],
          child: const ChzzkTV(),
        ),
      );

      await tester.pumpAndSettle();

      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      
      // 라우터가 설정되어 있는지 확인
      expect(app.routerConfig, isNotNull);
    });
  });

  group('설정 및 상태 관리 테스트', () {
    testWidgets('SharedPreferences 오버라이드 테스트', (WidgetTester tester) async {
      final testData = {'test_key': 'test_value'};
      SharedPreferences.setMockInitialValues(testData);
      final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPrefsProvider.overrideWithValue(sharedPrefs)],
          child: Consumer(
            builder: (context, ref, child) {
              final prefs = ref.watch(sharedPrefsProvider);
              return MaterialApp(
                home: Scaffold(
                  body: Text('Value: ${prefs.getString('test_key')}'),
                ),
              );
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Value: test_value'), findsOneWidget);
    });
  });

  group('에러 핸들링 테스트', () {
    testWidgets('빈 SharedPreferences로 앱 시작', (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPrefsProvider.overrideWithValue(sharedPrefs)],
          child: const ChzzkTV(),
        ),
      );

      // 에러 없이 앱이 시작되는지 확인
      await tester.pumpAndSettle();
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
} 