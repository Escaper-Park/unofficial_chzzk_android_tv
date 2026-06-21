import 'package:freezed_annotation/freezed_annotation.dart';

part 'naver_session_cookie.freezed.dart';

@Freezed(toStringOverride: false)
abstract class NaverSessionCookie with _$NaverSessionCookie {
  const NaverSessionCookie._();

  const factory NaverSessionCookie({
    required String nidAut,
    required String nidSes,
  }) = _NaverSessionCookie;

  static const nidAutCookieName = 'NID_AUT';
  static const nidSesCookieName = 'NID_SES';

  bool get hasRequiredCookies => nidAut.isNotEmpty && nidSes.isNotEmpty;

  String get cookieHeader =>
      '$nidAutCookieName=$nidAut; $nidSesCookieName=$nidSes';

  factory NaverSessionCookie.fromCookieMap(Map<String, String> cookies) {
    return NaverSessionCookie(
      nidAut: cookies[nidAutCookieName] ?? '',
      nidSes: cookies[nidSesCookieName] ?? '',
    );
  }
}
