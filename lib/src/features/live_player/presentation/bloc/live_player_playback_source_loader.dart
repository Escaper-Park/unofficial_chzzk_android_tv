part of 'live_player_bloc.dart';

final class LivePlayerPlaybackSourceLoader {
  const LivePlayerPlaybackSourceLoader({
    required this.loadPlaylistText,
  });

  final LoadLivePlaybackPlaylistText loadPlaylistText;

  Future<LiveResolvedPlaybackSource?> resolve({
    required String? livePlaybackJson,
    required int latencyIndex,
    required int resolutionIndex,
  }) {
    return resolveLivePlaybackSource(
      livePlaybackJson: livePlaybackJson,
      latencyIndex: latencyIndex,
      resolutionIndex: resolutionIndex,
      loadPlaylistText: loadPlaylistText,
    );
  }
}
