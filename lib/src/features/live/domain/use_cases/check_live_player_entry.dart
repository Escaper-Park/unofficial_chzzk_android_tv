import '../../../player_entry_guard_decision.dart';
import '../entities/live_status.dart';

enum LivePlayerEntryBlockReason {
  closed,
  abroad,
  restricted,
  adult,
  membership,
}

final class LivePlayerEntryDecision {
  const LivePlayerEntryDecision.allowed() : blockReason = null;

  const LivePlayerEntryDecision.blocked(this.blockReason);

  final LivePlayerEntryBlockReason? blockReason;

  bool get isAllowed => blockReason == null;
}

LivePlayerEntryDecision checkLivePlayerEntry({
  required LiveStatus status,
  required bool hasCheatKey,
  required bool hasNaverMembership,
}) {
  return _liveDecisionFromGuard(
    checkPlayerEntryGuard(
      status: status.status,
      blockClosedStatus: true,
      blindType: status.blindType,
      adult: status.adult,
      userAdultStatus: status.userAdultStatus,
      membershipBenefitType: status.membershipBenefitType,
      canAccessMembershipBenefit: hasCheatKey || hasNaverMembership,
    ),
  );
}

LivePlayerEntryDecision _liveDecisionFromGuard(
  PlayerEntryGuardDecision decision,
) {
  return switch (decision.blockReason) {
    null => const LivePlayerEntryDecision.allowed(),
    PlayerEntryBlockReason.closed => const LivePlayerEntryDecision.blocked(
      LivePlayerEntryBlockReason.closed,
    ),
    PlayerEntryBlockReason.abroad => const LivePlayerEntryDecision.blocked(
      LivePlayerEntryBlockReason.abroad,
    ),
    PlayerEntryBlockReason.restricted ||
    PlayerEntryBlockReason.missingPlayableId =>
      const LivePlayerEntryDecision.blocked(
        LivePlayerEntryBlockReason.restricted,
      ),
    PlayerEntryBlockReason.adult => const LivePlayerEntryDecision.blocked(
      LivePlayerEntryBlockReason.adult,
    ),
    PlayerEntryBlockReason.membership => const LivePlayerEntryDecision.blocked(
      LivePlayerEntryBlockReason.membership,
    ),
  };
}
