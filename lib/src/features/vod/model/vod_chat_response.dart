import 'package:freezed_annotation/freezed_annotation.dart';

import 'vod_chat.dart';

part 'vod_chat_response.g.dart';
part 'vod_chat_response.freezed.dart';

@freezed
@JsonSerializable()
class VodChatResponse with _$VodChatResponse {
  final int? nextPlayerMessageTime;
  final List<VodChat>? previousVideoChats;
  final List<VodChat>? videoChats;

  VodChatResponse({
    required this.nextPlayerMessageTime,
    required this.previousVideoChats,
    required this.videoChats,
  });

  factory VodChatResponse.fromJson(Map<String, dynamic> json) =>
      _$VodChatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VodChatResponseToJson(this);
}
