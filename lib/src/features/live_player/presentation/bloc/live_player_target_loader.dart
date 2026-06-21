part of 'live_player_bloc.dart';

enum LivePlayerTargetLoadResultType {
  stale,
  ended,
  entryBlocked,
  playbackSourceMissing,
  ready,
  loadFailed,
}

final class LivePlayerTargetLoadSettings {
  const LivePlayerTargetLoadSettings({
    required this.liveSettings,
    required this.videoViewType,
  });

  factory LivePlayerTargetLoadSettings._fromEntrySettings(
    _LivePlayerEntrySettings settings,
  ) {
    return LivePlayerTargetLoadSettings(
      liveSettings: settings.liveSettings,
      videoViewType: settings.videoViewType,
    );
  }

  final LiveSettings liveSettings;
  final PlayerVideoViewType videoViewType;
}

final class LivePlayerTargetLoadResult {
  const LivePlayerTargetLoadResult._({
    required this.type,
    this.detail,
    this.liveStatus,
    this.playbackSource,
    this.playbackLatencyIndex,
    this.playbackResolutionIndex,
    this.videoViewType,
  });

  const LivePlayerTargetLoadResult.stale()
    : this._(type: LivePlayerTargetLoadResultType.stale);

  const LivePlayerTargetLoadResult.ended({
    required LiveDetail detail,
    LiveStatus? liveStatus,
  }) : this._(
         type: LivePlayerTargetLoadResultType.ended,
         detail: detail,
         liveStatus: liveStatus,
       );

  const LivePlayerTargetLoadResult.entryBlocked({
    required LiveDetail detail,
    LiveStatus? liveStatus,
  }) : this._(
         type: LivePlayerTargetLoadResultType.entryBlocked,
         detail: detail,
         liveStatus: liveStatus,
       );

  const LivePlayerTargetLoadResult.playbackSourceMissing({
    required LiveDetail detail,
  }) : this._(
         type: LivePlayerTargetLoadResultType.playbackSourceMissing,
         detail: detail,
       );

  const LivePlayerTargetLoadResult.ready({
    required LiveDetail detail,
    required LiveResolvedPlaybackSource playbackSource,
    required int playbackLatencyIndex,
    required int playbackResolutionIndex,
    required PlayerVideoViewType videoViewType,
    LiveStatus? liveStatus,
  }) : this._(
         type: LivePlayerTargetLoadResultType.ready,
         detail: detail,
         liveStatus: liveStatus,
         playbackSource: playbackSource,
         playbackLatencyIndex: playbackLatencyIndex,
         playbackResolutionIndex: playbackResolutionIndex,
         videoViewType: videoViewType,
       );

  const LivePlayerTargetLoadResult.loadFailed()
    : this._(type: LivePlayerTargetLoadResultType.loadFailed);

  final LivePlayerTargetLoadResultType type;
  final LiveDetail? detail;
  final LiveStatus? liveStatus;
  final LiveResolvedPlaybackSource? playbackSource;
  final int? playbackLatencyIndex;
  final int? playbackResolutionIndex;
  final PlayerVideoViewType? videoViewType;

  bool get isStale => type == LivePlayerTargetLoadResultType.stale;
}

final class LivePlayerTargetLoader {
  const LivePlayerTargetLoader({
    required this.liveRepository,
    required this.statusReader,
    required this.playbackSourceLoader,
  });

  final LiveRepository liveRepository;
  final LivePlayerStatusReader statusReader;
  final LivePlayerPlaybackSourceLoader playbackSourceLoader;

  Future<LivePlayerTargetLoadResult> load({
    required LivePlayerInitialTarget target,
    required LivePlayerTargetLoadSettings settings,
    required int resolutionIndex,
    required bool Function() isCurrent,
  }) async {
    try {
      final detail = await liveRepository.getLiveDetail(
        channelId: target.channelId,
      );
      if (!isCurrent()) {
        return const LivePlayerTargetLoadResult.stale();
      }

      if (_isLiveClosedStatus(detail.status)) {
        return LivePlayerTargetLoadResult.ended(detail: detail);
      }

      final detailBlockReason = await statusReader.blockReasonForStatus(
        _liveStatusFromDetail(
          detail,
          fallbackChannelId: target.channelId,
        ),
        fallbackChannelId: target.channelId,
      );
      if (!isCurrent()) {
        return const LivePlayerTargetLoadResult.stale();
      }

      if (_isBlockedLiveEntry(detailBlockReason)) {
        return LivePlayerTargetLoadResult.entryBlocked(detail: detail);
      }

      LiveStatus? liveStatus;
      try {
        liveStatus = await statusReader.readStatus(
          detail.channel?.channelId ?? target.channelId,
        );
        if (!isCurrent()) {
          return const LivePlayerTargetLoadResult.stale();
        }
      } on Object {
        // Playback can still start; the periodic refresh will retry status.
      }

      if (_isLiveClosedStatus(liveStatus?.status)) {
        return LivePlayerTargetLoadResult.ended(
          detail: detail,
          liveStatus: liveStatus,
        );
      }

      final statusBlockReason = liveStatus == null
          ? null
          : await statusReader.blockReasonForStatus(
              liveStatus,
              fallbackChannelId: detail.channel?.channelId ?? target.channelId,
            );
      if (!isCurrent()) {
        return const LivePlayerTargetLoadResult.stale();
      }

      if (_isBlockedLiveEntry(statusBlockReason)) {
        return LivePlayerTargetLoadResult.entryBlocked(
          detail: detail,
          liveStatus: liveStatus,
        );
      }

      final playbackSource = await playbackSourceLoader.resolve(
        livePlaybackJson: detail.livePlaybackJson,
        latencyIndex: settings.liveSettings.latencyIndex,
        resolutionIndex: resolutionIndex,
      );
      if (!isCurrent()) {
        return const LivePlayerTargetLoadResult.stale();
      }

      if (playbackSource == null) {
        return LivePlayerTargetLoadResult.playbackSourceMissing(
          detail: detail,
        );
      }

      return LivePlayerTargetLoadResult.ready(
        detail: detail,
        liveStatus: liveStatus,
        playbackSource: playbackSource,
        playbackLatencyIndex: settings.liveSettings.latencyIndex,
        playbackResolutionIndex: resolutionIndex,
        videoViewType: settings.videoViewType,
      );
    } on Object {
      if (!isCurrent()) {
        return const LivePlayerTargetLoadResult.stale();
      }

      return const LivePlayerTargetLoadResult.loadFailed();
    }
  }
}
