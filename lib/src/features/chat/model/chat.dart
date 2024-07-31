import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';



@freezed
class Chat with _$Chat {
  const factory Chat({
    required String svcid,
    required String ver,
    required List<ChatBdy> bdy,
    required int cmd,
    required String? tid,
    required String? cid,
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
    required Profile? profile,
    required String msg,
    required int msgTypeCode,
    required String msgStatusType,
    required Extras extras,
    required int ctime,
    required int utime,
    required Object? msgTid,
    required int msgTime,
  }) = _ChatBdy;

  factory ChatBdy.fromJson(Map<String, dynamic> json) =>
      _$ChatBdyFromJson(json);
}

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String userIdHash,
    required String nickname,
    required String? profileImageUrl,
    required String
        userRoleCode, // "common-user", "streaming_channel_manager", "streaming_chat_manager",
    required Badge? badge,
    required ChatTitle? title, //
    required bool verifiedMark,
    required List<ActivityBadge>? activityBadges,
    required StreamingProperty? streamingProperty,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@freezed
class Extras with _$Extras {
  const factory Extras({
    required String chatType,
    required String osType,
    required String streamingChannelId,
    required Map<String, String>? emojis,
    required String extraToken,
    required int? durationTime,
    required int? month,
    required int? tierNo,

    /// Donation
    required bool? isAnonymous,
    required String? payType,
    required int? payAmount,
    required String? nickname,
    required String? donationType,
    required List<WeeklyRank>? weeklyRankList,
    required WeeklyRank? donationUserWeeklyRank,
  }) = _Extras;

  factory Extras.fromJson(Map<String, dynamic> json) => _$ExtrasFromJson(json);
}

@freezed
class ChatTitle with _$ChatTitle {
  const factory ChatTitle({
    required String name,
    required String color,
  }) = _ChatTitle;

  factory ChatTitle.fromJson(Map<String, dynamic> json) =>
      _$ChatTitleFromJson(json);
}

@freezed
class Badge with _$Badge {
  const factory Badge({
    required String imageUrl,
  }) = _Badge;

  factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);
}

@freezed
class ActivityBadge with _$ActivityBadge {
  const factory ActivityBadge({
    required int badgeNo,
    required String badgeId, // "donation_newbie", "subscrption_founder"
    required String imageUrl,
    required bool activated,
  }) = _ActivityBadge;

  factory ActivityBadge.fromJson(Map<String, dynamic> json) =>
      _$ActivityBadgeFromJson(json);
}

@freezed
class StreamingProperty with _$StreamingProperty {
  const factory StreamingProperty({
    required Subscription? subscription,
    required NicknameColor nicknameColor,
    required RealTimeDonationRanking? realTimeDonationRanking,
  }) = _StreamingProperty;

  factory StreamingProperty.fromJson(Map<String, dynamic> json) =>
      _$StreamingPropertyFromJson(json);
}

@freezed
class Subscription with _$Subscription {
  const factory Subscription({
    required int accumulativeMonth,
    required int tier,
    required Badge badge,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}

@freezed
class NicknameColor with _$NicknameColor {
  const factory NicknameColor({
    required String colorCode,
  }) = _NicknameColor;

  factory NicknameColor.fromJson(Map<String, dynamic> json) =>
      _$NicknameColorFromJson(json);
}

@freezed
class RealTimeDonationRanking with _$RealTimeDonationRanking {
  const factory RealTimeDonationRanking({
    required Badge badge,
  }) = _RealTimeDonationRanking;

  factory RealTimeDonationRanking.fromJson(Map<String, dynamic> json) =>
      _$RealTimeDonationRankingFromJson(json);
}

@freezed
class WeeklyRank with _$WeeklyRank {
  const factory WeeklyRank({
    required String userIdHash,
    required String nickName,
    required bool verifiedMark,
    required int donationAmount,
    required int ranking,
  }) = _WeeklyRank;

  factory WeeklyRank.fromJson(Map<String, dynamic> json) =>
      _$WeeklyRankFromJson(json);
}
