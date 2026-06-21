import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/use_cases/watching_history_vod_mapper.dart';
import 'package:unofficial_chzzk_android_tv/src/features/watching_history/domain/entities/watching_history.dart';

void main() {
  test('maps a watching history item to a VOD card model', () {
    final vod = vodFromWatchingHistoryItem(
      const WatchingHistoryItem(
        historyNo: 'history',
        channelId: 'history-channel',
        videoNo: 1,
        timeline: 42,
        contentType: 'VIDEO',
        video: WatchingHistoryVideo(
          videoNo: 1,
          videoId: 'video-id',
          title: 'History VOD',
          videoType: 'REPLAY',
          publishDate: '2026-06-20',
          thumbnailImageUrl: 'https://example.com/thumb.jpg',
          duration: 60,
          readCount: 100,
          publishDateAt: 123,
          categoryValue: 'Game',
          adult: false,
          livePv: 7,
          tags: ['tag'],
          channel: WatchingHistoryChannel(
            channelId: 'channel',
            channelName: 'Channel',
            channelImageUrl: 'https://example.com/channel.jpg',
            verifiedMark: true,
          ),
          blindType: 'NONE',
          watchTimeline: 24,
        ),
      ),
    );

    expect(vod, isNotNull);
    expect(vod!.videoNo, 1);
    expect(vod.videoId, 'video-id');
    expect(vod.title, 'History VOD');
    expect(vod.thumbnailImageUrl, 'https://example.com/thumb.jpg');
    expect(vod.tags, ['tag']);
    expect(vod.channel?.channelId, 'channel');
    expect(vod.channel?.verifiedMark, isTrue);
    expect(vod.blindType, 'NONE');
    expect(vod.watchTimeline, 42);
  });

  test('returns null when the history item has no video payload', () {
    final vod = vodFromWatchingHistoryItem(
      const WatchingHistoryItem(
        historyNo: 'history',
        channelId: 'history-channel',
        videoNo: 1,
        timeline: 42,
        contentType: 'VIDEO',
      ),
    );

    expect(vod, isNull);
  });
}
