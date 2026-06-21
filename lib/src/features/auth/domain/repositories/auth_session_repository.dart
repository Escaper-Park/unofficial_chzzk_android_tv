import '../entities/naver_session_cookie.dart';

abstract interface class AuthSessionRepository {
  Future<NaverSessionCookie?> readRequiredSessionCookie();

  Future<bool> clearAllCookies();
}
