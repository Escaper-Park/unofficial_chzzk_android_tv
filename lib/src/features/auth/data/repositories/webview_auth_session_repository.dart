import 'package:webview_flutter/webview_flutter.dart';

import '../../domain/entities/naver_session_cookie.dart';
import '../../domain/repositories/auth_session_repository.dart';
import '../auth_session_config.dart';
import '../webview/android_web_view_cookie_channel.dart';
import '../webview/auth_cookie_header_parser.dart';

typedef RawCookieHeaderReader = Future<String?> Function(Uri url);
typedef PlatformCookieReader = Future<List<WebViewCookie>> Function(Uri url);

final class WebViewAuthSessionRepository implements AuthSessionRepository {
  WebViewAuthSessionRepository({
    WebViewCookieManager? cookieManager,
    RawCookieHeaderReader? readRawCookieHeader,
    PlatformCookieReader? readPlatformCookies,
  }) : this._(
         cookieManager: cookieManager,
         readRawCookieHeader:
             readRawCookieHeader ??
             AndroidWebViewCookieChannel.readCookieHeader,
         readPlatformCookies: readPlatformCookies,
       );

  const WebViewAuthSessionRepository._({
    this._cookieManager,
    required this._readRawCookieHeader,
    this._readPlatformCookies,
  });

  final WebViewCookieManager? _cookieManager;
  final RawCookieHeaderReader _readRawCookieHeader;
  final PlatformCookieReader? _readPlatformCookies;

  @override
  Future<NaverSessionCookie?> readRequiredSessionCookie() async {
    for (final domain in AuthSessionConfig.cookieDomains) {
      final cookieMap = await _readCookieMap(Uri.parse(domain));
      final sessionCookie = NaverSessionCookie.fromCookieMap(cookieMap);
      if (sessionCookie.hasRequiredCookies) {
        return sessionCookie;
      }
    }

    return null;
  }

  @override
  Future<bool> clearAllCookies() {
    return (_cookieManager ?? WebViewCookieManager()).clearCookies();
  }

  Future<Map<String, String>> _readCookieMap(Uri uri) async {
    final rawCookieHeader = await _readRawCookieHeader(uri);
    final rawCookieMap = AuthCookieHeaderParser.parse(rawCookieHeader);
    if (_hasRequiredCookiePair(rawCookieMap)) {
      return rawCookieMap;
    }

    final cookies = await _readCookiesFromPlatform(uri);
    return <String, String>{
      for (final cookie in cookies)
        if (AuthSessionConfig.requiredCookieNames.contains(cookie.name))
          cookie.name: cookie.value,
    };
  }

  bool _hasRequiredCookiePair(Map<String, String> cookies) {
    return AuthSessionConfig.requiredCookieNames.every(
      (name) => cookies[name]?.isNotEmpty ?? false,
    );
  }

  Future<List<WebViewCookie>> _readCookiesFromPlatform(Uri uri) {
    final reader = _readPlatformCookies;
    if (reader != null) {
      return reader(uri);
    }

    return (_cookieManager ?? WebViewCookieManager()).platform.getCookies(uri);
  }
}
