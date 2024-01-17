import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/screens.dart';

export 'package:go_router/go_router.dart';

part 'app_router.g.dart';

enum AppRoute {
  dashboard('/dashboard', 'dashboard'),
  splash('/splash', 'splash'),
  home('/home', 'home'),
  auth('/auth', 'auth'),
  following('/following', 'following'),
  search('/search', 'search'),
  naverLogin('/naverLogin', 'naverLogin'),
  vod('/vod', 'vod'),
  singleView('/singleView', 'singleView');
  // channelDetail('/channelDetail', 'channelDetail');

  final String routePath;
  final String routeName;

  const AppRoute(this.routePath, this.routeName);
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

// final GlobalKey<NavigatorState> _shellNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'shell');

@riverpod
Raw<GoRouter> appRouter(AppRouterRef ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true, // TODO : Set false
    initialLocation: AppRoute.splash.routePath,
    routes: [
      GoRoute(
        path: AppRoute.splash.routePath,
        name: AppRoute.splash.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: SplashScreen(key: state.pageKey),
        ),
      ),
      GoRoute(
        path: AppRoute.auth.routePath,
        name: AppRoute.auth.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: AuthScreen(key: state.pageKey),
        ),
      ),
      GoRoute(
        path: AppRoute.naverLogin.routePath,
        name: AppRoute.naverLogin.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: NaverLoginWebViewScreen(
            key: state.pageKey,
            id: state.uri.queryParameters['id']!,
            password: state.uri.queryParameters['password']!,
          ),
        ),
      ),
      GoRoute(
        path: AppRoute.singleView.routePath,
        name: AppRoute.singleView.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: SingleViewScreen(
            key: state.pageKey,
            videoPath: state.uri.queryParameters['videoPath']!,
          ),
        ),
      ),
      GoRoute(
        path: AppRoute.vod.routePath,
        name: AppRoute.vod.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: VodScreen(
            key: state.pageKey,
            vodPath: state.uri.queryParameters['vodPath']!,
          ),
        ),
      ),
      GoRoute(
        path: AppRoute.home.routePath,
        name: AppRoute.home.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: HomeScreen(key: state.pageKey),
        ),
      ),
      GoRoute(
        path: AppRoute.following.routePath,
        name: AppRoute.following.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: FollowingScreen(key: state.pageKey),
        ),
      ),
      GoRoute(
        path: AppRoute.search.routePath,
        name: AppRoute.search.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: SearchScreen(key: state.pageKey),
        ),
      ),

      // Dashboard Shell
      // ShellRoute(
      //   navigatorKey: _shellNavigatorKey,
      //   builder: (context, state, child) => DashboardScreen(
      //     body: child,
      //   ),
      //   routes: [
      //     GoRoute(
      //       path: AppRoute.home.routePath,
      //       name: AppRoute.home.routeName,
      //       pageBuilder: (context, state) => NoTransitionPage(
      //         child: HomeScreen(key: state.pageKey),
      //       ),
      //     ),
      //     GoRoute(
      //       path: AppRoute.following.routePath,
      //       name: AppRoute.following.routeName,
      //       pageBuilder: (context, state) => NoTransitionPage(
      //         child: FollowingScreen(key: state.pageKey),
      //       ),
      //     ),
      //     GoRoute(
      //       path: AppRoute.search.routePath,
      //       name: AppRoute.search.routeName,
      //       pageBuilder: (context, state) => NoTransitionPage(
      //         child: SearchScreen(key: state.pageKey),
      //       ),
      //     ),
      //   ],
      // ),
    ],
    redirect: (context, state) {
      final bool isSplash = state.uri.toString() == AppRoute.splash.routePath;

      if (isSplash) {
        return AppRoute.home.routePath;
      }

      return null;
    },
  );
}
