import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/data/dtos/channel_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/data/mappers/channel_mapper.dart';

void main() {
  test('maps channel detail dto into domain detail', () {
    const dto = ChannelDetailDto(
      channelId: 'channel',
      channelName: 'Streamer',
      channelDescription: 'Description',
      followerCount: 123,
      openLive: true,
      verifiedMark: true,
      personalData: ChannelPersonalDataDto(
        following: ChannelPersonalFollowingDto(
          following: true,
          notification: true,
        ),
      ),
    );

    final detail = channelDetailFromDto(dto);

    expect(detail.channelId, 'channel');
    expect(detail.channelName, 'Streamer');
    expect(detail.description, 'Description');
    expect(detail.followerCount, 123);
    expect(detail.openLive, true);
    expect(detail.verifiedMark, true);
    expect(detail.personalData?.following?.following, true);
    expect(detail.personalData?.following?.notification, true);
  });

  test('parses channel my info dto and maps following fields', () {
    final dto = ChannelMyInfoDto.fromJson({
      'channelId': 'c2bb58fbc38e1ce5da52bc1cb9a62cc5',
      'userRole': 'USER',
      'permissions': <String>[],
      'following': {
        'following': true,
        'notification': false,
        'followDate': '2026-06-14 01:57:58',
      },
      'cheatKey': false,
      'naverMembership': false,
      'restriction': {
        'restrict': false,
        'origin': false,
        'restrictReleaseState': 'NONE',
      },
      'privateUserBlock': false,
      'subscription': {
        'subscribing': false,
        'subscriptionDisabled': true,
      },
      'playerAdFlag': {
        'preRoll': true,
        'midRoll': true,
        'postRoll': true,
      },
    });

    final myInfo = channelMyInfoFromDto(dto);

    expect(myInfo.channelId, 'c2bb58fbc38e1ce5da52bc1cb9a62cc5');
    expect(myInfo.following?.following, true);
    expect(myInfo.following?.notification, false);
    expect(myInfo.following?.followDate, '2026-06-14 01:57:58');
    expect(myInfo.cheatKey, false);
    expect(myInfo.naverMembership, false);
  });

  test('fails fast when channel detail identity is missing', () {
    expect(
      () => ChannelDetailDto.fromJson(const <String, dynamic>{
        'channelName': 'Streamer',
      }),
      throwsA(isA<TypeError>()),
    );
    expect(
      () => ChannelDetailDto.fromJson(const <String, dynamic>{
        'channelId': 'channel',
      }),
      throwsA(isA<TypeError>()),
    );
  });

  test('fails fast when channel my-info identity is missing', () {
    expect(
      () => ChannelMyInfoDto.fromJson(const <String, dynamic>{}),
      throwsA(isA<TypeError>()),
    );
  });
}
