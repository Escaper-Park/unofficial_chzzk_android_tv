import 'package:dio/dio.dart';

import '../../../../core/network/chzzk_api_base_urls.dart';

final class AuthCookieInterceptor extends Interceptor {
  AuthCookieInterceptor({
    required this.readCookieHeader,
    Set<String>? allowedHosts,
    Map<String, Set<String>>? allowedPathPrefixesByHost,
  }) : allowedHosts = allowedHosts ?? _defaultAllowedHosts,
       allowedPathPrefixesByHost =
           allowedPathPrefixesByHost ?? _defaultAllowedPathPrefixesByHost;

  final String? Function() readCookieHeader;
  final Set<String> allowedHosts;
  final Map<String, Set<String>> allowedPathPrefixesByHost;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final cookieHeader = readCookieHeader();
    if (!_isAllowedHost(options.uri) ||
        cookieHeader == null ||
        cookieHeader.isEmpty) {
      options.headers.remove('Cookie');
    } else {
      options.headers['Cookie'] = cookieHeader;
    }

    handler.next(options);
  }

  bool _isAllowedHost(Uri uri) {
    final host = uri.host.toLowerCase();
    if (!allowedHosts.contains(host)) {
      return false;
    }

    final allowedPathPrefixes = allowedPathPrefixesByHost[host];
    if (allowedPathPrefixes == null || allowedPathPrefixes.isEmpty) {
      return true;
    }

    return allowedPathPrefixes.any(uri.path.startsWith);
  }
}

final _defaultAllowedHosts = {
  Uri.parse(ChzzkApiBaseUrls.service).host,
  Uri.parse(ChzzkApiBaseUrls.comm).host,
  Uri.parse(ChzzkApiBaseUrls.player).host,
};

final _defaultAllowedPathPrefixesByHost = {
  Uri.parse(ChzzkApiBaseUrls.player).host: {
    '/neonplayer/vodplay/',
  },
};
