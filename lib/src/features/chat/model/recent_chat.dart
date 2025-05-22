import 'package:freezed_annotation/freezed_annotation.dart';

import 'extras.dart';
import 'profile.dart';

part 'recent_chat.g.dart';
part 'recent_chat.freezed.dart';

@freezed
@JsonSerializable()
class RecentChat with _$RecentChat {
  final String svcid;
  final List<RecentChatBdy> bdy;
  final int cmd;
  final int retCode;
  final String? retMsg;
  final String? tid;
  final String? cid;

  RecentChat({
    required this.svcid,
    required this.bdy,
    required this.cmd,
    required this.retCode,
    this.retMsg,
    this.tid,
    this.cid,
  });
  
  factory RecentChat.fromJson(Map<String, dynamic> json) =>
      _$RecentChatFromJson(json);

  Map<String, dynamic> toJson() => _$RecentChatToJson(this);
}

@freezed
@JsonSerializable()
class RecentChatBdy with _$RecentChatBdy {
  final List<RecentChatMsg> messageList;
  final int? userCount;

  RecentChatBdy({
    required this.messageList,
    this.userCount,
  });

  factory RecentChatBdy.fromJson(Map<String, dynamic> json) =>
      _$RecentChatBdyFromJson(json);

  Map<String, dynamic> toJson() => _$RecentChatBdyToJson(this);
}

@freezed
@JsonSerializable()
class RecentChatMsg with _$RecentChatMsg {
  final String serviceId;
  final String channelId;
  final int messageTime;
  final String userId;
  @ProfileConverter()
  final Profile? profile;
  final String content;
  @ExtrasConverter()
  final Extras? extras;
  final int memberCount;
  final int messageTypeCode;
  final String messageStatusType;
  final int createTime;
  final int updateTime;

  RecentChatMsg({
    required this.serviceId,
    required this.channelId,
    required this.messageTime,
    required this.userId,
    this.profile,
    required this.content,
    this.extras,
    required this.memberCount,
    required this.messageTypeCode,
    required this.messageStatusType,
    required this.createTime,
    required this.updateTime,
  });

  factory RecentChatMsg.fromJson(Map<String, dynamic> json) =>
      _$RecentChatMsgFromJson(json);

  Map<String, dynamic> toJson() => _$RecentChatMsgToJson(this);
}
