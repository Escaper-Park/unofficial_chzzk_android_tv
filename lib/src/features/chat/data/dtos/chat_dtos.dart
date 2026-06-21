import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_dtos.freezed.dart';
part 'chat_dtos.g.dart';

@Freezed(toStringOverride: false)
abstract class ChatAccessTokenDto with _$ChatAccessTokenDto {
  const factory ChatAccessTokenDto({
    required String accessToken,
    required String extraToken,
  }) = _ChatAccessTokenDto;

  factory ChatAccessTokenDto.fromJson(Map<String, dynamic> json) =>
      _$ChatAccessTokenDtoFromJson(json);
}

@freezed
abstract class VideoChatListDto with _$VideoChatListDto {
  const factory VideoChatListDto({
    int? nextPlayerMessageTime,
    @Default(<VideoChatMessageDto>[])
    List<VideoChatMessageDto> previousVideoChats,
    @Default(<VideoChatMessageDto>[]) List<VideoChatMessageDto> videoChats,
  }) = _VideoChatListDto;

  factory VideoChatListDto.fromJson(Map<String, dynamic> json) =>
      _$VideoChatListDtoFromJson(json);
}

@freezed
abstract class VideoChatMessageDto with _$VideoChatMessageDto {
  const factory VideoChatMessageDto({
    @Default('') String chatChannelId,
    @Default('') String content,
    Object? extras,
    @Default('') String messageStatusType,
    @Default(0) int messageTime,
    @Default(0) int messageTypeCode,
    @Default(0) int playerMessageTime,
    Object? profile,
    @Default('') String userIdHash,
  }) = _VideoChatMessageDto;

  factory VideoChatMessageDto.fromJson(Map<String, dynamic> json) =>
      _$VideoChatMessageDtoFromJson(json);
}
