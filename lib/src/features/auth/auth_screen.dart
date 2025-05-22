import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/api.dart' show BaseUrl;
import '../../common/constants/enums.dart' show AppRoute, LoginStep;
import '../../common/constants/dimensions.dart' show Dimensions;
import '../../common/widgets/ui/ui_widgets.dart' show CenteredText;
import '../../common/widgets/screen/screen_widgets.dart';
import '../../utils/dio/user_agent.dart';
import '../../utils/virtual_keyboard/virtual_keyboard.dart'
    show VirtualKeyboardLayout, VirtualKeyboardInputField;

import 'auth_event.dart';
import 'auth_state.dart';

part 'widgets/screen/auth_body.dart';
part 'widgets/screen/naver_login_input_field.dart';
part 'widgets/screen/naver_login_header_text.dart';

class AuthScreen extends ConsumerWidget with AuthEvent {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScopeScreen(
      onPopInvoked: (OnPopInvokedHandler onPopInvokedHandler) {
        onPopInvokedHandler.navigate(
          context: context,
          currentLocation: AppRoute.auth.routeName,
          appRoute: AppRoute.home,
          popAction: () => authControllerInvalidate(ref),
        );
      },
      child: _AuthBody(
        headerText: _NaverLoginHeaderText(),
        inputField: _NaverLoginInputField(),
      ),
    );
  }
}
