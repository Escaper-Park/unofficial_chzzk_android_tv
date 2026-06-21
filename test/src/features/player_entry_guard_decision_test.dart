import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/player_entry_guard_decision.dart';

void main() {
  test('uses the shared player entry guard precedence', () {
    final decision = checkPlayerEntryGuard(
      status: 'closed',
      blockClosedStatus: true,
      blindType: 'ABROAD',
      adult: true,
      userAdultStatus: null,
      membershipBenefitType: 'MEMBER_ONLY',
      canAccessMembershipBenefit: false,
      playableId: null,
      requirePlayableId: true,
    );

    expect(decision.blockReason, PlayerEntryBlockReason.closed);
  });

  test('blocks abroad blind content before generic restrictions', () {
    final decision = checkPlayerEntryGuard(
      blindType: ' abroad ',
      adult: false,
      canAccessMembershipBenefit: true,
    );

    expect(decision.blockReason, PlayerEntryBlockReason.abroad);
  });

  test('blocks adult content when the user is not adult verified', () {
    final decision = checkPlayerEntryGuard(
      adult: true,
      userAdultStatus: null,
      canAccessMembershipBenefit: true,
    );

    expect(decision.blockReason, PlayerEntryBlockReason.adult);
  });

  test('blocks member-only content when membership access is unavailable', () {
    final decision = checkPlayerEntryGuard(
      adult: false,
      membershipBenefitType: 'member_only',
      canAccessMembershipBenefit: false,
    );

    expect(decision.blockReason, PlayerEntryBlockReason.membership);
  });

  test('blocks missing playable ids only when requested', () {
    final decision = checkPlayerEntryGuard(
      adult: false,
      canAccessMembershipBenefit: true,
      requirePlayableId: true,
    );

    expect(decision.blockReason, PlayerEntryBlockReason.missingPlayableId);
  });

  test('allows unrestricted content', () {
    final decision = checkPlayerEntryGuard(
      adult: false,
      canAccessMembershipBenefit: true,
    );

    expect(decision.isAllowed, isTrue);
  });
}
