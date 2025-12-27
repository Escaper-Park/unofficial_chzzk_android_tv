part of '../../auth_screen.dart';

class _NaverLoginInputField extends ConsumerWidget with AuthState {
  const _NaverLoginInputField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // If the login step is password, isObscure is true.
    final loginStep = getLoginStep(ref);
    final isObscure =
        loginStep == LoginStep.password || loginStep == LoginStep.passwordAgain;

    return VirtualKeyboardInputField(
      isObscure: isObscure,
      routeName: AppRoute.auth.routeName,
    );
  }
}
