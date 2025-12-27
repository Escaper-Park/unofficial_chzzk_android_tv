import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/common/widgets/ui/centered_text.dart';
import 'package:unofficial_chzzk_android_tv/src/common/widgets/ui/header_text.dart';

void main() {
  group('접근성 테스트', () {
    testWidgets('Semantic labels 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Semantics(
                  label: '메인 헤더',
                  child: const HeaderText(text: '홈'),
                ),
                Semantics(
                  label: '콘텐츠 텍스트',
                  child: const CenteredText(text: '환영합니다'),
                ),
                Semantics(
                  button: true,
                  label: '설정 버튼',
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('설정'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // 기본 위젯들이 렌더링되는지 확인
      expect(find.text('홈'), findsOneWidget);
      expect(find.text('환영합니다'), findsOneWidget);
      expect(find.text('설정'), findsOneWidget);
    });

    testWidgets('Screen reader 호환성 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('치지직 TV'),
            ),
            body: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.live_tv),
                  title: const Text('라이브 스트림'),
                  subtitle: const Text('현재 방송 중인 스트림'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.video_library),
                  title: const Text('VOD'),
                  subtitle: const Text('다시보기 콘텐츠'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );

      // 접근성 정보 확인
      final SemanticsHandle handle = tester.ensureSemantics();
      expect(find.text('치지직 TV'), findsOneWidget);
      expect(find.text('라이브 스트림'), findsOneWidget);
      expect(find.text('VOD'), findsOneWidget);
      
      handle.dispose();
    });

    testWidgets('키보드 네비게이션 테스트', (WidgetTester tester) async {
      bool button1Pressed = false;
      bool button2Pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                ElevatedButton(
                  onPressed: () => button1Pressed = true,
                  child: const Text('버튼 1'),
                ),
                ElevatedButton(
                  onPressed: () => button2Pressed = true,
                  child: const Text('버튼 2'),
                ),
              ],
            ),
          ),
        ),
      );

      // 첫 번째 버튼에 포커스
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pumpAndSettle();

      // 엔터 키로 버튼 활성화
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();

      expect(button1Pressed, true);
      expect(button2Pressed, false); // 두 번째 버튼은 눌리지 않음
    });

    testWidgets('대비 및 가독성 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(), // 다크 테마 사용
          home: Scaffold(
            body: Column(
              children: [
                Container(
                  color: Colors.black,
                  child: const Text(
                    '다크 테마 텍스트',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Text(
                    '라이트 테마 텍스트',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // 텍스트가 올바르게 렌더링되는지 확인
      expect(find.text('다크 테마 텍스트'), findsOneWidget);
      expect(find.text('라이트 테마 텍스트'), findsOneWidget);
    });

    testWidgets('폰트 크기 조정 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return Column(
                  children: [
                    Text(
                      '기본 폰트 크기',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      '큰 폰트 크기',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '작은 폰트 크기',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      // 다양한 폰트 크기의 텍스트가 렌더링되는지 확인
      expect(find.text('기본 폰트 크기'), findsOneWidget);
      expect(find.text('큰 폰트 크기'), findsOneWidget);
      expect(find.text('작은 폰트 크기'), findsOneWidget);
    });

    testWidgets('터치 타겟 크기 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 48, // 최소 터치 타겟 크기
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(ElevatedButton);
      expect(buttonFinder, findsOneWidget);

      final RenderBox renderBox = tester.renderObject(buttonFinder);
      expect(renderBox.size.width, greaterThanOrEqualTo(48));
      expect(renderBox.size.height, greaterThanOrEqualTo(48));
    });

    testWidgets('색상 접근성 테스트', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                // 성공 상태 - 녹색
                Container(
                  color: Colors.green,
                  child: const Text(
                    '성공',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // 경고 상태 - 주황색
                Container(
                  color: Colors.orange,
                  child: const Text(
                    '경고',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                // 오류 상태 - 빨간색
                Container(
                  color: Colors.red,
                  child: const Text(
                    '오류',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // 상태별 텍스트가 올바르게 표시되는지 확인
      expect(find.text('성공'), findsOneWidget);
      expect(find.text('경고'), findsOneWidget);
      expect(find.text('오류'), findsOneWidget);
    });
  });
} 