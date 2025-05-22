part of '../following_channel_info_card.dart';

class _FollowingChannelInfoCardBody extends StatelessWidget {
  const _FollowingChannelInfoCardBody({
    required this.autofocus,
    required this.openLive,
    required this.onPressed,
    required this.profileImage,
    required this.channelName,
    required this.liveStatus,
  });

  final bool autofocus;
  final bool openLive;
  final VoidCallback onPressed;
  final Widget profileImage;
  final Widget channelName;
  final Widget liveStatus;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlinedButton(
      autofocus: autofocus,
      onPressed: onPressed,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          profileImage,
          const SizedBox(width: 10.0),
          // If openLive is true, Divide the channel name and current user count area
          // in a 2:1 ratio.
          Expanded(
            flex: 2,
            child: channelName,
          ),
          const SizedBox(width: 5.0),
          if (openLive)
            Expanded(
              flex: 1,
              child: liveStatus,
            ),
        ],
      ),
    );
  }
}
