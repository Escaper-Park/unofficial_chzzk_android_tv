import '../../channel/model/channel.dart';

class PopularChannel {
  final int liveId;
  final String liveTitle;
  final String? liveImageUrl;
  final int concurrentUserCount;
  final bool adult;
  final String? categoryValue;
  final ChannelWithPersonalData channel;

  PopularChannel({
    required this.liveId,
    required this.liveTitle,
    required this.liveImageUrl,
    required this.concurrentUserCount,
    required this.adult,
    required this.categoryValue,
    required this.channel,
  });

  factory PopularChannel.fromJson(Map<String, dynamic> json) {
    return PopularChannel(
      liveId: json['liveId'],
      liveTitle: json['liveTitle'],
      liveImageUrl: json['liveImageUrl'],
      concurrentUserCount: json['concurrentUserCount'],
      adult: json['adult'],
      categoryValue: json['categoryValue'],
      channel: ChannelWithPersonalData.fromJson(json['channel']),
    );
  }
}
