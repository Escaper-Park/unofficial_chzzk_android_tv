import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'package:dio/dio.dart';

part 'dio_client.g.dart';

@Riverpod(keepAlive: true)
class DioClient extends _$DioClient {
  final String _userAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3';

  @override
  Dio build() {
    return init();
  }

  Dio getBaseDio() {
    return Dio(
      BaseOptions(
        headers: {'User-Agent': _userAgent},
      ),
    );
  }

  Dio init() {
    final Dio dio = getBaseDio();

    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          response.data = response.data['content'];
          handler.next(response);
        },
      ),
    );

    return dio;
  }

  /// Add cookies for global setting with login.
  void addCookies(Set cookies) {
    final dio = Dio(
      BaseOptions(
        headers: {
          'User-Agent': _userAgent,
          'Cookie': cookies,
        },
      ),
    );

    // Add interceptors to get only content from json.
    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          response.data = response.data['content'];
          handler.next(response);
        },
      ),
    );

    state = dio;
  }

  void singOut() {
    state = getBaseDio();
  }
}
