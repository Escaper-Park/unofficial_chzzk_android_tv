import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/utils/utils.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_design.dart';
import 'live_player_playback_session_controller.dart';
import 'live_player_status_surface.dart';
import 'live_player_watch_event_reporter.dart';

part 'live_player_video_controller_factory.dart';
part 'live_player_video_content.dart';
part 'live_player_video_lifecycle.dart';
part 'live_player_video_watch_reporter.dart';

class LivePlayerVideoSurface extends HookWidget {
  const LivePlayerVideoSurface({
    super.key,
    required this.slotId,
    required this.playbackUri,
    required this.playbackHttpHeaders,
    required this.videoViewType,
    required this.mixWithOthers,
    required this.playbackPaused,
    required this.volume,
    required this.watchEventEnabled,
    required this.playbackSessionController,
    required this.channelId,
    required this.liveId,
    required this.liveOpenDate,
    required this.liveTokens,
    required this.postWatchEvent,
    required this.onReady,
    required this.onEnded,
    required this.onFailure,
  });

  final String slotId;
  final Uri playbackUri;
  final Map<String, String> playbackHttpHeaders;
  final PlayerVideoViewType videoViewType;
  final bool mixWithOthers;
  final bool playbackPaused;
  final double volume;
  final bool watchEventEnabled;
  final LivePlayerPlaybackSessionController playbackSessionController;
  final String? channelId;
  final int? liveId;
  final String? liveOpenDate;
  final List<String> liveTokens;
  final PostLivePlayerWatchEvent postWatchEvent;
  final VoidCallback onReady;
  final VoidCallback onEnded;
  final VoidCallback onFailure;

  @override
  Widget build(BuildContext context) {
    final watchSnapshot = context
        .select<LivePlayerBloc, _LivePlayerVideoWatchSnapshot>((bloc) {
          return _LivePlayerVideoWatchSnapshot.fromState(
            bloc.state,
            slotId: slotId,
            channelId: channelId,
            liveId: liveId,
            playbackUri: playbackUri,
            fallbackLiveOpenDate: liveOpenDate,
            fallbackLiveTokens: liveTokens,
          );
        });
    final playbackHttpHeadersKey = _playbackHttpHeadersKey(
      playbackHttpHeaders,
    );
    final controller = useMemoized(
      () => _liveVideoControllerFor(
        playbackUri: playbackUri,
        playbackHttpHeaders: playbackHttpHeaders,
        videoViewType: videoViewType,
        mixWithOthers: mixWithOthers,
      ),
      [playbackUri, playbackHttpHeadersKey, videoViewType, mixWithOthers],
    );
    final playbackSessionHandle = useMemoized(
      () => _LivePlayerVideoSessionHandle(controller),
      [controller],
    );
    final parsedLiveOpenDate = useMemoized(
      () => _parseLiveOpenDate(watchSnapshot.liveOpenDate),
      [watchSnapshot.liveOpenDate],
    );
    final postWatchEventRef = useRef(postWatchEvent)..value = postWatchEvent;
    final reporter = useMemoized(
      () => _livePlayerWatchEventReporterFor(
        enabled: watchEventEnabled,
        channelId: channelId,
        liveId: liveId,
        liveOpenDate: parsedLiveOpenDate,
        liveTokens: watchSnapshot.liveTokens,
        postWatchEvent:
            ({
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
              return postWatchEventRef.value(
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
            },
      ),
      [channelId, liveId, parsedLiveOpenDate, watchEventEnabled],
    );
    final initialized = useState(false);
    final failed = useState(false);
    final ended = useState(false);
    final syncTimer = useMemoized(PeriodicCallbackTimer.new, const []);
    final playbackPausedRef = useRef(playbackPaused);
    final reporterRef = useRef<LivePlayerWatchEventReporter?>(reporter);
    final previousReporterRef = useRef<LivePlayerWatchEventReporter?>(
      reporter,
    );
    final normalizedVolume = _normalizedPlayerVolume(volume);

    bool playbackSuspended() {
      return playbackSessionHandle.suspended ||
          playbackPausedRef.value ||
          ended.value;
    }

    void reportPlaybackFailure() {
      if (failed.value) {
        return;
      }

      failed.value = true;
      reporterRef.value?.pause();
      onFailure();
    }

    void syncWatchEvent() {
      if (!controller.value.isInitialized || failed.value) {
        return;
      }

      final value = controller.value;
      if (value.hasError) {
        reportPlaybackFailure();
        return;
      }

      final reporter = reporterRef.value;
      if (value.isCompleted) {
        if (!ended.value) {
          ended.value = true;
          reporter?.end();
          onEnded();
        }
        return;
      }

      if (!value.isPlaying || playbackSuspended()) {
        reporter?.pause();
        return;
      }

      reporter?.start();
      reporter?.tick();
    }

    _useLivePlayerControllerLifecycle(
      controller: controller,
      initialized: initialized,
      failed: failed,
      ended: ended,
      reporterRef: reporterRef,
      playbackSessionController: playbackSessionController,
      playbackSessionHandle: playbackSessionHandle,
      volume: normalizedVolume,
      playbackSuspended: playbackSuspended,
      onReady: onReady,
      reportPlaybackFailure: reportPlaybackFailure,
      syncWatchEvent: syncWatchEvent,
    );

    useEffect(
      () {
        if (!initialized.value || failed.value || reporter == null) {
          syncTimer.stop();
          return null;
        }

        syncTimer.start(
          interval: _liveWatchEventSyncInterval,
          onTick: syncWatchEvent,
        );
        syncWatchEvent();
        return syncTimer.stop;
      },
      [
        controller,
        syncTimer,
        initialized.value,
        failed.value,
        reporter,
      ],
    );

    useEffect(() {
      return syncTimer.dispose;
    }, [syncTimer]);

    useEffect(() {
      unawaited(controller.setVolume(normalizedVolume));
      return null;
    }, [controller, normalizedVolume]);

    reporter?.updateLiveTokens(watchSnapshot.liveTokens);
    playbackPausedRef.value = playbackPaused;
    reporterRef.value = reporter;

    useEffect(() {
      final previousReporter = previousReporterRef.value;
      if (previousReporter != null && previousReporter != reporter) {
        previousReporter.end();
        unawaited(previousReporter.flush());
      }

      previousReporterRef.value = reporter;
      reporterRef.value = reporter;
      return null;
    }, [reporter]);

    useEffect(() {
      return () {
        reporter?.end();
        unawaited(reporter?.flush());
      };
    }, [reporter]);

    useEffect(
      () {
        if (!initialized.value || failed.value) {
          return null;
        }

        final playback = playbackSuspended()
            ? controller.pause()
            : controller.play();
        unawaited(playback.then((_) => syncWatchEvent()));
        return null;
      },
      [
        controller,
        initialized.value,
        failed.value,
        ended.value,
        playbackPaused,
      ],
    );

    if (!initialized.value || failed.value) {
      return const ColoredBox(
        color: LivePlayerScreenDesign.backgroundColor,
      );
    }

    return _LivePlayerVideoContent(
      controller: controller,
      playbackSuspended: playbackSuspended(),
    );
  }
}

@immutable
final class _LivePlayerVideoWatchSnapshot {
  const _LivePlayerVideoWatchSnapshot({
    required this.liveOpenDate,
    required this.liveTokens,
  });

  factory _LivePlayerVideoWatchSnapshot.fromState(
    LivePlayerState state, {
    required String slotId,
    required String? channelId,
    required int? liveId,
    required Uri playbackUri,
    required String? fallbackLiveOpenDate,
    required List<String> fallbackLiveTokens,
  }) {
    final currentSlot = state.slotById(slotId);
    final slot =
        currentSlot != null &&
            currentSlot.channelId == channelId &&
            currentSlot.liveId == liveId &&
            currentSlot.playbackUri == playbackUri
        ? currentSlot
        : null;

    return _LivePlayerVideoWatchSnapshot(
      liveOpenDate: slot?.openDate ?? fallbackLiveOpenDate,
      liveTokens: slot?.liveTokens ?? fallbackLiveTokens,
    );
  }

  final String? liveOpenDate;
  final List<String> liveTokens;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LivePlayerVideoWatchSnapshot &&
            other.liveOpenDate == liveOpenDate &&
            listEquals(other.liveTokens, liveTokens);
  }

  @override
  int get hashCode => Object.hash(liveOpenDate, Object.hashAll(liveTokens));
}

const _liveBufferingIndicatorDelay = Duration(seconds: 2);
const _liveWatchEventSyncInterval = Duration(seconds: 5);

double _normalizedPlayerVolume(double volume) {
  if (!volume.isFinite) {
    return 0;
  }

  return volume.clamp(0, 1).toDouble();
}

String _playbackHttpHeadersKey(Map<String, String> headers) {
  final entries = headers.entries.toList()
    ..sort((a, b) => a.key.compareTo(b.key));

  return entries.map((entry) => '${entry.key}:${entry.value}').join('\n');
}
