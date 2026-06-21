import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_status.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/live_player_entry_target.dart';

void main() {
  test('builds a live player target from a card item', () {
    final target = livePlayerEntryTargetFromCard(
      const Live(
        liveId: 12,
        title: 'Live title',
        thumbnailImageUrl: null,
        defaultThumbnailImageUrl: 'default-thumb',
        concurrentUserCount: 100,
        adult: false,
      ),
      'channel-a',
    );

    expect(target.channelId, 'channel-a');
    expect(target.liveId, 12);
    expect(target.title, 'Live title');
    expect(target.thumbnailImageUrl, 'default-thumb');
  });

  test('builds a live player target from channel status', () {
    final target = livePlayerEntryTargetFromChannel(
      channelId: 'channel-a',
      status: const LiveStatus(
        title: 'Status title',
        status: 'OPEN',
        concurrentUserCount: 100,
        adult: false,
      ),
      title: '  ',
      thumbnailImageUrl: 'thumb',
    );

    expect(target.channelId, 'channel-a');
    expect(target.liveId, isNull);
    expect(target.title, 'Status title');
    expect(target.thumbnailImageUrl, 'thumb');
  });
}
