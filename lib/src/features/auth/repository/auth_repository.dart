import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api.dart' show BaseUrl;
import '../model/auth.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepository();

/// Auth Repository with the [CookieManager].
class AuthRepository {
  final CookieManager _cookieManager = CookieManager.instance();
  final String _naverLoginUrl = BaseUrl.naverLogin;

  Future<Auth?> getAuthFromCookies() async {
    final List<Cookie> cookies = await _getCookies();
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

  /// Set the cookies' expires date to maintain login state.
  Future<void> _setExpiresDate({int days = 14}) async {
    final List<Cookie> cookies = await _getCookies();

    final expiresDate =
        DateTime.now().add(Duration(days: days)).millisecondsSinceEpoch;

    for (Cookie cookie in cookies) {
      if (cookie.name == 'NID_AUT' && cookie.value != null) {
        _setCookie('NID_AUT', cookie.value.toString(), expiresDate);
      }

      if (cookie.name == 'NID_SES' && cookie.value != null) {
        _setCookie('NID_SES', cookie.value.toString(), expiresDate);
      }
    }
  }

  /// Set cookie with the expiresDate.
  Future<void> _setCookie(String name, String value, int expiresDate) async {
    await _cookieManager.setCookie(
      url: WebUri(_naverLoginUrl),
      name: name,
      value: value,
      expiresDate: expiresDate,
    );
  }

  /// Get saved cookies.
  Future<List<Cookie>> _getCookies() async {
    return await _cookieManager.getCookies(url: WebUri(_naverLoginUrl));
  }

  /// Delete all cookies when you logged out.
  Future<void> deleteCookies() async {
    await _cookieManager.deleteAllCookies();
  }
}
