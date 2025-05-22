import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user_agent.dart';

export 'package:dio/dio.dart';

part 'dio_client.g.dart';

@Riverpod(keepAlive: true)
class DioClient extends _$DioClient {
  final String _userAgent = UserAgent.userAgent;

  /// A common response in CHZZK is like {code: 200, message: null, content: Map}
  /// and only needs `content` so it uses the interceptor to filter out the unnecessary data.
  final InterceptorsWrapper _contentInterceptor = InterceptorsWrapper(
    onResponse: (response, handler) {
      response.data = response.data['content'];
      handler.next(response);
    },
    onError: (error, handler) {
      // return null on error situation.
      handler.resolve(
        Response(
          requestOptions: error.requestOptions,
          statusCode: error.response?.statusCode ?? 500,
          data: null,
        ),
      );
    },
  );

  @override
  Dio build() {
    return _init(null);
  }

  /// A Base dio client with the User-Agent and cookies(for login).
  Dio getBaseDio(Set? cookies) {
    return Dio(
      BaseOptions(
        headers: {
          'User-Agent': _userAgent,
          'Cookie': cookies,
        },
      ),
    );
  }

  Dio _init(Set? cookies) {
    final Dio dio = getBaseDio(cookies);
    dio.interceptors.add(_contentInterceptor);

    return dio;
  }

  /// Add Cookies for global setting with login status.
  void addCookies(Set cookies) {
    final Dio dio = _init(cookies);

    // notifying
    state = dio;
  }

  void signOut() {
    state = _init(null);
  }
}
