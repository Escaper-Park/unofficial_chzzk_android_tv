import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api.dart';
import '../model/auth.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepository();

class AuthRepository {
  final CookieManager _cookieManger = CookieManager.instance();

  Future<void> naverLogin({
    required String id,
    required String password,
  }) async {}

  Future<void> setExpiresDate() async {
    const String naverLoginUrl = APIUrl.naverLogin;

    final expiresDate =
        DateTime.now().add(const Duration(days: 13)).millisecondsSinceEpoch;

    List<Cookie> cookies = await _cookieManger.getCookies(
      url: WebUri(naverLoginUrl),
    );

    for (Cookie cookie in cookies) {
      if (cookie.name == 'NID_AUT') {
        if (cookie.value != null) {
          _cookieManger.setCookie(
            url: WebUri(naverLoginUrl),
            name: 'NID_AUT',
            value: cookie.value.toString(),
            expiresDate: expiresDate,
          );
        }
      }

      if (cookie.name == 'NID_SES') {
        if (cookie.value != null) {
          _cookieManger.setCookie(
            url: WebUri(naverLoginUrl),
            name: 'NID_SES',
            value: cookie.value.toString(),
            expiresDate: expiresDate,
          );
        }
      }
    }
  }

  /// Get Cookies from inappwebview to use it as a login signals.
  Future<Auth?> getAuthWithCookies() async {
    const String naverLoginUrl = APIUrl.naverLogin;

    List<Cookie> cookies = await _cookieManger.getCookies(
      url: WebUri(naverLoginUrl),
    );

    String? nidAuth;
    String? nidSession;

    for (Cookie cookie in cookies) {
      if (cookie.name == 'NID_AUT') {
        nidAuth = cookie.value;
      }

      if (cookie.name == 'NID_SES') {
        nidSession = cookie.value;
      }
    }

    if (nidAuth != null && nidSession != null) {
      return Auth(nidAuth: nidAuth, nidSession: nidSession);
    } else {
      return null;
    }
  }

  Future<void> deleteCookies() async {
    await _cookieManger.deleteAllCookies();
  }
}
