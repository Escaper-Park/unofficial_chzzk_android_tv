import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel.freezed.dart';
part 'channel.g.dart';

@freezed
class Channel with _$Channel {
  factory Channel({
    // required
    required String channelId,
    required String channelName,
    required String? channelImageUrl,
    required bool verifiedMark,
    // optional
    required PersonalData? personalData,
    required int? followerCount,
    required bool? openLive,
    required String? channelType,
    required String? channelDescription,
    // required bool? subscriptionAvailability,
    // required SubscriptionPaymentAvailability? subscriptionPaymentAvailability,
    // required bool? adMonetizationAvailability,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

@freezed
class PersonalData with _$PersonalData {
  const factory PersonalData({
    required PersonalFollowing? following,
    required bool privateUserBlock,
    required bool? subscription,
  }) = _PersonalData;

  factory PersonalData.fromJson(Map<String, dynamic> json) =>
      _$PersonalDataFromJson(json);
}

@freezed
class PersonalFollowing with _$PersonalFollowing {
  const factory PersonalFollowing({
    required bool following,
    required bool notification,
    required String? followDate,
  }) = _PersonalFollowing;

  factory PersonalFollowing.fromJson(Map<String, dynamic> json) =>
      _$PersonalFollowingFromJson(json);
}
