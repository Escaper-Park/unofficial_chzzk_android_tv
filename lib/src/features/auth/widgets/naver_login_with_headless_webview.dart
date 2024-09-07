import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/api.dart';
import '../../../common/widgets/header_text.dart';
import '../../../utils/router/app_router.dart';
import '../../../utils/virtual_keyboard/controller/virtual_keyboard_controller.dart';
import '../../../utils/virtual_keyboard/widgets/virtual_keyboard_input_field.dart';
import '../../../utils/virtual_keyboard/widgets/virtual_keyboard_layout.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../../user/controller/user_controller.dart';
import '../../user/model/user.dart';
import '../controller/auth_controller.dart';
import './naver_login_scripts.dart';
import './naver_login_with_webview.dart';

class NaverLoginWithHeadlessWebview extends StatefulHookConsumerWidget {
  const NaverLoginWithHeadlessWebview({super.key});

  @override
  ConsumerState<NaverLoginWithHeadlessWebview> createState() =>
      _NaverLoginWithHeadlessWebviewState();
}

class _NaverLoginWithHeadlessWebviewState
    extends ConsumerState<NaverLoginWithHeadlessWebview> {
  HeadlessInAppWebView? headlessWebView;
  late InAppWebViewController _controller;

  @override
  void initState() {
    super.initState();
    headlessWebView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(ApiUrl.naverLogin)),
      initialSettings: InAppWebViewSettings(
        useHybridComposition: false,
        javaScriptEnabled: true,
        javaScriptCanOpenWindowsAutomatically: true,
        thirdPartyCookiesEnabled: true,
        cacheEnabled: true,
        userAgent:
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
      ),
      onWebViewCreated: (controller) {
        _controller = controller;
      },
      onLoadStop: (controller, url) async {
        // Toggle keep login button
        await controller.evaluateJavascript(
            source: NaverLoginJavaScriptSource().toggleKeepLogin());

        if (url.toString() == "https://chzzk.naver.com/" ||
            url.toString() == "https://m.chzzk.naver.com/") {
          if (context.mounted) {
            // Check login state.
            await ref
                .read(authControllerProvider.notifier)
                .getAuthWithCookies();

            final User? user =
                await ref.read(userControllerProvider.notifier).fetchUser();

            ref.invalidate(authControllerProvider);
            ref.invalidate(userControllerProvider);

            // Change Screen
            if (mounted && user != null) {
              ref
                  .read(dashboardControllerProvider.notifier)
                  .changeScreen(context, AppRoute.home);
            }
          }
        }
      },
    );
  }

  @override
  void dispose() {
    headlessWebView?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    headlessWebView?.run();

    // Hide password at password input step.
    final isObscure = useState<bool>(false);
    final loginStep = useState<LoginStep>(LoginStep.id);
    final isActivateButton = useState<bool>(true);

    final String hintText = switch (loginStep.value) {
      LoginStep.id => '네이버 아이디를 입력해주세요',
      LoginStep.password => '비밀번호를 입력해주세요',
      LoginStep.captcha => '로그인 중...\n2단계 인증을 설정하셨다면 스마트폰 알림을 확인해주세요',
    };

    return Column(
      children: [
        Expanded(
          child: _inputFieldWithHeader(hintText, isObscure.value),
        ),
        SizedBox(
          height: 300.0,
          width: 500.0,
          child: Center(
            child: _keyboardLayout(loginStep, isObscure, isActivateButton),
          ),
        ),
      ],
    );
  }

  Widget _inputFieldWithHeader(String hintText, bool isObscure) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeaderText(text: hintText),
        VirtualKeyboardInputField(isObscure: isObscure),
      ],
    );
  }

  Widget _keyboardLayout(
    ValueNotifier<LoginStep> loginStep,
    ValueNotifier<bool> isObscure,
    ValueNotifier<bool> isActivateButton,
  ) {
    final NaverLoginJavaScriptSource script = NaverLoginJavaScriptSource();

    return VirtualKeyboardLayout(
      onEnterPressed: isActivateButton.value
          ? (input) async {
              if (input.isNotEmpty) {
                String source = '';

                switch (loginStep.value) {
                  case LoginStep.id:
                    source = script.inputId(input);
                    ref
                        .read(virtualKeyboardControllerProvider.notifier)
                        .reset();
                    loginStep.value = LoginStep.password;
                    isObscure.value = true;

                    await _controller.evaluateJavascript(source: source);
                    break;

                  case LoginStep.password:
                    isActivateButton.value = false;
                    // first password input
                    // password input
                    source = script.inputPassword(input);

                    await _controller.evaluateJavascript(source: source);
                    // click login button
                    source = script.clickLoginButton();
                    await _controller.evaluateJavascript(source: source);

                    loginStep.value = LoginStep.captcha;

                  case _:
                    break;
                }
              }
            }
          : (_) {},
    );
  }
}
