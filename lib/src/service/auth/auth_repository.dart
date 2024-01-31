import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../constants/api.dart';
import '../../model/auth/auth.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepository();

class AuthRepository {
  final CookieManager _cookieManager = CookieManager.instance();

  Future<void> naverLogin({
    required InAppWebViewController controller,
    required WebUri? webUri,
    required String id,
    required String password,
  }) async {
    final urlString = webUri.toString();

    if (urlString == APIUrl.naverLogin) {
      String script = "";

      // Input id, password
      script = """
var idField = document.getElementById('id');
var passwordField = document.getElementById('pw');
if (idField.value === '') {
    idField.value = '$id';
}
if (passwordField.value === ''){
    passwordField.value = '$password';
}
""";
      await controller.evaluateJavascript(source: script);

      // Check keep login button state
      script = """
      document.querySelector('#keep').checked;
    """;
      bool isChecked = await controller.evaluateJavascript(source: script);

      // If not checked
      if (!isChecked) {
        script = """
        document.querySelector('#keep').click();
      """;
        // click keep login checkbox
        await controller.evaluateJavascript(source: script);
      }

      await Future.delayed(const Duration(milliseconds: 300));

      // click login button
      script = """
      document.querySelector('[id="log.login"]').click();
    """;
      await controller.evaluateJavascript(source: script);
    }
  }

  Future<Auth?> getAuthWithCookies() async {
    const String naverLoginUrl = APIUrl.naverLogin;

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
      return Auth(nidAuth: nidAuth, nidSession: nidSession);
    } else {
      return null;
    }
  }

  Future<void> deleteCookies() async {
    await _cookieManager.deleteAllCookies();
  }

  Future<void> setExpiresDate({int days = 13}) async {
    const String naverLoginUrl = APIUrl.naverLogin;

    final expiresDate =
        DateTime.now().add(Duration(days: days)).millisecondsSinceEpoch;

    List<Cookie> cookies = await _cookieManager.getCookies(
      url: WebUri(naverLoginUrl),
    );

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
