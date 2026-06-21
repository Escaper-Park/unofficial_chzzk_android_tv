abstract interface class UserStatus {
  bool get hasProfile;

  bool get loggedIn;

  String? get nickname;

  bool get officialNotiAgree;

  String? get officialNotiAgreeUpdatedDate;

  List<String> get penalties;

  String? get profileImageUrl;

  String? get userIdHash;

  bool get verifiedMark;
}

final class CurrentUserStatus implements UserStatus {
  CurrentUserStatus({
    required this.hasProfile,
    required this.loggedIn,
    required this.officialNotiAgree,
    required List<String> penalties,
    required this.verifiedMark,
    this.nickname,
    this.officialNotiAgreeUpdatedDate,
    this.profileImageUrl,
    this.userIdHash,
  }) : penalties = List<String>.unmodifiable(penalties);

  @override
  final bool hasProfile;

  @override
  final bool loggedIn;

  @override
  final String? nickname;

  @override
  final bool officialNotiAgree;

  @override
  final String? officialNotiAgreeUpdatedDate;

  @override
  final List<String> penalties;

  @override
  final String? profileImageUrl;

  @override
  final String? userIdHash;

  @override
  final bool verifiedMark;
}
