import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/network.dart';
import '../../../auth/presentation/bloc/auth_session_bloc.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_design.dart';
import 'live_player_live_status_poller.dart';
import 'live_player_playback_session_controller.dart';
import 'live_player_video_surface.dart';

class LivePlayerSurface extends StatelessWidget {
  const LivePlayerSurface({
    super.key,
    required this.slot,
    required this.playbackPaused,
    required this.muted,
    required this.mixWithOthers,
    required this.watchEventEnabled,
    required this.playbackSessionController,
  });

  final LivePlayerSlotState slot;
  final bool playbackPaused;
  final bool muted;
  final bool mixWithOthers;
  final bool watchEventEnabled;
  final LivePlayerPlaybackSessionController playbackSessionController;

  @override
  Widget build(BuildContext context) {
    final playbackUri = slot.playbackUri;
    if (playbackUri == null) {
      return const ColoredBox(
        color: LivePlayerScreenDesign.backgroundColor,
      );
    }
    final bloc = context.read<LivePlayerBloc>();
    final playbackHttpHeaders = _livePlayerPlaybackHttpHeaders(
      _livePlayerCookieHeader(context),
    );

    return LivePlayerLiveStatusPoller(
      slotId: slot.slotId,
      channelId: slot.channelId,
      pollingPaused: playbackPaused,
      onRefreshRequested: ({required slotId, required channelId}) {
        bloc.add(
          LivePlayerEvent.liveStatusRefreshRequested(
            slotId: slotId,
            channelId: channelId,
          ),
        );
      },
      child: LivePlayerVideoSurface(
        playbackUri: playbackUri,
        playbackHttpHeaders: playbackHttpHeaders,
        videoViewType: slot.videoViewType,
        playbackPaused: playbackPaused,
        muted: muted,
        mixWithOthers: mixWithOthers,
        watchEventEnabled: watchEventEnabled,
        playbackSessionController: playbackSessionController,
        channelId: slot.channelId,
        liveId: slot.liveId,
        liveOpenDate: slot.openDate,
        liveTokens: slot.liveTokens,
        postWatchEvent:
            (({
              required channelId,
              required liveId,
              required watchEventType,
              required sessionId,
              required eventDurationSeconds,
              required positionSeconds,
              required awtSeconds,
              required liveTokens,
              required autoPlay,
              required radioMode,
              required allowStaleSlotTarget,
            }) {
              return bloc.postWatchEventForSlot(
                slotId: slot.slotId,
                channelId: channelId,
                liveId: liveId,
                watchEventType: watchEventType,
                sessionId: sessionId,
                eventDurationSeconds: eventDurationSeconds,
                positionSeconds: positionSeconds,
                awtSeconds: awtSeconds,
                liveTokens: liveTokens,
                autoPlay: autoPlay,
                radioMode: radioMode,
                allowStaleSlotTarget: allowStaleSlotTarget,
              );
            }),
        onReady: () {
          bloc.add(
            LivePlayerEvent.playbackReady(
              slotId: slot.slotId,
              playbackUri: playbackUri,
            ),
          );
        },
        onEnded: () {
          bloc.add(
            LivePlayerEvent.playbackEnded(
              slotId: slot.slotId,
              playbackUri: playbackUri,
            ),
          );
        },
        onFailure: () {
          bloc.add(
            LivePlayerEvent.playbackFailed(
              slotId: slot.slotId,
              playbackUri: playbackUri,
            ),
          );
        },
      ),
    );
  }
}

String? _livePlayerCookieHeader(BuildContext context) {
  try {
    return context.read<AuthSessionBloc>().cookieHeader;
  } on Object {
    return null;
  }
}

Map<String, String> _livePlayerPlaybackHttpHeaders(String? cookieHeader) {
  final headers = <String, String>{
    'Accept': 'application/x-mpegURL, application/vnd.apple.mpegurl, */*',
    'User-Agent': ChzzkDioFactory.userAgent,
  };
  if (cookieHeader != null && cookieHeader.isNotEmpty) {
    headers['Cookie'] = cookieHeader;
  }

  return Map.unmodifiable(headers);
}
