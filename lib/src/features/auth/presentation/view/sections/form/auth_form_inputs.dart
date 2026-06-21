part of 'auth_form_section.dart';

class _AuthInputRow extends StatelessWidget {
  const _AuthInputRow({
    required this.state,
    required this.inputFocusNodes,
  });

  final AuthScreenState state;
  final AuthInputFocusNodes inputFocusNodes;

  @override
  Widget build(BuildContext context) {
    final activeInput = state.activeInput;
    final inputAutofocus = !state.isKeyboardOpen;

    return SizedBox(
      key: const Key('auth-input-row'),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TvTextField(
              key: const Key('auth-id-field'),
              label: AuthScreenString.idSubject,
              value: state.naverId,
              hintText: AuthScreenString.idHint,
              active: activeInput == AuthInputField.naverId,
              focusNode: inputFocusNodes.naverId,
              autofocus:
                  inputAutofocus && activeInput == AuthInputField.naverId,
              onPressed: () {
                context.read<AuthScreenBloc>().add(
                  const AuthScreenEvent.inputSelected(AuthInputField.naverId),
                );
              },
            ),
          ),
          const SizedBox(width: AuthScreenDesign.inputGap),
          Expanded(
            child: TvTextField(
              key: const Key('auth-password-field'),
              label: AuthScreenString.passwordSubject,
              value: _visiblePassword(state),
              hintText: AuthScreenString.passwordHint,
              active: activeInput == AuthInputField.password,
              focusNode: inputFocusNodes.password,
              autofocus:
                  inputAutofocus && activeInput == AuthInputField.password,
              onPressed: () {
                context.read<AuthScreenBloc>().add(
                  const AuthScreenEvent.inputSelected(AuthInputField.password),
                );
              },
            ),
          ),
          if (state.isCaptchaRequired) ...[
            const SizedBox(width: AuthScreenDesign.inputGap),
            Expanded(
              child: TvTextField(
                key: const Key('auth-captcha-field'),
                label: AuthScreenString.captchaSubject,
                value: state.captcha,
                hintText: AuthScreenString.captchaHint,
                active: activeInput == AuthInputField.captcha,
                focusNode: inputFocusNodes.captcha,
                autofocus:
                    inputAutofocus && activeInput == AuthInputField.captcha,
                onPressed: () {
                  context.read<AuthScreenBloc>().add(
                    const AuthScreenEvent.inputSelected(AuthInputField.captcha),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}

String _visiblePassword(AuthScreenState state) {
  if (state.isPasswordVisible || state.password.length <= 1) {
    return state.password;
  }

  return '${'*' * (state.password.length - 1)}'
      '${state.password[state.password.length - 1]}';
}
