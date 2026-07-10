import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/tv/back/back.dart';
import '../../../../core/tv/keyboard/keyboard.dart';
import '../auth_screen_design.dart';
import '../bloc/auth_screen_bloc.dart';
import '../bloc/auth_session_bloc.dart';
import 'auth_keyboard_binding.dart';
import 'auth_web_view_coordinator.dart';
import 'auth_web_view_flow.dart';
import 'layout/auth_layout.dart';
import 'sections/form/auth_form_section.dart';
import 'sections/keyboard/auth_keyboard_overlay.dart';
import 'sections/webview/auth_web_view_section.dart';

part 'auth_screen_content.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthScreenBloc(),
      child: const _AuthScreenContent(),
    );
  }
}

class _AuthScreenContent extends HookWidget {
  const _AuthScreenContent();

  @override
  Widget build(BuildContext context) {
    final authScreenBloc = context.read<AuthScreenBloc>();
    final authSessionBloc = context.read<AuthSessionBloc>();
    final actionSectionNode = useFocusScopeNode(
      debugLabel: 'auth action section',
    );
    final inputSectionNode = useFocusScopeNode(
      debugLabel: 'auth input section',
    );
    final keyboardSectionNode = useFocusScopeNode(
      debugLabel: 'auth keyboard section',
    );
    final inputFocusNodes = AuthInputFocusNodes(
      naverId: useFocusNode(debugLabel: 'auth id input'),
      password: useFocusNode(debugLabel: 'auth password input'),
      captcha: useFocusNode(debugLabel: 'auth captcha input'),
    );
    final webViewController = useMemoized(
      WebViewController.new,
      const [],
    );
    final keyboardBinding = useMemoized(
      () => AuthKeyboardBinding(authScreenBloc)..sync(authScreenBloc.state),
      [authScreenBloc],
    );
    final webViewCoordinator = useMemoized(
      () => AuthWebViewCoordinator(
        webViewController,
        AuthWebViewFlow(
          captureSessionFromCookies: authSessionBloc.captureSessionFromCookies,
        ),
        authScreenBloc,
        () => context.mounted,
      ),
      [webViewController, authScreenBloc, authSessionBloc],
    );
    final lastReloadRequestId = useRef(0);
    final lastSubmitRequestId = useRef(0);
    final wasKeyboardOpen = useRef(authScreenBloc.state.isKeyboardOpen);
    final didNavigateHome = useRef(false);

    useEffect(
      () {
        unawaited(webViewCoordinator.configure());
        return null;
      },
      [webViewCoordinator],
    );
    useEffect(
      () => keyboardBinding.dispose,
      [keyboardBinding],
    );

    return BlocConsumer<AuthScreenBloc, AuthScreenState>(
      listenWhen: (previous, current) {
        return previous.reloadRequestId != current.reloadRequestId ||
            previous.submitRequestId != current.submitRequestId ||
            previous.isKeyboardOpen != current.isKeyboardOpen ||
            previous.activeInput != current.activeInput ||
            previous.activeValue != current.activeValue ||
            previous.isLoginCompleted != current.isLoginCompleted;
      },
      buildWhen: _shouldRebuildAuthScreen,
      listener: (context, state) {
        final didRequestReload =
            state.reloadRequestId != lastReloadRequestId.value;
        final didRequestSubmit =
            state.submitRequestId != lastSubmitRequestId.value;

        if (didRequestReload) {
          lastReloadRequestId.value = state.reloadRequestId;
          unawaited(webViewCoordinator.reloadLoginPage());
        }
        if (didRequestSubmit) {
          lastSubmitRequestId.value = state.submitRequestId;
          unawaited(webViewCoordinator.submitLogin(state));
        }
        if (state.isKeyboardOpen) {
          keyboardBinding.sync(state);
          wasKeyboardOpen.value = true;
        } else {
          keyboardBinding.closeKeyboard();
          if (wasKeyboardOpen.value &&
              !didRequestReload &&
              !didRequestSubmit &&
              !state.isLoginCompleted) {
            inputFocusNodes.forInput(state.activeInput).requestFocus();
          }
          wasKeyboardOpen.value = false;
        }
        if (state.isLoginCompleted && !didNavigateHome.value) {
          didNavigateHome.value = true;
          context.go(AppRoute.home.path);
        }
      },
      builder: (context, state) {
        final keyboardCubit = keyboardBinding.cubit;

        return TvScaffold(
          backController: TvBackController.navigate(
            onNavigate: () {
              if (state.isKeyboardOpen) {
                authScreenBloc.add(const AuthScreenEvent.keyboardClosed());
                inputFocusNodes.forInput(state.activeInput).requestFocus();
                return;
              }

              context.go(AppRoute.home.path);
            },
          ),
          body: _authScreenContent(
            state: state,
            inputFocusNodes: inputFocusNodes,
            actionSectionNode: actionSectionNode,
            inputSectionNode: inputSectionNode,
            keyboardSectionNode: keyboardSectionNode,
            webViewController: webViewController,
            keyboardCubit: keyboardCubit,
          ),
        );
      },
    );
  }
}

bool _shouldRebuildAuthScreen(
  AuthScreenState previous,
  AuthScreenState current,
) {
  return previous.copyWith(reloadRequestId: 0, submitRequestId: 0) !=
      current.copyWith(reloadRequestId: 0, submitRequestId: 0);
}
