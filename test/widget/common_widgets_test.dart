import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/common/widgets/ui/centered_text.dart';
import 'package:unofficial_chzzk_android_tv/src/common/widgets/ui/header_text.dart';
import 'package:unofficial_chzzk_android_tv/src/common/constants/styles.dart';

void main() {
  group('공통 위젯 테스트', () {
    testWidgets('CenteredText 위젯 테스트', (WidgetTester tester) async {
      const testText = '테스트 텍스트';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CenteredText(
              text: testText,
              fontSize: 16.0,
              fontColor: Colors.white,
            ),
          ),
        ),
      );

      // 텍스트가 표시되는지 확인
      expect(find.text(testText), findsOneWidget);
      
      // Center 위젯이 있는지 확인
      expect(find.byType(Center), findsOneWidget);
      
      // FittedBox가 있는지 확인
      expect(find.byType(FittedBox), findsOneWidget);
    });

    testWidgets('CenteredText 기본값 테스트', (WidgetTester tester) async {
      const testText = '기본값 테스트';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CenteredText(text: testText),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.byType(Text));
      
      // 기본 폰트 크기 확인
      expect(textWidget.style?.fontSize, 14.0);
      
      // 기본 폰트 색상 확인
      expect(textWidget.style?.color, AppColors.whiteColor);
      
      // 기본 폰트 굵기 확인
      expect(textWidget.style?.fontWeight, FontWeight.w600);
    });

    testWidgets('HeaderText 위젯 테스트', (WidgetTester tester) async {
      const testText = '헤더 텍스트';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HeaderText(
              text: testText,
              fontSize: 24.0,
              verticalPadding: 15.0,
              horizontalPadding: 10.0,
            ),
          ),
        ),
      );

      // 텍스트가 표시되는지 확인
      expect(find.text(testText), findsOneWidget);
      
      // Padding 위젯이 있는지 확인
      expect(find.byType(Padding), findsOneWidget);
      
      final paddingWidget = tester.widget<Padding>(find.byType(Padding));
      final edgeInsets = paddingWidget.padding as EdgeInsets;
      
      // 패딩 값 확인
      expect(edgeInsets.vertical, 30.0); // 15.0 * 2
      expect(edgeInsets.horizontal, 20.0); // 10.0 * 2
    });

    testWidgets('HeaderText 기본값 테스트', (WidgetTester tester) async {
      const testText = '기본 헤더';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HeaderText(text: testText),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.byType(Text));
      
      // 기본 폰트 크기 확인
      expect(textWidget.style?.fontSize, 20.0);
      
      // 기본 폰트 색상 확인
      expect(textWidget.style?.color, AppColors.whiteColor);
      
      // 기본 폰트 굵기 확인
      expect(textWidget.style?.fontWeight, FontWeight.w600);
      
      // 기본 오버플로우 확인
      expect(textWidget.style?.overflow, TextOverflow.ellipsis);
    });

    testWidgets('HeaderText 패딩 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HeaderText(
              text: '패딩 테스트',
              verticalPadding: 5.0,
              horizontalPadding: 8.0,
            ),
          ),
        ),
      );

      final paddingWidget = tester.widget<Padding>(find.byType(Padding));
      final edgeInsets = paddingWidget.padding as EdgeInsets;
      
      expect(edgeInsets.top, 5.0);
      expect(edgeInsets.bottom, 5.0);
      expect(edgeInsets.left, 8.0);
      expect(edgeInsets.right, 8.0);
    });
  });
}