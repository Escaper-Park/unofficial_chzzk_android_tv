import 'dart:convert';

T decodeAndFromJson<T>(
    String jsonString, T Function(Map<String, dynamic>) fromJson) {
  return fromJson(json.decode(jsonString));
}
