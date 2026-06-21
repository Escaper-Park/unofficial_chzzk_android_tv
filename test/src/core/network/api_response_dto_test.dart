import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/network/network.dart';

void main() {
  test('requireContent returns content for successful envelope', () {
    const response = ApiResponseDto<String>(
      code: 200,
      content: 'ok',
    );

    expect(response.requireContent(), 'ok');
  });

  test('requireContent keeps fake envelopes without code usable', () {
    const response = ApiResponseDto<String>(content: 'ok');

    expect(response.requireContent(), 'ok');
  });

  test('requireContent rejects failed envelope code', () {
    const response = ApiResponseDto<String>(
      code: 500,
      message: 'failed',
      content: 'ignored',
    );

    expect(response.requireContent, throwsA(isA<ApiResponseException>()));
  });

  test('requireContent rejects missing content', () {
    const response = ApiResponseDto<String>(
      code: 200,
      message: 'ok',
    );

    expect(response.requireContent, throwsA(isA<ApiResponseException>()));
  });

  test('contentOr returns fallback for missing successful content', () {
    const response = ApiResponseDto<String>(code: 200);

    expect(response.contentOr('fallback'), 'fallback');
  });

  test('contentOr rejects failed envelope code', () {
    const response = ApiResponseDto<String>(
      code: 500,
      message: 'failed',
    );

    expect(
      () => response.contentOr('fallback'),
      throwsA(isA<ApiResponseException>()),
    );
  });
}
