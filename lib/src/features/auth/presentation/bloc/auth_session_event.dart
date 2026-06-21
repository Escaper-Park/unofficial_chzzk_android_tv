part of 'auth_session_bloc.dart';

@freezed
sealed class AuthSessionEvent with _$AuthSessionEvent {
  const factory AuthSessionEvent.restoreRequested({
    Completer<bool>? completer,
  }) = _RestoreRequested;

  const factory AuthSessionEvent.captureRequested({
    Completer<bool>? completer,
  }) = _CaptureRequested;

  const factory AuthSessionEvent.logoutRequested({
    Completer<bool>? completer,
  }) = _LogoutRequested;
}
