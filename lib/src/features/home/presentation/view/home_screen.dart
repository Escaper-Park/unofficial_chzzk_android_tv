import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/shell/shell.dart';
import '../../../auth/presentation/bloc/auth_session_bloc.dart';
import '../../../browse/presentation/browse_route_query.dart';
import '../../../category/domain/entities/category_item.dart';
import '../../../category/domain/repositories/category_repository.dart';
import '../../../following/domain/repositories/following_repository.dart';
import '../../../live/domain/entities/live_feed.dart';
import '../../../live/domain/repositories/live_repository.dart';
import '../../../live/presentation/live_player_entry_flow.dart';
import '../../../settings/domain/repositories/settings_preferences_repository.dart';
import '../../../vod/domain/entities/vod_feed.dart';
import '../../../vod/domain/repositories/vod_repository.dart';
import '../../../vod/presentation/vod_player_entry_flow.dart';
import '../../../watching_history/domain/repositories/watching_history_repository.dart';
import '../../domain/repositories/home_repository.dart';
import '../bloc/home_bloc.dart';
import 'layout/login_home.dart';
import 'layout/non_login_home.dart';
import 'shared/home_focus_registry.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSignedIn = context.read<AuthSessionBloc>().state.hasRequiredCookies;

    return BlocProvider(
      create: (context) => HomeBloc(
        homeRepository: context.read<HomeRepository>(),
        liveRepository: context.read<LiveRepository>(),
        followingRepository: context.read<FollowingRepository>(),
        vodRepository: context.read<VodRepository>(),
        watchingHistoryRepository: context.read<WatchingHistoryRepository>(),
        categoryRepository: context.read<CategoryRepository>(),
        settingsPreferencesRepository: context
            .read<SettingsPreferencesRepository>(),
      )..add(HomeEvent.started(isSignedIn: isSignedIn)),
      child: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends HookWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    final focusRegistry = useMemoized(HomeFocusRegistry.new);
    final scrollController = useScrollController();
    final fallbackHomeRefreshListenable = useState(0);
    final homeRefreshListenable =
        AppShellFocusScope.maybeHomeRefreshListenableOf(context) ??
        fallbackHomeRefreshListenable;
    final homeRefreshSerial = useListenable(homeRefreshListenable).value;
    final handledHomeRefreshSerial = useRef(homeRefreshSerial);

    useEffect(() => focusRegistry.dispose, [focusRegistry]);
    useEffect(() {
      if (handledHomeRefreshSerial.value != homeRefreshSerial) {
        handledHomeRefreshSerial.value = homeRefreshSerial;
        _refreshFromAuthState(context);
      }

      return null;
    }, [homeRefreshSerial]);

    return BlocListener<AuthSessionBloc, AuthSessionState>(
      listenWhen: (previous, current) {
        return previous.hasRequiredCookies != current.hasRequiredCookies;
      },
      listener: (context, state) {
        _refresh(context, isSignedIn: state.hasRequiredCookies);
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return switch (state.variant) {
            HomeVariant.login => LoginHome(
              state: state,
              focusRegistry: focusRegistry,
              scrollController: scrollController,
              onRetry: () => _refreshFromAuthState(context),
              onLivePressed: (item) {
                unawaited(_openLivePlayer(context, item, scrollController));
              },
              onVodPressed: (item) {
                unawaited(_openVodPlayer(context, item, scrollController));
              },
              onCategoryPressed: (item) => _openCategory(context, item),
              onSectionMorePressed: (sectionId) =>
                  _openSectionMore(context, sectionId),
            ),
            HomeVariant.nonLogin => NonLoginHome(
              state: state,
              focusRegistry: focusRegistry,
              scrollController: scrollController,
              onRetry: () => _refreshFromAuthState(context),
              onLivePressed: (item) {
                unawaited(_openLivePlayer(context, item, scrollController));
              },
              onVodPressed: (item) {
                unawaited(_openVodPlayer(context, item, scrollController));
              },
              onCategoryPressed: (item) => _openCategory(context, item),
              onSectionMorePressed: (sectionId) =>
                  _openSectionMore(context, sectionId),
            ),
          };
        },
      ),
    );
  }

  void _refreshFromAuthState(BuildContext context) {
    _refresh(
      context,
      isSignedIn: context.read<AuthSessionBloc>().state.hasRequiredCookies,
    );
  }

  void _refresh(BuildContext context, {required bool isSignedIn}) {
    context.read<HomeBloc>().add(
      HomeEvent.refreshRequested(isSignedIn: isSignedIn),
    );
  }

  Future<void> _openLivePlayer(
    BuildContext context,
    Live item,
    ScrollController scrollController,
  ) {
    final returnScrollOffset = _currentScrollOffset(scrollController);

    return openLivePlayerFromCard(
      context,
      item,
      onPlayerClosed: () {
        _restoreScrollOffset(scrollController, returnScrollOffset);
        _refreshFromAuthState(context);
      },
    );
  }

  Future<void> _openVodPlayer(
    BuildContext context,
    Vod item,
    ScrollController scrollController,
  ) {
    final returnScrollOffset = _currentScrollOffset(scrollController);

    return openVodPlayerFromCard(
      context,
      item,
      onPlayerClosed: () {
        _restoreScrollOffset(scrollController, returnScrollOffset);
        _refreshFromAuthState(context);
      },
    );
  }

  double _currentScrollOffset(ScrollController scrollController) {
    if (!scrollController.hasClients) {
      return 0;
    }

    return scrollController.offset;
  }

  void _restoreScrollOffset(
    ScrollController scrollController,
    double offset,
  ) {
    if (!scrollController.hasClients) {
      return;
    }

    final position = scrollController.position;
    final safeOffset = offset
        .clamp(
          position.minScrollExtent,
          position.maxScrollExtent,
        )
        .toDouble();
    scrollController.jumpTo(safeOffset);
  }

  void _openCategory(BuildContext context, CategoryItem item) {
    unawaited(
      context.pushNamed(
        AppRoute.categoryDetail.name,
        pathParameters: {
          'categoryType': item.categoryType,
          'categoryId': item.categoryId,
        },
      ),
    );
  }

  void _openSectionMore(BuildContext context, HomeSectionId sectionId) {
    context.go(_sectionMoreLocation(sectionId));
  }

  String _sectionMoreLocation(HomeSectionId sectionId) {
    return switch (sectionId) {
      HomeSectionId.followingLive => AppRoute.following.path,
      HomeSectionId.popularLive => _browseLocation(
        BrowseRouteQuery.popularLive(),
      ),
      HomeSectionId.watchingHistory => _browseLocation(
        BrowseRouteQuery.watchingHistory(),
      ),
      HomeSectionId.popularVod => _browseLocation(
        BrowseRouteQuery.popularVod(),
      ),
      HomeSectionId.followingCategory ||
      HomeSectionId.trendingCategory => AppRoute.category.path,
      HomeSectionId.immersive => AppRoute.home.path,
    };
  }

  String _browseLocation(Map<String, String> queryParameters) {
    return Uri(
      path: AppRoute.browse.path,
      queryParameters: queryParameters,
    ).toString();
  }
}
