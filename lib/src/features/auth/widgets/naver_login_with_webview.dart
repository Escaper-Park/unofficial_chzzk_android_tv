import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../common/constants/api.dart';
import '../../../common/constants/dimensions.dart';
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

enum LoginStep {
  id,
  password,
  captcha,
}

class NaverLoginWithWebview extends StatefulHookConsumerWidget {
  const NaverLoginWithWebview({super.key});

  @override
  ConsumerState<NaverLoginWithWebview> createState() =>
      _NaverLoginWithWebviewState();
}

class _NaverLoginWithWebviewState extends ConsumerState<NaverLoginWithWebview> {
  InAppWebViewController? _controller;
  late InAppWebViewSettings settings;

  @override
  void initState() {
    super.initState();

    settings = InAppWebViewSettings(
      useHybridComposition: true,
      javaScriptEnabled: true,
      javaScriptCanOpenWindowsAutomatically: true,
      thirdPartyCookiesEnabled: true,
      cacheEnabled: true,
      userAgent:
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Hide password at password input step.
    final isObscure = useState<bool>(false);
    final loginStep = useState<LoginStep>(LoginStep.id);
    final webViewKey = useMemoized(GlobalKey.new, const []);

    // Password input count
    // 0: first input.
    // 1: second input before input captcha
    final passwordInputCount = useState<int>(0);

    // Change hint text depending on the login step.
    final String hintText = switch (loginStep.value) {
      LoginStep.id => '네이버 아이디를 입력해주세요',
      LoginStep.password => '비밀번호를 입력해주세요',
      LoginStep.captcha => 'CAPTCHA 정답을 입력해주세요',
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Input
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: _inputFieldWithHeader(hintText, isObscure.value),
              ),
              _keyboardLayout(loginStep, isObscure, passwordInputCount),
            ],
          ),
        ),
        // WebView
        SizedBox(
          width: Dimensions.naverLoginWebViewWidth,
          child: _inAppWebView(context, webViewKey),
        )
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

  Widget _inAppWebView(BuildContext context, GlobalKey webViewKey) {
    return InAppWebView(
      key: webViewKey,
      initialSettings: settings,
      initialUrlRequest: URLRequest(url: WebUri(ApiUrl.naverLogin)),
      onWebViewCreated: (controller) {
        _controller = controller;
      },
      onLoadStop: (controller, url) async {
        // Scroll to top
        await _controller!.scrollTo(x: 0, y: 0);

        // Toggle keep login button
        await _controller!.evaluateJavascript(
            source: NaverLoginJavaScriptSource().toggleKeepLogin());

        // Check login state.
        await ref.read(authControllerProvider.notifier).getAuthWithCookies();

        final User? user =
            await ref.read(userControllerProvider.notifier).fetchUser();

        ref.invalidate(authControllerProvider);
        ref.invalidate(userControllerProvider);

        // Change Screen
        if (context.mounted && user != null) {
          ref
              .read(dashboardControllerProvider.notifier)
              .changeScreen(context, AppRoute.home);
        }
      },
    );
  }

  Widget _keyboardLayout(
    ValueNotifier<LoginStep> loginStep,
    ValueNotifier<bool> isObscure,
    ValueNotifier<int> passwordInputCount,
  ) {
    final NaverLoginJavaScriptSource script = NaverLoginJavaScriptSource();

    return VirtualKeyboardLayout(
      onEnterPressed: (input) async {
        if (input.isNotEmpty && _controller != null) {
          String source = '';

          switch (loginStep.value) {
            case LoginStep.id:
              source = script.inputId(input);
              ref.read(virtualKeyboardControllerProvider.notifier).reset();
              loginStep.value = LoginStep.password;
              isObscure.value = true;

              await _controller!.evaluateJavascript(source: source);
              break;

            case LoginStep.password:
              // first password input
              if (passwordInputCount.value == 0) {
                // password input
                source = script.inputPassword(input);
                await _controller!.evaluateJavascript(source: source);
                // click login button
                source = script.clickLoginButton();
                await _controller!.evaluateJavascript(source: source);

                loginStep.value = LoginStep.password;
                isObscure.value = true;
                passwordInputCount.value += 1;
              }
              // second password input for preparing captcha
              else if (passwordInputCount.value == 1) {
                // password input and focus captcha
                source = script.inputPasswordAndFocusCaptcha(input);
                await _controller!.evaluateJavascript(source: source);
                ref.read(virtualKeyboardControllerProvider.notifier).reset();
                loginStep.value = LoginStep.captcha;
                isObscure.value = false;
              }
              break;
            case LoginStep.captcha:
              // captcha input
              source = script.inputCaptcha(input);
              await _controller!.evaluateJavascript(source: source);
              // click login button
              source = script.clickLoginButton();
              await _controller!.evaluateJavascript(source: source);
              break;
          }
        }
      },
    );
  }
}
