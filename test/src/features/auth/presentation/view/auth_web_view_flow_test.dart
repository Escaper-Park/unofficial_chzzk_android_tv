import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/view/auth_web_view_flow.dart';

void main() {
  group('AuthPageState', () {
    test('parses captcha required state', () {
      final state = AuthPageState.fromJson({
        'captchaRequired': true,
      });

      expect(state.captchaRequired, true);
    });

    test('parses captcha hidden state', () {
      final state = AuthPageState.fromJson({
        'captchaRequired': false,
      });

      expect(state.captchaRequired, false);
    });
  });
}
