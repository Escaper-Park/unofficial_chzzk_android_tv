import 'dart:async';
import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/entities/naver_session_cookie.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/repositories/auth_session_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/bloc/auth_session_bloc.dart';

void main() {
  group('AuthSessionBloc', () {
    test('restores app-visible session from cookies', () async {
      final repository = _FakeAuthSessionRepository([
        _sessionCookie,
      ]);
      final bloc = AuthSessionBloc(repository);
      addTearDown(bloc.close);

      final restored = await bloc.restoreSessionFromCookies();

      expect(restored, true);
      expect(bloc.hasRequiredCookies, true);
      expect(bloc.cookieHeader, 'NID_AUT=aut; NID_SES=ses');
      expect(bloc.state.status, AuthSessionStatus.authenticated);
    });

    test(
      'retries session capture until required cookies are available',
      () async {
        final repository = _FakeAuthSessionRepository([
          null,
          null,
          _sessionCookie,
        ]);
        final bloc = AuthSessionBloc(
          repository,
          captureRetryDelay: Duration.zero,
        );
        addTearDown(bloc.close);

        final captured = await bloc.captureSessionFromCookies();

        expect(captured, true);
        expect(repository.readCount, 3);
        expect(bloc.state.session, _sessionCookie);
        expect(bloc.state.status, AuthSessionStatus.authenticated);
      },
    );

    test('clears app-visible session on logout', () async {
      final repository = _FakeAuthSessionRepository([
        _sessionCookie,
      ]);
      final bloc = AuthSessionBloc(repository);
      addTearDown(bloc.close);
      await bloc.restoreSessionFromCookies();

      final didLogout = await bloc.logout();

      expect(didLogout, true);
      expect(repository.clearCount, 1);
      expect(bloc.state.session, isNull);
      expect(bloc.state.status, AuthSessionStatus.unauthenticated);
    });

    test('serializes restore before logout', () async {
      final readCompleter = Completer<NaverSessionCookie?>();
      final repository = _FakeAuthSessionRepository([
        readCompleter.future,
      ]);
      final bloc = AuthSessionBloc(repository);
      addTearDown(bloc.close);

      final restoreFuture = bloc.restoreSessionFromCookies();
      await pumpEventQueue();
      final logoutFuture = bloc.logout();
      await pumpEventQueue();

      expect(repository.clearCount, 0);

      readCompleter.complete(_sessionCookie);

      expect(await restoreFuture, true);
      expect(await logoutFuture, true);
      expect(repository.clearCount, 1);
      expect(bloc.state.session, isNull);
      expect(bloc.state.status, AuthSessionStatus.unauthenticated);
    });

    test('does not expose session cookies in state diagnostics', () {
      const state = AuthSessionState(session: _sessionCookie);

      expect(state.toString(), isNot(contains('aut')));
      expect(state.toString(), isNot(contains('ses')));
      expect(_sessionCookie.toString(), isNot(contains('aut')));
      expect(_sessionCookie.toString(), isNot(contains('ses')));
    });
  });
}

const _sessionCookie = NaverSessionCookie(
  nidAut: 'aut',
  nidSes: 'ses',
);

final class _FakeAuthSessionRepository implements AuthSessionRepository {
  _FakeAuthSessionRepository(Iterable<FutureOr<NaverSessionCookie?>> cookies)
    : _cookies = Queue.of(cookies);

  final Queue<FutureOr<NaverSessionCookie?>> _cookies;
  int readCount = 0;
  int clearCount = 0;

  @override
  Future<NaverSessionCookie?> readRequiredSessionCookie() async {
    readCount += 1;
    if (_cookies.isEmpty) {
      return null;
    }

    return _cookies.removeFirst();
  }

  @override
  Future<bool> clearAllCookies() async {
    clearCount += 1;
    return true;
  }
}
