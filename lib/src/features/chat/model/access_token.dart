import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_token.g.dart';
part 'access_token.freezed.dart';

@freezed
class AccessToken with _$AccessToken {
  const factory AccessToken({
    required String accessToken,
    required bool realNameAuth,
    required String extraToken,
  }) = _AccessToken;

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);
}

