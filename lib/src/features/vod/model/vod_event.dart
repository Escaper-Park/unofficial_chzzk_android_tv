import 'package:freezed_annotation/freezed_annotation.dart';

part 'vod_event.g.dart';
part 'vod_event.freezed.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class VodEvent with _$VodEvent {
  final String channelId;
  final int videoNo;
  final Payload payload;
  final int totalLength;

  VodEvent({
    required this.channelId,
    required this.videoNo,
    required this.payload,
    required this.totalLength,
  });

  factory VodEvent.fromJson(Map<String, dynamic> json) =>
      _$VodEventFromJson(json);

  Map<String, Object?> toJson() => _$VodEventToJson(this);
}

@freezed
@JsonSerializable()
class Payload with _$Payload {
  final String watchEventType;
  final String sessionId; // uuid v4
  final int duration;
  final int positionAt;
  final int? awt; // max : totalLength

  Payload({
    required this.watchEventType,
    required this.sessionId,
    required this.duration,
    required this.positionAt,
    required this.awt,
  });

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);

  Map<String, Object?> toJson() => _$PayloadToJson(this);
}
