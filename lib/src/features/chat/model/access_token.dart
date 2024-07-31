import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_token.freezed.dart';
part 'access_token.g.dart';

@freezed
class AccessToken with _$AccessToken {
  const factory AccessToken({
    required String accessToken,
    required bool realNameAuth,
    required String extraToken,
    required TemporaryRestrict temporaryRestrict,
  }) = _AccessToken;

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);
}

@freezed
class TemporaryRestrict with _$TemporaryRestrict {
  const factory TemporaryRestrict({
    required bool temporaryRestrict,
    required int times,
    required int? duration,
    required int? createdTime,
  }) = _TemporaryRestrict;

  factory TemporaryRestrict.fromJson(Map<String, dynamic> json) =>
      _$TemporaryRestrictFromJson(json);
}
