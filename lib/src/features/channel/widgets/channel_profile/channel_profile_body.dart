import 'package:flutter/material.dart';

class ChannelProfileBody extends StatelessWidget {
  const ChannelProfileBody({
    super.key,
    required this.channelName,
    required this.profileImageWithLiveBadge,
    required this.followerCounter,
    required this.channelDescription,
  });

  final Widget channelName;
  final Widget profileImageWithLiveBadge;
  final Widget followerCounter;
  final Widget channelDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        profileImageWithLiveBadge,
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              channelName,
              const SizedBox(height: 5.0),
              followerCounter,
              const SizedBox(height: 5.0),
              channelDescription,
            ],
          ),
        ),
      ],
    );
  }
}
