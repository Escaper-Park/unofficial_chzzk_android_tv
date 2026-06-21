import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/app/router/app_router.dart';
import 'package:unofficial_chzzk_android_tv/src/app/router/app_routes.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/entities/naver_session_cookie.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/repositories/auth_session_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/bloc/auth_session_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/home_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/user/domain/entities/user_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/user/domain/repositories/user_repository.dart';

import 'src/test_fakes/fake_feature_repository_scope.dart';

void main() {
  testWidgets('renders the routed home screen', (tester) async {
    await tester.pumpWidget(const _AppHarness());
    await tester.pump();
    await tester.pump();

    expect(find.text(HomeScreenString.immersiveEmpty), findsOneWidget);
    expect(find.text('홈'), findsOneWidget);
  });
}

class _AppHarness extends StatelessWidget {
  const _AppHarness();

  @override
  Widget build(BuildContext context) {
    const authSessionRepository = _FakeAuthSessionRepository();

    return FakeFeatureRepositoryScope(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthSessionRepository>.value(
            value: authSessionRepository,
          ),
          RepositoryProvider<UserRepository>.value(
            value: const _FakeUserRepository(),
          ),
        ],
        child: BlocProvider(
          create: (context) {
            final bloc = AuthSessionBloc(authSessionRepository);
            unawaited(bloc.restoreSessionFromCookies());
            return bloc;
          },
          child: MaterialApp.router(
            routerConfig: createAppRouter(initialLocation: AppRoute.home.path),
          ),
        ),
      ),
    );
  }
}

final class _FakeAuthSessionRepository implements AuthSessionRepository {
  const _FakeAuthSessionRepository();

  @override
  Future<NaverSessionCookie?> readRequiredSessionCookie() async {
    return null;
  }

  @override
  Future<bool> clearAllCookies() async {
    return true;
  }
}

final class _FakeUserRepository implements UserRepository {
  const _FakeUserRepository();

  @override
  Future<List<String>> getPrivateUserBlocks() async {
    return const [];
  }

  @override
  Future<UserStatus> getUserStatus() async {
    return const _FakeUserStatus();
  }
}

final class _FakeUserStatus implements UserStatus {
  const _FakeUserStatus();

  @override
  bool get hasProfile => false;

  @override
  bool get loggedIn => false;

  @override
  String? get nickname => null;

  @override
  bool get officialNotiAgree => false;

  @override
  String? get officialNotiAgreeUpdatedDate => null;

  @override
  List<String> get penalties => const [];

  @override
  String? get profileImageUrl => null;

  @override
  String? get userIdHash => null;

  @override
  bool get verifiedMark => false;
}
