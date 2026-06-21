import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/network/chzzk_dio_factory.dart';

void main() {
  test('adds CHZZK web-style headers to CHZZK clients', () {
    final dio = ChzzkDioFactory.service();
    final headers = dio.options.headers;

    expect(dio.options.connectTimeout, ChzzkDioFactory.timeout);
    expect(dio.options.receiveTimeout, ChzzkDioFactory.timeout);
    expect(dio.options.sendTimeout, ChzzkDioFactory.timeout);
    expect(headers['Accept'], 'application/json, text/plain, */*');
    expect(headers['Accept-Language'], 'ko-KR');
    expect(headers['Cache-Control'], 'no-cache');
    expect(headers['Pragma'], 'no-cache');
    expect(headers['If-Modified-Since'], 'Mon, 26 Jul 1997 05:00:00 GMT');
    expect(headers['User-Agent'], ChzzkDioFactory.userAgent);
    expect(headers['Referer'], 'https://chzzk.naver.com/');
    expect(headers['front-client-platform-type'], 'PC');
    expect(headers['front-client-product-type'], 'web');
    expect(
      headers['deviceid'],
      matches(
        RegExp(
          r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
        ),
      ),
    );
  });

  test('keeps GitHub client free from CHZZK-specific headers', () {
    final dio = ChzzkDioFactory.github();
    final headers = dio.options.headers;

    expect(dio.options.connectTimeout, ChzzkDioFactory.timeout);
    expect(dio.options.receiveTimeout, ChzzkDioFactory.timeout);
    expect(dio.options.sendTimeout, ChzzkDioFactory.timeout);
    expect(headers['User-Agent'], ChzzkDioFactory.userAgent);
    expect(headers, isNot(contains('front-client-platform-type')));
    expect(headers, isNot(contains('front-client-product-type')));
    expect(headers, isNot(contains('deviceid')));
    expect(headers, isNot(contains('Referer')));
  });
}
