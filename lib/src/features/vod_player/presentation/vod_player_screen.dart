import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../channel/domain/repositories/channel_repository.dart';
import '../../group/domain/repositories/group_repository.dart';
import '../../settings/domain/repositories/settings_preferences_repository.dart';
import '../../vod/domain/repositories/vod_repository.dart';
import '../domain/use_cases/resolve_vod_playback_uri.dart';
import 'bloc/vod_player_bloc.dart';
import 'view/vod_player_view.dart';
import 'vod_player_route_target.dart';

class VodPlayerScreen extends StatelessWidget {
  const VodPlayerScreen({
    super.key,
    this.initialTarget,
  });

  final VodPlayerInitialTarget? initialTarget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return VodPlayerBloc(
          vodRepository: context.read<VodRepository>(),
          channelRepository: context.read<ChannelRepository>(),
          groupRepository: context.read<GroupRepository>(),
          settingsPreferencesRepository: context
              .read<SettingsPreferencesRepository>(),
          loadVodPlaybackPlaylistText: context
              .read<LoadVodPlaybackPlaylistText>(),
        )..add(VodPlayerEvent.started(initialTarget: initialTarget));
      },
      child: const VodPlayerView(),
    );
  }
}
