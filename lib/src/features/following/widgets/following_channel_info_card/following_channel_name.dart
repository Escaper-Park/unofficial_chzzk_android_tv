part of '../following_channel_info_card.dart';

class _FollowingChannelName extends StatelessWidget {
  const _FollowingChannelName({
    required this.channel,
  });

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: ChannelNameWithVerifiedMark(channel: channel),
    );
  }
}
