import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

void main() {
  group('API 테스트', () {
    test('Dio 인스턴스 생성 테스트', () {
      // Given
      final dio = Dio();
      
      // When & Then
      expect(dio, isA<Dio>());
      expect(dio.options, isA<BaseOptions>());
    });

    test('RequestOptions 생성 테스트', () {
      // Given
      final options = RequestOptions(
        path: '/test',
        method: 'GET',
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 3),
      );

      // Then
      expect(options.path, '/test');
      expect(options.method, 'GET');
      expect(options.connectTimeout, Duration(seconds: 5));
      expect(options.receiveTimeout, Duration(seconds: 3));
    });

    test('Response 객체 생성 테스트', () {
      // Given
      final response = Response(
        data: {'message': 'success'},
        statusCode: 200,
        requestOptions: RequestOptions(path: '/test'),
      );

      // Then
      expect(response.statusCode, 200);
      expect(response.data, {'message': 'success'});
      expect(response.requestOptions.path, '/test');
    });

    test('DioException 생성 테스트', () {
      // Given
      final exception = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.connectionTimeout,
        message: 'Connection timeout',
      );

      // Then
      expect(exception.type, DioExceptionType.connectionTimeout);
      expect(exception.message, 'Connection timeout');
      expect(exception.requestOptions.path, '/test');
    });

    test('HTTP 상태 코드 확인 테스트', () {
      // Given
      final successCodes = [200, 201, 202, 204];
      final clientErrorCodes = [400, 401, 403, 404];
      final serverErrorCodes = [500, 502, 503, 504];

      // When & Then
      for (final code in successCodes) {
        expect(code >= 200 && code < 300, true, reason: '$code should be success');
      }

      for (final code in clientErrorCodes) {
        expect(code >= 400 && code < 500, true, reason: '$code should be client error');
      }

      for (final code in serverErrorCodes) {
        expect(code >= 500, true, reason: '$code should be server error');
      }
    });
  });
} 