import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './controller/auth_controller.dart';
import './widgets/naver_login_scripts.dart';
import '../user/controller/user_controller.dart';
import '../../common/constants/enums.dart';
import '../../utils/extensions/custom_extensions.dart';
import '../../utils/virtual_keyboard/controller/virtual_keyboard_controller.dart';

mixin class AuthEvent {
  void authControllerInvalidate(WidgetRef ref) {
    ref.invalidate(authControllerProvider);
  }

  void userControllerInvalidate(WidgetRef ref) {
    ref.invalidate(userControllerProvider);
  }

  Future<void> checkLoginStateAndGoToHomeScreen(
    WidgetRef ref, {
    required BuildContext context,
    required InAppWebViewController controller,
    required LoginStep loginStep,
  }) async {
    if (loginStep == LoginStep.passwordAgain ||
        loginStep == LoginStep.captcha) {
      final currentPath = await controller.getUrl();
      final curretPathStr = currentPath.toString();

      if (curretPathStr == "https://chzzk.naver.com/" ||
          curretPathStr == "https://m.chzzk.naver.com") {
        authControllerInvalidate(ref);
        userControllerInvalidate(ref);

        if (context.mounted) {
          context.goTo(
            context: context,
            currentLocation: AppRoute.auth,
            appRoute: AppRoute.home,
          );
        }
      }
    }
  }

  Future<void> onKeyboardEnterPressed(
    WidgetRef ref, {
    required InAppWebViewController? controller,
    required String inputText,
  }) async {
    final step = ref.read(loginStepControllerProvider);

    if (inputText.isNotEmpty && controller != null) {
      switch (step) {
        case LoginStep.id:
          // input id
          await _runJS(controller, NaverLoginSource.inputId(inputText));
          // reset input
          _resetInput(ref);
          // change step
          _changeStep(ref, LoginStep.password);
          break;

        case LoginStep.password:
          // input password
          await _runJS(controller, NaverLoginSource.inputPassword(inputText));
          // click login
          await _runJS(controller, NaverLoginSource.clickLoginButton);
          // change step (without reset)
          _changeStep(ref, LoginStep.passwordAgain);
          // try sign in
          await _trySignIn(ref);
          break;

        case LoginStep.passwordAgain:
          // input password again
          await _runJS(controller, NaverLoginSource.inputPassword(inputText));
          // reset input
          _resetInput(ref);
          // change step (without reset)
          _changeStep(ref, LoginStep.captcha);
          // Focus to CAPTCHA
          await _runJS(controller, NaverLoginSource.scrollToCaptcha);
          break;

        case LoginStep.captcha:
          // input captcha answer
          await _runJS(controller, NaverLoginSource.inputCaptcha(inputText));
          // click login
          await _runJS(controller, NaverLoginSource.clickLoginButton);
          // try sign in
          await _trySignIn(ref);
          break;
      }
    }
  }

  Future<void> toggleKeepLogin(InAppWebViewController controller) async {
    await _runJS(controller, NaverLoginSource.toggleKeepLogin);
  }

  Future<void> toggleIpSecureSwitch(InAppWebViewController controller) async {
    await _runJS(controller, NaverLoginSource.toggleIpSecureSwitch);
  }

  Future<void> _runJS(InAppWebViewController controller, String source) async {
    await controller.evaluateJavascript(source: source);
  }

  void _resetInput(WidgetRef ref) {
    ref
        .read(
          virtualKeyboardControllerProvider(routeName: AppRoute.auth.routeName)
              .notifier,
        )
        .reset();
  }

  void _changeStep(WidgetRef ref, LoginStep step) {
    ref.read(loginStepControllerProvider.notifier).update(step);
  }

  Future<void> _trySignIn(WidgetRef ref) async {
    await ref.read(authControllerProvider.notifier).signIn();
    await ref.read(userControllerProvider.notifier).signIn();
  }
}
