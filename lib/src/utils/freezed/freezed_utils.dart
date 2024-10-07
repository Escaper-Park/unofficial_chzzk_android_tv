import 'dart:convert';

T? decodeAndFromJson<T>(
    String? jsonString, T? Function(Map<String, dynamic>) fromJson) {
  return jsonString == null ? null : fromJson(json.decode(jsonString));
}
