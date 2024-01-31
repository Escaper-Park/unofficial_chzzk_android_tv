import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/live/live.dart';
import '../../ui/screens/screens.dart';

export 'package:go_router/go_router.dart';

part 'app_router.g.dart';

enum AppRoute {
  splash('/splash', 'splash'),
  home('/home', 'home'),
  following('/following', 'following'),
  search('/search', 'search'),
  setting('/setting', 'setting'),
  auth('/auth', 'auth'),
  singleViewLive('/singleViewLive', 'singleViewLive'),
  singleViewVod('/singleViewVod', 'singleViewVod'),
  multiView('/multiView', 'multiView'),
  multiViewLive('/multiViewLive', 'multiViewLive'),
  license('/license', 'license');

  final String routePath;
  final String routeName;

  const AppRoute(this.routePath, this.routeName);
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
Raw<GoRouter> appRouter(AppRouterRef ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
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
      GoRoute(
        path: AppRoute.setting.routePath,
        name: AppRoute.setting.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: SettingScreen(key: state.pageKey),
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
        path: AppRoute.singleViewLive.routePath,
        name: AppRoute.singleViewLive.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: SingleViewLiveScreen(
            key: state.pageKey,
            videoPath: state.uri.queryParameters['videoPath']!,
            channelId: state.uri.queryParameters['channelId']!,
            chatChannelId: state.uri.queryParameters['chatChannelId']!,
            openDate: state.uri.queryParameters['openDate']!,
          ),
        ),
      ),
      GoRoute(
        path: AppRoute.singleViewVod.routePath,
        name: AppRoute.singleViewVod.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: SingleViewVodScreen(
            key: state.pageKey,
            vodPath: state.uri.queryParameters['vodPath']!,
          ),
        ),
      ),
      GoRoute(
        path: AppRoute.multiView.routePath,
        name: AppRoute.multiView.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: MultiViewScreen(
            key: state.pageKey,
          ),
        ),
      ),
      GoRoute(
          path: AppRoute.multiViewLive.routePath,
          name: AppRoute.multiViewLive.routeName,
          pageBuilder: (context, state) {
            List<LiveDetail> liveDetails = state.extra as List<LiveDetail>;

            return NoTransitionPage(
              child: MultiViewLiveScreen(
                key: state.pageKey,
                liveDetails: liveDetails,
              ),
            );
          }),
      GoRoute(
        path: AppRoute.license.routePath,
        name: AppRoute.license.routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: OpenSourceLicenseScreen(
            key: state.pageKey,
          ),
        ),
      ),
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
