import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.g.dart';
part 'profile.freezed.dart';

@freezed
@JsonSerializable()
class Profile with _$Profile {
  final String? userIdHash;
  final String? nickname;
  final String?
      userRoleCode; // "common-user", "streaming_channel_manager", "streaming_chat_manager",
  final ChzzkBadge? badge;
  final bool? verifiedMark;

  Profile({
    this.userIdHash,
    this.nickname,
    this.userRoleCode,
    this.badge,
    required this.verifiedMark,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@freezed
@JsonSerializable()
class ChzzkBadge with _$ChzzkBadge {
  final String? imageUrl;

  ChzzkBadge({this.imageUrl});

  factory ChzzkBadge.fromJson(Map<String, dynamic> json) =>
      _$ChzzkBadgeFromJson(json);
  Map<String, dynamic> toJson() => _$ChzzkBadgeToJson(this);
}

class ProfileConverter implements JsonConverter<Profile, String> {
  const ProfileConverter();

  @override
  Profile fromJson(String json) {
    final profileJson = jsonDecode(json);

    return Profile.fromJson(profileJson);
  }

  @override
  String toJson(Profile object) {
    final jsonMap = object.toJson();

    return jsonEncode(jsonMap);
  }
}
