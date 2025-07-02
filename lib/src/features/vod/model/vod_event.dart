import 'package:freezed_annotation/freezed_annotation.dart';

part 'vod_event.g.dart';
part 'vod_event.freezed.dart';

@freezed
class VodEvent with _$VodEvent {
  const factory VodEvent({
    required String channelId,
    required int videoNo,
    required Payload payload,
    required int totalLength,
  }) = _VodEvent;

  factory VodEvent.fromJson(Map<String, dynamic> json) =>
      _$VodEventFromJson(json);
}

@freezed
class Payload with _$Payload {
  const factory Payload({
    required String watchEventType,
    required String sessionId, // uuid v4
    required int duration,
    required int positionAt,
    required int? awt, // max : totalLength
  }) = _Payload;

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);
}
