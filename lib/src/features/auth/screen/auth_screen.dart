import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/custom_scaffold.dart';
import '../../../utils/router/app_router.dart';
import '../auth.dart';

class AuthScreen extends HookConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idController = useTextEditingController();
    final passwordController = useTextEditingController();

    final idFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final confirmFocusNode = useFocusNode();

    final formKey = useMemoized(GlobalKey<FormState>.new, const []);

    useListenable(idController);
    useListenable(passwordController);

    return CustomScaffold(
      topPadding: 100.0,
      useTextField: true,
      body: Center(
        child: SizedBox(
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NaverLoginTextFormFields(
                formKey: formKey,
                idFocusNode: idFocusNode,
                passwordFocusNode: passwordFocusNode,
                idController: idController,
                passwordController: passwordController,
                onPasswordFieldSubmitted: (_) {
                  // Pass the focus to login confirm button after clicking
                  // enter button of password textfield.
                  passwordFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(confirmFocusNode);
                },
              ),
              const SizedBox(height: 10.0),
              LoginButtons(
                confirmFocusNode: confirmFocusNode,
                cancelCallback: () {
                  if (context.mounted) context.pop();
                },
                confirmCallback: () {
                  if (context.mounted) {
                    bool? isValid = formKey.currentState?.validate();

                    if (isValid == true) {
                      context.pushNamed(
                        AppRoute.naverLogin.routeName,
                        queryParameters: {
                          'id': idController.text,
                          'password': passwordController.text,
                        },
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
