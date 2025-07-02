import 'package:freezed_annotation/freezed_annotation.dart';

import 'extras.dart';
import 'profile.dart';

part 'recent_chat.g.dart';
part 'recent_chat.freezed.dart';

@freezed
class RecentChat with _$RecentChat {
  const factory RecentChat({
    required String svcid,
    required List<RecentChatBdy> bdy,
    required int cmd,
    required int retCode,
    String? retMsg,
    String? tid,
    String? cid,
  }) = _RecentChat;

  factory RecentChat.fromJson(Map<String, dynamic> json) =>
      _$RecentChatFromJson(json);
}

@freezed
class RecentChatBdy with _$RecentChatBdy {
  const factory RecentChatBdy({
    required List<RecentChatMsg> messageList,
    int? userCount,
  }) = _RecentChatBdy;

  factory RecentChatBdy.fromJson(Map<String, dynamic> json) =>
      _$RecentChatBdyFromJson(json);
}

@freezed
class RecentChatMsg with _$RecentChatMsg {
  const factory RecentChatMsg({
    required String serviceId,
    required String channelId,
    required int messageTime,
    required String userId,
    @ProfileConverter() Profile? profile,
    required String content,
    @ExtrasConverter() Extras? extras,
    required int memberCount,
    required int messageTypeCode,
    required String messageStatusType,
    required int createTime,
    required int updateTime,
  }) = _RecentChatMsg;

  factory RecentChatMsg.fromJson(Map<String, dynamic> json) =>
      _$RecentChatMsgFromJson(json);
}

