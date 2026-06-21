import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/data/network/auth_cookie_interceptor.dart';

void main() {
  test('attaches cookies to allowed API hosts', () async {
    final adapter = _CapturingAdapter();
    final dio = Dio(BaseOptions(baseUrl: 'https://apis.naver.com'))
      ..httpClientAdapter = adapter
      ..interceptors.add(
        AuthCookieInterceptor(
          readCookieHeader: () => 'NID_AUT=aut; NID_SES=ses',
        ),
      );

    await dio.get<void>('/neonplayer/vodplay/v2/playback/video-id');

    expect(adapter.lastOptions?.headers['Cookie'], 'NID_AUT=aut; NID_SES=ses');
  });

  test('removes cookies from external absolute playlist hosts', () async {
    final adapter = _CapturingAdapter();
    final dio = Dio(BaseOptions(baseUrl: 'https://apis.naver.com'))
      ..httpClientAdapter = adapter
      ..interceptors.add(
        AuthCookieInterceptor(
          readCookieHeader: () => 'NID_AUT=aut; NID_SES=ses',
        ),
      );

    await dio.getUri<void>(
      Uri.parse('https://cdn.example.com/live/master.m3u8'),
      options: Options(headers: {'Cookie': 'old=value'}),
    );

    expect(adapter.lastOptions?.headers.containsKey('Cookie'), isFalse);
  });

  test('removes cookies from player-host playlist paths', () async {
    final adapter = _CapturingAdapter();
    final dio = Dio(BaseOptions(baseUrl: 'https://apis.naver.com'))
      ..httpClientAdapter = adapter
      ..interceptors.add(
        AuthCookieInterceptor(
          readCookieHeader: () => 'NID_AUT=aut; NID_SES=ses',
        ),
      );

    await dio.getUri<void>(
      Uri.parse('https://apis.naver.com/hls/live/master.m3u8'),
      options: Options(headers: {'Cookie': 'old=value'}),
    );

    expect(adapter.lastOptions?.headers.containsKey('Cookie'), isFalse);
  });
}

final class _CapturingAdapter implements HttpClientAdapter {
  RequestOptions? lastOptions;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    lastOptions = options;
    return ResponseBody.fromString(
      '{}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
