import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/data/dtos/live_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/data/mappers/live_mapper.dart';

void main() {
  test('maps live list dto into domain page', () {
    const dto = LiveListDto(
      data: [
        LiveDto(
          liveId: 1,
          liveTitle: 'Live',
          liveImageUrl: 'https://example.com/live.png',
          concurrentUserCount: 100,
          liveCategoryValue: 'Game',
          watchPartyTag: 'party',
          watchPartyType: 'Normal',
          membershipBenefitType: 'MEMBER_ONLY',
          channel: LiveChannelDto(
            channelId: 'channel',
            channelName: 'Streamer',
            verifiedMark: true,
          ),
        ),
      ],
      page: LivePageDto(
        next: LivePageNextDto(
          concurrentUserCount: 50,
          liveId: 2,
        ),
      ),
      size: 18,
    );

    final page = livePageFromDto(dto);

    expect(page.size, 18);
    expect(page.items.single.liveId, 1);
    expect(page.items.single.title, 'Live');
    expect(page.items.single.thumbnailImageUrl, 'https://example.com/live.png');
    expect(page.items.single.categoryValue, 'Game');
    expect(page.items.single.watchPartyTag, 'party');
    expect(page.items.single.watchPartyType, 'Normal');
    expect(page.items.single.membershipBenefitType, 'MEMBER_ONLY');
    expect(page.items.single.channel?.channelName, 'Streamer');
    expect(page.items.single.channel?.verifiedMark, true);
    expect(page.cursor?.concurrentUserCount, 50);
    expect(page.cursor?.liveId, 2);
  });

  test('maps live status dto playback flags into domain status', () {
    const dto = LiveStatusDto(
      liveTitle: 'Live',
      status: 'OPEN',
      concurrentUserCount: 100,
      adult: false,
      watchPartyTag: 'party',
      watchPartyType: 'RS',
      krOnlyViewing: true,
      timeMachineActive: true,
      membershipBenefitType: 'MEMBER_ONLY',
      liveTokenList: ['token-a', 'token-b'],
    );

    final status = liveStatusFromDto(dto);

    expect(status.watchPartyTag, 'party');
    expect(status.watchPartyType, 'RS');
    expect(status.krOnlyViewing, true);
    expect(status.timeMachineActive, true);
    expect(status.membershipBenefitType, 'MEMBER_ONLY');
    expect(status.liveTokenList, ['token-a', 'token-b']);
    expect(status.liveTokens, ['token-a', 'token-b']);
  });

  test('maps live detail dto playback flags into domain detail', () {
    const dto = LiveDetailDto(
      liveId: 1,
      liveTitle: 'Live',
      status: 'OPEN',
      concurrentUserCount: 100,
      adult: false,
      watchPartyTag: 'party',
      watchPartyType: 'Normal',
      timeMachineActive: true,
      timeMachinePlayback: true,
      membershipBenefitType: 'MEMBER_ONLY',
    );

    final detail = liveDetailFromDto(dto);

    expect(detail.watchPartyTag, 'party');
    expect(detail.watchPartyType, 'Normal');
    expect(detail.timeMachineActive, true);
    expect(detail.timeMachinePlayback, true);
    expect(detail.membershipBenefitType, 'MEMBER_ONLY');
  });
}
