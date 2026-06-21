import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_screen_bloc.freezed.dart';
part 'auth_screen_bloc_flow_helpers.dart';
part 'auth_screen_bloc_input_helpers.dart';
part 'auth_screen_event.dart';
part 'auth_screen_state.dart';

final class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  AuthScreenBloc() : super(const AuthScreenState(isKeyboardOpen: true)) {
    on<_InputSelected>(_onInputSelected);
    on<_KeyboardValueChanged>(_onKeyboardValueChanged);
    on<_KeyboardSubmitted>(_onKeyboardSubmitted);
    on<_KeyboardClosed>(_onKeyboardClosed);
    on<_PasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<_ReloadRequested>(_onReloadRequested);
    on<_LoginRequested>(_onLoginRequested);
    on<_WebViewLoadingChanged>(_onWebViewLoadingChanged);
    on<_CaptchaRequirementChanged>(_onCaptchaRequirementChanged);
    on<_LoginSubmissionStarted>(_onLoginSubmissionStarted);
    on<_SessionCaptureStarted>(_onSessionCaptureStarted);
    on<_SessionCapturePending>(_onSessionCapturePending);
    on<_LoginCompleted>(_onLoginCompleted);
    on<_FailureReported>(_onFailureReported);
  }
}
