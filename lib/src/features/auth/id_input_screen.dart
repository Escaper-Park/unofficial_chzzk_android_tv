import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/router/app_router.dart';
import '../../common/widgets/base_scaffold.dart';
import '../dashboard/controller/dashboard_controller.dart';
import '../settings/controller/settings_controller.dart';
import './widgets/login_text_form_field.dart';

class IdInputScreen extends HookConsumerWidget {
  const IdInputScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? savedNaverId =
        ref.read(settingsControllerProvider.notifier).getNaverIdPrefs();

    final textInputFocusNode = useFocusNode();

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        textInputFocusNode.unfocus();
        ref
            .read(dashboardControllerProvider.notifier)
            .changeScreen(context, AppRoute.home);
      },
      child: BaseScaffold(
        useTextField: true,
        verticalPadding: 100.0,
        body: LoginTextFormField(
          initText: savedNaverId,
          buttonText: '다음',
          hintText: '네이버 아이디를 입력해주세요.',
          textInputFocusNode: textInputFocusNode,
          goBackAction: () {},
          onPressed: (text) {
            context.pushNamed(
              AppRoute.password.routeName,
              queryParameters: {"id": text},
            );
          },
        ),
      ),
    );
  }
}
