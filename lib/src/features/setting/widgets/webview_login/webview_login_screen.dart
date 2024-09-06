import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/pop_scope_screen.dart';
import '../../../../utils/router/app_router.dart';
import '../../../auth/controller/auth_controller.dart';
import '../../../auth/widgets/naver_login_with_webview.dart';
import '../../../dashboard/controller/dashboard_controller.dart';

class WebviewLoginScreen extends ConsumerWidget {
  const WebviewLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScopeScreen(
      onPopInvoked: (_) {
        ref.invalidate(authControllerProvider);

        ref
            .read(dashboardControllerProvider.notifier)
            .changeScreen(context, AppRoute.home);
      },
      body: const NaverLoginWithWebview(),
    );
  }
}
