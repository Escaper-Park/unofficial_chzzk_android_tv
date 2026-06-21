part of 'resolve_vod_playback_uri.dart';

Future<VodResolvedPlaybackSource> _writeAutoPlaybackSource({
  required VodPlaybackCache playbackCache,
  required String masterPlaylistText,
  required Uri masterPlaylistUri,
  required List<HlsVariantStream> variants,
  required int? startPositionSeconds,
  required LoadVodPlaybackPlaylistText loadPlaylistText,
}) async {
  final variantFileNames = await Future.wait([
    for (var index = 0; index < variants.length; index += 1)
      _writeAutoVariantPlaylist(
        playbackCache: playbackCache,
        fileName: 'variant_$index.m3u8',
        variantUri: variants[index].uri,
        inheritedQueryParameters: masterPlaylistUri.queryParametersAll,
        startPositionSeconds: startPositionSeconds,
        loadPlaylistText: loadPlaylistText,
      ),
  ]);

  if (variantFileNames.every((fileName) => fileName == null)) {
    throw StateError('No playable VOD HLS variants.');
  }
  final playableVariants = [
    for (var index = 0; index < variants.length; index += 1)
      if (variantFileNames[index] != null) variants[index],
  ];

  final masterFile = await _writePlaylistFile(
    playbackCache: playbackCache,
    fileName: 'master.m3u8',
    playlistText: rewriteVodPlaybackMasterPlaylist(
      playlistText: masterPlaylistText,
      masterPlaylistUri: masterPlaylistUri,
      variantFileNames: variantFileNames,
    ),
  );

  return VodResolvedPlaybackSource(
    playbackUri: masterFile.uri,
    availableResolutionIndexes: _availableResolutionIndexes(playableVariants),
    cache: playbackCache,
  );
}

Future<String?> _writeAutoVariantPlaylist({
  required VodPlaybackCache playbackCache,
  required String fileName,
  required Uri variantUri,
  required Map<String, List<String>> inheritedQueryParameters,
  required int? startPositionSeconds,
  required LoadVodPlaybackPlaylistText loadPlaylistText,
}) async {
  final signedVariantUri = HlsMasterPlaylistParser.appendMissingQueryParameters(
    variantUri,
    inheritedQueryParameters,
  );

  try {
    final variantPlaylistText = await loadPlaylistText(
      playlistUri: signedVariantUri,
    );
    await _writeMediaPlaylistFile(
      playbackCache: playbackCache,
      fileName: fileName,
      playlistText: variantPlaylistText,
      playlistUri: signedVariantUri,
      startPositionSeconds: startPositionSeconds,
    );
    return fileName;
  } on Object {
    return null;
  }
}

Future<File> _writeMediaPlaylistFile({
  required VodPlaybackCache playbackCache,
  required String fileName,
  required String playlistText,
  required Uri playlistUri,
  required int? startPositionSeconds,
}) {
  return _writePlaylistFile(
    playbackCache: playbackCache,
    fileName: fileName,
    playlistText: rewriteVodPlaybackMediaPlaylist(
      playlistText: playlistText,
      playlistUri: playlistUri,
      startPositionSeconds: startPositionSeconds,
    ),
  );
}

Future<File> _writePlaylistFile({
  required VodPlaybackCache playbackCache,
  required String fileName,
  required String playlistText,
}) {
  return playbackCache.writeFile(fileName: fileName, text: playlistText);
}
