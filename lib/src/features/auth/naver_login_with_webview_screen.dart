import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/repository/auth_repository.dart';

import '../../common/constants/api.dart';
import '../../common/widgets/base_scaffold.dart';
import '../../utils/router/app_router.dart';
import '../dashboard/controller/dashboard_controller.dart';
import 'controller/auth_controller.dart';
import 'widgets/login_text_form_field.dart';

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
  );

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final webViewKey = useMemoized(GlobalKey.new, const []);
    final textController = useTextEditingController();
    final textInputFocusNode = useFocusNode();
    final loginStep = useState<LoginStep>(LoginStep.id);
    final focusScopeNode = useFocusScopeNode();
    final isObscure = useState<bool>(false);
    final passwordCount = useState<int>(0);

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
                    FocusScope(
                      autofocus: true,
                      node: focusScopeNode,
                      child: LoginTextFormField(
                        textEditingController: textController,
                        textInputFocusNode: textInputFocusNode,
                        enableSuggestion:
                            loginStep.value == LoginStep.captcha ? true : false,
                        buttonText: '전송',
                        hintText: hintText,
                        isObscure: isObscure.value,
                        onPressed: (text) async {
                          String script = """ """;
                          switch (loginStep.value) {
                            case LoginStep.id:
                              script = """
      var idField = document.getElementById('id');
      if (idField.value === '') {
      idField.value = '$text';
      }
      """;
                              loginStep.value = LoginStep.password;
                              isObscure.value = true;
                              textController.text = '';
                              textInputFocusNode.requestFocus();
                              break;
                            case LoginStep.password:
                              if (passwordCount.value == 0) {
                                script = """
      var passwordField = document.getElementById('pw');
      if (passwordField.value === ''){
      passwordField.value = '$text';
      }
      document.querySelector('[id="log.login"]').click();
      """;
                                loginStep.value = LoginStep.password;
                                isObscure.value = true;
                                passwordCount.value += 1;
                              } else {
                                script = """
      var passwordField = document.getElementById('pw');
      if (passwordField.value === ''){
      passwordField.value = '$text';
      }
      var captchaField = document.getElementById('captcha');
      captchaField.focus();
      
      """;
                                loginStep.value = LoginStep.captcha;
                                isObscure.value = false;
                                textController.text = '';
                              }
                              break;
                            case LoginStep.captcha:
                              script = """
      var captchaField = document.getElementById('captcha');
      if (captchaField.value === ''){
      captchaField.value = '$text';
      }
      document.querySelector('[id="log.login"]').click();
      """;
                              break;
                          }
                          if (_controller != null) {
                            _controller!.evaluateJavascript(source: script);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        """비밀번호를 여러 번 틀려 로그인에 문제가 생기면 CAPTCHA 화면이 나오게 됩니다.\n
비밀번호 입력 후 로그인이 안된다면, 바로 다시 한 번 전송 버튼을 누르시고,\n
CAPTCHA 정답을 입력하고 전송 후 로그인이 완료되면 치지직 웹 페이지가 나옵니다.\n
치지직 웹 페이지가 로드되고 로그인이 완료된 것을 확인하셨으면 뒤로가기 버튼을 눌러\n
화면에서 빠져나와주세요.""",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: InAppWebView(
                key: webViewKey,
                initialUrlRequest: URLRequest(
                  url: WebUri(APIUrl.naverLogin),
                  headers: {
                    'User-Agent': 'Chrome/58.0.3029.110',
                  },
                ),
                initialSettings: settings,
                onWebViewCreated: (controller) {
                  _controller = controller;
                },
                onLoadStop: (controller, url) async {
                  // Keep login
                  _controller!.evaluateJavascript(source: """            
              var checkbox = document.querySelector('.input_keep');
              if (checkbox !== null) {
                checkbox.checked = true;
                checkbox.value = 'on';
              }""");
                  _controller!.scrollTo(x: 0, y: 0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
