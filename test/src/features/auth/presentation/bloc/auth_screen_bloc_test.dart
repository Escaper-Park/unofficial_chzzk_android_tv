import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/auth_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/auth_screen_ui_mapper.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/bloc/auth_screen_bloc.dart';

void main() {
  group('AuthScreenBloc', () {
    test('starts with id input selected and keyboard open', () {
      final bloc = AuthScreenBloc();
      addTearDown(bloc.close);

      expect(bloc.state.activeInput, AuthInputField.naverId);
      expect(bloc.state.isKeyboardOpen, true);
    });

    test('opens keyboard for selected input', () async {
      final bloc = AuthScreenBloc();
      addTearDown(bloc.close);

      bloc.add(
        const AuthScreenEvent.inputSelected(AuthInputField.naverId),
      );
      await pumpEventQueue();

      expect(bloc.state.activeInput, AuthInputField.naverId);
      expect(bloc.state.isKeyboardOpen, true);
    });

    test('moves from id to password on keyboard submit', () async {
      final bloc = AuthScreenBloc();
      addTearDown(bloc.close);

      bloc.add(const AuthScreenEvent.keyboardSubmitted('viewer'));
      await pumpEventQueue();

      expect(bloc.state.naverId, 'viewer');
      expect(bloc.state.activeInput, AuthInputField.password);
      expect(bloc.state.isKeyboardOpen, true);
      expect(bloc.state.status, AuthScreenStatus.idle);
    });

    test('requests login when id and password are present', () async {
      final bloc = AuthScreenBloc();
      addTearDown(bloc.close);

      bloc
        ..add(const AuthScreenEvent.keyboardSubmitted('viewer'))
        ..add(const AuthScreenEvent.keyboardValueChanged('pw1234'))
        ..add(const AuthScreenEvent.keyboardSubmitted('pw1234'));
      await pumpEventQueue();

      expect(bloc.state.naverId, 'viewer');
      expect(bloc.state.password, 'pw1234');
      expect(bloc.state.submitRequestId, 1);
      expect(bloc.state.isKeyboardOpen, false);
    });

    test('moves from password to captcha when captcha is required', () async {
      final bloc = AuthScreenBloc();
      addTearDown(bloc.close);

      bloc
        ..add(const AuthScreenEvent.keyboardSubmitted('viewer'))
        ..add(
          const AuthScreenEvent.captchaRequirementChanged(isRequired: true),
        )
        ..add(const AuthScreenEvent.inputSelected(AuthInputField.password))
        ..add(const AuthScreenEvent.keyboardSubmitted('pw1234'));
      await pumpEventQueue();

      expect(bloc.state.password, 'pw1234');
      expect(bloc.state.activeInput, AuthInputField.captcha);
      expect(bloc.state.isKeyboardOpen, true);
      expect(bloc.state.submitRequestId, 0);
      expect(
        AuthScreenUiMapper.description(bloc.state),
        AuthScreenString.captchaDescription,
      );
    });

    test('requires password before login request', () async {
      final bloc = AuthScreenBloc();
      addTearDown(bloc.close);

      bloc.add(const AuthScreenEvent.keyboardSubmitted('viewer'));
      await pumpEventQueue();
      bloc.add(const AuthScreenEvent.loginRequested());
      await pumpEventQueue();

      expect(bloc.state.submitRequestId, 0);
      expect(bloc.state.activeInput, AuthInputField.password);
      expect(bloc.state.isKeyboardOpen, true);
      expect(bloc.state.status, AuthScreenStatus.enterPassword);
    });

    test(
      'requires captcha before login request when captcha is required',
      () async {
        final bloc = AuthScreenBloc();
        addTearDown(bloc.close);

        bloc
          ..add(const AuthScreenEvent.keyboardSubmitted('viewer'))
          ..add(const AuthScreenEvent.keyboardValueChanged('pw1234'))
          ..add(
            const AuthScreenEvent.captchaRequirementChanged(isRequired: true),
          )
          ..add(const AuthScreenEvent.loginRequested());
        await pumpEventQueue();

        expect(bloc.state.submitRequestId, 0);
        expect(bloc.state.activeInput, AuthInputField.captcha);
        expect(bloc.state.isKeyboardOpen, true);
        expect(
          AuthScreenUiMapper.description(bloc.state),
          AuthScreenString.captchaDescription,
        );
      },
    );

    test('captcha requirement opens captcha input and keyboard', () async {
      final bloc = AuthScreenBloc();
      addTearDown(bloc.close);

      bloc
        ..add(const AuthScreenEvent.sessionCapturePending())
        ..add(
          const AuthScreenEvent.captchaRequirementChanged(isRequired: true),
        );
      await pumpEventQueue();

      expect(bloc.state.isCaptchaRequired, true);
      expect(bloc.state.activeInput, AuthInputField.captcha);
      expect(bloc.state.isKeyboardOpen, true);
      expect(bloc.state.status, AuthScreenStatus.idle);
      expect(
        AuthScreenUiMapper.description(bloc.state),
        AuthScreenString.captchaDescription,
      );
    });

    test('session pending does not replace captcha prompt', () async {
      final bloc = AuthScreenBloc();
      addTearDown(bloc.close);

      bloc
        ..add(
          const AuthScreenEvent.captchaRequirementChanged(isRequired: true),
        )
        ..add(const AuthScreenEvent.sessionCapturePending());
      await pumpEventQueue();

      expect(bloc.state.isCaptchaRequired, true);
      expect(bloc.state.activeInput, AuthInputField.captcha);
      expect(bloc.state.isKeyboardOpen, true);
      expect(bloc.state.status, AuthScreenStatus.idle);
      expect(
        AuthScreenUiMapper.description(bloc.state),
        AuthScreenString.captchaDescription,
      );
    });

    test('reload clears captcha state and emits reload command', () async {
      final bloc = AuthScreenBloc();
      addTearDown(bloc.close);

      bloc
        ..add(
          const AuthScreenEvent.captchaRequirementChanged(isRequired: true),
        )
        ..add(const AuthScreenEvent.keyboardValueChanged('가나다'))
        ..add(const AuthScreenEvent.reloadRequested());
      await pumpEventQueue();

      expect(bloc.state.reloadRequestId, 1);
      expect(bloc.state.isCaptchaRequired, false);
      expect(bloc.state.captcha, '');
      expect(bloc.state.activeInput, AuthInputField.password);
      expect(bloc.state.status, AuthScreenStatus.reloading);
    });

    test('does not expose password or captcha in diagnostics', () async {
      final bloc = AuthScreenBloc();
      addTearDown(bloc.close);

      bloc
        ..add(const AuthScreenEvent.keyboardSubmitted('viewer'))
        ..add(const AuthScreenEvent.keyboardSubmitted('pw1234'))
        ..add(const AuthScreenEvent.captchaRequirementChanged(isRequired: true))
        ..add(const AuthScreenEvent.keyboardSubmitted('captcha123'));
      await pumpEventQueue();

      expect(bloc.state.toString(), isNot(contains('pw1234')));
      expect(bloc.state.toString(), isNot(contains('captcha123')));
      expect(
        const AuthScreenEvent.keyboardSubmitted('pw1234').toString(),
        isNot(contains('pw1234')),
      );
    });

    test('clears sensitive input values after login completes', () async {
      final bloc = AuthScreenBloc();
      addTearDown(bloc.close);

      bloc
        ..add(const AuthScreenEvent.keyboardSubmitted('viewer'))
        ..add(const AuthScreenEvent.keyboardSubmitted('pw1234'))
        ..add(const AuthScreenEvent.captchaRequirementChanged(isRequired: true))
        ..add(const AuthScreenEvent.keyboardSubmitted('captcha123'))
        ..add(const AuthScreenEvent.loginCompleted());
      await pumpEventQueue();

      expect(bloc.state.naverId, 'viewer');
      expect(bloc.state.password, '');
      expect(bloc.state.captcha, '');
      expect(bloc.state.status, AuthScreenStatus.loginCompleted);
    });

    test('clears sensitive input values after reported failure', () async {
      final bloc = AuthScreenBloc();
      addTearDown(bloc.close);

      bloc
        ..add(const AuthScreenEvent.keyboardSubmitted('viewer'))
        ..add(const AuthScreenEvent.keyboardSubmitted('pw1234'))
        ..add(const AuthScreenEvent.captchaRequirementChanged(isRequired: true))
        ..add(const AuthScreenEvent.keyboardSubmitted('captcha123'))
        ..add(
          const AuthScreenEvent.failureReported(
            AuthScreenStatus.webViewControlFailure,
          ),
        );
      await pumpEventQueue();

      expect(bloc.state.naverId, 'viewer');
      expect(bloc.state.password, '');
      expect(bloc.state.captcha, '');
      expect(bloc.state.status, AuthScreenStatus.webViewControlFailure);
    });
  });
}
