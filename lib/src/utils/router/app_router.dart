import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/category/model/category.dart';
import '../../features/channel/model/channel.dart';
import '../../features/vod/model/vod.dart';
import './screen_index.dart';

export 'package:go_router/go_router.dart';

part 'app_router.g.dart';

enum AppRoute {
  splash('/splash', 'splash', 99),

  // Main sidebar
  search('search', 'search', 0),
  home('home', 'home', 1),
  following('following', 'following', 2),
  category('category', 'category', 3),
  settings('settings', 'settings', 4),
  user('user', 'user', 5),
  auth('auth', 'auth', 6),

  // Home Headers
  allLives('allLives', 'allLives', 7),
  allVods('allVods', 'allVods', 8),
  popularClip('popularClip', 'popularClip', 9),

  // Channel vod
  channelVods('channelVods', 'channelVods', 10),

  // Live Streaming
  liveStreaming('liveStreaming', 'liveStreaming', 11),

  // Vod Streaming
  vodStreaming('vodStreaming', 'vodStreaming', 12),

  // Search results
  searchResults('searchResults', 'searchResults', 13),

  // Category details
  categoryDetail('categoryDetail', 'categoryDetail', 14),

  // Clip
  clip('clip', 'clip', 15),

  // webview
  webviewLogin('webviewLogin', 'webviewLogin', 16);

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
      // Splash
      GoRoute(
        path: AppRoute.splash.routePath,
        name: AppRoute.splash.routeName,
        pageBuilder: (context, state) {
          // Stacking base page for using [PopScope]
          return MaterialPage(
            child: SplashScreen(key: state.pageKey),
          );
        },
        routes: <GoRoute>[
          // Search: 0
          GoRoute(
            path: AppRoute.search.routePath,
            name: AppRoute.search.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: SearchScreen(key: state.pageKey),
            ),
          ),
          // Home: 1
          GoRoute(
            path: AppRoute.home.routePath,
            name: AppRoute.home.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: HomeScreen(key: state.pageKey),
            ),
          ),
          // Following: 2
          GoRoute(
            path: AppRoute.following.routePath,
            name: AppRoute.following.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: FollowingScreen(key: state.pageKey),
            ),
          ),
          // Category: 3
          GoRoute(
            path: AppRoute.category.routePath,
            name: AppRoute.category.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: CategoryScreen(key: state.pageKey),
            ),
          ),
          // Settings: 4
          GoRoute(
            path: AppRoute.settings.routePath,
            name: AppRoute.settings.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: SettingsScreen(key: state.pageKey),
            ),
          ),
          // User: 5
          GoRoute(
            path: AppRoute.user.routePath,
            name: AppRoute.user.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: UserScreen(key: state.pageKey),
            ),
          ),
          // Auth: 6
          GoRoute(
            path: AppRoute.auth.routePath,
            name: AppRoute.auth.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: AuthScreen(key: state.pageKey),
            ),
          ),
          // All Lives: 7
          GoRoute(
            path: AppRoute.allLives.routePath,
            name: AppRoute.allLives.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: AllLivesScreen(key: state.pageKey),
            ),
          ),
          // All Vods: 8
          GoRoute(
            path: AppRoute.allVods.routePath,
            name: AppRoute.allVods.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: AllVodsScreen(key: state.pageKey),
            ),
          ),
          // Popular Clips: 9
          GoRoute(
            path: AppRoute.popularClip.routePath,
            name: AppRoute.popularClip.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: PopularClipScreen(key: state.pageKey),
            ),
          ),
          // Channel Vods: 10
          GoRoute(
            path: AppRoute.channelVods.routePath,
            name: AppRoute.channelVods.routeName,
            pageBuilder: (context, state) {
              final fields = state.extra as Map<String, dynamic>;

              return NoTransitionPage(
                child: ChannelVodsScreen(
                  key: state.pageKey,
                  channel: fields['channel'] as Channel,
                ),
              );
            },
          ),
          // Live Streaming: 11
          GoRoute(
            path: AppRoute.liveStreaming.routePath,
            name: AppRoute.liveStreaming.routeName,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: LiveStreamingScreen(key: state.pageKey),
              );
            },
          ),
          // Vod Streaming: 12
          GoRoute(
            path: AppRoute.vodStreaming.routePath,
            name: AppRoute.vodStreaming.routeName,
            pageBuilder: (context, state) {
              final fields = state.extra as Map<String, dynamic>;

              return NoTransitionPage(
                child: VodStreamingScreen(
                  key: state.pageKey,
                  vodPath: fields['vodPath'] as dynamic,
                  vod: fields['vod'] as Vod,
                ),
              );
            },
          ),
          // Search Results: 13
          GoRoute(
            path: AppRoute.searchResults.routePath,
            name: AppRoute.searchResults.routeName,
            pageBuilder: (context, state) {
              final fields = state.extra as Map<String, dynamic>;

              return NoTransitionPage(
                child: SearchResultScreen(
                  key: state.pageKey,
                  keyword: fields['keyword'] as String,
                ),
              );
            },
          ),
          // Category details: 14
          GoRoute(
            path: AppRoute.categoryDetail.routePath,
            name: AppRoute.categoryDetail.routeName,
            pageBuilder: (context, state) {
              final fields = state.extra as Map<String, dynamic>;

              return NoTransitionPage(
                child: CategoryDetailScreen(
                  key: state.pageKey,
                  category: fields['category'] as Category,
                ),
              );
            },
          ),
          // Clip : 15
          GoRoute(
            path: AppRoute.clip.routePath,
            name: AppRoute.clip.routeName,
            pageBuilder: (context, state) {
              final fields = state.extra as Map<String, dynamic>;

              return NoTransitionPage(
                child: ClipScreen(
                  key: state.pageKey,
                  url: fields['url'] as String,
                ),
              );
            },
          ),
          // WebviewLogin: 16
          GoRoute(
            path: AppRoute.webviewLogin.routePath,
            name: AppRoute.webviewLogin.routeName,
            pageBuilder: (context, state) => NoTransitionPage(
              child: WebviewLoginScreen(key: state.pageKey),
            ),
          ),
        ],
      ),
    ],
  );
}
