import '../domain/entities/naver_session_cookie.dart';

abstract final class AuthSessionConfig {
  static const cookieDomains = <String>[
    'https://nid.naver.com',
    'https://naver.com',
    'https://www.naver.com',
    'https://m.naver.com',
    'https://chzzk.naver.com',
    'https://game.naver.com',
    'https://comm-api.game.naver.com',
    'https://api.chzzk.naver.com',
    'https://apis.naver.com',
  ];

  static const requiredCookieNames = <String>[
    NaverSessionCookie.nidAutCookieName,
    NaverSessionCookie.nidSesCookieName,
  ];
}
