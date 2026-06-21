import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_video.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/use_cases/channel_video_vod_mapper.dart';

void main() {
  test('maps channel videos to VOD card models with channel profile data', () {
    const profile = ChannelDetail(
      channelId: 'channel',
      channelName: 'Channel',
      channelImageUrl: 'https://example.com/channel.jpg',
      verifiedMark: true,
      followerCount: 100,
      description: 'description',
      openLive: false,
    );
    const video = ChannelVideo(
      videoNo: 1,
      videoId: 'video-id',
      title: 'Channel VOD',
      videoType: 'REPLAY',
      publishDate: '2026-06-20',
      thumbnailImageUrl: 'https://example.com/thumb.jpg',
      duration: 60,
      readCount: 7,
      publishDateAt: 123,
      categoryValue: 'Game',
      adult: false,
      livePv: 3,
      tags: ['tag'],
      blindType: 'NONE',
      watchTimeline: 42,
    );

    final vods = vodsFromChannelVideos([video], profile);
    final vod = vods.single;

    expect(vod.videoNo, 1);
    expect(vod.videoId, 'video-id');
    expect(vod.title, 'Channel VOD');
    expect(vod.thumbnailImageUrl, 'https://example.com/thumb.jpg');
    expect(vod.tags, ['tag']);
    expect(vod.channel?.channelId, 'channel');
    expect(vod.channel?.channelName, 'Channel');
    expect(vod.channel?.verifiedMark, isTrue);
    expect(vod.blindType, 'NONE');
    expect(vod.watchTimeline, 42);
  });
}
