import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel.freezed.dart';
part 'channel.g.dart';

@freezed
class Channel with _$Channel {
  const factory Channel({
    required String channelId,
    required String channelName,
    required String? channelImageUrl,
    required bool verifiedMark,
    required int? followerCount,
    required String? channelDescription,
    required bool? openLive,
    required PersonalData? personalData,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

@freezed
class PersonalData with _$PersonalData {
  const factory PersonalData({
    required bool privateUserBlock,
  }) = _PersonalData;

  factory PersonalData.fromJson(Map<String, dynamic> json) =>
      _$PersonalDataFromJson(json);
}

@freezed
class PopularChannelPage with _$PopularChannelPage {
  factory PopularChannelPage({
    required int? concurrentUserCount,
    required int? liveId,
  }) = _PopularChannelPage;

  factory PopularChannelPage.fromJson(Map<String, dynamic> json) =>
      _$PopularChannelPageFromJson(json);
}

@freezed
class PopularChannelResponse with _$PopularChannelResponse {
  const factory PopularChannelResponse({
    required List<Channel>? channels,
    required PopularChannelPage? page,
  }) = _PopularChannelResponse;
}
