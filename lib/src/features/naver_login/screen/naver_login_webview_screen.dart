import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/repository/auth_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/client/repository/client_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/utils/router/app_router.dart';

import '../../../common/custom_scaffold.dart';
import '../../../constants/api.dart';
import '../../../utils/webview/webview_with_dpad_pointer.dart';
import '../../auth/model/auth.dart';

class NaverLoginWebViewScreen extends ConsumerWidget {
  const NaverLoginWebViewScreen({
    super.key,
    required this.id,
    required this.password,
  });

  final String id;
  final String password;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      body: WebViewWithDpadPointer(
        initialUrl: APIUrl.naverLogin,
        onLoadStop: (controller, webUri) async {
          await controller.evaluateJavascript(source: """
var idField = document.getElementById('id');
var passwordField = document.getElementById('pw');
if (idField.value === '') {
    idField.value = '$id';
}
if (passwordField.value === ''){
    passwordField.value = '$password';
}
""");
          await ref.watch(authRepositoryProvider).setExpiresDate();

          final Auth? auth =
              await ref.watch(authRepositoryProvider).getAuthWithCookies();

          if (auth != null) {
            await ref.read(clientRepositoryProvider.notifier).login(auth);

            if (context.mounted) {
              context.go(AppRoute.home.routePath);
            }
          } else {
            return;
          }
        },
      ),
    );
  }
}
