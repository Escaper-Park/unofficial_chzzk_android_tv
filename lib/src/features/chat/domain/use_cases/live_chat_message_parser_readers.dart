part of 'live_chat_message_parser.dart';

Map<String, dynamic>? _parseLiveChatJsonLikeMap(Object? value) {
  if (value is String) {
    if (value.isEmpty) {
      return null;
    }

    try {
      return _asLiveChatStringKeyedMap(jsonDecode(value));
    } on FormatException {
      return null;
    }
  }

  return _asLiveChatStringKeyedMap(value);
}

Map<String, dynamic>? _asLiveChatStringKeyedMap(Object? value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  if (value is Map) {
    return Map<String, dynamic>.from(value);
  }

  return null;
}
