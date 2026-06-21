import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/data/dtos/search_results_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/data/mappers/search_results_mapper.dart';

void main() {
  test('maps channel search result page', () {
    const dto = SearchChannelListDto(
      data: [
        SearchChannelResultDto(
          channel: SearchChannelDto(
            channelId: 'channel',
            channelName: 'Streamer',
            channelDescription: 'Description',
            verifiedMark: true,
            followerCount: 10,
            openLive: true,
          ),
          content: SearchChannelContentDto(
            live: SearchLiveDto(liveId: 1, liveTitle: 'Live'),
            videos: [SearchVideoDto(videoNo: 2, videoTitle: 'Video')],
          ),
        ),
      ],
      page: SearchPageDto(next: SearchPageNextDto(offset: 18)),
      size: 18,
      totalCount: 20,
      totalPages: 2,
    );

    final page = searchChannelResultsPageFromDto(dto);

    expect(page.size, 18);
    expect(page.totalCount, 20);
    expect(page.totalPages, 2);
    expect(page.cursor?.offset, 18);
    expect(page.items.single.channel?.channelId, 'channel');
    expect(page.items.single.channel?.verifiedMark, true);
    expect(page.items.single.content?.live?.title, 'Live');
    expect(page.items.single.content?.videos.single.title, 'Video');
  });

  test('maps video search result page', () {
    const dto = SearchVideoListDto(
      data: [
        SearchVideoResultDto(
          channel: SearchChannelDto(channelId: 'channel', channelName: 'Name'),
          video: SearchVideoDto(
            videoNo: 1,
            videoId: 'video',
            videoTitle: 'Video',
            videoType: 'REPLAY',
            publishDate: '2026-06-06',
            thumbnailImageUrl: 'https://example.com/video.png',
            duration: 60,
            readCount: 10,
            publishDateAt: 123,
            videoCategoryValue: 'Game',
            tags: ['tag'],
            blindType: 'ABROAD',
            watchTimeline: 42,
          ),
        ),
      ],
      page: SearchPageDto(next: SearchPageNextDto(offset: 36)),
      size: 18,
    );

    final page = searchVideoResultsPageFromDto(dto);

    expect(page.items.single.channel?.channelId, 'channel');
    expect(page.items.single.video?.videoNo, 1);
    expect(page.items.single.video?.title, 'Video');
    expect(page.items.single.video?.categoryValue, 'Game');
    expect(page.items.single.video?.tags, ['tag']);
    expect(page.items.single.video?.blindType, 'ABROAD');
    expect(page.items.single.video?.watchTimeline, 42);
    expect(page.cursor?.offset, 36);
  });

  test('maps live search result page', () {
    const dto = SearchLiveListDto(
      data: [
        SearchLiveResultDto(
          channel: SearchChannelDto(channelId: 'channel', channelName: 'Name'),
          live: SearchLiveDto(
            liveId: 1,
            liveTitle: 'Live',
            liveImageUrl: 'https://example.com/live.png',
            concurrentUserCount: 100,
            liveCategoryValue: 'Game',
            chatChannelId: 'chat',
            watchPartyTag: 'party',
            watchPartyType: 'Normal',
            channelId: 'channel',
          ),
        ),
      ],
      page: SearchPageDto(next: SearchPageNextDto(offset: 54)),
      size: 18,
    );

    final page = searchLiveResultsPageFromDto(dto);

    expect(page.items.single.channel?.channelId, 'channel');
    expect(page.items.single.live?.liveId, 1);
    expect(page.items.single.live?.title, 'Live');
    expect(
      page.items.single.live?.thumbnailImageUrl,
      'https://example.com/live.png',
    );
    expect(page.items.single.live?.categoryValue, 'Game');
    expect(page.items.single.live?.chatChannelId, 'chat');
    expect(page.items.single.live?.watchPartyTag, 'party');
    expect(page.items.single.live?.watchPartyType, 'Normal');
    expect(page.cursor?.offset, 54);
  });
}
