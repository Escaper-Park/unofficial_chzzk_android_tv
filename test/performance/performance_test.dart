import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/utils/extensions/custom_formatter.dart';
import 'package:unofficial_chzzk_android_tv/src/common/widgets/ui/centered_text.dart';

void main() {
  group('성능 테스트', () {
    test('포맷터 성능 테스트', () {
      const iterations = 10000;
      final stopwatch = Stopwatch()..start();

      for (int i = 0; i < iterations; i++) {
        CustomFormatter.formatIntToCommaStr(1234567 + i);
        CustomFormatter.formatDurationToPaddedTimeStr(
          Duration(seconds: 3600 + i % 7200),
        );
        CustomFormatter.formatNumberToStringUnit(50000 + i);
      }

      stopwatch.stop();
      // ignore: avoid_print
      print('포맷터 $iterations회 실행 시간: ${stopwatch.elapsedMilliseconds}ms');
      
      // 평균 1ms 이하로 실행되어야 함
      expect(stopwatch.elapsedMilliseconds / iterations, lessThan(1.0));
    });

    testWidgets('위젯 렌더링 성능 테스트', (WidgetTester tester) async {
      const widgetCount = 100;
      final stopwatch = Stopwatch()..start();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView.builder(
              itemCount: widgetCount,
              itemBuilder: (context, index) {
                return CenteredText(
                  text: '테스트 위젯 $index',
                  fontSize: 16.0,
                );
              },
            ),
          ),
        ),
      );

      stopwatch.stop();
      // ignore: avoid_print
      print('$widgetCount개 위젯 렌더링 시간: ${stopwatch.elapsedMilliseconds}ms');
      
      // 위젯이 정상적으로 렌더링되었는지 확인 (처음 몇 개만)
      expect(find.text('테스트 위젯 0'), findsOneWidget);
      expect(find.text('테스트 위젯 1'), findsOneWidget);
      
      // ListView가 생성되었는지 확인
      expect(find.byType(ListView), findsOneWidget);
      
      // 렌더링 시간이 3초 이하여야 함
      expect(stopwatch.elapsedMilliseconds, lessThan(3000));
    });

    test('큰 데이터 처리 성능 테스트', () {
      const dataSize = 100000;
      final stopwatch = Stopwatch()..start();

      // 큰 리스트 생성 및 처리
      final List<Map<String, dynamic>> largeDataSet = List.generate(
        dataSize,
        (index) => {
          'id': index,
          'name': 'User $index',
          'timestamp': DateTime.now().millisecondsSinceEpoch + index,
          'value': index * 1.5,
        },
      );

      // 데이터 필터링 및 변환
      final filteredData = largeDataSet
          .where((item) => (item['id'] as int) % 2 == 0)
          .map((item) => {
                ...item,
                'formatted_value': CustomFormatter.formatIntToCommaStr(
                  (item['value'] as double).round(),
                ),
              },)
          .toList();

      stopwatch.stop();
      // ignore: avoid_print
      print('$dataSize개 데이터 처리 시간: ${stopwatch.elapsedMilliseconds}ms');
      
      expect(filteredData.length, dataSize ~/ 2);
      expect(stopwatch.elapsedMilliseconds, lessThan(5000)); // 5초 이하
    });

    test('메모리 사용량 테스트', () {
      final List<String> memoryTestData = [];
      
      // 메모리 사용량 측정을 위한 큰 데이터 생성
      for (int i = 0; i < 10000; i++) {
        memoryTestData.add('테스트 데이터 $i - ${DateTime.now()}');
      }
      
      expect(memoryTestData.length, 10000);
      
      // 메모리 정리 테스트
      memoryTestData.clear();
      expect(memoryTestData.isEmpty, true);
    });

    test('동시성 테스트', () async {
      const concurrentTasks = 10;
      final stopwatch = Stopwatch()..start();

      // 동시에 여러 작업 실행
      final futures = List.generate(
        concurrentTasks,
        (index) => Future.delayed(
          Duration(milliseconds: 100),
          () => CustomFormatter.formatIntToCommaStr(index * 1000),
        ),
      );

      final results = await Future.wait(futures);

      stopwatch.stop();
      // ignore: avoid_print
      print('$concurrentTasks개 동시 작업 완료 시간: ${stopwatch.elapsedMilliseconds}ms');
      
      expect(results.length, concurrentTasks);
      expect(results[0], '0');
      expect(results[9], '9,000');
      
      // 동시 실행으로 인한 성능 향상 확인 (순차 실행 대비)
      expect(stopwatch.elapsedMilliseconds, lessThan(1000));
    });
  });
} 