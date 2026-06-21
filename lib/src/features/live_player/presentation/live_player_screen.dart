import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../category/domain/repositories/category_repository.dart';
import '../../channel/domain/repositories/channel_repository.dart';
import '../../following/domain/repositories/following_repository.dart';
import '../../group/domain/repositories/group_repository.dart';
import '../../live/domain/repositories/live_repository.dart';
import '../../settings/domain/repositories/settings_preferences_repository.dart';
import '../domain/use_cases/resolve_live_playback_uri.dart';
import 'bloc/live_player_bloc.dart';
import 'live_player_route_target.dart';
import 'view/live_player_view.dart';

class LivePlayerScreen extends StatelessWidget {
  const LivePlayerScreen({
    super.key,
    this.initialTarget,
  });

  final LivePlayerInitialTarget? initialTarget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LivePlayerBloc(
          initialTarget: initialTarget,
          liveRepository: context.read<LiveRepository>(),
          channelRepository: context.read<ChannelRepository>(),
          followingRepository: context.read<FollowingRepository>(),
          categoryRepository: context.read<CategoryRepository>(),
          groupRepository: context.read<GroupRepository>(),
          loadLivePlaybackPlaylistText: context
              .read<LoadLivePlaybackPlaylistText>(),
          settingsPreferencesRepository: context
              .read<SettingsPreferencesRepository>(),
        )..add(LivePlayerEvent.started(initialTarget: initialTarget));
      },
      child: const LivePlayerView(),
    );
  }
}
