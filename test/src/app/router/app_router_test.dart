import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/app/router/app_router.dart';
import 'package:unofficial_chzzk_android_tv/src/app/router/app_routes.dart';
import 'package:unofficial_chzzk_android_tv/src/app/shell/shell.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/entities/naver_session_cookie.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/repositories/auth_session_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/bloc/auth_session_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/presentation/following_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/home_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/live_player_screen.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/presentation/search_results_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/presentation/search_tag_results_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/settings_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/user/domain/entities/user_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/user/domain/repositories/user_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/vod_player_screen.dart';

import '../../test_fakes/fake_feature_repository_scope.dart';

void main() {
  testWidgets('router opens Home by default', (tester) async {
    await tester.pumpWidget(
      _RouterHarness(initialLocation: AppRoute.home.path),
    );
    await tester.pump();
    await tester.pump();

    expect(find.text(HomeScreenString.immersiveEmpty), findsOneWidget);
    expect(find.text('홈'), findsOneWidget);
  });

  testWidgets('router can open a non-shell route', (tester) async {
    await tester.pumpWidget(
      const _RouterHarness(initialLocation: '/channel/test-channel'),
    );
    await tester.pump();
    await tester.pump();

    expect(find.byType(AppShell), findsNothing);
  });

  testWidgets('router opens Search Tag Results outside AppShell', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _RouterHarness(
        initialLocation: '/search/tag-results?keyword=%23game',
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.byType(AppShell), findsNothing);
    expect(
      find.text(SearchTagResultsScreenString.headerTitle('game')),
      findsOneWidget,
    );
  });

  testWidgets('router opens Search Results outside AppShell', (tester) async {
    await tester.pumpWidget(
      const _RouterHarness(
        initialLocation: '/search/results?keyword=game',
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.byType(AppShell), findsNothing);
    expect(
      find.text(SearchResultsScreenString.headerTitle('game')),
      findsOneWidget,
    );
  });

  testWidgets('router opens Settings Licenses outside AppShell', (
    tester,
  ) async {
    await tester.pumpWidget(
      _RouterHarness(initialLocation: AppRoute.settingsLicenses.path),
    );
    await tester.pump();
    await tester.pump();

    expect(find.byType(AppShell), findsNothing);
    expect(
      find.text(SettingsScreenString.appInfoOpenSourceLicensesTitle),
      findsOneWidget,
    );
  });

  testWidgets('router opens Settings with route dependencies', (tester) async {
    await tester.pumpWidget(
      _RouterHarness(initialLocation: AppRoute.settings.path),
    );
    await tester.pump();
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.byType(AppShell), findsOneWidget);
    expect(find.text(SettingsScreenString.title), findsOneWidget);
  });

  testWidgets('router opens Live Player with route dependencies', (
    tester,
  ) async {
    await tester.pumpWidget(
      _RouterHarness(initialLocation: AppRoute.livePlayer.path),
    );
    await tester.pump();
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.byType(AppShell), findsNothing);
    expect(find.byType(LivePlayerScreen), findsOneWidget);
  });

  testWidgets('router opens VOD Player with route dependencies', (
    tester,
  ) async {
    await tester.pumpWidget(
      _RouterHarness(initialLocation: AppRoute.vodPlayer.path),
    );
    await tester.pump();
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.byType(AppShell), findsNothing);
    expect(find.byType(VodPlayerScreen), findsOneWidget);
  });

  testWidgets('router reports missing required search query', (tester) async {
    await tester.pumpWidget(
      const _RouterHarness(initialLocation: '/search/results'),
    );
    await tester.pump();

    final exception = tester.takeException();
    expect(exception, isA<StateError>());
    expect(exception.toString(), contains('keyword'));
  });

  testWidgets('router keeps shell user state across shell navigation', (
    tester,
  ) async {
    final userRepository = _CountingUserRepository(
      status: const _FakeUserStatus(
        loggedIn: true,
        profileImageUrl: 'https://ssl.pstatic.net/static/chzzk/profile.jpg',
      ),
    );

    await tester.pumpWidget(
      _RouterHarness(
        initialLocation: AppRoute.home.path,
        authSessionRepository: const _FakeAuthSessionRepository(
          sessionCookie: _sessionCookie,
        ),
        userRepository: userRepository,
      ),
    );
    await tester.pump();
    await tester.pump();

    final initialCallCount = userRepository.getUserStatusCallCount;
    expect(initialCallCount, greaterThan(0));

    await tester.tap(find.text('팔로잉'));
    await tester.pump();
    await tester.pump();

    expect(find.text(FollowingScreenString.liveEmpty), findsOneWidget);
    expect(userRepository.getUserStatusCallCount, initialCallCount);
  });
}

class _RouterHarness extends StatelessWidget {
  const _RouterHarness({
    required this.initialLocation,
    this.authSessionRepository = const _FakeAuthSessionRepository(),
    this.userRepository = const _FakeUserRepository(),
  });

  final String initialLocation;
  final AuthSessionRepository authSessionRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return FakeFeatureRepositoryScope(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthSessionRepository>.value(
            value: authSessionRepository,
          ),
          RepositoryProvider<UserRepository>.value(
            value: userRepository,
          ),
        ],
        child: BlocProvider(
          create: (context) {
            final bloc = AuthSessionBloc(authSessionRepository);
            unawaited(bloc.restoreSessionFromCookies());
            return bloc;
          },
          child: MaterialApp.router(
            routerConfig: createAppRouter(initialLocation: initialLocation),
          ),
        ),
      ),
    );
  }
}

final class _FakeAuthSessionRepository implements AuthSessionRepository {
  const _FakeAuthSessionRepository({
    this.sessionCookie,
  });

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

final class _CountingUserRepository implements UserRepository {
  _CountingUserRepository({
    this.status = const _FakeUserStatus(),
  });

  final UserStatus status;
  int getUserStatusCallCount = 0;

  @override
  Future<List<String>> getPrivateUserBlocks() async {
    return const [];
  }

  @override
  Future<UserStatus> getUserStatus() async {
    getUserStatusCallCount += 1;
    return status;
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
  const _FakeUserStatus({
    this.loggedIn = false,
    this.profileImageUrl,
  });

  @override
  bool get hasProfile => false;

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

const _sessionCookie = NaverSessionCookie(
  nidAut: 'nid-aut',
  nidSes: 'nid-ses',
);
