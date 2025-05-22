import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../common/constants/enums.dart' show AppRoute;

import '../../features/category/controller/category_controller.dart';
import '../../features/category/model/category.dart';

import '../../features/following/controller/following_category_controller.dart';
import 'screen_index.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

GoRoute _goRoute(AppRoute appRoute, Widget child) {
  return GoRoute(
    path: appRoute.routePath,
    name: appRoute.routeName,
    pageBuilder: (context, state) {
      return NoTransitionPage(
        key: state.pageKey,
        child: child,
      );
    },
  );
}

GoRoute _goRouteWithExtras(
  AppRoute appRoute,
  Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
) {
  return GoRoute(
    path: appRoute.routePath,
    name: appRoute.routeName,
    pageBuilder: pageBuilder,
  );
}

GoRoute _goRouteWithPathParameters(
  AppRoute appRoute,
  String idName,
  Page<dynamic> Function(BuildContext context, GoRouterState state)?
      pageBuilder,
) {
  return GoRoute(
    path: '${appRoute.routePath}/:$idName',
    name: appRoute.routeName,
    pageBuilder: pageBuilder,
  );
}

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/home',
    routes: [
      // Search: 0
      _goRouteWithExtras(
        AppRoute.search,
        (context, state) {
          final fields = state.extra as Map<String, dynamic>;
          final fromHome = fields['fromHome'] as bool? ;

          return NoTransitionPage(
            child: SearchScreen(
              fromHome: fromHome ?? false,
            ),
          );
        },
      ),
      // Dashboard
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return DashboardScreen(state: state, child: child);
        },
        routes: [
          // Home: 1
          _goRoute(AppRoute.home, HomeScreen()),
          // Following: 2
          _goRoute(AppRoute.following, FollowingScreen()),
          // Category: 3
          _goRoute(AppRoute.category, CategoryScreen()),
          // Settings: 4
          _goRoute(AppRoute.settings, SettingsScreen()),
        ],
      ),
      // Auth
      _goRoute(AppRoute.auth, AuthScreen()),
      // Live All
      _goRoute(AppRoute.liveAll, LiveAllScreen()),
      // Vod All
      _goRoute(AppRoute.vodAll, VodAllScreen()),
      // popular clips
      _goRoute(AppRoute.popularClips, ClipPopularScreen()),

      // search tags
      _goRoute(AppRoute.searchTag, SearchTagScreen()),
      // Search Tag result
      _goRouteWithPathParameters(
        AppRoute.searchTagResult,
        'keyword',
        (context, state) {
          final String keyword = state.pathParameters['keyword'] as String;

          return NoTransitionPage(
            child: SearchTagResultScreen(tag: keyword),
          );
        },
      ),
      // Search result
      _goRouteWithPathParameters(
        AppRoute.searchResult,
        'keyword',
        (context, state) {
          final String keyword = state.pathParameters['keyword'] as String;

          return NoTransitionPage(child: SearchResultScreen(keyword: keyword));
        },
      ),
      // search result channel
      _goRouteWithPathParameters(
        AppRoute.searchResultChannel,
        'channelId',
        (context, state) {
          final String channelId = state.pathParameters['channelId'] as String;

          return NoTransitionPage(
            child: SearchResultChannelScreen(channelId: channelId),
          );
        },
      ),
      // Channel vod
      _goRouteWithPathParameters(
        AppRoute.channelVod,
        'channelId',
        (context, state) {
          final String channelId = state.pathParameters['channelId'] as String;
          final fields = state.extra as Map<String, dynamic>;
          final channelName = fields['channelName'] as String;

          return NoTransitionPage(
            child: ChannelVodScreen(
              key: state.pageKey,
              channelId: channelId,
              channelName: channelName,
            ),
          );
        },
      ),
      // channel Clip
      _goRouteWithPathParameters(
        AppRoute.channelClip,
        'channelId',
        (context, state) {
          final String channelId = state.pathParameters['channelId'] as String;
          final fields = state.extra as Map<String, dynamic>;
          final channelName = fields['channelName'] as String;

          return NoTransitionPage(
            child: ChannelClipScreen(
              key: state.pageKey,
              channelId: channelId,
              channelName: channelName,
            ),
          );
        },
      ),
      // CategoryDetail
      _goRouteWithPathParameters(
        AppRoute.categoryDetail,
        'categoryId',
        (context, state) {
          final fields = state.extra as Map<String, dynamic>;
          final baseRoute = fields['baseRoute'] as String;

          final String categoryId =
              state.pathParameters['categoryId'] as String;

          final Category category = switch (baseRoute) {
            'home' => ref
                .read(followingCategoryControllerProvider.notifier)
                .findById(categoryId),
            'category' => ref
                .read(categoryControllerProvider.notifier)
                .findById(categoryId),
            _ => ref
                .read(followingCategoryControllerProvider.notifier)
                .findById(categoryId),
          };

          return NoTransitionPage(
            child: CategoryDetailScreen(
              key: state.pageKey,
              category: category,
            ),
          );
        },
      ),
      // group generate
      _goRoute(AppRoute.group, GroupScreen()),
      _goRoute(AppRoute.groupGenerate, GroupGenerateScreen()),
      // clip player
      _goRouteWithExtras(
        AppRoute.clipPlayer,
        (context, state) {
          final fields = state.extra as Map<String, dynamic>;
          final clipEmbedUrl = fields['clipEmbedUrl'] as String;

          return NoTransitionPage(
            child: ClipPlayerScreen(clipEmbedUrl: clipEmbedUrl),
          );
        },
      ),
      // live streaming
      _goRouteWithExtras(
        AppRoute.liveStream,
        (context, state) {
          final fields = state.extra as Map<String, dynamic>;
          final fromHome = fields['fromHome'] as bool? ;

          return NoTransitionPage(
            child: LiveStreamScreen(
              fromHome: fromHome ?? false,
            ),
          );
        },
      ),
      // vod streaming
      _goRoute(AppRoute.vodStream, VodStreamScreen()),
    ],
  );
}
