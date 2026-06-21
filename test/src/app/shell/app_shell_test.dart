import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/app/app_theme.dart';
import 'package:unofficial_chzzk_android_tv/src/app/router/app_routes.dart';
import 'package:unofficial_chzzk_android_tv/src/app/shell/app_shell_design.dart';
import 'package:unofficial_chzzk_android_tv/src/app/shell/shell.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/back/back.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/entities/naver_session_cookie.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/repositories/auth_session_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/bloc/auth_session_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/domain/entities/home_live.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/domain/repositories/home_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/presentation/home_screen.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/domain/entities/search_suggestions.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/domain/repositories/search_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/presentation/search_screen.dart';
import 'package:unofficial_chzzk_android_tv/src/features/user/domain/entities/user_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/user/domain/repositories/user_repository.dart';

import '../../test_fakes/fake_feature_repository_scope.dart';

void main() {
  testWidgets('renders top navigation and content', (tester) async {
    await tester.pumpWidget(
      const _ShellHarness(
        selectedRoute: AppRoute.home,
        child: Text('Home content'),
      ),
    );

    expect(find.text('홈'), findsOneWidget);
    expect(find.text('팔로잉'), findsOneWidget);
    expect(find.text('Home content'), findsOneWidget);
    expect(
      tester.getTopLeft(find.text('Home content')).dy,
      0,
    );
  });

  testWidgets('Home tab uses refresh icon when Home is selected', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _ShellHarness(
        selectedRoute: AppRoute.home,
        child: Text('Home content'),
      ),
    );

    expect(find.byIcon(Icons.refresh), findsOneWidget);
    expect(find.byIcon(Icons.home), findsNothing);
  });

  testWidgets('Home tab uses home icon when another screen is selected', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _ShellHarness(
        selectedRoute: AppRoute.settings,
        child: Text('Settings content'),
      ),
    );

    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.refresh), findsNothing);
  });

  testWidgets('reselecting Home refreshes the visible Home screen', (
    tester,
  ) async {
    final homeRepository = _CountingHomeRepository();

    await tester.pumpWidget(
      FakeFeatureRepositoryScope(
        child: RepositoryProvider<HomeRepository>.value(
          value: homeRepository,
          child: const _ShellHarness(
            selectedRoute: AppRoute.home,
            child: HomeScreen(),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(homeRepository.getTopLivesCallCount, 1);

    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();
    await tester.pump();

    expect(homeRepository.getTopLivesCallCount, 2);
  });

  testWidgets('D-pad Select on selected Home tab refreshes Home', (
    tester,
  ) async {
    final homeRepository = _CountingHomeRepository();

    await tester.pumpWidget(
      FakeFeatureRepositoryScope(
        child: RepositoryProvider<HomeRepository>.value(
          value: homeRepository,
          child: const _ShellHarness(
            selectedRoute: AppRoute.home,
            child: HomeScreen(),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(homeRepository.getTopLivesCallCount, 1);

    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pump();
    await tester.pump();

    expect(homeRepository.getTopLivesCallCount, 2);
  });

  testWidgets('non-Home content starts below top navigation', (tester) async {
    await tester.pumpWidget(
      const _ShellHarness(
        selectedRoute: AppRoute.settings,
        child: Text('Settings content'),
      ),
    );

    expect(
      tester.getTopLeft(find.text('Settings content')).dy,
      AppShellDesign.height,
    );
  });

  testWidgets(
    'Home navigation backdrop follows immersive focus notifications',
    (
      tester,
    ) async {
      await tester.pumpWidget(
        _ShellHarness(
          selectedRoute: AppRoute.home,
          child: Builder(
            builder: (context) {
              return TextButton(
                onPressed: () {
                  const AppShellNavigationBackdropNotification(
                    translucent: true,
                  ).dispatch(context);
                },
                child: const Text('Translucent'),
              );
            },
          ),
        ),
      );

      expect(_opaqueBackdropFinder(), findsOneWidget);
      expect(
        tester.widget<ColoredBox>(_opaqueBackdropFinder()).color,
        AppColorTokens.screenBackgroundColor,
      );
      expect(
        tester.getSize(_opaqueBackdropFinder()),
        const Size(800, AppShellDesign.height),
      );

      await tester.tap(find.text('Translucent'));
      await tester.pump();

      expect(_opaqueBackdropFinder(), findsNothing);

      const AppShellNavigationBackdropNotification(
        translucent: false,
      ).dispatch(tester.element(find.text('Translucent')));
      await tester.pump();

      expect(_opaqueBackdropFinder(), findsOneWidget);
    },
  );

  testWidgets('Back from content moves focus to top navigation', (
    tester,
  ) async {
    late FocusScopeNode navigationNode;
    late FocusScopeNode contentNode;

    await tester.pumpWidget(
      _ShellHarness(
        selectedRoute: AppRoute.home,
        child: Builder(
          builder: (context) {
            navigationNode = AppShellFocusScope.navigationOf(context);
            contentNode = AppShellFocusScope.contentOf(context);

            return const Text('Home content');
          },
        ),
      ),
    );

    contentNode.requestFocus();
    await tester.pump();
    await _sendSystemBack(tester);

    expect(navigationNode.hasFocus, isTrue);
  });

  testWidgets('Back from top navigation uses double back exit', (tester) async {
    late FocusScopeNode navigationNode;
    var exits = 0;

    await tester.pumpWidget(
      _ShellHarness(
        selectedRoute: AppRoute.home,
        onExit: () => exits += 1,
        child: Builder(
          builder: (context) {
            navigationNode = AppShellFocusScope.navigationOf(context);

            return const Text('Home content');
          },
        ),
      ),
    );

    navigationNode.requestFocus();
    await tester.pump();
    await _sendSystemBack(tester);

    expect(find.text(AppShellString.exitNoticeMessage), findsOneWidget);
    expect(find.byIcon(AppShellDesign.exitNoticeIcon), findsOneWidget);
    expect(exits, 0);

    await _sendSystemBack(tester);

    expect(exits, 1);
  });

  testWidgets(
    'Back from non-Home top navigation exits through AppShell when content owns Back',
    (tester) async {
      late FocusScopeNode navigationNode;
      var exits = 0;

      await tester.pumpWidget(
        _ShellHarness(
          selectedRoute: AppRoute.search,
          onExit: () => exits += 1,
          child: Builder(
            builder: (context) {
              navigationNode = AppShellFocusScope.navigationOf(context);

              return RepositoryProvider<SearchRepository>.value(
                value: const _FakeSearchRepository(),
                child: const SearchScreen(),
              );
            },
          ),
        ),
      );
      await tester.pump();

      navigationNode.requestFocus();
      await tester.pump();
      await _sendSystemBack(tester);

      expect(find.text(AppShellString.exitNoticeMessage), findsOneWidget);
      expect(exits, 0);

      await _sendSystemBack(tester);

      expect(exits, 1);
    },
  );

  testWidgets('content BackScope is disabled while top navigation has focus', (
    tester,
  ) async {
    late FocusScopeNode navigationNode;
    var contentBacks = 0;
    var exits = 0;

    await tester.pumpWidget(
      _ShellHarness(
        selectedRoute: AppRoute.settings,
        onExit: () => exits += 1,
        child: Builder(
          builder: (context) {
            navigationNode = AppShellFocusScope.navigationOf(context);

            return AppShellContentBackScope(
              controller: TvBackController(
                onBack: () => contentBacks += 1,
              ),
              child: const Text('Content with Back'),
            );
          },
        ),
      ),
    );
    await tester.pump();

    navigationNode.requestFocus();
    await tester.pump();
    await _sendSystemBack(tester);

    expect(contentBacks, 0);
    expect(find.text(AppShellString.exitNoticeMessage), findsOneWidget);
    expect(exits, 0);

    await _sendSystemBack(tester);

    expect(contentBacks, 0);
    expect(exits, 1);
  });

  testWidgets('content BackScope handles Back while content has focus', (
    tester,
  ) async {
    final contentFocusNode = FocusNode(debugLabel: 'test content focus');
    addTearDown(contentFocusNode.dispose);
    var contentBacks = 0;
    var exits = 0;

    await tester.pumpWidget(
      _ShellHarness(
        selectedRoute: AppRoute.settings,
        onExit: () => exits += 1,
        child: Builder(
          builder: (context) {
            return AppShellContentBackScope(
              controller: TvBackController(
                onBack: () => contentBacks += 1,
              ),
              child: TextButton(
                focusNode: contentFocusNode,
                onPressed: () {},
                child: const Text('Content with Back'),
              ),
            );
          },
        ),
      ),
    );
    await tester.pump();

    contentFocusNode.requestFocus();
    await tester.pump();
    await _sendSystemBack(tester);

    expect(contentBacks, 1);
    expect(exits, 0);
    expect(find.text(AppShellString.exitNoticeMessage), findsNothing);
  });

  testWidgets('modal BackScope handles Back before content and shell', (
    tester,
  ) async {
    final modalNode = FocusScopeNode(debugLabel: 'test modal');
    addTearDown(modalNode.dispose);
    var contentBacks = 0;
    var dismisses = 0;
    var exits = 0;

    await tester.pumpWidget(
      _ShellHarness(
        selectedRoute: AppRoute.settings,
        onExit: () => exits += 1,
        child: AppShellContentBackScope(
          controller: TvBackController(
            onBack: () => contentBacks += 1,
          ),
          child: Stack(
            children: [
              const Text('Content with modal'),
              TvModalPanel(
                type: TvModalPanelType.standard,
                header: 'Modal',
                focusNode: modalNode,
                onDismiss: () => dismisses += 1,
                child: const SizedBox(height: 80),
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    modalNode.requestFocus();
    await tester.pump();
    await _sendSystemBack(tester);

    expect(dismisses, 1);
    expect(contentBacks, 0);
    expect(exits, 0);
    expect(find.text(AppShellString.exitNoticeMessage), findsNothing);
  });

  testWidgets('auth status-only changes do not refresh shell user profile', (
    tester,
  ) async {
    late AuthSessionBloc authSessionBloc;
    final userRepository = _CountingUserRepository(
      status: const _FakeUserStatus(
        loggedIn: true,
        profileImageUrl: _profileImageUrl,
      ),
    );

    await tester.pumpWidget(
      _ShellHarness(
        selectedRoute: AppRoute.home,
        authSessionRepository: const _FakeAuthSessionRepository(
          sessionCookie: _sessionCookie,
        ),
        userRepository: userRepository,
        child: Builder(
          builder: (context) {
            authSessionBloc = context.read<AuthSessionBloc>();
            return const Text('Home content');
          },
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    final initialRefreshCount = userRepository.getUserStatusCallCount;
    expect(initialRefreshCount, greaterThan(0));

    await authSessionBloc.captureSessionFromCookies();
    await tester.pump();
    await tester.pump();

    expect(userRepository.getUserStatusCallCount, initialRefreshCount);
  });

  testWidgets('logged-in top navigation opens the logout dialog', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _ShellHarness(
        selectedRoute: AppRoute.home,
        authSessionRepository: _FakeAuthSessionRepository(
          sessionCookie: _sessionCookie,
        ),
        userRepository: _FakeUserRepository(
          status: _FakeUserStatus(
            loggedIn: true,
            profileImageUrl: _profileImageUrl,
          ),
        ),
        child: Text('Home content'),
      ),
    );
    await tester.pump();
    await tester.pump();

    final avatar = find.byType(ProfileCircleAvatar);
    final avatarButton = find.ancestor(
      of: avatar,
      matching: find.byType(TextButton),
    );

    expect(avatar, findsOneWidget);
    expect(
      tester.getSize(avatarButton),
      AppShellDesign.profileAvatarButtonSize,
    );
    expect(
      tester.getSize(avatar),
      const Size.square(AppShellDesign.profileAvatarRadius * 2),
    );

    await tester.tap(avatar);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.byType(TvDialog), findsOneWidget);
    expect(find.text(AppShellString.logoutContent), findsOneWidget);
    expect(find.text(AppShellString.logoutCancelLabel), findsOneWidget);
  });
}

Future<void> _sendSystemBack(WidgetTester tester) async {
  await tester.binding.handlePopRoute();
  await tester.pump();
}

Finder _opaqueBackdropFinder() {
  final backgroundColor = AppTheme.dark().scaffoldBackgroundColor;

  return find.byWidgetPredicate((widget) {
    return widget is ColoredBox && widget.color == backgroundColor;
  });
}

class _ShellHarness extends StatelessWidget {
  const _ShellHarness({
    required this.selectedRoute,
    required this.child,
    this.authSessionRepository = const _FakeAuthSessionRepository(),
    this.userRepository = const _FakeUserRepository(),
    this.onExit,
  });

  final AppRoute selectedRoute;
  final Widget child;
  final AuthSessionRepository authSessionRepository;
  final UserRepository userRepository;
  final VoidCallback? onExit;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthSessionRepository>.value(
          value: authSessionRepository,
        ),
        RepositoryProvider<UserRepository>.value(value: userRepository),
      ],
      child: BlocProvider(
        create: (context) {
          final bloc = AuthSessionBloc(authSessionRepository);
          unawaited(bloc.restoreSessionFromCookies());
          return bloc;
        },
        child: MaterialApp(
          theme: AppTheme.dark(),
          home: AppShell(
            selectedRoute: selectedRoute,
            onExit: onExit,
            child: child,
          ),
        ),
      ),
    );
  }
}

const _sessionCookie = NaverSessionCookie(
  nidAut: 'nid-aut',
  nidSes: 'nid-ses',
);
const _profileImageUrl = 'https://ssl.pstatic.net/static/chzzk/profile.jpg';

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

final class _FakeUserRepository implements UserRepository {
  const _FakeUserRepository({
    this.status = const _FakeUserStatus(),
  });

  final UserStatus status;

  @override
  Future<List<String>> getPrivateUserBlocks() async {
    return const [];
  }

  @override
  Future<UserStatus> getUserStatus() async {
    return status;
  }
}

final class _CountingUserRepository implements UserRepository {
  _CountingUserRepository({
    required this.status,
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

final class _CountingHomeRepository implements HomeRepository {
  int getTopLivesCallCount = 0;

  @override
  Future<List<HomeLive>> getTopLives({int? slotSize}) async {
    getTopLivesCallCount += 1;
    return const [];
  }
}

final class _FakeSearchRepository implements SearchRepository {
  const _FakeSearchRepository();

  @override
  Future<SearchSuggestions> fetchChannelAutoComplete({
    required String keyword,
  }) async {
    return const SearchSuggestions();
  }

  @override
  Future<SearchSuggestions> fetchCategoryAutoComplete({
    required String keyword,
  }) async {
    return const SearchSuggestions();
  }

  @override
  Future<SearchTagSuggestions> fetchTagAutoComplete({
    required String keyword,
  }) async {
    return const SearchTagSuggestions();
  }
}

final class _FakeUserStatus implements UserStatus {
  const _FakeUserStatus({
    this.loggedIn = false,
    this.profileImageUrl,
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
