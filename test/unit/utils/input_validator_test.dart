import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/utils/security/input_validator.dart';

void main() {
  group('InputValidator 테스트', () {
    group('Username 검증 테스트', () {
      test('유효한 사용자명은 통과해야 함', () {
        // Given
        const validUsernames = [
          'user123',
          'test_user',
          'TestUser',
          '한글사용자',
          'user-name',
        ];

        // Then
        for (final username in validUsernames) {
          final result = InputValidator.validateUsername(username);
          expect(result.isValid, true, reason: '$username should be valid');
        }
      });

      test('빈 사용자명은 실패해야 함', () {
        // When
        final result = InputValidator.validateUsername('');
        final nullResult = InputValidator.validateUsername(null);

        // Then
        expect(result.isValid, false);
        expect(nullResult.isValid, false);
        expect(result.errorMessage, contains('입력'));
      });

      test('최대 길이 초과 사용자명은 실패해야 함', () {
        // Given
        final longUsername = 'a' * 51;

        // When
        final result = InputValidator.validateUsername(longUsername);

        // Then
        expect(result.isValid, false);
        expect(result.errorMessage, contains('50'));
      });

      test('특수문자 포함 사용자명은 실패해야 함', () {
        // Given
        const invalidUsernames = [
          'user@name',
          'user<script>',
          'user"name',
          'user\\name',
        ];

        // Then
        for (final username in invalidUsernames) {
          final result = InputValidator.validateUsername(username);
          expect(result.isValid, false, reason: '$username should be invalid');
        }
      });
    });

    group('SearchQuery 검증 테스트', () {
      test('유효한 검색어는 통과해야 함', () {
        // Given
        const validQueries = [
          '검색어',
          'search term',
          '게임 스트리머',
          '@username',
          '#태그',
        ];

        // Then
        for (final query in validQueries) {
          final result = InputValidator.validateSearchQuery(query);
          expect(result.isValid, true, reason: '$query should be valid');
        }
      });

      test('빈 검색어는 실패해야 함', () {
        // When
        final result = InputValidator.validateSearchQuery('');
        final whitespaceResult = InputValidator.validateSearchQuery('   ');

        // Then
        expect(result.isValid, false);
        expect(whitespaceResult.isValid, false);
      });

      test('최대 길이 초과 검색어는 실패해야 함', () {
        // Given
        final longQuery = 'a' * 101;

        // When
        final result = InputValidator.validateSearchQuery(longQuery);

        // Then
        expect(result.isValid, false);
        expect(result.errorMessage, contains('100'));
      });
    });

    group('ChatMessage 검증 테스트', () {
      test('유효한 채팅 메시지는 통과해야 함', () {
        // Given
        const validMessages = [
          '안녕하세요!',
          'Hello World',
          '이모티콘 테스트 😀',
        ];

        // Then
        for (final message in validMessages) {
          final result = InputValidator.validateChatMessage(message);
          expect(result.isValid, true, reason: '$message should be valid');
        }
      });

      test('빈 채팅 메시지는 실패해야 함', () {
        // When
        final result = InputValidator.validateChatMessage('');

        // Then
        expect(result.isValid, false);
      });

      test('스크립트 태그 포함 메시지는 실패해야 함', () {
        // Given
        const maliciousMessage = '<script>alert("xss")</script>';

        // When
        final result = InputValidator.validateChatMessage(maliciousMessage);

        // Then
        expect(result.isValid, false);
      });
    });

    group('URL 검증 테스트', () {
      test('유효한 URL은 통과해야 함', () {
        // Given
        const validUrls = [
          'https://example.com',
          'http://localhost:8080',
          'https://api.chzzk.naver.com/service/v1',
        ];

        // Then
        for (final url in validUrls) {
          final result = InputValidator.validateUrl(url);
          expect(result.isValid, true, reason: '$url should be valid');
        }
      });

      test('빈 URL은 실패해야 함', () {
        // When
        final result = InputValidator.validateUrl('');

        // Then
        expect(result.isValid, false);
      });

      test('HTTPS 필수 옵션 테스트', () {
        // Given
        const httpUrl = 'http://example.com';
        const httpsUrl = 'https://example.com';

        // When
        final httpResult = InputValidator.validateUrl(httpUrl, requireHttps: true);
        final httpsResult = InputValidator.validateUrl(httpsUrl, requireHttps: true);

        // Then
        expect(httpResult.isValid, false);
        expect(httpsResult.isValid, true);
      });

      test('잘못된 URL 형식은 실패해야 함', () {
        // Given
        const invalidUrls = [
          'not-a-url',
          '://missing-scheme',
        ];

        // Then
        for (final url in invalidUrls) {
          final result = InputValidator.validateUrl(url);
          expect(result.isValid, false, reason: '$url should be invalid');
        }
      });
    });

    group('Sanitize 테스트', () {
      test('HTML 태그 제거 테스트', () {
        // Given
        const input = '<div>Hello <b>World</b></div>';

        // When
        final sanitized = InputValidator.sanitize(input);

        // Then
        expect(sanitized, 'Hello World');
      });

      test('스크립트 태그 제거 테스트', () {
        // Given
        const input = 'Hello<script>alert("xss")</script>World';

        // When
        final sanitized = InputValidator.sanitize(input);

        // Then
        expect(sanitized, 'HelloWorld');
        expect(sanitized.contains('script'), false);
      });

      test('위험한 문자 제거 테스트', () {
        // Given
        const input = 'Test<>"\\;String';

        // When
        final sanitized = InputValidator.sanitize(input);

        // Then
        expect(sanitized.contains('<'), false);
        expect(sanitized.contains('>'), false);
        expect(sanitized.contains('"'), false);
        expect(sanitized.contains('\\'), false);
        expect(sanitized.contains(';'), false);
      });

      test('공백 정규화 테스트', () {
        // Given
        const input = '  Hello   World  ';

        // When
        final sanitized = InputValidator.sanitize(input);

        // Then
        expect(sanitized, 'Hello World');
      });
    });

    group('Truncate 테스트', () {
      test('긴 문자열 자르기 테스트', () {
        // Given
        const input = 'This is a very long string';

        // When
        final truncated = InputValidator.truncate(input, 10);

        // Then
        expect(truncated.length, 10);
        expect(truncated, 'This is a…');
      });

      test('짧은 문자열은 그대로 유지', () {
        // Given
        const input = 'Short';

        // When
        final truncated = InputValidator.truncate(input, 10);

        // Then
        expect(truncated, 'Short');
      });

      test('말줄임표 없이 자르기', () {
        // Given
        const input = 'Hello World';

        // When
        final truncated = InputValidator.truncate(input, 5, addEllipsis: false);

        // Then
        expect(truncated, 'Hello');
      });
    });

    group('String Extension 테스트', () {
      test('validateAsUsername 확장 메서드 테스트', () {
        // Given
        const username = 'validUser123';

        // When
        final result = username.validateAsUsername();

        // Then
        expect(result.isValid, true);
      });

      test('sanitized 확장 메서드 테스트', () {
        // Given
        const input = '<script>alert("xss")</script>';

        // When
        final sanitized = input.sanitized();

        // Then
        expect(sanitized.contains('script'), false);
      });

      test('truncated 확장 메서드 테스트', () {
        // Given
        const input = 'A very long string that needs truncation';

        // When
        final truncated = input.truncated(20);

        // Then
        expect(truncated.length, 20);
      });
    });
  });
}
