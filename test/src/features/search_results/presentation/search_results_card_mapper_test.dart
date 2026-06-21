import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/domain/entities/search_results.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/presentation/view/sections/shared/search_results_card_mapper.dart';

void main() {
  test(
    'maps video restriction and watch progress fields into VOD card item',
    () {
      final item = searchResultVideoCardItem(
        const SearchVideoResult(
          channel: SearchChannel(
            channelId: 'channel-a',
            channelName: 'Channel A',
            verifiedMark: false,
            followerCount: 0,
            description: '',
            openLive: false,
          ),
          video: SearchVideo(
            videoNo: 1,
            videoId: 'video-a',
            title: 'Video A',
            videoType: 'REPLAY',
            publishDate: '2026-06-06',
            duration: 120,
            readCount: 10,
            publishDateAt: 123,
            categoryValue: 'Game',
            adult: false,
            livePv: 7,
            blindType: 'ABROAD',
            watchTimeline: 42,
          ),
        ),
      );

      expect(item.blindType, 'ABROAD');
      expect(item.watchTimeline, 42);
    },
  );
}
