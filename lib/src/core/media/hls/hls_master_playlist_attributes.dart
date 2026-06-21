part of 'hls_master_playlist.dart';

const _streamInfoPrefix = '#EXT-X-STREAM-INF:';

final _quotedUriAttributePattern = RegExp(r'''URI=(["'])(.*?)\1''');

Map<String, String> _parseAttributeList(String raw) {
  final attributes = <String, String>{};
  var index = 0;

  while (index < raw.length) {
    while (index < raw.length &&
        (raw[index] == ',' || raw[index].trim().isEmpty)) {
      index += 1;
    }
    if (index >= raw.length) {
      break;
    }

    final keyStart = index;
    while (index < raw.length && raw[index] != '=' && raw[index] != ',') {
      index += 1;
    }
    if (index >= raw.length || raw[index] != '=') {
      index = _skipUntilNextAttribute(raw, index);
      continue;
    }

    final key = raw.substring(keyStart, index).trim();
    index += 1;

    final value = StringBuffer();
    if (index < raw.length && raw[index] == '"') {
      index += 1;
      while (index < raw.length) {
        final char = raw[index];
        if (char == '"') {
          index += 1;
          break;
        }
        value.write(char);
        index += 1;
      }
    } else {
      while (index < raw.length && raw[index] != ',') {
        value.write(raw[index]);
        index += 1;
      }
    }

    if (key.isNotEmpty) {
      attributes[key] = value.toString().trim();
    }
    index = _skipUntilNextAttribute(raw, index);
  }

  return attributes;
}

String? _nextUriLine(List<String> lines, int startIndex) {
  for (var index = startIndex; index < lines.length; index += 1) {
    final line = lines[index].trim();
    if (line.isEmpty || line.startsWith('#')) {
      continue;
    }

    return line;
  }

  return null;
}

int _skipUntilNextAttribute(String raw, int index) {
  while (index < raw.length && raw[index] != ',') {
    index += 1;
  }
  if (index < raw.length && raw[index] == ',') {
    index += 1;
  }

  return index;
}

int? _parseInt(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }

  return int.tryParse(value);
}

(int?, int?) _parseResolution(String? value) {
  if (value == null || value.isEmpty) {
    return (null, null);
  }

  final match = RegExp(r'^(\d+)[xX](\d+)$').firstMatch(value);
  if (match == null) {
    return (null, null);
  }

  return (
    int.tryParse(match.group(1)!),
    int.tryParse(match.group(2)!),
  );
}
