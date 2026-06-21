import '../../../player_entry_guard_decision.dart';
import '../entities/vod_detail.dart';
import '../entities/vod_feed.dart';

enum VodPlayerEntryBlockReason {
  abroad,
  restricted,
  adult,
  membership,
  missingVideoId,
}

final class VodPlayerEntryDecision {
  const VodPlayerEntryDecision.allowed() : blockReason = null;

  const VodPlayerEntryDecision.blocked(this.blockReason);

  final VodPlayerEntryBlockReason? blockReason;

  bool get isAllowed => blockReason == null;
}

VodPlayerEntryDecision checkVodPlayerEntry({
  required Vod vod,
  required bool isSignedIn,
  required bool hasCheatKey,
  required bool hasNaverMembership,
}) {
  return _checkVodPlayerEntryFields(
    blindType: vod.blindType,
    adult: vod.adult,
    userAdultStatus: vod.userAdultStatus,
    membershipBenefitType: vod.membershipBenefitType,
    videoId: vod.videoId,
    isSignedIn: isSignedIn,
    hasCheatKey: hasCheatKey,
    hasNaverMembership: hasNaverMembership,
  );
}

VodPlayerEntryDecision checkVodDetailPlayerEntry({
  required VodDetail vod,
  required bool isSignedIn,
  required bool hasCheatKey,
  required bool hasNaverMembership,
  String? fallbackVideoId,
}) {
  return _checkVodPlayerEntryFields(
    blindType: vod.blindType,
    adult: vod.adult,
    userAdultStatus: vod.userAdultStatus,
    membershipBenefitType: vod.membershipBenefitType,
    videoId: vod.videoId ?? fallbackVideoId,
    isSignedIn: isSignedIn,
    hasCheatKey: hasCheatKey,
    hasNaverMembership: hasNaverMembership,
  );
}

bool requiresVodMembershipBenefit(Vod vod) {
  return requiresPlayerEntryMembershipBenefit(vod.membershipBenefitType);
}

bool requiresVodDetailMembershipBenefit(VodDetail vod) {
  return requiresPlayerEntryMembershipBenefit(vod.membershipBenefitType);
}

VodPlayerEntryDecision _checkVodPlayerEntryFields({
  required String? blindType,
  required bool adult,
  required String? userAdultStatus,
  required String? membershipBenefitType,
  required String? videoId,
  required bool isSignedIn,
  required bool hasCheatKey,
  required bool hasNaverMembership,
}) {
  return _vodDecisionFromGuard(
    checkPlayerEntryGuard(
      blindType: blindType,
      adult: adult,
      userAdultStatus: userAdultStatus,
      membershipBenefitType: membershipBenefitType,
      canAccessMembershipBenefit:
          isSignedIn && (hasCheatKey || hasNaverMembership),
      playableId: videoId,
      requirePlayableId: true,
    ),
  );
}

VodPlayerEntryDecision _vodDecisionFromGuard(
  PlayerEntryGuardDecision decision,
) {
  return switch (decision.blockReason) {
    null => const VodPlayerEntryDecision.allowed(),
    PlayerEntryBlockReason.abroad => const VodPlayerEntryDecision.blocked(
      VodPlayerEntryBlockReason.abroad,
    ),
    PlayerEntryBlockReason.restricted ||
    PlayerEntryBlockReason.closed => const VodPlayerEntryDecision.blocked(
      VodPlayerEntryBlockReason.restricted,
    ),
    PlayerEntryBlockReason.adult => const VodPlayerEntryDecision.blocked(
      VodPlayerEntryBlockReason.adult,
    ),
    PlayerEntryBlockReason.membership => const VodPlayerEntryDecision.blocked(
      VodPlayerEntryBlockReason.membership,
    ),
    PlayerEntryBlockReason.missingPlayableId =>
      const VodPlayerEntryDecision.blocked(
        VodPlayerEntryBlockReason.missingVideoId,
      ),
  };
}
