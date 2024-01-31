import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/custom_scaffold.dart';
import './widgets/naver_login.dart';

class AuthScreen extends HookConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new, const []);

    final idController = useTextEditingController();
    final passwordController = useTextEditingController();

    final idFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final suffixIconFocusNode = useFocusNode();
    final confirmFocusNode = useFocusNode();
    final cancelFocusNode = useFocusNode();

    useListenable(idController);
    useListenable(passwordController);

    return PopScope(
      canPop: true,
      onPopInvoked: (_) {},
      child: CustomScaffold(
        verticalPadding: 100.0,
        useTextField: true,
        body: Center(
          child: SizedBox(
            width: 300.0,
            child: NaverLogin(
              formKey: formKey,
              idController: idController,
              passwordController: passwordController,
              idFocusNode: idFocusNode,
              passwordFocusNode: passwordFocusNode,
              suffixIconFocusNode: suffixIconFocusNode,
              confirmFocusNode: confirmFocusNode,
              cancelFocusNode: cancelFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
