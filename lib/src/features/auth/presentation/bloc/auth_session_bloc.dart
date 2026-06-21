import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/naver_session_cookie.dart';
import '../../domain/repositories/auth_session_repository.dart';

part 'auth_session_bloc.freezed.dart';
part 'auth_session_event.dart';
part 'auth_session_state.dart';

final class AuthSessionBloc extends Bloc<AuthSessionEvent, AuthSessionState> {
  AuthSessionBloc(
    this._repository, {
    this.captureRetryDelay = const Duration(milliseconds: 300),
    this.captureMaxAttempts = 20,
  }) : super(const AuthSessionState()) {
    on<AuthSessionEvent>(_onSessionEvent, transformer: sequential());
  }

  final AuthSessionRepository _repository;
  final Duration captureRetryDelay;
  final int captureMaxAttempts;

  bool get hasRequiredCookies => state.hasRequiredCookies;

  String? get cookieHeader => state.cookieHeader;

  Future<bool> restoreSessionFromCookies() {
    return _dispatchAndWait(
      (completer) => AuthSessionEvent.restoreRequested(
        completer: completer,
      ),
    );
  }

  Future<bool> captureSessionFromCookies() {
    return _dispatchAndWait(
      (completer) => AuthSessionEvent.captureRequested(
        completer: completer,
      ),
    );
  }

  Future<bool> logout() {
    return _dispatchAndWait(
      (completer) => AuthSessionEvent.logoutRequested(
        completer: completer,
      ),
    );
  }

  Future<void> _onRestoreRequested(
    _RestoreRequested event,
    Emitter<AuthSessionState> emit,
  ) async {
    emit(state.copyWith(status: AuthSessionStatus.restoring));

    try {
      final sessionCookie = await _readSessionCookie();
      if (sessionCookie == null) {
        emit(const AuthSessionState());
        _complete(event.completer, false);
        return;
      }

      emit(
        AuthSessionState(
          session: sessionCookie,
          status: AuthSessionStatus.authenticated,
        ),
      );
      _complete(event.completer, true);
    } catch (_) {
      emit(const AuthSessionState());
      _complete(event.completer, false);
    }
  }

  Future<void> _onSessionEvent(
    AuthSessionEvent event,
    Emitter<AuthSessionState> emit,
  ) {
    return switch (event) {
      _RestoreRequested() => _onRestoreRequested(event, emit),
      _CaptureRequested() => _onCaptureRequested(event, emit),
      _LogoutRequested() => _onLogoutRequested(event, emit),
    };
  }

  Future<void> _onCaptureRequested(
    _CaptureRequested event,
    Emitter<AuthSessionState> emit,
  ) async {
    emit(state.copyWith(status: AuthSessionStatus.capturing));

    try {
      final sessionCookie = await _readSessionCookieWithRetry();
      if (sessionCookie == null) {
        emit(
          state.copyWith(
            status: _statusForSession(state.session),
          ),
        );
        _complete(event.completer, false);
        return;
      }

      emit(
        AuthSessionState(
          session: sessionCookie,
          status: AuthSessionStatus.authenticated,
        ),
      );
      _complete(event.completer, true);
    } catch (_) {
      emit(
        state.copyWith(
          status: _statusForSession(state.session),
        ),
      );
      _complete(event.completer, false);
    }
  }

  Future<void> _onLogoutRequested(
    _LogoutRequested event,
    Emitter<AuthSessionState> emit,
  ) async {
    emit(state.copyWith(status: AuthSessionStatus.loggingOut));

    var didLogout = false;
    try {
      didLogout = await _repository.clearAllCookies();
    } catch (_) {
      didLogout = false;
    } finally {
      emit(const AuthSessionState());
      _complete(event.completer, didLogout);
    }
  }

  Future<NaverSessionCookie?> _readSessionCookieWithRetry() async {
    for (var attempt = 0; attempt < captureMaxAttempts; attempt += 1) {
      final sessionCookie = await _readSessionCookie();
      if (sessionCookie != null) {
        return sessionCookie;
      }

      if (attempt == captureMaxAttempts - 1) {
        break;
      }

      await Future<void>.delayed(captureRetryDelay);
    }

    return null;
  }

  Future<NaverSessionCookie?> _readSessionCookie() async {
    final sessionCookie = await _repository.readRequiredSessionCookie();
    if (sessionCookie?.hasRequiredCookies != true) {
      return null;
    }

    return sessionCookie;
  }

  Future<bool> _dispatchAndWait(
    AuthSessionEvent Function(Completer<bool> completer) createEvent,
  ) {
    final completer = Completer<bool>();
    add(createEvent(completer));
    return completer.future;
  }

  void _complete(Completer<bool>? completer, bool value) {
    if (completer?.isCompleted == false) {
      completer!.complete(value);
    }
  }

  AuthSessionStatus _statusForSession(NaverSessionCookie? session) {
    return session?.hasRequiredCookies == true
        ? AuthSessionStatus.authenticated
        : AuthSessionStatus.unauthenticated;
  }
}
