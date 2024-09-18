import 'package:freezed_annotation/freezed_annotation.dart';

part 'vod_event.freezed.dart';
part 'vod_event.g.dart';

enum WatchEventType {
  watchStarted('WATCH_STARTED'),
  watchContinued('WATCH_CONTINUED'),
  watchPaused('WATCH_PAUSED'),
  watchEnded('WATCH_ENDED');

  final String value;

  const WatchEventType(this.value);
}

@freezed
class VodEvent with _$VodEvent {
  /// Vod Event to resume or continue watching
  /// a prev viewed VOD from the point where it was last stopped.
  ///
  /// POST this when the VOD is paused or stopped.
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
    required String sessionId,
    required int duration,
    required int positionAt,
  }) = _Payload;

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);
}
