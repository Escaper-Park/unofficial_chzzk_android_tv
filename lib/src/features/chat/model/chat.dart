import 'package:freezed_annotation/freezed_annotation.dart';

import 'extras.dart';
import 'profile.dart';

part 'chat.g.dart';
part 'chat.freezed.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Chat with _$Chat {
  final String svcid;
  final String ver;
  final List<ChatBdy> bdy;
  final int
      cmd; // only use 93101, 93102. Don't accept 93006 to avoid duplicated displaying missions.
  final String? tid;
  final String? cid;

  Chat({
    required this.svcid,
    required this.ver,
    required this.bdy,
    required this.cmd,
    this.tid,
    this.cid,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}

@freezed
@JsonSerializable(explicitToJson: true)
class ChatBdy with _$ChatBdy {
  final String svcid;
  final String cid;
  final int mbrCnt;
  final String uid;
  @ProfileConverter()
  final Profile? profile;
  final String msg;
  final int msgTypeCode;
  final String msgStatusType;
  @ExtrasConverter()
  final Extras? extras;
  final int ctime;
  final int utime;
  final int msgTime;

  ChatBdy({
    required this.svcid,
    required this.cid,
    required this.mbrCnt,
    required this.uid,
    @ProfileConverter() this.profile,
    required this.msg,
    required this.msgTypeCode,
    required this.msgStatusType,
    @ExtrasConverter() this.extras,
    required this.ctime,
    required this.utime,
    required this.msgTime,
  });

  factory ChatBdy.fromJson(Map<String, dynamic> json) =>
      _$ChatBdyFromJson(json);

  Map<String, dynamic> toJson() => _$ChatBdyToJson(this);
}
