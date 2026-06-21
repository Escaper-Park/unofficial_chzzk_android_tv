import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../core/tv/back/back.dart';
import '../../core/tv/focus/focus.dart';
import '../../core/ui/ui.dart';
import '../../features/auth/presentation/bloc/auth_session_bloc.dart';
import '../../features/player_shared/presentation/overlay_controls/overlay_controls.dart';
import '../../features/user/domain/repositories/user_repository.dart';
import '../bloc/app_shell_user_cubit.dart';
import '../router/app_routes.dart';
import 'app_shell_design.dart';
import 'app_shell_focus_scope.dart';
import 'app_shell_navigation_backdrop.dart';
import 'app_shell_string.dart';
import 'widgets/app_shell_top_navigation.dart';

part 'app_shell_slots.dart';
part 'app_shell_view_stack.dart';

class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.selectedRoute,
    required this.child,
    this.onExit,
  });

  final AppRoute selectedRoute;
  final Widget child;
  final VoidCallback? onExit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = AppShellUserCubit(
          authSessionBloc: context.read<AuthSessionBloc>(),
          userRepository: context.read<UserRepository>(),
        );
        unawaited(cubit.refresh());
        return cubit;
      },
      child: _AppShellUserRefreshListener(
        child: _AppShellView(
          selectedRoute: selectedRoute,
          onExit: onExit,
          child: child,
        ),
      ),
    );
  }
}

class _AppShellUserRefreshListener extends StatelessWidget {
  const _AppShellUserRefreshListener({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthSessionBloc, AuthSessionState>(
      listenWhen: (previous, current) {
        return previous.cookieHeader != current.cookieHeader;
      },
      listener: (context, state) {
        unawaited(context.read<AppShellUserCubit>().refresh());
      },
      child: child,
    );
  }
}

class _AppShellView extends HookWidget {
  const _AppShellView({
    required this.selectedRoute,
    required this.child,
    this.onExit,
  });

  final AppRoute selectedRoute;
  final Widget child;
  final VoidCallback? onExit;

  @override
  Widget build(BuildContext context) {
    final navigationNode = useFocusScopeNode(
      debugLabel: 'app shell navigation',
    );
    final contentNode = useFocusScopeNode(debugLabel: 'app shell content');
    final homeRefreshSerial = useState(0);
    final translucentNavigationBackdrop = useState(false);
    final exitNoticeController = useMemoized(
      () => TvTimedVisibilityController(
        displayDuration: AppShellDesign.exitNoticeDuration,
      ),
      const [],
    );
    useListenable(exitNoticeController);
    final logoutDialogOpen = useRef(false);

    Future<void> requestLogoutDialog() async {
      if (logoutDialogOpen.value) {
        return;
      }

      exitNoticeController.hide();
      logoutDialogOpen.value = true;

      try {
        final result = await showTvDialog(
          context: context,
          type: TvDialogType.alert,
          backgroundType: TvDialogBackgroundType.fullScreen,
          title: AppShellString.logoutTitle,
          content: AppShellString.logoutContent,
          secondaryLabel: AppShellString.logoutCancelLabel,
          primaryLabel: AppShellString.logoutPrimaryLabel,
        );

        if (!context.mounted) {
          return;
        }

        navigationNode.requestFocus();
        if (result != TvDialogResult.primary) {
          return;
        }

        await context.read<AppShellUserCubit>().logout();
        if (!context.mounted) {
          return;
        }

        context.go(AppRoute.home.path);
        navigationNode.requestFocus();
      } finally {
        logoutDialogOpen.value = false;
      }
    }

    void exit() {
      exitNoticeController.hide();

      final onExit = this.onExit;
      if (onExit != null) {
        onExit();
        return;
      }

      unawaited(SystemNavigator.pop());
    }

    final doubleBackExitController = useMemoized(
      () => TvBackController.doubleBackExit(
        window: AppShellDesign.exitNoticeDuration,
        onFirstBack: exitNoticeController.show,
        onExit: exit,
      ),
      [exitNoticeController, onExit],
    );
    final backController = TvBackController(
      onBack: () {
        if (navigationNode.hasFocus) {
          doubleBackExitController.handleBack();
          return;
        }

        navigationNode.requestFocus();
      },
    );

    useEffect(() {
      return () {
        doubleBackExitController.dispose();
        exitNoticeController.dispose();
      };
    }, [doubleBackExitController, exitNoticeController]);

    final extendsBehindNavigation = selectedRoute == AppRoute.home;

    useEffect(() {
      translucentNavigationBackdrop.value = false;
      return null;
    }, [extendsBehindNavigation]);

    return TvScaffold(
      backController: backController,
      body: AppShellFocusScope(
        navigationNode: navigationNode,
        contentNode: contentNode,
        homeRefreshListenable: homeRefreshSerial,
        child: _AppShellViewStack(
          selectedRoute: selectedRoute,
          contentNode: contentNode,
          navigationNode: navigationNode,
          extendsBehindNavigation: extendsBehindNavigation,
          translucentNavigationBackdrop: translucentNavigationBackdrop.value,
          showExitNotice: exitNoticeController.isShowing,
          onNavigationBackdropChanged: (translucent) {
            translucentNavigationBackdrop.value = translucent;
          },
          onHomeReselected: () {
            homeRefreshSerial.value += 1;
          },
          onLogoutRequested: () => unawaited(requestLogoutDialog()),
          child: child,
        ),
      ),
    );
  }
}
