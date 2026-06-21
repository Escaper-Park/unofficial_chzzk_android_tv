import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/app/bloc/app_shell_user_cubit.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/entities/naver_session_cookie.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/repositories/auth_session_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/bloc/auth_session_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/user/domain/entities/user_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/user/domain/repositories/user_repository.dart';

void main() {
  test(
    'keeps current profile image when authenticated refresh fails',
    () async {
      final authSessionBloc = AuthSessionBloc(
        const _FakeAuthSessionRepository(_sessionCookie),
      );
      addTearDown(authSessionBloc.close);
      await authSessionBloc.restoreSessionFromCookies();

      final cubit = AppShellUserCubit(
        authSessionBloc: authSessionBloc,
        userRepository: _QueuedUserRepository([
          const _FakeUserStatus(
            loggedIn: true,
            profileImageUrl: _profileImageUrl,
          ),
          StateError('temporary user status failure'),
        ]),
      );
      addTearDown(cubit.close);

      await cubit.refresh();
      expect(cubit.state, _profileImageUrl);

      await cubit.refresh();
      expect(cubit.state, _profileImageUrl);
    },
  );
}

const _sessionCookie = NaverSessionCookie(
  nidAut: 'nid-aut',
  nidSes: 'nid-ses',
);
const _profileImageUrl = 'https://ssl.pstatic.net/static/chzzk/profile.jpg';

final class _FakeAuthSessionRepository implements AuthSessionRepository {
  const _FakeAuthSessionRepository(this.sessionCookie);

  final NaverSessionCookie? sessionCookie;

  @override
  Future<NaverSessionCookie?> readRequiredSessionCookie() async {
    return sessionCookie;
  }

  @override
  Future<bool> clearAllCookies() async {
    return true;
  }
}

final class _QueuedUserRepository implements UserRepository {
  _QueuedUserRepository(this._results);

  final List<Object> _results;

  @override
  Future<List<String>> getPrivateUserBlocks() async {
    return const [];
  }

  @override
  Future<UserStatus> getUserStatus() async {
    final result = _results.removeAt(0);
    if (result is Error) {
      throw result;
    }

    return result as UserStatus;
  }
}

final class _FakeUserStatus implements UserStatus {
  const _FakeUserStatus({
    required this.loggedIn,
    required this.profileImageUrl,
  });

  @override
  bool get hasProfile => profileImageUrl != null;

  @override
  final bool loggedIn;

  @override
  String? get nickname => null;

  @override
  bool get officialNotiAgree => false;

  @override
  String? get officialNotiAgreeUpdatedDate => null;

  @override
  List<String> get penalties => const [];

  @override
  final String? profileImageUrl;

  @override
  String? get userIdHash => null;

  @override
  bool get verifiedMark => false;
}
