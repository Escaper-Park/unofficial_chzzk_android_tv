part 'hls_master_playlist_attributes.dart';
part 'hls_master_playlist_variant_selection.dart';

final class HlsVariantStream {
  const HlsVariantStream({
    required this.uri,
    this.bandwidth,
    this.averageBandwidth,
    this.height,
  });

  final Uri uri;
  final int? bandwidth;
  final int? averageBandwidth;
  final int? height;

  int? get preferredBandwidth => averageBandwidth ?? bandwidth;
}

abstract final class HlsMasterPlaylistParser {
  static List<HlsVariantStream> parseMasterPlaylist({
    required String playlistText,
    required Uri masterUri,
  }) {
    final lines = playlistText.replaceAll('\r\n', '\n').split('\n');
    final variants = <HlsVariantStream>[];

    for (var index = 0; index < lines.length; index += 1) {
      final line = lines[index].trim();
      if (!line.startsWith(_streamInfoPrefix)) {
        continue;
      }

      final variantUri = _nextUriLine(lines, index + 1);
      if (variantUri == null) {
        continue;
      }

      final attributes = _parseAttributeList(
        line.substring(_streamInfoPrefix.length),
      );
      final resolution = _parseResolution(attributes['RESOLUTION']);

      variants.add(
        HlsVariantStream(
          uri: masterUri.resolve(variantUri),
          bandwidth: _parseInt(attributes['BANDWIDTH']),
          averageBandwidth: _parseInt(attributes['AVERAGE-BANDWIDTH']),
          height: resolution.$2,
        ),
      );
    }

    return variants;
  }

  static HlsVariantStream? selectPreferredVariant({
    required Iterable<HlsVariantStream> variants,
    required int? targetHeight,
    int? fallbackRank,
  }) {
    if (targetHeight == null || targetHeight <= 0) {
      return null;
    }

    final candidates = variants.toList();
    if (candidates.isEmpty) {
      return null;
    }

    final heightAware = [
      for (final variant in candidates)
        if (variant.height != null) variant,
    ]..sort(_compareByHeightThenBandwidth);

    if (heightAware.isNotEmpty) {
      return _selectByHeight(heightAware, targetHeight);
    }

    if (fallbackRank == null) {
      return null;
    }

    final bandwidthAware = [...candidates]..sort(_compareByBandwidth);
    return bandwidthAware[_clampRank(fallbackRank, bandwidthAware.length)];
  }

  static HlsVariantStream? selectHighestVariant(
    Iterable<HlsVariantStream> variants,
  ) {
    final candidates = variants.toList();
    if (candidates.isEmpty) {
      return null;
    }

    final heightAware = [
      for (final variant in candidates)
        if (variant.height != null) variant,
    ]..sort(_compareByHeightThenBandwidth);
    if (heightAware.isNotEmpty) {
      return heightAware.last;
    }

    final bandwidthAware = [...candidates]..sort(_compareByBandwidth);
    return bandwidthAware.last;
  }

  static Uri appendMissingQueryParameters(
    Uri uri,
    Map<String, List<String>> additionalQueryParameters,
  ) {
    if (additionalQueryParameters.isEmpty) {
      return uri;
    }

    final existingKeys = uri.queryParametersAll.keys.toSet();
    final queryParts = <String>[];
    if (uri.hasQuery) {
      queryParts.add(uri.query);
    }

    for (final entry in additionalQueryParameters.entries) {
      if (existingKeys.contains(entry.key)) {
        continue;
      }

      for (final value in entry.value) {
        queryParts.add(
          '${Uri.encodeQueryComponent(entry.key)}='
          '${Uri.encodeQueryComponent(value)}',
        );
      }
    }

    final nextQuery = queryParts.where((part) => part.isNotEmpty).join('&');
    return uri.replace(query: nextQuery.isEmpty ? null : nextQuery);
  }

  static String rewriteUriAttributesInLine({
    required String line,
    required Uri baseUri,
    required Map<String, List<String>> inheritedQueryParameters,
  }) {
    return line.replaceAllMapped(_quotedUriAttributePattern, (match) {
      final quote = match.group(1) ?? '"';
      final rawUri = match.group(2);
      if (rawUri == null || rawUri.isEmpty) {
        return match.group(0) ?? '';
      }

      final rewrittenUri = appendMissingQueryParameters(
        baseUri.resolve(rawUri),
        inheritedQueryParameters,
      );
      return 'URI=$quote$rewrittenUri$quote';
    });
  }
}
