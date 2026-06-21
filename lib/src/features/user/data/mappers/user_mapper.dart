import '../../domain/entities/user_status.dart';
import '../dtos/user_dtos.dart';

UserStatus userStatusFromDto(UserStatusDto dto) {
  return CurrentUserStatus(
    hasProfile: dto.hasProfile,
    loggedIn: dto.loggedIn,
    nickname: dto.nickname,
    officialNotiAgree: dto.officialNotiAgree,
    officialNotiAgreeUpdatedDate: dto.officialNotiAgreeUpdatedDate,
    penalties: dto.penalties,
    profileImageUrl: dto.profileImageUrl,
    userIdHash: dto.userIdHash,
    verifiedMark: dto.verifiedMark,
  );
}
