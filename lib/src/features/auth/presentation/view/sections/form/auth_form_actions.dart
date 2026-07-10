part of 'auth_form_section.dart';

class _AuthActionRow extends StatelessWidget {
  const _AuthActionRow();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      AuthScreenBloc,
      AuthScreenState,
      ({bool enabled, bool isPasswordVisible})
    >(
      selector: (state) {
        return (
          enabled: !state.isSubmitting && !state.isCapturingSession,
          isPasswordVisible: state.isPasswordVisible,
        );
      },
      builder: (context, snapshot) {
        return SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: AuthScreenDesign.actionGap,
            children: [
              TvButton.label(
                text: snapshot.isPasswordVisible
                    ? AuthScreenString.hidePassword
                    : AuthScreenString.showPassword,
                icon: snapshot.isPasswordVisible
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                enabled: snapshot.enabled,
                onPressed: () {
                  context.read<AuthScreenBloc>().add(
                    const AuthScreenEvent.passwordVisibilityToggled(),
                  );
                },
              ),
              TvButton.label(
                text: AuthScreenString.reloadPage,
                icon: Icons.refresh_rounded,
                enabled: snapshot.enabled,
                onPressed: () {
                  context.read<AuthScreenBloc>().add(
                    const AuthScreenEvent.reloadRequested(),
                  );
                },
              ),
              TvButton.label(
                text: AuthScreenString.login,
                icon: Icons.login_rounded,
                enabled: snapshot.enabled,
                onPressed: () {
                  context.read<AuthScreenBloc>().add(
                    const AuthScreenEvent.loginRequested(),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
