import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/utils/controller_disposal_barrier.dart';
import '../../../../core/utils/periodic_callback_timer.dart';
import '../../../../core/utils/serialized_wakelock_controller.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../vod_player_screen_design.dart';
import 'vod_player_chat_replay_controller.dart';
import 'vod_player_status_surface.dart';
import 'vod_player_video_position.dart';
import 'vod_player_watch_event_reporter.dart';
import 'vod_player_watch_event_seek_hold.dart';

part 'vod_player_video_controller_factory.dart';
part 'vod_player_video_content.dart';
part 'vod_player_video_effects.dart';
part 'vod_player_video_lifecycle.dart';
part 'vod_player_video_runtime.dart';
part 'vod_player_video_runtime_bindings.dart';

const _watchEventSeekSettleDelay = Duration(seconds: 2);

final class VodPlayerSeekRequest {
  const VodPlayerSeekRequest({
    required this.serial,
    required this.position,
  });

  final int serial;
  final Duration position;
}

class VodPlayerVideoSurface extends HookWidget {
  const VodPlayerVideoSurface({
    super.key,
    required this.playbackUri,
    required this.playbackHttpHeaders,
    required this.videoViewType,
    required this.playbackPaused,
    required this.muted,
    required this.playbackSpeed,
    required this.initialPosition,
    required this.watchEventReporter,
    required this.onReady,
    required this.onFailure,
    required this.onPositionChanged,
    required this.onEnded,
    this.chatReplayController,
    this.seekRequest,
  });

  final Uri playbackUri;
  final Map<String, String> playbackHttpHeaders;
  final PlayerVideoViewType videoViewType;
  final bool playbackPaused;
  final bool muted;
  final double playbackSpeed;
  final Duration initialPosition;
  final VodPlayerWatchEventReporter? watchEventReporter;
  final VoidCallback onReady;
  final VoidCallback onFailure;
  final void Function(Duration position, Duration duration) onPositionChanged;
  final void Function(Duration position, Duration duration) onEnded;
  final VodPlayerChatReplayController? chatReplayController;
  final VodPlayerSeekRequest? seekRequest;

  @override
  Widget build(BuildContext context) {
    final playbackHttpHeadersKey = _playbackHttpHeadersKey(
      playbackHttpHeaders,
    );
    final controller = useMemoized(
      () => _videoControllerFor(
        playbackUri: playbackUri,
        playbackHttpHeaders: playbackHttpHeaders,
        videoViewType: videoViewType,
      ),
      [playbackUri, playbackHttpHeadersKey, videoViewType],
    );
    final reporter = watchEventReporter;
    final initialized = useState(false);
    final failed = useState(false);
    final ended = useState(false);
    final controllerDisposalCoordinator = useMemoized(
      () => mediaControllerDisposalCoordinator,
      const [],
    );
    final appLifecycleState = _useVodPlayerAppLifecycleState();
    final watchEventSyncTimer = useMemoized(
      PeriodicCallbackTimer.new,
      const [],
    );
    final chatSyncTimer = useMemoized(
      PeriodicCallbackTimer.new,
      const [],
    );
    final handledSeekSerial = useRef<int?>(null);
    final pendingWatchEventSeekPositionSeconds = useRef<int?>(null);
    final wakelockController = useMemoized(
      SerializedWakelockController.new,
      const [],
    );
    final watchEventSeekHold = useMemoized(
      () => VodPlayerWatchEventSeekHold(
        settleDelay: _watchEventSeekSettleDelay,
      ),
      const [],
    );
    final playbackPausedRef = useRef(playbackPaused);
    final appPlaybackSuspendedRef = useRef(false);
    final reporterRef = useRef<VodPlayerWatchEventReporter?>(reporter);
    final previousReporterRef = useRef<VodPlayerWatchEventReporter?>(reporter);
    final chatReplayControllerRef = useRef<VodPlayerChatReplayController?>(
      chatReplayController,
    );
    final onReadyRef = useRef<VoidCallback>(onReady);
    final onFailureRef = useRef<VoidCallback>(onFailure);
    final onPositionChangedRef =
        useRef<void Function(Duration position, Duration duration)>(
          onPositionChanged,
        );
    final onEndedRef =
        useRef<void Function(Duration position, Duration duration)>(onEnded);

    final runtime = _VodPlayerVideoRuntime(
      controller: controller,
      initialized: initialized,
      failed: failed,
      ended: ended,
      controllerDisposalCoordinator: controllerDisposalCoordinator,
      handledSeekSerial: handledSeekSerial,
      pendingWatchEventSeekPositionSeconds:
          pendingWatchEventSeekPositionSeconds,
      watchEventSeekHold: watchEventSeekHold,
      watchEventSyncTimer: watchEventSyncTimer,
      chatSyncTimer: chatSyncTimer,
      wakelockController: wakelockController,
      playbackPausedRef: playbackPausedRef,
      appPlaybackSuspendedRef: appPlaybackSuspendedRef,
      reporterRef: reporterRef,
      previousReporterRef: previousReporterRef,
      chatReplayControllerRef: chatReplayControllerRef,
      onReadyRef: onReadyRef,
      onFailureRef: onFailureRef,
      onPositionChangedRef: onPositionChangedRef,
      onEndedRef: onEndedRef,
      playbackPaused: playbackPaused,
      appLifecycleState: appLifecycleState,
    );

    _useVodPlayerVideoRuntimeBindings(
      runtime: runtime,
      initialPosition: initialPosition,
      playbackSpeed: playbackSpeed,
      muted: muted,
      reporter: reporter,
      chatReplayController: chatReplayController,
      onReady: onReady,
      onFailure: onFailure,
      onPositionChanged: onPositionChanged,
      onEnded: onEnded,
      seekRequest: seekRequest,
    );

    if (!initialized.value || failed.value) {
      return const ColoredBox(
        color: VodPlayerScreenDesign.backgroundColor,
      );
    }

    return _VodPlayerVideoContent(controller: controller);
  }
}

String _playbackHttpHeadersKey(Map<String, String> headers) {
  final entries = headers.entries.toList()
    ..sort((a, b) => a.key.compareTo(b.key));

  return entries.map((entry) => '${entry.key}:${entry.value}').join('\n');
}
