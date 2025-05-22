import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_token.g.dart';
part 'access_token.freezed.dart';

@freezed
@JsonSerializable()
class AccessToken with _$AccessToken {
  final String accessToken;
  final bool realNameAuth;
  final String extraToken;

  AccessToken({
    required this.accessToken,
    required this.realNameAuth,
    required this.extraToken,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);
  
  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}
