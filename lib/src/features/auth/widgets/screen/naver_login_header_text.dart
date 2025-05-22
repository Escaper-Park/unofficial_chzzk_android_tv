part of '../../auth_screen.dart';

class _NaverLoginHeaderText extends ConsumerWidget with AuthState {
  /// Hint text for login.
  const _NaverLoginHeaderText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginStep = getLoginStep(ref);

    final String hintText = switch (loginStep) {
      LoginStep.id => '네이버 아이디를 입력해주세요',
      LoginStep.password => '비밀번호를 입력해주세요',
      LoginStep.passwordAgain =>
        'CAPTCHA 문제로 로그인이 진행되지 않는다면,\nENTER 버튼을 눌러 비밀번호를 다시 넣어주세요.',
      LoginStep.captcha => 'CAPTCHA 정답을 입력해주세요',
    };

    return CenteredText(
      text: hintText,
      fontSize: 20.0,
    );
  }
}
