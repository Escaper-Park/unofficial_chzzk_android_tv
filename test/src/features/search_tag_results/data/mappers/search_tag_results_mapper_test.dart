import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/data/dtos/search_tag_results_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/data/mappers/search_tag_results_mapper.dart';

void main() {
  test('maps tag live page', () {
    const dto = SearchTagLiveListDto(
      data: [
        SearchTagLiveDto(
          liveId: 1,
          liveTitle: 'Live',
          liveImageUrl: 'https://example.com/live.png',
          concurrentUserCount: 100,
          liveCategoryValue: 'Game',
          tags: ['tag'],
          watchPartyTag: 'party',
          watchPartyType: 'RS',
          channel: SearchTagChannelDto(
            channelId: 'channel',
            channelName: 'Streamer',
            verifiedMark: true,
          ),
        ),
      ],
      page: SearchTagLivePageDto(
        next: SearchTagLivePageNextDto(
          concurrentUserCount: 50,
          liveId: 2,
        ),
      ),
      size: 18,
    );

    final page = searchTagLivePageFromDto(dto);

    expect(page.size, 18);
    expect(page.items.single.liveId, 1);
    expect(page.items.single.title, 'Live');
    expect(page.items.single.thumbnailImageUrl, 'https://example.com/live.png');
    expect(page.items.single.categoryValue, 'Game');
    expect(page.items.single.tags, ['tag']);
    expect(page.items.single.watchPartyTag, 'party');
    expect(page.items.single.watchPartyType, 'RS');
    expect(page.items.single.channel?.channelName, 'Streamer');
    expect(page.items.single.channel?.verifiedMark, true);
    expect(page.cursor?.concurrentUserCount, 50);
    expect(page.cursor?.liveId, 2);
  });

  test('maps tag video page', () {
    const dto = SearchTagVideoListDto(
      data: [
        SearchTagVideoDto(
          videoNo: 1,
          videoId: 'video',
          videoTitle: 'Video',
          videoType: 'REPLAY',
          publishDate: '2026-06-06',
          thumbnailImageUrl: 'https://example.com/video.png',
          duration: 60,
          readCount: 20,
          publishDateAt: 123,
          videoCategoryValue: 'Game',
          tags: ['tag'],
          channel: SearchTagChannelDto(
            channelId: 'channel',
            channelName: 'Streamer',
          ),
          watchTimeline: 30,
        ),
      ],
      page: SearchTagVideoPageDto(next: SearchTagVideoPageNextDto(start: 18)),
      size: 18,
    );

    final page = searchTagVideoPageFromDto(dto);

    expect(page.size, 18);
    expect(page.items.single.videoNo, 1);
    expect(page.items.single.videoId, 'video');
    expect(page.items.single.title, 'Video');
    expect(
      page.items.single.thumbnailImageUrl,
      'https://example.com/video.png',
    );
    expect(page.items.single.categoryValue, 'Game');
    expect(page.items.single.tags, ['tag']);
    expect(page.items.single.channel?.channelId, 'channel');
    expect(page.items.single.watchTimeline, 30);
    expect(page.cursor?.start, 18);
  });
}
