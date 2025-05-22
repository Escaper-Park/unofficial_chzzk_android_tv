import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@JsonSerializable()
class User with _$User {
  final bool hasProfile;

  /// UID for chat service.
  final String? userIdHash;
  final String nickname;
  final String? profileImageUrl;

  /// partner streamer
  final bool verifiedMark;

  User({
    required this.hasProfile,
    this.userIdHash,
    required this.nickname,
    this.profileImageUrl,
    required this.verifiedMark,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
