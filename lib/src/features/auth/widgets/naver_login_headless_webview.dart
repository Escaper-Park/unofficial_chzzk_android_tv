import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/api.dart';
import '../../../utils/router/app_router.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../../settings/controller/settings_controller.dart';
import '../controller/auth_controller.dart';
import 'login_text_form_field.dart';

class NaverLoginHeadlessWebView extends ConsumerStatefulWidget {
  const NaverLoginHeadlessWebView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  ConsumerState<NaverLoginHeadlessWebView> createState() =>
      _NaverLoginHeadlessWebViewState();
}

class _NaverLoginHeadlessWebViewState
    extends ConsumerState<NaverLoginHeadlessWebView> {
  HeadlessInAppWebView? headlessWebView;
  String password = '';

  FocusNode textInputFocusNode = FocusNode();
  bool isActivate = true;
  String msg = '2단계 인증을 설정하셨다면\n설정한 기기에서 인증 알림을 확인하세요.';

  @override
  void initState() {
    super.initState();
    headlessWebView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(APIUrl.naverLogin)),
      initialSettings: InAppWebViewSettings(
        useHybridComposition: true,
        javaScriptEnabled: true,
        javaScriptCanOpenWindowsAutomatically: true,
        thirdPartyCookiesEnabled: true,
        cacheEnabled: true,
      ),
      onLoadStop: (controller, url) async {
        await ref.read(settingsControllerProvider.notifier).setNaverIdPrefs(
              widget.id,
            );

        final bool isLoggedIn =
            await ref.read(authControllerProvider.notifier).login(
                  controller: controller,
                  webUri: url,
                  id: widget.id,
                  password: password,
                );

        if (isLoggedIn) {
          if (context.mounted) {
            ref
                .read(dashboardControllerProvider.notifier)
                .changeScreen(context, AppRoute.home);
          }
        } else {
          // Check Error
          final errorMsg = await controller.evaluateJavascript(source: '''
      var elementById = document.querySelector('#err_common');
      if (elementById && elementById.style.display !== 'none') {
        var errorMessageElement = elementById.querySelector('.error_message');
        if (errorMessageElement) {
          errorMessageElement.innerText;
        }
      }
''');

          if (errorMsg != null && context.mounted) {
            setState(() {
              msg = errorMsg as String;
              isActivate = true;
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    headlessWebView?.dispose();
    textInputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LoginTextFormField(
          textInputFocusNode: textInputFocusNode,
          buttonText: '로그인',
          hintText: '비밀번호를 입력해주세요.',
          isObscure: true,
          goBackAction: () {
            context.pop();
          },
          onPressed: isActivate
              ? (text) async {
                  if (context.mounted && text != null) {
                    setState(() {
                      isActivate = false;
                      password = text;
                    });
                  }
                  await headlessWebView?.dispose();
                  await headlessWebView?.run();
                }
              : null,
        ),
        const SizedBox(height: 10.0),
        Text(msg),
      ],
    );
  }
}
