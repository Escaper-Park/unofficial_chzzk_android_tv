import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/channel_screen_string.dart';

void main() {
  test('uses channel home labels', () {
    expect(ChannelScreenString.liveNow, '라이브');
    expect(ChannelScreenString.follow, '팔로우');
    expect(ChannelScreenString.following, '팔로잉');
    expect(ChannelScreenString.confirmUnfollowTitle, '팔로우 취소');
    expect(ChannelScreenString.confirmUnfollowPrimary, '네');
    expect(ChannelScreenString.confirmUnfollowSecondary, '아니오');
    expect(
      ChannelScreenString.confirmUnfollowContent('Streamer'),
      '"Streamer" 채널의 팔로우를 취소할까요?',
    );
  });

  test('followerCount uses comma grouped full number', () {
    expect(ChannelScreenString.followerCount(999), '팔로워 999명');
    expect(ChannelScreenString.followerCount(12000), '팔로워 12,000명');
    expect(ChannelScreenString.followerCount(1234567), '팔로워 1,234,567명');
  });
}
