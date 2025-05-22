part of '../live_container.dart';

class _LiveChannelName extends StatelessWidget {
  const _LiveChannelName(this.channel);

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return ChannelNameWithVerifiedMark(
      channel: channel,
      fontSize: 12.0,
    );
  }
}
