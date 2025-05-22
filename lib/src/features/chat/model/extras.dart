import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'extras.g.dart';
part 'extras.freezed.dart';

@freezed
@JsonSerializable()
class Extras with _$Extras {
  final String? chatType;
  final Map<String, String>? emojis;
  final String? streamingChannelId;
  final bool? isAnonymous;
  final String? nickname;
  final int? payAmount;
  final String? donationType;

  Extras({
    required this.chatType,
    required this.emojis,
    required this.streamingChannelId,
    required this.isAnonymous,
    required this.nickname,
    required this.payAmount,
    required this.donationType,
  });

  factory Extras.fromJson(Map<String, dynamic> json) => _$ExtrasFromJson(json);
  Map<String, dynamic> toJson() => _$ExtrasToJson(this);
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
