import 'package:freezed_annotation/freezed_annotation.dart';

import 'extras.dart';
import 'profile.dart';

part 'chat.g.dart';
part 'chat.freezed.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    required String svcid,
    required String ver,
    required List<ChatBdy> bdy,
    required int
        cmd, // only use 93101, 93102. Don't accept 93006 to avoid duplicated displaying missions.
    String? tid,
    String? cid,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}

@freezed
class ChatBdy with _$ChatBdy {
  const factory ChatBdy({
    required String svcid,
    required String cid,
    required int mbrCnt,
    required String uid,
    @ProfileConverter() Profile? profile,
    required String msg,
    required int msgTypeCode,
    required String msgStatusType,
    @ExtrasConverter() Extras? extras,
    required int ctime,
    required int utime,
    required int msgTime,
  }) = _ChatBdy;

  factory ChatBdy.fromJson(Map<String, dynamic> json) =>
      _$ChatBdyFromJson(json);
}
