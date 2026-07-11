import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/network/network.dart';
import '../../../auth/presentation/bloc/auth_session_bloc.dart';
import '../../../chat/domain/repositories/chat_repository.dart';
import '../../../chat/presentation/player_chat.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../bloc/vod_player_bloc.dart';
import '../vod_player_screen_design.dart';
import 'vod_player_chat_layer.dart';
import 'vod_player_chat_replay_controller.dart';
import 'vod_player_chat_shortcuts.dart';
import 'vod_player_playback_snapshot.dart';
import 'vod_player_video_surface.dart';
import 'vod_player_watch_event_reporter.dart';

class VodPlayerSurface extends HookWidget {
  const VodPlayerSurface({
    super.key,
    required this.slot,
    required this.playbackPaused,
    required this.muted,
    required this.playbackSpeed,
    required this.seekRequest,
    required this.playbackSnapshot,
    required this.chatPresentationModeIndex,
    required this.chatSettings,
  });

  final VodPlayerSlotState slot;
  final bool playbackPaused;
  final bool muted;
  final double playbackSpeed;
  final VodPlayerSeekRequest? seekRequest;
  final ValueNotifier<VodPlayerPlaybackSnapshot> playbackSnapshot;
  final int chatPresentationModeIndex;
  final ChatSettings chatSettings;

  @override
  Widget build(BuildContext context) {
    final videoNo = slot.videoNo;
    if (videoNo == null) {
      return const ColoredBox(
        color: VodPlayerScreenDesign.backgroundColor,
      );
    }

    final watchEventEnabled = context.select<AuthSessionBloc, bool>(
      (bloc) => bloc.state.hasRequiredCookies,
    );
    final vodPlayerBloc = context.read<VodPlayerBloc>();
    final watchEventReporter = useMemoized(
      () {
        final channelId = slot.channelId;
        if (!watchEventEnabled ||
            channelId == null ||
            channelId.isEmpty ||
            slot.durationSeconds <= 0) {
          return null;
        }

        return VodPlayerWatchEventReporter(
          channelId: channelId,
          videoNo: videoNo,
          durationSeconds: slot.durationSeconds,
          postWatchEvent:
              ({
                required channelId,
                required videoNo,
                required watchEventType,
                required awtSeconds,
                required positionSeconds,
                required sessionId,
                required eventDurationSeconds,
                required totalLengthSeconds,
              }) {
                return vodPlayerBloc.postWatchEventForSlot(
                  slotId: slot.slotId,
                  channelId: channelId,
                  videoNo: videoNo,
                  watchEventType: watchEventType,
                  awtSeconds: awtSeconds,
                  positionSeconds: positionSeconds,
                  sessionId: sessionId,
                  eventDurationSeconds: eventDurationSeconds,
                  totalLengthSeconds: totalLengthSeconds,
                  allowStaleSlotTarget:
                      watchEventType ==
                      VodPlayerWatchEventReporter.watchEndedEventType,
                );
              },
        );
      },
      [
        watchEventEnabled,
        slot.channelId,
        slot.durationSeconds,
        slot.slotId,
        videoNo,
        vodPlayerBloc,
      ],
    );
    useEffect(() {
      return () {
        watchEventReporter?.end(
          positionSeconds: playbackSnapshot.value.position.inSeconds,
          reportPauseIfActive: false,
        );
        unawaited(watchEventReporter?.flush());
      };
    }, [watchEventReporter]);

    final playbackUri = slot.playbackUri;
    if (playbackUri == null) {
      return const ColoredBox(
        color: VodPlayerScreenDesign.backgroundColor,
      );
    }
    final playbackHttpHeaders = _vodPlayerPlaybackHttpHeaders(
      context.read<AuthSessionBloc>().cookieHeader,
    );

    final detail = slot.detail;
    final chatController = useMemoized(
      () => VodPlayerChatReplayController(
        videoNo: videoNo,
        isChatEnabled: detail?.videoChatEnabled ?? false,
        chatChannelId: detail?.videoChatChannelId,
        fetchPage: context.read<ChatRepository>().fetchVideoChats,
        initialPresentationMode: PlayerChatPresentationMode.fromSettingsIndex(
          chatPresentationModeIndex,
        ),
      ),
      [videoNo, detail?.videoChatEnabled, detail?.videoChatChannelId],
    );
    useEffect(() => chatController.dispose, [chatController]);
    useEffect(() {
      chatController.setPresentationMode(
        PlayerChatPresentationMode.fromSettingsIndex(
          chatPresentationModeIndex,
        ),
      );

      return null;
    }, [chatController, chatPresentationModeIndex]);
    final chatLayer = isVodChatAvailable(detail)
        ? VodPlayerChatLayer(
            controller: chatController,
            chatSettings: chatSettings,
          )
        : null;

    return PlayerChatSingleViewLayout(
      playback: VodPlayerVideoSurface(
        playbackUri: playbackUri,
        playbackHttpHeaders: playbackHttpHeaders,
        videoViewType: slot.videoViewType,
        playbackPaused: playbackPaused,
        muted: muted,
        playbackSpeed: playbackSpeed,
        initialPosition: slot.startPosition,
        watchEventReporter: watchEventReporter,
        seekRequest: seekRequest,
        chatReplayController: chatController,
        onReady: () {
          context.read<VodPlayerBloc>().add(
            VodPlayerEvent.playbackReady(
              slotId: slot.slotId,
              playbackUri: playbackUri,
            ),
          );
        },
        onFailure: () {
          context.read<VodPlayerBloc>().add(
            VodPlayerEvent.playbackFailed(
              slotId: slot.slotId,
              playbackUri: playbackUri,
            ),
          );
        },
        onPositionChanged: (position, duration) {
          final snapshot = VodPlayerPlaybackSnapshot(
            position: position,
            duration: duration,
          );
          playbackSnapshot.value = snapshot;
          context.read<VodPlayerBloc>().add(
            VodPlayerEvent.playbackPositionChanged(
              slotId: slot.slotId,
              playbackUri: playbackUri,
              position: snapshot.position,
              duration: snapshot.duration,
            ),
          );
        },
        onEnded: (position, duration) {
          context.read<VodPlayerBloc>().add(
            VodPlayerEvent.playbackEnded(
              slotId: slot.slotId,
              playbackUri: playbackUri,
              position: position,
              duration: duration,
            ),
          );
        },
      ),
      chatPresentationModeIndex: chatPresentationModeIndex,
      chatSettings: chatSettings,
      chat: chatLayer,
    );
  }
}

Map<String, String> _vodPlayerPlaybackHttpHeaders(String? cookieHeader) {
  final headers = <String, String>{
    'Accept': 'application/x-mpegURL, application/vnd.apple.mpegurl, */*',
    'User-Agent': ChzzkDioFactory.userAgent,
  };
  if (cookieHeader != null && cookieHeader.isNotEmpty) {
    headers['Cookie'] = cookieHeader;
  }

  return Map.unmodifiable(headers);
}
