import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';

import 'auth_page_state.dart';

export 'auth_page_state.dart';

part 'auth_web_view_captcha_scripts.dart';
part 'auth_web_view_login_scripts.dart';

final authNaverLoginUri = Uri.parse(
  'https://nid.naver.com/nidlogin.login'
  '?mode=form'
  '&url=https%3A%2F%2Fchzzk.naver.com%2F'
  '&locale=ko_KR'
  '&svctype=1',
);

enum AuthSessionCaptureResult {
  pending,
  completed,
}

final class AuthWebViewFlow {
  const AuthWebViewFlow({
    required this.captureSessionFromCookies,
  });

  final Future<bool> Function() captureSessionFromCookies;

  Future<bool> injectCredentials({
    required WebViewController controller,
    required String id,
    required String password,
    required String captcha,
    required bool captchaRequired,
  }) async {
    final didFill = await controller.runJavaScriptReturningResult(
      _AuthWebViewLoginScripts.injectCredentials(
        id: id,
        password: password,
        captcha: captcha,
        shouldSetCaptcha: captchaRequired,
      ),
    );
    if (!_isTruthy(didFill)) {
      return false;
    }

    await ensureKeepLoginReady(controller: controller);

    final didSubmit = await controller.runJavaScriptReturningResult(
      _AuthWebViewLoginScripts.submitLoginForm(),
    );

    return _isTruthy(didSubmit);
  }

  Future<bool> ensureKeepLoginReady({
    required WebViewController controller,
  }) async {
    final result = await controller.runJavaScriptReturningResult(
      _AuthWebViewLoginScripts.ensureKeepLoginReady(),
    );

    return _isTruthy(result);
  }

  Future<void> reloadLoginPage({
    required WebViewController controller,
  }) {
    return controller.loadRequest(authNaverLoginUri);
  }

  Future<void> scrollToCaptcha({
    required WebViewController controller,
  }) {
    return controller.runJavaScript(
      _AuthWebViewCaptchaScripts.scrollToCaptcha(),
    );
  }

  Future<void> syncCaptchaImageOverlay({
    required WebViewController controller,
    required bool visible,
    required double height,
  }) {
    return controller.runJavaScript(
      _AuthWebViewCaptchaScripts.syncCaptchaImageOverlay(
        visible: visible,
        height: height,
      ),
    );
  }

  Future<AuthPageState?> readPageState({
    required WebViewController controller,
  }) async {
    final result = await controller.runJavaScriptReturningResult(
      _AuthWebViewCaptchaScripts.readLoginPageState(),
    );
    final decoded = _decodeJavascriptJson(result);
    if (decoded is! Map<String, dynamic>) {
      return null;
    }

    return AuthPageState.fromJson(decoded);
  }

  bool isNaverLoginPageUrl(String? url) {
    if (url == null) {
      return false;
    }

    final uri = Uri.tryParse(url);
    if (uri == null) {
      return false;
    }

    return uri.host.toLowerCase() == 'nid.naver.com' &&
        uri.path.toLowerCase() == '/nidlogin.login';
  }

  bool shouldCaptureLoginForUrl(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      return false;
    }

    final host = uri.host.toLowerCase();
    return host == 'chzzk.naver.com' || host.endsWith('.chzzk.naver.com');
  }

  Future<AuthSessionCaptureResult> captureLoginSession() async {
    final didCapture = await captureSessionFromCookies();
    if (!didCapture) {
      return AuthSessionCaptureResult.pending;
    }

    return AuthSessionCaptureResult.completed;
  }

  Object? _decodeJavascriptJson(Object? result) {
    if (result == null) {
      return null;
    }

    Object? decoded = result;
    for (var depth = 0; depth < 2 && decoded is String; depth += 1) {
      final raw = decoded.trim();
      if (raw.isEmpty || raw == 'null') {
        return null;
      }
      try {
        decoded = jsonDecode(raw);
      } on FormatException {
        return null;
      }
    }

    return decoded;
  }

  bool _isTruthy(Object? result) {
    return switch (result) {
      true => true,
      1 => true,
      'true' => true,
      _ => false,
    };
  }
}
