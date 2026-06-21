import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dtos.freezed.dart';
part 'user_dtos.g.dart';

@freezed
abstract class UserStatusDto with _$UserStatusDto {
  const factory UserStatusDto({
    required bool hasProfile,
    required bool loggedIn,
    String? nickname,
    @Default(false) bool officialNotiAgree,
    String? officialNotiAgreeUpdatedDate,
    @Default(<String>[]) List<String> penalties,
    String? profileImageUrl,
    String? userIdHash,
    @Default(false) bool verifiedMark,
  }) = _UserStatusDto;

  factory UserStatusDto.fromJson(Map<String, dynamic> json) =>
      _$UserStatusDtoFromJson(json);
}
