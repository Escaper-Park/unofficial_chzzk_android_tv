import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    /// UID for chat service
    required String? userIdHash,
    required String? nickname,
    required String? profileImageUrl,
    required bool? hasProfile,
    // required bool verifiedMark,
    required bool? loggedIn,
    // required List<dynamic> penalties,
    // required bool officialNotiAgree,
    // required String? officialNotiAgreeUpdatedDate,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
