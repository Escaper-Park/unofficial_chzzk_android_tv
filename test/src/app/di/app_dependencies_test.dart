import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/app/di/app_dependencies.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/entities/naver_session_cookie.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/domain/repositories/auth_session_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/bloc/auth_session_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/category/domain/repositories/category_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/repositories/channel_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/domain/repositories/following_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/repositories/group_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/domain/repositories/home_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/repositories/live_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search/domain/repositories/search_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/domain/repositories/search_results_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/domain/repositories/search_tag_results_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_preferences_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_update_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/user/domain/repositories/user_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/repositories/vod_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/watching_history/domain/repositories/watching_history_repository.dart';

void main() {
  test(
    'dispose closes callbacks in reverse order and closes auth bloc once',
    () async {
      final calls = <String>[];
      final dependencies = _createDependencies(
        disposeCallbacks: [
          () => calls.add('first'),
          () async {
            await Future<void>.delayed(Duration.zero);
            calls.add('second');
          },
        ],
      );

      await dependencies.dispose();
      await dependencies.dispose();

      expect(calls, ['second', 'first']);
      expect(dependencies.authSessionBloc.isClosed, isTrue);
    },
  );

  test('starts auth session restore without waiting for cookie IO', () async {
    final readCompleter = Completer<NaverSessionCookie?>();
    final repositories = _FakeRepositories(
      sessionCookie: readCompleter.future,
    );
    final dependencies = _createDependencies(repositories: repositories);
    addTearDown(dependencies.dispose);

    final restoreFuture = dependencies.startAuthSessionRestore();
    await pumpEventQueue();

    expect(repositories.readRequiredSessionCookieCount, 1);
    expect(
      dependencies.authSessionBloc.state.status,
      AuthSessionStatus.restoring,
    );

    readCompleter.complete(_sessionCookie);

    expect(await restoreFuture, true);
    expect(
      dependencies.authSessionBloc.state.status,
      AuthSessionStatus.authenticated,
    );
  });

  testWidgets('scope disposes dependencies when removed from the tree', (
    tester,
  ) async {
    var disposed = false;
    final dependencies = _createDependencies(
      disposeCallbacks: [
        () => disposed = true,
      ],
    );

    await tester.pumpWidget(
      AppDependencyScope(
        dependencies: dependencies,
        child: const SizedBox(),
      ),
    );

    await tester.pumpWidget(const SizedBox());
    await _waitFor(() {
      return disposed && dependencies.authSessionBloc.isClosed;
    });

    expect(disposed, isTrue);
    expect(dependencies.authSessionBloc.isClosed, isTrue);
  });
}

AppDependencies _createDependencies({
  _FakeRepositories? repositories,
  List<FutureOr<void> Function()> disposeCallbacks = const [],
}) {
  final fakeRepositories = repositories ?? _FakeRepositories();

  return AppDependencies(
    authSessionRepository: fakeRepositories,
    authSessionBloc: AuthSessionBloc(fakeRepositories),
    userRepository: fakeRepositories,
    homeRepository: fakeRepositories,
    liveRepository: fakeRepositories,
    chatRepository: fakeRepositories,
    loadLivePlaybackPlaylistText: _emptyPlaylist,
    loadVodPlaybackPlaylistText: _emptyPlaylist,
    followingRepository: fakeRepositories,
    groupRepository: _FakeGroupRepository(),
    channelRepository: fakeRepositories,
    vodRepository: fakeRepositories,
    watchingHistoryRepository: fakeRepositories,
    categoryRepository: fakeRepositories,
    searchRepository: fakeRepositories,
    searchResultsRepository: fakeRepositories,
    searchTagResultsRepository: fakeRepositories,
    settingsPreferencesRepository: _FakeSettingsPreferencesRepository(),
    settingsUpdateRepository: fakeRepositories,
    disposeCallbacks: disposeCallbacks,
  );
}

Future<String> _emptyPlaylist({
  required Uri playlistUri,
}) async {
  return '';
}

Future<void> _waitFor(bool Function() condition) async {
  for (var attempt = 0; attempt < 20; attempt += 1) {
    if (condition()) {
      return;
    }
    await Future<void>.delayed(Duration.zero);
  }

  fail('Condition was not met.');
}

const _sessionCookie = NaverSessionCookie(
  nidAut: 'aut',
  nidSes: 'ses',
);

final class _FakeRepositories
    implements
        AuthSessionRepository,
        UserRepository,
        HomeRepository,
        LiveRepository,
        ChatRepository,
        FollowingRepository,
        ChannelRepository,
        VodRepository,
        WatchingHistoryRepository,
        CategoryRepository,
        SearchRepository,
        SearchResultsRepository,
        SearchTagResultsRepository,
        SettingsUpdateRepository {
  _FakeRepositories({
    this.sessionCookie,
  });

  final FutureOr<NaverSessionCookie?>? sessionCookie;
  int readRequiredSessionCookieCount = 0;
  int clearAllCookiesCount = 0;

  @override
  Future<NaverSessionCookie?> readRequiredSessionCookie() async {
    readRequiredSessionCookieCount += 1;
    return sessionCookie;
  }

  @override
  Future<bool> clearAllCookies() async {
    clearAllCookiesCount += 1;
    return true;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

final class _FakeGroupRepository implements GroupRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

final class _FakeSettingsPreferencesRepository
    implements SettingsPreferencesRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}
