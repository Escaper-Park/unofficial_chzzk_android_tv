import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/common/result/results.dart';
import 'package:unofficial_chzzk_android_tv/src/common/exceptions/exceptions.dart';

void main() {
  group('Result 패턴 테스트', () {
    group('Success 테스트', () {
      test('Success 객체 생성 및 데이터 접근 테스트', () {
        // Given
        const result = Success<String>('test data');

        // Then
        expect(result.isSuccess, true);
        expect(result.isFailure, false);
        expect(result.dataOrNull, 'test data');
        expect(result.exceptionOrNull, null);
      });

      test('Success.when() 메서드 테스트', () {
        // Given
        const result = Success<int>(42);

        // When
        final value = result.when(
          success: (data) => 'Success: $data',
          failure: (exception) => 'Failure: ${exception.message}',
        );

        // Then
        expect(value, 'Success: 42');
      });

      test('Success.map() 변환 테스트', () {
        // Given
        const result = Success<int>(10);

        // When
        final mapped = result.map((data) => data * 2);

        // Then
        expect(mapped.isSuccess, true);
        expect(mapped.dataOrNull, 20);
      });

      test('Success.getOrElse() 테스트', () {
        // Given
        const result = Success<String>('actual value');

        // When
        final value = result.getOrElse('default value');

        // Then
        expect(value, 'actual value');
      });

      test('Success.getOrThrow() 테스트', () {
        // Given
        const result = Success<String>('value');

        // When & Then
        expect(result.getOrThrow(), 'value');
      });
    });

    group('Failure 테스트', () {
      test('Failure 객체 생성 및 예외 접근 테스트', () {
        // Given
        const exception = NetworkException(
          message: 'Network error',
          type: NetworkExceptionType.noConnection,
        );
        const result = Failure<String>(exception);

        // Then
        expect(result.isSuccess, false);
        expect(result.isFailure, true);
        expect(result.dataOrNull, null);
        expect(result.exceptionOrNull, isA<NetworkException>());
      });

      test('Failure.when() 메서드 테스트', () {
        // Given
        const exception = NetworkException(
          message: 'Connection failed',
          type: NetworkExceptionType.timeout,
        );
        const result = Failure<int>(exception);

        // When
        final value = result.when(
          success: (data) => 'Success: $data',
          failure: (exception) => 'Failure: ${exception.message}',
        );

        // Then
        expect(value, 'Failure: Connection failed');
      });

      test('Failure.map()은 예외를 전파해야 함', () {
        // Given
        const exception = NetworkException(
          message: 'Error',
          type: NetworkExceptionType.serverError,
        );
        const result = Failure<int>(exception);

        // When
        final mapped = result.map((data) => data * 2);

        // Then
        expect(mapped.isFailure, true);
        expect(mapped.exceptionOrNull, exception);
      });

      test('Failure.getOrElse()는 기본값을 반환해야 함', () {
        // Given
        const exception = NetworkException(
          message: 'Error',
          type: NetworkExceptionType.unknown,
        );
        const result = Failure<String>(exception);

        // When
        final value = result.getOrElse('default value');

        // Then
        expect(value, 'default value');
      });

      test('Failure.getOrThrow()는 예외를 던져야 함', () {
        // Given
        const exception = NetworkException(
          message: 'Error',
          type: NetworkExceptionType.unknown,
        );
        const result = Failure<String>(exception);

        // When & Then
        expect(() => result.getOrThrow(), throwsA(isA<NetworkException>()));
      });
    });

    group('flatMap 테스트', () {
      test('Success.flatMap() 체이닝 테스트', () {
        // Given
        const result = Success<int>(5);

        // When
        final chained = result.flatMap((data) => Success(data.toString()));

        // Then
        expect(chained.isSuccess, true);
        expect(chained.dataOrNull, '5');
      });

      test('Failure.flatMap()은 실패를 전파해야 함', () {
        // Given
        const exception = NetworkException(
          message: 'Error',
          type: NetworkExceptionType.unknown,
        );
        const result = Failure<int>(exception);

        // When
        final chained = result.flatMap((data) => Success(data.toString()));

        // Then
        expect(chained.isFailure, true);
      });
    });
  });

  group('Exception 테스트', () {
    test('NetworkException 생성 테스트', () {
      // Given
      const exception = NetworkException(
        message: '네트워크 오류',
        statusCode: 500,
        type: NetworkExceptionType.serverError,
      );

      // Then
      expect(exception.message, '네트워크 오류');
      expect(exception.statusCode, 500);
      expect(exception.type, NetworkExceptionType.serverError);
      expect(exception.displayMessage, '네트워크 오류');
    });

    test('NetworkException.isRetryable 테스트', () {
      // Given
      const timeoutException = NetworkException(
        message: 'Timeout',
        type: NetworkExceptionType.timeout,
      );
      const noConnectionException = NetworkException(
        message: 'No connection',
        type: NetworkExceptionType.noConnection,
      );
      const cancelledException = NetworkException(
        message: 'Cancelled',
        type: NetworkExceptionType.cancelled,
      );

      // Then
      expect(timeoutException.isRetryable, true);
      expect(noConnectionException.isRetryable, true);
      expect(cancelledException.isRetryable, false);
    });

    test('AuthException 팩토리 메서드 테스트', () {
      // When
      final sessionExpired = AuthException.sessionExpired();
      final invalidCredentials = AuthException.invalidCredentials();
      final loginRequired = AuthException.loginRequired();

      // Then
      expect(sessionExpired.type, AuthExceptionType.sessionExpired);
      expect(invalidCredentials.type, AuthExceptionType.invalidCredentials);
      expect(loginRequired.type, AuthExceptionType.loginRequired);
    });

    test('StreamingException 팩토리 메서드 테스트', () {
      // When
      final liveEnded = StreamingException.liveEnded();
      final ageRestricted = StreamingException.ageRestricted();
      final regionRestricted = StreamingException.regionRestricted();

      // Then
      expect(liveEnded.type, StreamingExceptionType.liveEnded);
      expect(ageRestricted.type, StreamingExceptionType.ageRestricted);
      expect(regionRestricted.type, StreamingExceptionType.regionRestricted);
    });

    test('CacheException 팩토리 메서드 테스트', () {
      // When
      final readError = CacheException.readError();
      final writeError = CacheException.writeError();

      // Then
      expect(readError.message, contains('읽는'));
      expect(writeError.message, contains('저장'));
    });
  });
}
