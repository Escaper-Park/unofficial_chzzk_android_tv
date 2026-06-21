part of 'vod_player_video_surface.dart';

VideoPlayerController _videoControllerFor({
  required Uri playbackUri,
  required Map<String, String> playbackHttpHeaders,
  required PlayerVideoViewType videoViewType,
}) {
  final viewType = _videoViewTypeFor(videoViewType);
  if (playbackUri.isScheme('file')) {
    return VideoPlayerController.file(
      File.fromUri(playbackUri),
      httpHeaders: playbackHttpHeaders,
      viewType: viewType,
    );
  }

  return VideoPlayerController.networkUrl(
    playbackUri,
    formatHint: VideoFormat.hls,
    httpHeaders: playbackHttpHeaders,
    viewType: viewType,
  );
}

VideoViewType _videoViewTypeFor(PlayerVideoViewType videoViewType) {
  return switch (videoViewType) {
    PlayerVideoViewType.textureView => VideoViewType.textureView,
    PlayerVideoViewType.platformView => VideoViewType.platformView,
  };
}
