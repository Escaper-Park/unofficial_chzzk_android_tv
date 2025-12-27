import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/utils/network/request_deduplicator.dart';

void main() {
  group('RequestDeduplicator 테스트', () {
    setUp(() {
      // 각 테스트 전에 활성 요청 초기화
      RequestDeduplicator.cancelAll();
    });

    test('중복 요청 제거 테스트', () async {
      // Given
      int callCount = 0;
      Future<String> mockRequest() async {
        callCount++;
        await Future.delayed(Duration(milliseconds: 100));
        return 'result';
      }

      // When - 동시에 3개의 요청 실행
      final results = await Future.wait([
        RequestDeduplicator.deduplicate('test_key', mockRequest),
        RequestDeduplicator.deduplicate('test_key', mockRequest),
        RequestDeduplicator.deduplicate('test_key', mockRequest),
      ]);

      // Then - 실제 요청은 1번만 실행되어야 함
      expect(callCount, 1);
      expect(results, ['result', 'result', 'result']);
    });

    test('다른 키는 별도로 요청되어야 함', () async {
      // Given
      int callCount = 0;
      Future<String> mockRequest(String value) async {
        callCount++;
        await Future.delayed(Duration(milliseconds: 50));
        return value;
      }

      // When
      final results = await Future.wait([
        RequestDeduplicator.deduplicate('key1', () => mockRequest('value1')),
        RequestDeduplicator.deduplicate('key2', () => mockRequest('value2')),
      ]);

      // Then - 각각 별도로 요청되어야 함
      expect(callCount, 2);
      expect(results, ['value1', 'value2']);
    });

    test('요청 완료 후 새로운 요청 가능', () async {
      // Given
      int callCount = 0;
      Future<String> mockRequest() async {
        callCount++;
        return 'result_$callCount';
      }

      // When
      final result1 = await RequestDeduplicator.deduplicate('key', mockRequest);
      final result2 = await RequestDeduplicator.deduplicate('key', mockRequest);

      // Then - 순차 실행이므로 각각 요청됨
      expect(callCount, 2);
      expect(result1, 'result_1');
      expect(result2, 'result_2');
    });

    test('에러 발생 시에도 정리되어야 함', () async {
      // Given
      Future<String> failingRequest() async {
        throw Exception('Test error');
      }

      // When & Then
      await expectLater(
        RequestDeduplicator.deduplicate('error_key', failingRequest),
        throwsException,
      );

      // 에러 후 활성 요청이 정리되었는지 확인
      expect(RequestDeduplicator.isActive('error_key'), false);
    });

    test('cancel 메서드 테스트', () async {
      // Given
      Future<String> slowRequest() async {
        await Future.delayed(Duration(seconds: 10));
        return 'result';
      }

      // When
      RequestDeduplicator.deduplicate('slow_key', slowRequest);
      
      // Then
      expect(RequestDeduplicator.isActive('slow_key'), true);
      
      RequestDeduplicator.cancel('slow_key');
      expect(RequestDeduplicator.isActive('slow_key'), false);
    });

    test('cancelAll 메서드 테스트', () async {
      // Given
      Future<String> slowRequest() async {
        await Future.delayed(Duration(seconds: 10));
        return 'result';
      }

      // When
      RequestDeduplicator.deduplicate('key1', slowRequest);
      RequestDeduplicator.deduplicate('key2', slowRequest);

      expect(RequestDeduplicator.activeCount, 2);

      RequestDeduplicator.cancelAll();

      // Then
      expect(RequestDeduplicator.activeCount, 0);
    });

    test('activeCount 메서드 테스트', () async {
      // Given
      Future<String> slowRequest() async {
        await Future.delayed(Duration(seconds: 10));
        return 'result';
      }

      // When
      RequestDeduplicator.deduplicate('key1', slowRequest);
      RequestDeduplicator.deduplicate('key2', slowRequest);
      RequestDeduplicator.deduplicate('key3', slowRequest);

      // Then
      expect(RequestDeduplicator.activeCount, 3);
    });
  });

  group('ScopedRequestDeduplicator 테스트', () {
    test('스코프별 중복 제거 테스트', () async {
      // Given
      final userDeduplicator = ScopedRequestDeduplicator('user');
      final liveDeduplicator = ScopedRequestDeduplicator('live');
      
      int userCallCount = 0;
      int liveCallCount = 0;

      Future<String> userRequest() async {
        userCallCount++;
        await Future.delayed(Duration(milliseconds: 50));
        return 'user_result';
      }

      Future<String> liveRequest() async {
        liveCallCount++;
        await Future.delayed(Duration(milliseconds: 50));
        return 'live_result';
      }

      // When - 같은 키지만 다른 스코프
      final results = await Future.wait([
        userDeduplicator.deduplicate('profile', userRequest),
        liveDeduplicator.deduplicate('profile', liveRequest),
      ]);

      // Then - 각 스코프에서 별도로 실행
      expect(userCallCount, 1);
      expect(liveCallCount, 1);
      expect(results[0], 'user_result');
      expect(results[1], 'live_result');
    });

    test('같은 스코프 내 중복 제거', () async {
      // Given
      final deduplicator = ScopedRequestDeduplicator('test');
      int callCount = 0;

      Future<String> request() async {
        callCount++;
        await Future.delayed(Duration(milliseconds: 100));
        return 'result';
      }

      // When
      final results = await Future.wait([
        deduplicator.deduplicate('key', request),
        deduplicator.deduplicate('key', request),
      ]);

      // Then
      expect(callCount, 1);
      expect(results, ['result', 'result']);
    });

    test('cancelAll은 해당 스코프만 취소해야 함', () async {
      // Given
      final deduplicator1 = ScopedRequestDeduplicator('scope1');
      final deduplicator2 = ScopedRequestDeduplicator('scope2');

      Future<String> slowRequest() async {
        await Future.delayed(Duration(seconds: 10));
        return 'result';
      }

      // When
      deduplicator1.deduplicate('key', slowRequest);
      deduplicator2.deduplicate('key', slowRequest);

      expect(deduplicator1.activeCount, 1);
      expect(deduplicator2.activeCount, 1);

      deduplicator1.cancelAll();

      // Then
      expect(deduplicator1.activeCount, 0);
      expect(deduplicator2.activeCount, 1);
    });
  });
}
