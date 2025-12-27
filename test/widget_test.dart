import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('기본 MaterialApp 위젯 테스트', (WidgetTester tester) async {
    // 간단한 MaterialApp 빌드
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('치지직 TV'),
          ),
          body: const Center(
            child: Text('환영합니다'),
          ),
        ),
      ),
    );

    // 앱이 정상적으로 빌드되는지 확인
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('치지직 TV'), findsOneWidget);
    expect(find.text('환영합니다'), findsOneWidget);
  });

  testWidgets('Scaffold 구조 테스트', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Container(
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text('헤더'),
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text('메인 콘텐츠'),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // 위젯들이 올바르게 렌더링되는지 확인
    expect(find.text('헤더'), findsOneWidget);
    expect(find.text('메인 콘텐츠'), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
  });
} 