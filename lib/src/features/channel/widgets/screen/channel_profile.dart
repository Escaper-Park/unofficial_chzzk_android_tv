part of '../../channel_screen.dart';

class _ChannelProfile extends StatelessWidget {
  /// Channel name, image, description, etc.
  const _ChannelProfile({required this.channel});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return ChannelProfileBody(
      channelName: ChannelNameWithVerifiedMark(
        channel: channel,
        fontSize: 24.0,
      ),
      profileImageWithLiveBadge:
          ChannelProfileImageWithLiveBadge(channel: channel),
      followerCounter:
          ChannelFollowerCounter(count: channel.followerCount ?? 0),
      channelDescription: ChannelDescription(
        channelDescription: channel.channelDescription ?? ' ',
      ),
    );
  }
}
