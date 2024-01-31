import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../../constants/api.dart';
import '../../../../controller/auth/auth_controller.dart';
import '../../../../utils/router/app_router.dart';

class LoginWithHeadlessWebView extends StatefulHookConsumerWidget {
  const LoginWithHeadlessWebView({
    super.key,
    required this.formKey,
    required this.focusNode,
    required this.id,
    required this.password,
  });

  final GlobalKey<FormState> formKey;
  final FocusNode focusNode;
  final String id;
  final String password;

  @override
  ConsumerState<LoginWithHeadlessWebView> createState() =>
      _LoginWithHeadlessWebViewState();
}

class _LoginWithHeadlessWebViewState
    extends ConsumerState<LoginWithHeadlessWebView> {
  HeadlessInAppWebView? headlessWebView;

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
        final bool isLoggedIn =
            await ref.read(authControllerProvider.notifier).login(
                  controller: controller,
                  webUri: url,
                  id: widget.id,
                  password: widget.password,
                );

        if (isLoggedIn) {
          if (context.mounted) {
            context.go(AppRoute.home.routePath);
          }
        } else {
          return;
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    headlessWebView?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // false while logging in.
    final buttonClickState = useState<bool>(true);

    return ElevatedButton(
      focusNode: widget.focusNode,
      onPressed: buttonClickState.value
          ? () async {
              bool? isValid = widget.formKey.currentState?.validate();

              if (isValid == true) {
                buttonClickState.value = false;
                await headlessWebView?.dispose();
                await headlessWebView?.run();
              }
            }
          : null,
      child: const Text('로그인'),
    );
  }
}
