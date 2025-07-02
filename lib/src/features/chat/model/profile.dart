import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.g.dart';
part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    String? userIdHash,
    String? nickname,
    String?
        userRoleCode, // "common-user", "streaming_channel_manager", "streaming_chat_manager",
    ChzzkBadge? badge,
    required bool? verifiedMark,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@freezed
class ChzzkBadge with _$ChzzkBadge {
  const factory ChzzkBadge({String? imageUrl}) = _ChzzkBadge;

  factory ChzzkBadge.fromJson(Map<String, dynamic> json) =>
      _$ChzzkBadgeFromJson(json);
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
