// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      svcid: json['svcid'] as String,
      ver: json['ver'] as String,
      bdy: (json['bdy'] as List<dynamic>)
          .map((e) => ChatBdy.fromJson(e as Map<String, dynamic>))
          .toList(),
      cmd: (json['cmd'] as num).toInt(),
      tid: json['tid'] as String?,
      cid: json['cid'] as String?,
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      'svcid': instance.svcid,
      'ver': instance.ver,
      'bdy': instance.bdy,
      'cmd': instance.cmd,
      'tid': instance.tid,
      'cid': instance.cid,
    };

_$ChatBdyImpl _$$ChatBdyImplFromJson(Map<String, dynamic> json) =>
    _$ChatBdyImpl(
      svcid: json['svcid'] as String,
      cid: json['cid'] as String,
      mbrCnt: (json['mbrCnt'] as num).toInt(),
      uid: json['uid'] as String,
      profile: profileFromJson(json['profile'] as String?),
      msg: json['msg'] as String,
      msgTypeCode: (json['msgTypeCode'] as num).toInt(),
      msgStatusType: json['msgStatusType'] as String,
      extras: extrasFromJson(json['extras'] as String?),
      ctime: (json['ctime'] as num).toInt(),
      utime: (json['utime'] as num).toInt(),
      msgTid: json['msgTid'],
      msgTime: (json['msgTime'] as num).toInt(),
    );

Map<String, dynamic> _$$ChatBdyImplToJson(_$ChatBdyImpl instance) =>
    <String, dynamic>{
      'svcid': instance.svcid,
      'cid': instance.cid,
      'mbrCnt': instance.mbrCnt,
      'uid': instance.uid,
      'profile': instance.profile,
      'msg': instance.msg,
      'msgTypeCode': instance.msgTypeCode,
      'msgStatusType': instance.msgStatusType,
      'extras': instance.extras,
      'ctime': instance.ctime,
      'utime': instance.utime,
      'msgTid': instance.msgTid,
      'msgTime': instance.msgTime,
    };

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      userIdHash: json['userIdHash'] as String?,
      nickname: json['nickname'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      userRoleCode: json['userRoleCode'] as String?,
      badge: json['badge'] == null
          ? null
          : Badge.fromJson(json['badge'] as Map<String, dynamic>),
      title: json['title'] == null
          ? null
          : ChatTitle.fromJson(json['title'] as Map<String, dynamic>),
      verifiedMark: json['verifiedMark'] as bool?,
      activityBadges: (json['activityBadges'] as List<dynamic>?)
          ?.map((e) => ActivityBadge.fromJson(e as Map<String, dynamic>))
          .toList(),
      streamingProperty: json['streamingProperty'] == null
          ? null
          : StreamingProperty.fromJson(
              json['streamingProperty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'userIdHash': instance.userIdHash,
      'nickname': instance.nickname,
      'profileImageUrl': instance.profileImageUrl,
      'userRoleCode': instance.userRoleCode,
      'badge': instance.badge,
      'title': instance.title,
      'verifiedMark': instance.verifiedMark,
      'activityBadges': instance.activityBadges,
      'streamingProperty': instance.streamingProperty,
    };

_$ExtrasImpl _$$ExtrasImplFromJson(Map<String, dynamic> json) => _$ExtrasImpl(
      chatType: json['chatType'] as String?,
      osType: json['osType'] as String?,
      streamingChannelId: json['streamingChannelId'] as String?,
      emojis: json['emojis'],
      extraToken: json['extraToken'] as String?,
      durationTime: (json['durationTime'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      tierNo: (json['tierNo'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ExtrasImplToJson(_$ExtrasImpl instance) =>
    <String, dynamic>{
      'chatType': instance.chatType,
      'osType': instance.osType,
      'streamingChannelId': instance.streamingChannelId,
      'emojis': instance.emojis,
      'extraToken': instance.extraToken,
      'durationTime': instance.durationTime,
      'month': instance.month,
      'tierNo': instance.tierNo,
    };

_$ChatTitleImpl _$$ChatTitleImplFromJson(Map<String, dynamic> json) =>
    _$ChatTitleImpl(
      name: json['name'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$$ChatTitleImplToJson(_$ChatTitleImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
    };

_$BadgeImpl _$$BadgeImplFromJson(Map<String, dynamic> json) => _$BadgeImpl(
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$BadgeImplToJson(_$BadgeImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
    };

_$ActivityBadgeImpl _$$ActivityBadgeImplFromJson(Map<String, dynamic> json) =>
    _$ActivityBadgeImpl(
      badgeNo: (json['badgeNo'] as num).toInt(),
      badgeId: json['badgeId'] as String?,
      imageUrl: json['imageUrl'] as String?,
      activated: json['activated'] as bool,
    );

Map<String, dynamic> _$$ActivityBadgeImplToJson(_$ActivityBadgeImpl instance) =>
    <String, dynamic>{
      'badgeNo': instance.badgeNo,
      'badgeId': instance.badgeId,
      'imageUrl': instance.imageUrl,
      'activated': instance.activated,
    };

_$StreamingPropertyImpl _$$StreamingPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$StreamingPropertyImpl(
      subscription: json['subscription'] == null
          ? null
          : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
      nicknameColor:
          NicknameColor.fromJson(json['nicknameColor'] as Map<String, dynamic>),
      realTimeDonationRanking: json['realTimeDonationRanking'] == null
          ? null
          : RealTimeDonationRanking.fromJson(
              json['realTimeDonationRanking'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StreamingPropertyImplToJson(
        _$StreamingPropertyImpl instance) =>
    <String, dynamic>{
      'subscription': instance.subscription,
      'nicknameColor': instance.nicknameColor,
      'realTimeDonationRanking': instance.realTimeDonationRanking,
    };

_$SubscriptionImpl _$$SubscriptionImplFromJson(Map<String, dynamic> json) =>
    _$SubscriptionImpl(
      accumulativeMonth: (json['accumulativeMonth'] as num).toInt(),
      tier: (json['tier'] as num).toInt(),
      badge: json['badge'] == null
          ? null
          : Badge.fromJson(json['badge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SubscriptionImplToJson(_$SubscriptionImpl instance) =>
    <String, dynamic>{
      'accumulativeMonth': instance.accumulativeMonth,
      'tier': instance.tier,
      'badge': instance.badge,
    };

_$NicknameColorImpl _$$NicknameColorImplFromJson(Map<String, dynamic> json) =>
    _$NicknameColorImpl(
      colorCode: json['colorCode'] as String,
    );

Map<String, dynamic> _$$NicknameColorImplToJson(_$NicknameColorImpl instance) =>
    <String, dynamic>{
      'colorCode': instance.colorCode,
    };

_$RealTimeDonationRankingImpl _$$RealTimeDonationRankingImplFromJson(
        Map<String, dynamic> json) =>
    _$RealTimeDonationRankingImpl(
      badge: Badge.fromJson(json['badge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RealTimeDonationRankingImplToJson(
        _$RealTimeDonationRankingImpl instance) =>
    <String, dynamic>{
      'badge': instance.badge,
    };

_$WeeklyRankImpl _$$WeeklyRankImplFromJson(Map<String, dynamic> json) =>
    _$WeeklyRankImpl(
      userIdHash: json['userIdHash'] as String,
      nickName: json['nickName'] as String,
      verifiedMark: json['verifiedMark'] as bool,
      donationAmount: (json['donationAmount'] as num).toInt(),
      ranking: (json['ranking'] as num).toInt(),
    );

Map<String, dynamic> _$$WeeklyRankImplToJson(_$WeeklyRankImpl instance) =>
    <String, dynamic>{
      'userIdHash': instance.userIdHash,
      'nickName': instance.nickName,
      'verifiedMark': instance.verifiedMark,
      'donationAmount': instance.donationAmount,
      'ranking': instance.ranking,
    };
