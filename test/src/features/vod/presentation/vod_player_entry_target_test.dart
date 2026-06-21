import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/presentation/vod_player_entry_target.dart';

void main() {
  test('builds a vod player target from item data first', () {
    final target = vodPlayerEntryTargetFromCard(
      item: _vod(
        videoId: 'item-video',
        channel: const VodChannel(
          channelId: 'item-channel',
          channelName: 'Item Channel',
          verifiedMark: true,
        ),
      ),
      detail: _detail(
        videoId: 'detail-video',
        channel: const VodChannel(
          channelId: 'detail-channel',
          channelName: 'Detail Channel',
          verifiedMark: false,
        ),
      ),
      startPositionSeconds: 42,
    );

    expect(target.videoNo, 1);
    expect(target.videoId, 'item-video');
    expect(target.title, 'VOD title');
    expect(target.thumbnailImageUrl, 'item-thumb');
    expect(target.channelId, 'item-channel');
    expect(target.channelName, 'Item Channel');
    expect(target.channelVerified, isTrue);
    expect(target.startPositionSeconds, 42);
    expect(target.detail, isNotNull);
  });

  test('falls back to vod detail identity data when item data is absent', () {
    final target = vodPlayerEntryTargetFromCard(
      item: _vod(videoId: null, channel: null),
      detail: _detail(
        videoId: 'detail-video',
        channel: const VodChannel(
          channelId: 'detail-channel',
          channelName: 'Detail Channel',
          verifiedMark: true,
        ),
      ),
      startPositionSeconds: 0,
    );

    expect(target.videoId, 'detail-video');
    expect(target.channelId, 'detail-channel');
    expect(target.channelName, 'Detail Channel');
    expect(target.channelVerified, isTrue);
  });
}

Vod _vod({
  required String? videoId,
  required VodChannel? channel,
}) {
  return Vod(
    videoNo: 1,
    videoId: videoId,
    title: 'VOD title',
    videoType: 'REPLAY',
    publishDate: '2026-06-15 20:00:00',
    thumbnailImageUrl: 'item-thumb',
    duration: 600,
    readCount: 1,
    publishDateAt: 1,
    adult: false,
    livePv: 0,
    channel: channel,
  );
}

VodDetail _detail({
  required String? videoId,
  required VodChannel? channel,
}) {
  return VodDetail(
    videoNo: 1,
    videoId: videoId,
    title: 'Detail title',
    videoType: 'REPLAY',
    publishDate: '2026-06-15 20:00:00',
    duration: 600,
    readCount: 1,
    publishDateAt: 1,
    adult: false,
    livePv: 0,
    chapterActive: false,
    channel: channel,
    videoChatEnabled: true,
  );
}
