import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:unofficial_chzzk_android_tv/src/features/auth/model/auth.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/controller/auth_controller.dart';
import 'package:unofficial_chzzk_android_tv/src/common/constants/enums.dart';

void main() {
  group('Auth 모델 테스트', () {
    test('Auth 객체 생성 및 쿠키 생성 테스트', () {
      // Given
      const auth = Auth(
        nidAuth: 'test_nid_auth',
        nidSession: 'test_nid_session',
      );

      // When
      final cookies = auth.getCookie();
      final options = auth.getOptions();

      // Then
      expect(auth.nidAuth, 'test_nid_auth');
      expect(auth.nidSession, 'test_nid_session');
      expect(cookies, {'NID_AUT=test_nid_auth; NID_SES=test_nid_session'});
      expect(options.headers!['Cookie'], cookies);
    });

    test('Auth JSON 직렬화/역직렬화 테스트', () {
      // Given
      const auth = Auth(
        nidAuth: 'test_auth',
        nidSession: 'test_session',
      );

      // When
      final json = auth.toJson();
      final authFromJson = Auth.fromJson(json);

      // Then
      expect(authFromJson.nidAuth, auth.nidAuth);
      expect(authFromJson.nidSession, auth.nidSession);
    });
  });

  group('LoginStepController 테스트', () {
    test('초기 상태는 LoginStep.id 여야 한다', () {
      // Given
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // When
      final loginStep = container.read(loginStepControllerProvider);

      // Then
      expect(loginStep, LoginStep.id);
    });

    test('LoginStep 업데이트 테스트', () {
      // Given
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // When
      container.read(loginStepControllerProvider.notifier).update(LoginStep.password);
      final updatedStep = container.read(loginStepControllerProvider);

      // Then
      expect(updatedStep, LoginStep.password);
    });
  });
} 