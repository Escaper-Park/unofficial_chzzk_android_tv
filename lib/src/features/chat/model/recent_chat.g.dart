// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecentChatImpl _$$RecentChatImplFromJson(Map<String, dynamic> json) =>
    _$RecentChatImpl(
      svcid: json['svcid'] as String,
      bdy: RecentChatBdy.fromJson(json['bdy'] as Map<String, dynamic>),
      cmd: (json['cmd'] as num).toInt(),
      retCode: (json['retCode'] as num).toInt(),
      retMsg: (json['retMsg'] as num).toInt(),
      tid: json['tid'] as String?,
      cid: json['cid'] as String?,
    );

Map<String, dynamic> _$$RecentChatImplToJson(_$RecentChatImpl instance) =>
    <String, dynamic>{
      'svcid': instance.svcid,
      'bdy': instance.bdy,
      'cmd': instance.cmd,
      'retCode': instance.retCode,
      'retMsg': instance.retMsg,
      'tid': instance.tid,
      'cid': instance.cid,
    };

_$RecentChatBdyImpl _$$RecentChatBdyImplFromJson(Map<String, dynamic> json) =>
    _$RecentChatBdyImpl(
      messageList: (json['messageList'] as List<dynamic>)
          .map((e) => RecentChatMsg.fromJson(e as Map<String, dynamic>))
          .toList(),
      userCount: (json['userCount'] as num?)?.toInt(),
      notice: json['notice'] == null
          ? null
          : Notice.fromJson(json['notice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RecentChatBdyImplToJson(_$RecentChatBdyImpl instance) =>
    <String, dynamic>{
      'messageList': instance.messageList,
      'userCount': instance.userCount,
      'notice': instance.notice,
    };

_$RecentChatMsgImpl _$$RecentChatMsgImplFromJson(Map<String, dynamic> json) =>
    _$RecentChatMsgImpl(
      serviceId: json['serviceId'] as String,
      channelId: json['channelId'] as String,
      messageTime: (json['messageTime'] as num).toInt(),
      userId: json['userId'] as String,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
      content: json['content'] as String,
      extras: Extras.fromJson(json['extras'] as Map<String, dynamic>),
      memberCount: (json['memberCount'] as num).toInt(),
      messageTypeCode: (json['messageTypeCode'] as num).toInt(),
      messageStatusType: json['messageStatusType'] as String,
      createTime: (json['createTime'] as num).toInt(),
      updateTime: (json['updateTime'] as num).toInt(),
      msgTid: json['msgTid'],
    );

Map<String, dynamic> _$$RecentChatMsgImplToJson(_$RecentChatMsgImpl instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'channelId': instance.channelId,
      'messageTime': instance.messageTime,
      'userId': instance.userId,
      'profile': instance.profile,
      'content': instance.content,
      'extras': instance.extras,
      'memberCount': instance.memberCount,
      'messageTypeCode': instance.messageTypeCode,
      'messageStatusType': instance.messageStatusType,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'msgTid': instance.msgTid,
    };

_$NoticeImpl _$$NoticeImplFromJson(Map<String, dynamic> json) => _$NoticeImpl(
      serviceId: json['serviceId'] as String,
      channelId: json['channelId'] as String,
      messageTime: (json['messageTime'] as num).toInt(),
      userId: json['userId'] as String,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
      content: json['content'] as String,
      extras: Extras.fromJson(json['extras'] as Map<String, dynamic>),
      messageTypeCode: (json['messageTypeCode'] as num).toInt(),
      createTime: (json['createTime'] as num).toInt(),
    );

Map<String, dynamic> _$$NoticeImplToJson(_$NoticeImpl instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'channelId': instance.channelId,
      'messageTime': instance.messageTime,
      'userId': instance.userId,
      'profile': instance.profile,
      'content': instance.content,
      'extras': instance.extras,
      'messageTypeCode': instance.messageTypeCode,
      'createTime': instance.createTime,
    };
