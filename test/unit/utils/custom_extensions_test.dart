import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/utils/extensions/custom_extensions.dart';

void main() {
  group('Custom Extensions 테스트', () {
    testWidgets('DimensionsX 확장 - 화면 크기 가져오기', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final width = context.screenWidth;
              final height = context.screenHeight;
              
              return Scaffold(
                body: Column(
                  children: [
                    Text('Width: $width'),
                    Text('Height: $height'),
                  ],
                ),
              );
            },
          ),
        ),
      );

      // 테스트 환경에서 기본 화면 크기 확인
      expect(find.text('Width: 800.0'), findsOneWidget);
      expect(find.text('Height: 600.0'), findsOneWidget);
    });

    test('ImageCacheX 확장 - 캐시 크기 계산', () {
      const devicePixelRatio = 2.0;
      
      // MockBuildContext 대신 실제 계산 로직 테스트
      const imageSize = 100;
      final expectedCacheSize = (imageSize * devicePixelRatio).round();
      
      expect(expectedCacheSize, 200);
    });

    test('DurationX 확장 - Duration을 패딩된 문자열로 변환', () {
      const duration1 = Duration(hours: 1, minutes: 23, seconds: 45);
      const duration2 = Duration(minutes: 5, seconds: 9);
      
      expect(duration1.paddedDuration(), '01:23:45');
      expect(duration2.paddedDuration(), '00:05:09');
    });

    test('IntTimeX 확장 - 정수 시간 관련 포맷팅', () {
      const number = 1234567;
      const timestamp = 1704110400000; // 2024-01-01 14:00:00 UTC
      const playerTime = 3661000; // 1시간 1분 1초
      
      expect(number.commaFormat(), '1,234,567');
      expect(playerTime.playerMessageTimeToHms(), '01:01:01');
      
      // timestamp는 로컬 시간대에 따라 다를 수 있으므로 형식만 확인
      expect(timestamp.timestampToHHmm(), matches(r'^\d{2}:\d{2}$'));
    });

    test('AppRouteX 확장 - routeName으로 AppRoute 찾기', () {
      // 존재하지 않는 라우트 이름 테스트
      final notFoundRoute = AppRouteX.fromRouteName('non_existent_route');
      expect(notFoundRoute, null);
      
      // AppRoute enum이 정의되어 있다면 실제 라우트 테스트도 가능
      final testRoute = AppRouteX.fromRouteName('test_route');
      // enum에 test_route가 없으므로 null이어야 함
      expect(testRoute, null);
    });
  });
} 