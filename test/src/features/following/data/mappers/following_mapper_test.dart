import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/data/dtos/following_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/data/mappers/following_mapper.dart';

void main() {
  test('maps following channel page', () {
    const dto = FollowingChannelListDto(
      followingList: [
        FollowingChannelDto(
          channelId: 'fallback',
          channel: FollowingChannelInfoDto(
            channelId: 'channel',
            channelName: 'Streamer',
            channelImageUrl: 'https://example.com/channel.png',
            verifiedMark: true,
            personalData: FollowingChannelPersonalDataDto(
              following: FollowingChannelPersonalFollowingDto(
                following: true,
                notification: true,
                followDate: '2026-06-06',
              ),
            ),
          ),
          streamer: FollowingStreamerDto(openLive: true),
        ),
      ],
      totalCount: 1,
      totalPage: 1,
    );

    final page = followingChannelPageFromDto(dto);

    expect(page.totalCount, 1);
    expect(page.totalPages, 1);
    expect(page.items.single.channelId, 'channel');
    expect(page.items.single.channelName, 'Streamer');
    expect(
      page.items.single.channelImageUrl,
      'https://example.com/channel.png',
    );
    expect(page.items.single.verifiedMark, true);
    expect(page.items.single.personalData?.following, true);
    expect(page.items.single.personalData?.notification, true);
    expect(page.items.single.personalData?.followDate, '2026-06-06');
    expect(page.items.single.openLive, true);
  });

  test('maps following live page', () {
    const dto = FollowingLiveListDto(
      followingList: [
        FollowingChannelDto(
          channel: FollowingChannelInfoDto(
            channelId: 'channel',
            channelName: 'Streamer',
          ),
          liveInfo: FollowingLiveInfoDto(
            liveId: 1,
            liveTitle: 'Live',
            liveImageUrl: 'https://example.com/live.png',
            concurrentUserCount: 100,
            liveCategoryValue: 'Game',
            tags: ['tag'],
            watchPartyTag: 'party',
            watchPartyType: 'Normal',
          ),
        ),
      ],
      totalCount: 1,
      totalLiveCount: 1,
      totalPage: 1,
    );

    final page = followingLivePageFromDto(dto);

    expect(page.totalCount, 1);
    expect(page.totalLiveCount, 1);
    expect(page.totalPages, 1);
    expect(page.items.single.channelId, 'channel');
    expect(page.items.single.liveInfo?.liveId, 1);
    expect(page.items.single.liveInfo?.title, 'Live');
    expect(
      page.items.single.liveInfo?.thumbnailImageUrl,
      'https://example.com/live.png',
    );
    expect(page.items.single.liveInfo?.concurrentUserCount, 100);
    expect(page.items.single.liveInfo?.categoryValue, 'Game');
    expect(page.items.single.liveInfo?.tags, ['tag']);
    expect(page.items.single.liveInfo?.watchPartyTag, 'party');
    expect(page.items.single.liveInfo?.watchPartyType, 'Normal');
    expect(page.items.single.openLive, true);
  });
}
