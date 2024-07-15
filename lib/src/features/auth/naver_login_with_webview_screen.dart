import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/api.dart';
import '../../common/widgets/base_scaffold.dart';
import '../../utils/router/app_router.dart';
import '../../utils/virtual_keyboard/controller/virtual_keyboard_input_controller.dart';
import '../../utils/virtual_keyboard/virtual_keyboard_input_display.dart';
import '../../utils/virtual_keyboard/virtual_keyboard_layout.dart';
import '../dashboard/controller/dashboard_controller.dart';
import './controller/auth_controller.dart';

enum LoginStep {
  id,
  password,
  captcha,
}

class NaverLoginWithWebViewScreen extends StatefulHookConsumerWidget {
  const NaverLoginWithWebViewScreen({super.key});

  @override
  ConsumerState<NaverLoginWithWebViewScreen> createState() =>
      _NaverLoginDpadWebViewState();
}

class _NaverLoginDpadWebViewState
    extends ConsumerState<NaverLoginWithWebViewScreen> {
  InAppWebViewController? _controller;
  InAppWebViewSettings settings = InAppWebViewSettings(
    useHybridComposition: true,
    javaScriptEnabled: true,
    javaScriptCanOpenWindowsAutomatically: true,
    thirdPartyCookiesEnabled: true,
    cacheEnabled: true,
    userAgent:
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
  );

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final webViewKey = useMemoized(GlobalKey.new, const []);
    final loginStep = useState<LoginStep>(LoginStep.id);
    final isObscure = useState<bool>(false);
    final passwordStepCount = useState<int>(0);

    final hintText = switch (loginStep.value) {
      LoginStep.id => '아이디를 입력해주세요',
      LoginStep.password => '비밀번호를 입력해주세요',
      LoginStep.captcha => 'CAPTCHA 정답을 입력해주세요',
    };

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        ref.invalidate(authControllerProvider);

        ref
            .read(dashboardControllerProvider.notifier)
            .changeScreen(context, AppRoute.home);
      },
      child: BaseScaffold(
        verticalPadding: 0.0,
        horizontalPadding: 0.0,
        useTextField: true,
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 100.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.0,
                      child: VirtualKeyboardInputDisplay(
                        headerText: hintText,
                        isObscure: isObscure.value,
                      ),
                    ),
                    Expanded(
                      child: VirtualKeyboardLayout(
                        onEnterPressed: (inputString) async {
                          String script = """ """;

                          if (inputString.isNotEmpty) {
                            switch (loginStep.value) {
                              // ID
                              case LoginStep.id:
                                script = """
      var idField = document.getElementById('id');
      if (idField.value === '') {
      idField.value = '$inputString';
      }
      """;
                                loginStep.value = LoginStep.password;
                                isObscure.value = true;
                                ref
                                    .read(virtualKeyboardInputControllerProvider
                                        .notifier)
                                    .reset();

                                if (_controller != null) {
                                  await _controller!
                                      .evaluateJavascript(source: script);
                                }
                                break;
                              case LoginStep.password:
                                if (passwordStepCount.value == 0) {
                                  script = """
      var passwordField = document.getElementById('pw');
      if (passwordField.value === ''){
      passwordField.value = '$inputString';
      }
      """;

                                  if (_controller != null) {
                                    await _controller!
                                        .evaluateJavascript(source: script);
                                  }

                                  script = """
document.querySelector('[id="log.login"]').click();
""";

                                  await Future.delayed(
                                    const Duration(seconds: 1),
                                    () {
                                      _controller!
                                          .evaluateJavascript(source: script);
                                    },
                                  );
                                  loginStep.value = LoginStep.password;
                                  isObscure.value = true;
                                  passwordStepCount.value += 1;
                                } else {
                                  script = """
      var passwordField = document.getElementById('pw');
      if (passwordField.value === ''){
      passwordField.value = '$inputString';
      }
      var captchaField = document.getElementById('captcha');
      captchaField.focus();
      """;
                                  loginStep.value = LoginStep.captcha;
                                  isObscure.value = false;
                                  ref
                                      .read(
                                          virtualKeyboardInputControllerProvider
                                              .notifier)
                                      .reset();
                                }

                                if (_controller != null) {
                                  await _controller!
                                      .evaluateJavascript(source: script);
                                }
                                break;
                              case LoginStep.captcha:
                                script = """
      var captchaField = document.getElementById('captcha');
      if (captchaField.value === ''){
      captchaField.value = '$inputString';
      }
      """;

                                if (_controller != null) {
                                  await _controller!
                                      .evaluateJavascript(source: script);
                                }
                                script = """
document.querySelector('[id="log.login"]').click();
""";

                                await Future.delayed(
                                  const Duration(seconds: 1),
                                  () {
                                    _controller!
                                        .evaluateJavascript(source: script);
                                  },
                                );
                                break;
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InAppWebView(
                key: webViewKey,
                initialUrlRequest: URLRequest(url: WebUri(APIUrl.naverLogin)),
                initialSettings: settings,
                onWebViewCreated: (controller) {
                  _controller = controller;
                },
                onLoadStop: (controller, url) async {
                  if (loginStep.value == LoginStep.id) {
                    // Keep login
                    _controller!.evaluateJavascript(source: """
              var smartLevel = document.getElementById('smart_LEVEL');
              smartLevel.value = '-1';
              
              var switchBlind = document.getElementById('switch_blind');
              if (switchBlind != null) {
                switchBlind.checked = false;
                switchBlind.innerText = 'off';
              }

              var checkbox = document.querySelector('.input_keep');
              if (checkbox !== null) {
                checkbox.checked = true;
                checkbox.value = 'on';
              }
              """);

                    await Future.delayed(const Duration(seconds: 1), () {
                      _controller!.scrollTo(x: 0, y: 0);
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
