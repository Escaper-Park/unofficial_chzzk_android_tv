import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/category/model/category.dart';
import '../../features/live/model/live.dart';
import '../../features/vod/model/vod.dart';
import 'screens.dart'; // index

export 'package:go_router/go_router.dart';

part 'app_router.g.dart';

enum AppRoute {
  splash('/splash', 'splash', 99),

  // Search
  search('search', 'search', 0),

  // Home
  home('home', 'home', 1),

  // Home - Subroutes
  following('following', 'following', 2),
  category('category', 'category', 3),
  multiView('multiView', 'multiView', 4),
  settings('settings', 'settings', 5),

  // Login (Headless webview)
  id('id', 'id', 6),
  password('password', 'password', 7),

  // Vod - Full
  vod('vod', 'vod', 8),

  // Search results
  searchResults('searchResults', 'searchResults', 9),

  // Category Steaming
  categoryStreaming('categoryStreaming', 'categoryStreaming', 10),

  // Single-view
  liveStreaming('liveStreaming', 'liveStreaming', 11),
  vodStreaming('vodStreaming', 'vodStreaming', 12),

  // Multi_view Streaming
  multiViewStreaming('multiViewStreaming', 'multiViewStreaming', 13),

  // allLives channels
  allLives('allLives', 'allLives', 14),

  // Login (Webview)
  naverLoginWithWebView('naverLoginWithWebView', 'naverLoginWithWebView', 97),

  // license
  license('license', 'license', 98);

  final String routePath;
  final String routeName;
  final int screenIndex;

  const AppRoute(this.routePath, this.routeName, this.screenIndex);
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
Raw<GoRouter> appRouter(AppRouterRef ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: AppRoute.splash.routePath,
    routes: [
      GoRoute(
        path: AppRoute.splash.routePath,
        name: AppRoute.splash.routeName,
        pageBuilder: (context, state) {
          // Return [HomeScreen] to stack base page for using [PopScope]
          return MaterialPage(
            child: SplashScreen(key: state.pageKey),
          );
        },
        routes: [
          // Settings
          GoRoute(
            path: AppRoute.search.routePath,
            name: AppRoute.search.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: SearchScreen(key: state.pageKey),
            ),
          ),
          GoRoute(
            path: AppRoute.searchResults.routePath,
            name: AppRoute.searchResults.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: SearchResultsScreen(
                key: state.pageKey,
                keyword: state.uri.queryParameters['keyword']!,
              ),
            ),
          ),
          // Home
          GoRoute(
            path: AppRoute.home.routePath,
            name: AppRoute.home.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: HomeScreen(key: state.pageKey),
            ),
          ),
          // Following
          GoRoute(
            path: AppRoute.following.routePath,
            name: AppRoute.following.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: FollowingScreen(key: state.pageKey),
            ),
          ),
          // Category
          GoRoute(
            path: AppRoute.category.routePath,
            name: AppRoute.category.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: CategoryScreen(key: state.pageKey),
            ),
          ),
          GoRoute(
            path: AppRoute.categoryStreaming.routePath,
            name: AppRoute.categoryStreaming.routeName,
            pageBuilder: (context, state) {
              final fields = state.extra as Map<String, dynamic>;

              return NoTransitionPage(
                child: CategoryStreamingScreen(
                  key: state.pageKey,
                  category: fields['category'] as Category,
                  fromHome: fields['fromHome'] as bool,
                ),
              );
            },
          ),
          // Multiview
          GoRoute(
            path: AppRoute.multiView.routePath,
            name: AppRoute.multiView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: MultiViewScreen(key: state.pageKey),
            ),
          ),
          // Settings
          GoRoute(
            path: AppRoute.settings.routePath,
            name: AppRoute.settings.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: SettingsScreen(key: state.pageKey),
            ),
          ),
          // Login
          GoRoute(
            path: AppRoute.id.routePath,
            name: AppRoute.id.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: IdInputScreen(key: state.pageKey),
            ),
          ),
          GoRoute(
            path: AppRoute.password.routePath,
            name: AppRoute.password.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: PasswordInputScreen(
                key: state.pageKey,
                id: state.uri.queryParameters['id']!,
              ),
            ),
          ),
          // Vod
          GoRoute(
            path: AppRoute.vod.routePath,
            name: AppRoute.vod.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: VodScreen(
                key: state.pageKey,
                channelId: state.uri.queryParameters['channelId']!,
                channelName: state.uri.queryParameters['channelName']!,
              ),
            ),
          ),
          // live streaming
          GoRoute(
            path: AppRoute.liveStreaming.routePath,
            name: AppRoute.liveStreaming.routeName,
            pageBuilder: (context, state) {
              final liveDetail = state.extra as LiveDetail;

              return NoTransitionPage(
                child: LiveStreamingScreen(
                  key: state.pageKey,
                  liveDetail: liveDetail,
                ),
              );
            },
          ),
          // vod streaming
          GoRoute(
            path: AppRoute.vodStreaming.routePath,
            name: AppRoute.vodStreaming.routeName,
            pageBuilder: (context, state) {
              final extras = state.extra as Map<String, dynamic>;

              return NoTransitionPage(
                child: VodStreamingScreen(
                  key: state.pageKey,
                  vodPath: extras['vodPath'] as String,
                  vod: extras['vod'] as Vod,
                ),
              );
            },
          ),
          // multiview streaming
          GoRoute(
            path: AppRoute.multiViewStreaming.routePath,
            name: AppRoute.multiViewStreaming.routeName,
            pageBuilder: (context, state) {
              final liveDetails = state.extra as List<LiveDetail>;

              return NoTransitionPage(
                child: MultiViewStreamingScreen(
                  key: state.pageKey,
                  liveDetails: liveDetails,
                ),
              );
            },
          ),
          GoRoute(
            path: AppRoute.allLives.routePath,
            name: AppRoute.allLives.routeName,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: AllLivesScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),

          // NaverLogin With WebView
          GoRoute(
            path: AppRoute.naverLoginWithWebView.routePath,
            name: AppRoute.naverLoginWithWebView.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: NaverLoginWithWebViewScreen(key: state.pageKey),
            ),
          ),
          // License
          GoRoute(
            path: AppRoute.license.routePath,
            name: AppRoute.license.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: OpenSourceLicenseScreen(key: state.pageKey),
            ),
          ),
        ],
      ),
    ],
  );
}
