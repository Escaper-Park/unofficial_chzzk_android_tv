final class AuthPageState {
  const AuthPageState({
    required this.captchaRequired,
  });

  final bool captchaRequired;

  factory AuthPageState.fromJson(Map<String, dynamic> json) {
    return AuthPageState(
      captchaRequired: json['captchaRequired'] == true,
    );
  }
}
