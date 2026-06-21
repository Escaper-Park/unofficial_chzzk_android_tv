part of 'auth_form_section.dart';

class _AuthActionRow extends StatelessWidget {
  const _AuthActionRow();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthScreenBloc, AuthScreenState>(
      buildWhen: (previous, current) {
        return previous.isPasswordVisible != current.isPasswordVisible ||
            previous.isSubmitting != current.isSubmitting ||
            previous.isCapturingSession != current.isCapturingSession;
      },
      builder: (context, state) {
        final enabled = !state.isSubmitting && !state.isCapturingSession;

        return SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: AuthScreenDesign.actionGap,
            children: [
              TvButton.label(
                text: AuthScreenUiMapper.passwordActionLabel(state),
                icon: state.isPasswordVisible
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                enabled: enabled,
                onPressed: () {
                  context.read<AuthScreenBloc>().add(
                    const AuthScreenEvent.passwordVisibilityToggled(),
                  );
                },
              ),
              TvButton.label(
                text: AuthScreenString.reloadPage,
                icon: Icons.refresh_rounded,
                enabled: enabled,
                onPressed: () {
                  context.read<AuthScreenBloc>().add(
                    const AuthScreenEvent.reloadRequested(),
                  );
                },
              ),
              TvButton.label(
                text: AuthScreenString.login,
                icon: Icons.login_rounded,
                enabled: enabled,
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
