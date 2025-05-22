part of '../../following_screen.dart';

class _FollowingChannelDetail extends StatelessWidget {
  const _FollowingChannelDetail({
    required this.asyncChannel,
    required this.followingListFSN,
    required this.channelDetailFSN,
  });

  final AsyncValue<Channel?> asyncChannel;

  /// To request focus between FollowingList <-> ChannelDetailScreen
  final FocusScopeNode followingListFSN;
  final FocusScopeNode channelDetailFSN;

  @override
  Widget build(BuildContext context) {
    return switch (asyncChannel) {
      AsyncData(:final value) => value == null
          ? _centerText('채널을 선택해주세요')
          : ChannelScreen(
              baseRoute: AppRoute.following,
              channel: value,
              channelFSN: channelDetailFSN,
              leftFSN: followingListFSN,
            ),
      AsyncError() => _centerText('채널 정보를 불러올 수 없습니다'),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _centerText(String text) => CenteredText(text: text);
}
