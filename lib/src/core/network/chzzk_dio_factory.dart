import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import 'chzzk_api_base_urls.dart';

abstract final class ChzzkDioFactory {
  static const timeout = Duration(seconds: 15);

  static const userAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
      'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36';
  static final deviceId = const Uuid().v4();

  static Dio service() {
    return _createChzzk(ChzzkApiBaseUrls.service);
  }

  static Dio comm() {
    return _createChzzk(ChzzkApiBaseUrls.comm);
  }

  static Dio player() {
    return _createChzzk(ChzzkApiBaseUrls.player);
  }

  static Dio github() {
    return _createJson(ChzzkApiBaseUrls.github);
  }

  static Dio _createChzzk(String baseUrl) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        sendTimeout: timeout,
        responseType: ResponseType.json,
        headers: {
          'Accept': 'application/json, text/plain, */*',
          'Accept-Language': 'ko-KR',
          'Cache-Control': 'no-cache',
          'Pragma': 'no-cache',
          'If-Modified-Since': 'Mon, 26 Jul 1997 05:00:00 GMT',
          'User-Agent': userAgent,
          'Referer': 'https://chzzk.naver.com/',
          'front-client-platform-type': 'PC',
          'front-client-product-type': 'web',
          'deviceid': deviceId,
        },
      ),
    );
  }

  static Dio _createJson(String baseUrl) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        sendTimeout: timeout,
        responseType: ResponseType.json,
        headers: const {
          'Accept': 'application/json',
          'User-Agent': userAgent,
        },
      ),
    );
  }
}
