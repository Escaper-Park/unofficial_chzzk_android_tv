final class AuthCookieHeaderParser {
  const AuthCookieHeaderParser._();

  static Map<String, String> parse(String? cookieHeader) {
    if (cookieHeader == null || cookieHeader.trim().isEmpty) {
      return const <String, String>{};
    }

    final cookies = <String, String>{};
    for (final segment in cookieHeader.split(';')) {
      final trimmed = segment.trim();
      final separatorIndex = trimmed.indexOf('=');
      if (separatorIndex <= 0) {
        continue;
      }

      final name = trimmed.substring(0, separatorIndex).trim();
      final value = trimmed.substring(separatorIndex + 1);
      if (name.isNotEmpty) {
        cookies[name] = value;
      }
    }

    return Map<String, String>.unmodifiable(cookies);
  }
}
