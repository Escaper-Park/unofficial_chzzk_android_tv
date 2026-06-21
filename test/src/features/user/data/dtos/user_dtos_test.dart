import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/user/data/dtos/user_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/user/data/mappers/user_mapper.dart';
import 'package:unofficial_chzzk_android_tv/src/features/user/domain/entities/user_status.dart';

void main() {
  test('maps user status dto to the domain contract', () {
    const dto = UserStatusDto(
      hasProfile: true,
      loggedIn: true,
      nickname: 'viewer',
      officialNotiAgree: true,
      penalties: ['limited'],
      profileImageUrl: 'https://example.com/profile.png',
      userIdHash: 'hash',
      verifiedMark: true,
    );

    final status = userStatusFromDto(dto);

    expect(status, isA<UserStatus>());
    expect(status, isNot(isA<UserStatusDto>()));
    expect(status.hasProfile, true);
    expect(status.loggedIn, true);
    expect(status.nickname, 'viewer');
    expect(status.officialNotiAgree, true);
    expect(status.penalties, ['limited']);
    expect(status.profileImageUrl, 'https://example.com/profile.png');
    expect(status.userIdHash, 'hash');
    expect(status.verifiedMark, true);
  });

  test('mapped user status owns an immutable penalties list', () {
    final penalties = <String>['limited'];
    final status = userStatusFromDto(
      UserStatusDto(
        hasProfile: false,
        loggedIn: false,
        penalties: penalties,
      ),
    );

    penalties.add('mutated');

    expect(status.penalties, ['limited']);
    expect(() => status.penalties.add('blocked'), throwsUnsupportedError);
  });

  test('fails fast when loggedIn is missing from user status payload', () {
    expect(
      () => UserStatusDto.fromJson(const <String, dynamic>{
        'hasProfile': false,
      }),
      throwsA(isA<TypeError>()),
    );
  });

  test('fails fast when hasProfile is missing from user status payload', () {
    expect(
      () => UserStatusDto.fromJson(const <String, dynamic>{
        'loggedIn': false,
      }),
      throwsA(isA<TypeError>()),
    );
  });
}
