import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/use_cases/check_vod_player_entry.dart';

void main() {
  test('blocks abroad blind type first', () {
    final decision = checkVodPlayerEntry(
      vod: _vod(
        blindType: 'ABROAD',
        adult: true,
        membershipBenefitType: 'MEMBER_ONLY',
        videoId: null,
      ),
      isSignedIn: true,
      hasCheatKey: true,
      hasNaverMembership: true,
    );

    expect(decision.blockReason, VodPlayerEntryBlockReason.abroad);
  });

  test('blocks any non-null non-abroad blind type as restricted', () {
    final decision = checkVodPlayerEntry(
      vod: _vod(blindType: 'PRIVATE'),
      isSignedIn: true,
      hasCheatKey: true,
      hasNaverMembership: true,
    );

    expect(decision.blockReason, VodPlayerEntryBlockReason.restricted);
  });

  test('blocks adult vod when user adult status is not adult', () {
    final decision = checkVodPlayerEntry(
      vod: _vod(adult: true, userAdultStatus: 'NOT_ADULT'),
      isSignedIn: true,
      hasCheatKey: true,
      hasNaverMembership: true,
    );

    expect(decision.blockReason, VodPlayerEntryBlockReason.adult);
  });

  test('blocks member-only vod before fetching benefits when signed out', () {
    final decision = checkVodPlayerEntry(
      vod: _vod(membershipBenefitType: 'MEMBER_ONLY'),
      isSignedIn: false,
      hasCheatKey: true,
      hasNaverMembership: true,
    );

    expect(decision.blockReason, VodPlayerEntryBlockReason.membership);
  });

  test('blocks member-only vod detail before missing video id', () {
    final decision = checkVodDetailPlayerEntry(
      vod: _detail(membershipBenefitType: 'MEMBER_ONLY', videoId: null),
      isSignedIn: false,
      hasCheatKey: false,
      hasNaverMembership: false,
    );

    expect(decision.blockReason, VodPlayerEntryBlockReason.membership);
  });

  test('allows vod detail with fallback video id', () {
    final decision = checkVodDetailPlayerEntry(
      vod: _detail(videoId: null),
      fallbackVideoId: 'card-video',
      isSignedIn: true,
      hasCheatKey: false,
      hasNaverMembership: false,
    );

    expect(decision.isAllowed, true);
  });

  test('blocks member-only vod without cheat key or naver membership', () {
    final decision = checkVodPlayerEntry(
      vod: _vod(membershipBenefitType: 'MEMBER_ONLY'),
      isSignedIn: true,
      hasCheatKey: false,
      hasNaverMembership: false,
    );

    expect(decision.blockReason, VodPlayerEntryBlockReason.membership);
  });

  test('checks missing video id last', () {
    final decision = checkVodPlayerEntry(
      vod: _vod(videoId: null),
      isSignedIn: true,
      hasCheatKey: false,
      hasNaverMembership: false,
    );

    expect(decision.blockReason, VodPlayerEntryBlockReason.missingVideoId);
  });

  test('allows vod when all entry conditions pass', () {
    final decision = checkVodPlayerEntry(
      vod: _vod(
        adult: true,
        userAdultStatus: 'ADULT',
        membershipBenefitType: 'MEMBER_ONLY',
      ),
      isSignedIn: true,
      hasCheatKey: true,
      hasNaverMembership: false,
    );

    expect(decision.isAllowed, true);
  });
}

Vod _vod({
  bool adult = false,
  String? blindType,
  String? membershipBenefitType,
  String? userAdultStatus,
  String? videoId = 'video',
}) {
  return Vod(
    videoNo: 1,
    videoId: videoId,
    title: 'Video',
    videoType: 'REPLAY',
    publishDate: '2026-06-06',
    duration: 60,
    readCount: 20,
    publishDateAt: 123,
    adult: adult,
    livePv: 0,
    blindType: blindType,
    membershipBenefitType: membershipBenefitType,
    userAdultStatus: userAdultStatus,
  );
}

VodDetail _detail({
  String? membershipBenefitType,
  String? videoId = 'video',
}) {
  return VodDetail(
    videoNo: 1,
    videoId: videoId,
    title: 'Video',
    videoType: 'REPLAY',
    publishDate: '2026-06-06',
    duration: 60,
    readCount: 20,
    publishDateAt: 123,
    adult: false,
    livePv: 0,
    chapterActive: false,
    videoChatEnabled: false,
    membershipBenefitType: membershipBenefitType,
  );
}
