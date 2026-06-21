import '../../../../settings/domain/entities/settings_preferences.dart';

final class LivePreviewState {
  const LivePreviewState._({
    required this.waitProgress,
    required this.playbackUri,
    required this.muted,
    required this.videoViewType,
  });

  factory LivePreviewState.inactive() {
    return const LivePreviewState._(
      waitProgress: null,
      playbackUri: null,
      muted: true,
      videoViewType: PlayerVideoViewType.textureView,
    );
  }

  factory LivePreviewState.waiting(double progress) {
    return LivePreviewState._(
      waitProgress: progress.clamp(0, 1).toDouble(),
      playbackUri: null,
      muted: true,
      videoViewType: PlayerVideoViewType.textureView,
    );
  }

  factory LivePreviewState.playing({
    required Uri playbackUri,
    required bool muted,
    required PlayerVideoViewType videoViewType,
  }) {
    return LivePreviewState._(
      waitProgress: null,
      playbackUri: playbackUri,
      muted: muted,
      videoViewType: videoViewType,
    );
  }

  factory LivePreviewState.finished() {
    return const LivePreviewState._(
      waitProgress: null,
      playbackUri: null,
      muted: true,
      videoViewType: PlayerVideoViewType.textureView,
    );
  }

  final double? waitProgress;
  final Uri? playbackUri;
  final bool muted;
  final PlayerVideoViewType videoViewType;

  bool get isPlaying => playbackUri != null;
}
