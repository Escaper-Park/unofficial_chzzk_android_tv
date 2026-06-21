import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/data/repositories/webview_auth_session_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/data/webview/auth_cookie_header_parser.dart';

void main() {
  group('AuthCookieHeaderParser', () {
    test('preserves cookie values containing equals padding', () {
      final cookies = AuthCookieHeaderParser.parse(
        'NID_AUT=aut-token; NID_SES=session-token==; other=value',
      );

      expect(cookies['NID_AUT'], 'aut-token');
      expect(cookies['NID_SES'], 'session-token==');
    });
  });

  group('WebViewAuthSessionRepository', () {
    test('restores required session cookies from raw Android header', () async {
      final repository = WebViewAuthSessionRepository(
        readRawCookieHeader: (_) async {
          return 'NID_AUT=aut-token; NID_SES=session-token==; other=value';
        },
      );

      final sessionCookie = await repository.readRequiredSessionCookie();

      expect(sessionCookie?.nidAut, 'aut-token');
      expect(sessionCookie?.nidSes, 'session-token==');
      expect(
        sessionCookie?.cookieHeader,
        'NID_AUT=aut-token; NID_SES=session-token==',
      );
    });

    test('does not combine required cookies from different domains', () async {
      final repository = WebViewAuthSessionRepository(
        readRawCookieHeader: (url) async {
          return switch (url.host) {
            'nid.naver.com' => 'NID_AUT=aut-token',
            'chzzk.naver.com' => 'NID_SES=session-token',
            _ => null,
          };
        },
        readPlatformCookies: (_) async => const [],
      );

      final sessionCookie = await repository.readRequiredSessionCookie();

      expect(sessionCookie, isNull);
    });
  });
}
