import 'package:freezed_annotation/freezed_annotation.dart';

import '../../chat/model/extras.dart';
import '../../chat/model/profile.dart';

part 'vod_chat.g.dart';
part 'vod_chat.freezed.dart';

@freezed
class VodChat with _$VodChat {
  const factory VodChat({
    required String chatChannelId,
    required int messageTime,
    required String userIdHash,
    required String content,
    @ExtrasConverter() Extras? extras,
    required int messageTypeCode,
    required String messageStatusType,
    @ProfileConverter() Profile? profile,
    required int playerMessageTime,
  }) = _VodChat;

  factory VodChat.fromJson(Map<String, dynamic> json) =>
      _$VodChatFromJson(json);
}
