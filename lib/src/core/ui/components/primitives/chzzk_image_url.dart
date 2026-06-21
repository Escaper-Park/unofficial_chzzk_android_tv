/// CHZZK/Naver CDN image type variants used by app image surfaces.
abstract final class ChzzkImageVariant {
  static const categoryPoster = 'w375';
  static const profileAvatar = 'f120_120_na';
}

/// Returns [imageUrl] with the requested CHZZK/Naver CDN image [type].
///
/// Unsupported hosts are returned unchanged so mixed API payloads can pass
/// through this helper without breaking non-CHZZK image URLs.
String? chzzkImageUrlWithType(String? imageUrl, String type) {
  final trimmedUrl = imageUrl?.trim();
  if (trimmedUrl == null ||
      trimmedUrl.isEmpty ||
      trimmedUrl.toLowerCase() == 'null') {
    return null;
  }

  if (type.isEmpty || trimmedUrl.startsWith('data:image')) {
    return trimmedUrl;
  }

  if (trimmedUrl.contains('{type}')) {
    return trimmedUrl.replaceAll('{type}', type);
  }

  final uri = Uri.tryParse(trimmedUrl);
  if (uri == null || !uri.hasScheme || uri.host.isEmpty) {
    return trimmedUrl;
  }

  final scheme = uri.scheme.toLowerCase();
  if (scheme != 'http' && scheme != 'https') {
    return trimmedUrl;
  }

  if (!_supportsChzzkImageType(uri.host)) {
    return trimmedUrl;
  }

  return uri
      .replace(
        queryParameters: {
          ...uri.queryParameters,
          'type': type,
        },
      )
      .removeFragment()
      .toString();
}

bool _supportsChzzkImageType(String host) {
  final normalizedHost = host.toLowerCase();

  return normalizedHost.contains('nng') ||
      normalizedHost.endsWith('pstatic.net') ||
      normalizedHost.endsWith('phinf.net');
}
