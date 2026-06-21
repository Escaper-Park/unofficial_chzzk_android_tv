import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/data/dtos/home_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/home/data/mappers/home_mapper.dart';

void main() {
  test('maps home main dto top lives into domain entities', () {
    const dto = HomeMainDto(
      topLives: [
        HomeLiveDto(
          liveId: 10,
          liveTitle: 'Live',
          concurrentUserCount: 100,
          adult: true,
          tags: ['tag'],
          openDate: '2026-06-06T12:00:00+09:00',
          liveCategoryValue: 'Game',
          blindType: 'ABROAD',
          watchPartyTag: 'party',
          watchPartyType: 'RS',
          membershipBenefitType: 'MEMBER_ONLY',
          channel: HomeChannelDto(
            channelId: 'channel',
            channelName: 'Streamer',
            verifiedMark: true,
          ),
        ),
      ],
    );

    final topLives = homeTopLivesFromDto(dto);

    expect(topLives.single.liveId, 10);
    expect(topLives.single.title, 'Live');
    expect(topLives.single.adult, true);
    expect(topLives.single.tags, ['tag']);
    expect(topLives.single.openDate, '2026-06-06T12:00:00+09:00');
    expect(topLives.single.categoryValue, 'Game');
    expect(topLives.single.blindType, 'ABROAD');
    expect(topLives.single.watchPartyTag, 'party');
    expect(topLives.single.watchPartyType, 'RS');
    expect(topLives.single.membershipBenefitType, 'MEMBER_ONLY');
    expect(topLives.single.channel?.channelName, 'Streamer');
    expect(topLives.single.channel?.verifiedMark, true);
  });
}
