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
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}
