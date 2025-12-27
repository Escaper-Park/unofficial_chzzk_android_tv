import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'extras.g.dart';
part 'extras.freezed.dart';

@freezed
class Extras with _$Extras {
  const factory Extras({
    String? chatType,
    Map<String, String>? emojis,
    String? streamingChannelId,
    bool? isAnonymous,
    String? nickname,
    int? payAmount,
    String? donationType,
  }) = _Extras;

  factory Extras.fromJson(Map<String, dynamic> json) => _$ExtrasFromJson(json);
}

class ExtrasConverter implements JsonConverter<Extras, String> {
  const ExtrasConverter();

  @override
  Extras fromJson(String json) {
    final extrasJson = jsonDecode(json);

    return Extras.fromJson(extrasJson);
  }

  @override
  String toJson(Extras object) {
    final jsonMap = object.toJson();

    return jsonEncode(jsonMap);
  }
}
