import 'package:freezed_annotation/freezed_annotation.dart';

import '../../chat/model/extras.dart';
import '../../chat/model/profile.dart';

part 'vod_chat.g.dart';
part 'vod_chat.freezed.dart';

@freezed
@JsonSerializable()
class VodChat with _$VodChat {
  final String chatChannelId;
  final int messageTime;
  final String userIdHash;
  final String content;
  @ExtrasConverter()
  final Extras? extras;
  final int messageTypeCode;
  final String messageStatusType;
  @ProfileConverter()
  final Profile? profile;
  final int playerMessageTime;

  VodChat({
    required this.chatChannelId,
    required this.messageTime,
    required this.userIdHash,
    required this.content,
    required this.extras,
    required this.messageTypeCode,
    required this.messageStatusType,
    required this.profile,
    required this.playerMessageTime,
  });

  factory VodChat.fromJson(Map<String, dynamic> json) =>
      _$VodChatFromJson(json);

  Map<String, dynamic> toJson() => _$VodChatToJson(this);
}
