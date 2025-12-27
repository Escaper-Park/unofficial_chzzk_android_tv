import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/user/model/user.dart';

void main() {
  group('User 모델 테스트', () {
    test('User 객체 생성 테스트', () {
      // Given
      final user = User(
        hasProfile: true,
        userIdHash: 'test_user_id_hash',
        nickname: 'TestUser',
        profileImageUrl: 'https://example.com/profile.jpg',
        verifiedMark: true,
      );

      // Then
      expect(user.hasProfile, true);
      expect(user.userIdHash, 'test_user_id_hash');
      expect(user.nickname, 'TestUser');
      expect(user.profileImageUrl, 'https://example.com/profile.jpg');
      expect(user.verifiedMark, true);
    });

    test('User 객체 - null 값 처리 테스트', () {
      // Given
      final user = User(
        hasProfile: false,
        userIdHash: null,
        nickname: 'GuestUser',
        profileImageUrl: null,
        verifiedMark: false,
      );

      // Then
      expect(user.hasProfile, false);
      expect(user.userIdHash, null);
      expect(user.nickname, 'GuestUser');
      expect(user.profileImageUrl, null);
      expect(user.verifiedMark, false);
    });

    test('User 객체 - 파트너 스트리머 확인', () {
      // Given
      final partnerUser = User(
        hasProfile: true,
        userIdHash: 'partner_id',
        nickname: 'PartnerStreamer',
        profileImageUrl: 'https://example.com/partner.jpg',
        verifiedMark: true,
      );

      final regularUser = User(
        hasProfile: true,
        userIdHash: 'regular_id',
        nickname: 'RegularUser',
        profileImageUrl: 'https://example.com/regular.jpg',
        verifiedMark: false,
      );

      // Then
      expect(partnerUser.verifiedMark, true);
      expect(regularUser.verifiedMark, false);
    });

    test('User 객체 - 동일성 비교', () {
      // Given
      final user1 = User(
        hasProfile: true,
        userIdHash: 'same_id',
        nickname: 'SameUser',
        profileImageUrl: 'https://example.com/same.jpg',
        verifiedMark: false,
      );

      final user2 = User(
        hasProfile: true,
        userIdHash: 'same_id',
        nickname: 'SameUser',
        profileImageUrl: 'https://example.com/same.jpg',
        verifiedMark: false,
      );

      // Then - Freezed가 적용되어 있으면 동일성 비교가 가능해야 함
      expect(user1.nickname, user2.nickname);
      expect(user1.userIdHash, user2.userIdHash);
    });
  });
}