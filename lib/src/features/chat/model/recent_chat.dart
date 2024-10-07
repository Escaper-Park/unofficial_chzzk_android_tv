import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat.dart';

part 'recent_chat.freezed.dart';
part 'recent_chat.g.dart';

@freezed
class RecentChat with _$RecentChat {
  factory RecentChat({
    required String svcid,
    required RecentChatBdy bdy,
    required int cmd,
    required int retCode,
    required String? retMsg,
    required String? tid,
    required String? cid,
  }) = _RecentChat;

  factory RecentChat.fromJson(Map<String, dynamic> json) =>
      _$RecentChatFromJson(json);
}

@freezed
class RecentChatBdy with _$RecentChatBdy {
  factory RecentChatBdy({
    required List<RecentChatMsg> messageList,
    required int? userCount,
    // required Notice? notice,
  }) = _RecentChatBdy;

  factory RecentChatBdy.fromJson(Map<String, dynamic> json) =>
      _$RecentChatBdyFromJson(json);
}

@freezed
class RecentChatMsg with _$RecentChatMsg {
  factory RecentChatMsg({
    required String serviceId,
    required String channelId,
    required int messageTime,
    required String userId,
    @JsonKey(fromJson: profileFromJson) required Profile? profile,
    required String content,
    @JsonKey(fromJson: extrasFromJson) required Extras? extras,
    required int memberCount,
    required int messageTypeCode,
    required String messageStatusType,
    required int createTime,
    required int updateTime,
    required Object? msgTid,
  }) = _RecentChatMsg;

  factory RecentChatMsg.fromJson(Map<String, dynamic> json) =>
      _$RecentChatMsgFromJson(json);
}

@freezed
class Notice with _$Notice {
  factory Notice({
    required String serviceId,
    required String channelId,
    required int messageTime,
    required String userId,
    required Profile profile,
    required String content,
    required Extras extras,
    required int messageTypeCode,
    required int createTime,
  }) = _Notice;

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
}
