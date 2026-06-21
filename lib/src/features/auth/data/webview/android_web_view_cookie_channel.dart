import 'package:flutter/services.dart';

final class AndroidWebViewCookieChannel {
  const AndroidWebViewCookieChannel._();

  static const _channel = MethodChannel(
    'unofficial_chzzk_android_tv/auth_cookies',
  );

  static Future<String?> readCookieHeader(Uri url) async {
    try {
      return await _channel.invokeMethod<String>(
        'getCookieHeader',
        <String, String>{'url': url.toString()},
      );
    } on MissingPluginException {
      return null;
    }
  }
}
