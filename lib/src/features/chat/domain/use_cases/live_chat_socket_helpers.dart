part of 'live_chat_service.dart';

List<Map<String, dynamic>> _decodeLiveChatJsonFrames(String value) {
  try {
    final decoded = jsonDecode(value);
    return _normalizeLiveChatDecodedFrames(decoded);
  } on FormatException {
    return const <Map<String, dynamic>>[];
  }
}

List<Map<String, dynamic>> _normalizeLiveChatDecodedFrames(Object? decoded) {
  if (decoded is Map<String, dynamic>) {
    return [decoded];
  }
  if (decoded is Map) {
    return [Map<String, dynamic>.from(decoded)];
  }
  if (decoded is! List) {
    return const <Map<String, dynamic>>[];
  }

  final frames = <Map<String, dynamic>>[];
  for (final entry in decoded) {
    if (entry is Map<String, dynamic>) {
      frames.add(entry);
    } else if (entry is Map) {
      frames.add(Map<String, dynamic>.from(entry));
    }
  }

  return frames;
}

String _createClientId() {
  final random = Random();
  final timestamp = DateTime.now().microsecondsSinceEpoch.toRadixString(16);
  final randomPart = List.generate(
    16,
    (_) => random.nextInt(16).toRadixString(16),
  ).join();

  return '$timestamp-$randomPart';
}
