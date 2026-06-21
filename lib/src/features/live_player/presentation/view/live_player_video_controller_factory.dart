part of 'live_player_video_surface.dart';

VideoPlayerController _liveVideoControllerFor({
  required Uri playbackUri,
  required Map<String, String> playbackHttpHeaders,
  required PlayerVideoViewType videoViewType,
  required bool mixWithOthers,
}) {
  return VideoPlayerController.networkUrl(
    playbackUri,
    formatHint: VideoFormat.hls,
    httpHeaders: playbackHttpHeaders,
    viewType: _videoViewTypeFor(videoViewType),
    videoPlayerOptions: VideoPlayerOptions(
      mixWithOthers: mixWithOthers,
    ),
  );
}

VideoViewType _videoViewTypeFor(PlayerVideoViewType videoViewType) {
  return switch (videoViewType) {
    PlayerVideoViewType.textureView => VideoViewType.textureView,
    PlayerVideoViewType.platformView => VideoViewType.platformView,
  };
}
