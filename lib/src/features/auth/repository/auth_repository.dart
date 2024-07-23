import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../common/constants/api.dart';
import '../model/auth.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepository();

class AuthRepository {
  // Use Cookie from WebView.
  final CookieManager _cookieManager = CookieManager.instance();

  /// Sign in with cookies.
  Future<Auth?> getAuthWithCookies() async {
    const String naverLoginUrl = ApiUrl.naverLogin;

    List<Cookie> cookies = await _cookieManager.getCookies(
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
      _setExpiresDate();

      return Auth(nidAuth: nidAuth, nidSession: nidSession);
    } else {
      return null;
    }
  }

  /// Delete cookies to log out.
  Future<void> deleteCookies() async {
    await _cookieManager.deleteAllCookies();
  }

  /// Set expires date to keep login state.
  Future<void> _setExpiresDate({int days = 14}) async {
    const String naverLoginUrl = ApiUrl.naverLogin;

    final expiresDate =
        DateTime.now().add(Duration(days: days)).millisecondsSinceEpoch;

    final List<Cookie> cookies =
        await _cookieManager.getCookies(url: WebUri(naverLoginUrl));

    for (Cookie cookie in cookies) {
      if (cookie.name == 'NID_AUT') {
        if (cookie.value != null) {
          _cookieManager.setCookie(
            url: WebUri(naverLoginUrl),
            name: 'NID_AUT',
            value: cookie.value.toString(),
            expiresDate: expiresDate,
          );
        }
      }

      if (cookie.name == 'NID_SES') {
        if (cookie.value != null) {
          _cookieManager.setCookie(
            url: WebUri(naverLoginUrl),
            name: 'NID_SES',
            value: cookie.value.toString(),
            expiresDate: expiresDate,
          );
        }
      }
    }
  }
}
