import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/watching_history/data/dtos/watching_history_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/watching_history/data/mappers/watching_history_mapper.dart';

void main() {
  test('maps watching history page', () {
    const dto = WatchingHistoryListDto(
      data: [
        WatchingHistoryDto(
          historyNo: 'history',
          channelId: 'channel',
          videoNo: 1,
          timeline: 30,
          contentType: 'VIDEO',
          date: '2026-06-06',
          videoResponse: WatchingHistoryVideoDto(
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
            channel: WatchingHistoryChannelDto(
              channelId: 'channel',
              channelName: 'Streamer',
              verifiedMark: true,
            ),
            watchTimeline: 30,
          ),
        ),
      ],
      page: WatchingHistoryPageDto(
        next: WatchingHistoryPageNextDto(lastTime: 123),
      ),
      size: 18,
    );

    final page = watchingHistoryPageFromDto(dto);

    expect(page.size, 18);
    expect(page.cursor?.lastTime, 123);
    expect(page.items.single.historyNo, 'history');
    expect(page.items.single.channelId, 'channel');
    expect(page.items.single.timeline, 30);
    expect(page.items.single.video?.videoNo, 1);
    expect(page.items.single.video?.title, 'Video');
    expect(
      page.items.single.video?.thumbnailImageUrl,
      'https://example.com/video.png',
    );
    expect(page.items.single.video?.categoryValue, 'Game');
    expect(page.items.single.video?.tags, ['tag']);
    expect(page.items.single.video?.channel?.channelName, 'Streamer');
    expect(page.items.single.video?.channel?.verifiedMark, true);
    expect(page.items.single.video?.watchTimeline, 30);
  });
}
