import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../core/tv/back/back.dart';
import '../../features/screen.dart';
import '../shell/shell.dart';
import 'app_player_route_targets.dart';
import 'app_routes.dart';

final appRouter = createAppRouter();

GoRouter createAppRouter({
  String initialLocation = '/',
}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      ShellRoute(
        pageBuilder: (context, state, child) {
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: AppShell(
              selectedRoute: _appShellSelectedRouteForPath(state.uri.path),
              child: child,
            ),
          );
        },
        routes: [
          for (final route in AppRoute.values.where(_usesAppShell))
            _route(route, (state) => _screenFor(route, state)),
        ],
      ),
      for (final route in AppRoute.values.where(
        (route) => !_usesAppShell(route),
      ))
        _route(
          route,
          (state) {
            final screen = _screenFor(route, state);
            if (route == AppRoute.auth ||
                route == AppRoute.settingsLicenses ||
                route == AppRoute.channel ||
                route == AppRoute.livePlayer ||
                route == AppRoute.vodPlayer ||
                route == AppRoute.searchResults ||
                route == AppRoute.searchTagResults) {
              return screen;
            }

            return TvScaffold(
              backController: const TvBackController.ignore(),
              body: screen,
            );
          },
        ),
    ],
  );
}

Widget _screenFor(AppRoute route, GoRouterState state) {
  final screen = switch (route) {
    AppRoute.home => const HomeScreen(),
    AppRoute.following => const FollowingScreen(),
    AppRoute.category => const CategoryScreen(),
    AppRoute.categoryDetail => CategoryDetailScreen(
      categoryType: state.requiredPathParam(_RoutePathParam.categoryType),
      categoryId: state.requiredPathParam(_RoutePathParam.categoryId),
    ),
    AppRoute.browse => const BrowseScreen(),
    AppRoute.search => const SearchScreen(),
    AppRoute.searchResults => SearchResultsScreen(
      query: state.requiredQueryParam(_RouteQueryParam.keyword),
    ),
    AppRoute.searchTagResults => SearchTagResultsScreen(
      tag: state.requiredQueryParam(_RouteQueryParam.keyword),
    ),
    AppRoute.group => const GroupScreen(),
    AppRoute.settings => const SettingsScreen(),
    AppRoute.settingsLicenses => const SettingsLicensesScreen(),
    AppRoute.auth => const AuthScreen(),
    AppRoute.channel => ChannelScreen(
      channelId: state.requiredPathParam(_RoutePathParam.channelId),
    ),
    AppRoute.livePlayer => LivePlayerScreen(
      initialTarget: livePlayerInitialTargetFromRoute(
        queryParameters: state.uri.queryParameters,
        extra: state.extra,
      ),
    ),
    AppRoute.vodPlayer => VodPlayerScreen(
      initialTarget: vodPlayerInitialTargetFromRoute(
        queryParameters: state.uri.queryParameters,
        extra: state.extra,
      ),
    ),
  };

  return screen;
}

bool _usesAppShell(AppRoute route) {
  return switch (route) {
    AppRoute.home ||
    AppRoute.following ||
    AppRoute.category ||
    AppRoute.browse ||
    AppRoute.search ||
    AppRoute.group ||
    AppRoute.settings => true,
    AppRoute.settingsLicenses ||
    AppRoute.auth ||
    AppRoute.categoryDetail ||
    AppRoute.channel ||
    AppRoute.searchResults ||
    AppRoute.searchTagResults ||
    AppRoute.livePlayer ||
    AppRoute.vodPlayer => false,
  };
}

AppRoute _appShellSelectedRoute(AppRoute route) {
  return switch (route) {
    AppRoute.searchResults || AppRoute.searchTagResults => AppRoute.search,
    _ => route,
  };
}

AppRoute _appShellSelectedRouteForPath(String path) {
  for (final route in AppRoute.values) {
    if (route.path == path) {
      return _appShellSelectedRoute(route);
    }
  }

  return AppRoute.home;
}

GoRoute _route(AppRoute route, Widget Function(GoRouterState state) builder) {
  return GoRoute(
    name: route.name,
    path: route.path,
    pageBuilder: (context, state) {
      return NoTransitionPage<void>(
        key: state.pageKey,
        child: builder(state),
      );
    },
  );
}

extension _RequiredRouteValues on GoRouterState {
  String requiredPathParam(String key) {
    return _requiredRouteValue(
      kind: 'path parameter',
      key: key,
      value: pathParameters[key],
    );
  }

  String requiredQueryParam(String key) {
    return _requiredRouteValue(
      kind: 'query parameter',
      key: key,
      value: uri.queryParameters[key],
    );
  }
}

String _requiredRouteValue({
  required String kind,
  required String key,
  required String? value,
}) {
  if (value == null || value.trim().isEmpty) {
    throw StateError('Missing required route $kind: $key');
  }

  return value;
}

abstract final class _RoutePathParam {
  static const categoryType = 'categoryType';
  static const categoryId = 'categoryId';
  static const channelId = 'channelId';
}

abstract final class _RouteQueryParam {
  static const keyword = 'keyword';
}
