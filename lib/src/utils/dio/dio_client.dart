import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'error_handling_interceptor.dart';
import 'user_agent.dart';

export 'package:dio/dio.dart';

part 'dio_client.g.dart';

@Riverpod(keepAlive: true)
class DioClient extends _$DioClient {
  final String _userAgent = UserAgent.userAgent;

  /// A common response in CHZZK is like {code: 200, message: null, content: Map}
  /// and only needs `content` so it uses the interceptor to filter out the unnecessary data.
  ///
  /// Note: Error handling is now delegated to [ErrorHandlingInterceptor] which
  /// converts DioExceptions to typed AppExceptions for proper error propagation.
  final InterceptorsWrapper _contentInterceptor = InterceptorsWrapper(
    onResponse: (response, handler) {
      response.data = response.data['content'];
      handler.next(response);
    },
    // Error handling is now done by ErrorHandlingInterceptor - no more swallowing errors
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

    // Add interceptors in order:
    // 1. ErrorHandlingInterceptor - converts DioExceptions to typed AppExceptions
    // 2. ContentInterceptor - extracts 'content' field from CHZZK API responses
    dio.interceptors.addAll([
      ErrorHandlingInterceptor(),
      _contentInterceptor,
    ]);

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
