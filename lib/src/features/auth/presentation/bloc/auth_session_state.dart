part of 'auth_session_bloc.dart';

enum AuthSessionStatus {
  unauthenticated,
  restoring,
  authenticated,
  capturing,
  loggingOut,
}

@Freezed(toStringOverride: false)
abstract class AuthSessionState with _$AuthSessionState {
  const AuthSessionState._();

  const factory AuthSessionState({
    NaverSessionCookie? session,
    @Default(AuthSessionStatus.unauthenticated) AuthSessionStatus status,
  }) = _AuthSessionState;

  bool get hasRequiredCookies => session?.hasRequiredCookies ?? false;

  String? get cookieHeader {
    final sessionCookie = session;
    if (sessionCookie?.hasRequiredCookies != true) {
      return null;
    }

    return sessionCookie!.cookieHeader;
  }
}
