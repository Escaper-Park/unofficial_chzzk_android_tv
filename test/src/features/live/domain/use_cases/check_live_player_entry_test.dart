import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/use_cases/check_live_player_entry.dart';

void main() {
  test('blocks closed live first', () {
    final decision = checkLivePlayerEntry(
      status: _status(status: 'CLOSED', blindType: 'ABROAD'),
      hasCheatKey: true,
      hasNaverMembership: true,
    );

    expect(decision.blockReason, LivePlayerEntryBlockReason.closed);
  });

  test('blocks abroad blind type first', () {
    final decision = checkLivePlayerEntry(
      status: _status(
        blindType: 'ABROAD',
        adult: true,
        membershipBenefitType: 'MEMBER_ONLY',
      ),
      hasCheatKey: false,
      hasNaverMembership: false,
    );

    expect(decision.blockReason, LivePlayerEntryBlockReason.abroad);
  });

  test('blocks any non-null non-abroad blind type as restricted', () {
    final decision = checkLivePlayerEntry(
      status: _status(blindType: 'PRIVATE'),
      hasCheatKey: true,
      hasNaverMembership: true,
    );

    expect(decision.blockReason, LivePlayerEntryBlockReason.restricted);
  });

  test('blocks adult live when user adult status is not adult', () {
    final decision = checkLivePlayerEntry(
      status: _status(adult: true, userAdultStatus: 'NOT_ADULT'),
      hasCheatKey: true,
      hasNaverMembership: true,
    );

    expect(decision.blockReason, LivePlayerEntryBlockReason.adult);
  });

  test('blocks member-only live without cheat key or naver membership', () {
    final decision = checkLivePlayerEntry(
      status: _status(membershipBenefitType: 'MEMBER_ONLY'),
      hasCheatKey: false,
      hasNaverMembership: false,
    );

    expect(decision.blockReason, LivePlayerEntryBlockReason.membership);
  });

  test('allows live when all entry conditions pass', () {
    final decision = checkLivePlayerEntry(
      status: _status(
        adult: true,
        userAdultStatus: 'ADULT',
        membershipBenefitType: 'MEMBER_ONLY',
      ),
      hasCheatKey: false,
      hasNaverMembership: true,
    );

    expect(decision.isAllowed, true);
  });
}

LiveStatus _status({
  String status = 'OPEN',
  bool adult = false,
  String? blindType,
  String? membershipBenefitType,
  String? userAdultStatus,
}) {
  return LiveStatus(
    title: 'Live',
    status: status,
    concurrentUserCount: 100,
    adult: adult,
    blindType: blindType,
    membershipBenefitType: membershipBenefitType,
    userAdultStatus: userAdultStatus,
  );
}
