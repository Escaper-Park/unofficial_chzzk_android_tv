import 'package:freezed_annotation/freezed_annotation.dart';

import '../../chat/model/chat.dart';

part 'vod_chat.freezed.dart';
part 'vod_chat.g.dart';

@freezed
class VodChat with _$VodChat {
  const factory VodChat({
    required String chatChannelId,
    required int messageTime,
    required String userIdHash,
    required String content,
    @JsonKey(fromJson: extrasFromJson) required Extras? extras,
    required int messageTypeCode,
    required String messageStatusType,
    @JsonKey(fromJson: profileFromJson) required Profile? profile,
    required int playerMessageTime,
  }) = _VodChat;

  factory VodChat.fromJson(Map<String, dynamic> json) =>
      _$VodChatFromJson(json);
}

@freezed
class VodChatResponse with _$VodChatResponse {
  const factory VodChatResponse({
    required int? nextPlayerMessageTime,
    required List<VodChat>? previousVideoChats,
    required List<VodChat>? videoChats,
  }) = _VodChatResponse;

  factory VodChatResponse.fromJson(Map<String, dynamic> json) =>
      _$VodChatResponseFromJson(json);
}
