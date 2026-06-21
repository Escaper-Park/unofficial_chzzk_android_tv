import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../bloc/channel_bloc.dart';
import '../../../channel_screen_string.dart';

class ChannelFollowAction extends StatelessWidget {
  const ChannelFollowAction({
    super.key,
    required this.state,
    required this.onPressed,
  });

  final ChannelState state;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TvTabActionButton(
      text: state.isFollowing
          ? ChannelScreenString.following
          : ChannelScreenString.follow,
      icon: state.isFollowing
          ? Icons.favorite_rounded
          : Icons.favorite_border_rounded,
      enabled: state.canUseFollowAction,
      onPressed: onPressed,
    );
  }
}

class ChannelGroupAction extends StatelessWidget {
  const ChannelGroupAction({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TvTabActionButton(
      text: ChannelScreenString.addToGroup,
      icon: Icons.group_add_rounded,
      onPressed: onPressed,
    );
  }
}

class ChannelSortAction extends StatelessWidget {
  const ChannelSortAction({
    super.key,
    required this.state,
    required this.onPressed,
  });

  final ChannelState state;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TvTabActionButton(
      text: ChannelScreenString.sortLabel(state),
      icon: Icons.tune_rounded,
      onPressed: onPressed,
    );
  }
}
