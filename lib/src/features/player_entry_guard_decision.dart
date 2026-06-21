enum PlayerEntryBlockReason {
  closed,
  abroad,
  restricted,
  adult,
  membership,
  missingPlayableId,
}

final class PlayerEntryGuardDecision {
  const PlayerEntryGuardDecision.allowed() : blockReason = null;

  const PlayerEntryGuardDecision.blocked(this.blockReason);

  final PlayerEntryBlockReason? blockReason;

  bool get isAllowed => blockReason == null;
}

PlayerEntryGuardDecision checkPlayerEntryGuard({
  String? status,
  bool blockClosedStatus = false,
  String? blindType,
  required bool adult,
  String? userAdultStatus,
  String? membershipBenefitType,
  required bool canAccessMembershipBenefit,
  String? playableId,
  bool requirePlayableId = false,
}) {
  if (blockClosedStatus && _normalized(status) == _closedStatus) {
    return const PlayerEntryGuardDecision.blocked(
      PlayerEntryBlockReason.closed,
    );
  }

  final normalizedBlindType = _normalized(blindType);
  if (normalizedBlindType == _blindTypeAbroad) {
    return const PlayerEntryGuardDecision.blocked(
      PlayerEntryBlockReason.abroad,
    );
  }

  if (normalizedBlindType != null) {
    return const PlayerEntryGuardDecision.blocked(
      PlayerEntryBlockReason.restricted,
    );
  }

  if (adult && _normalized(userAdultStatus) != _adultStatus) {
    return const PlayerEntryGuardDecision.blocked(
      PlayerEntryBlockReason.adult,
    );
  }

  if (requiresPlayerEntryMembershipBenefit(membershipBenefitType) &&
      !canAccessMembershipBenefit) {
    return const PlayerEntryGuardDecision.blocked(
      PlayerEntryBlockReason.membership,
    );
  }

  if (requirePlayableId && _normalized(playableId) == null) {
    return const PlayerEntryGuardDecision.blocked(
      PlayerEntryBlockReason.missingPlayableId,
    );
  }

  return const PlayerEntryGuardDecision.allowed();
}

bool requiresPlayerEntryMembershipBenefit(String? membershipBenefitType) {
  return _normalized(membershipBenefitType) == _membershipBenefitType;
}

String? _normalized(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  return trimmed.toUpperCase();
}

const _blindTypeAbroad = 'ABROAD';
const _closedStatus = 'CLOSED';
const _adultStatus = 'ADULT';
const _membershipBenefitType = 'MEMBER_ONLY';
