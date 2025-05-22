// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VodEvent {
  String get channelId;
  int get videoNo;
  Payload get payload;
  int get totalLength;

  /// Create a copy of VodEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodEventCopyWith<VodEvent> get copyWith =>
      _$VodEventCopyWithImpl<VodEvent>(this as VodEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodEvent &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.totalLength, totalLength) ||
                other.totalLength == totalLength));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, channelId, videoNo, payload, totalLength);

  @override
  String toString() {
    return 'VodEvent(channelId: $channelId, videoNo: $videoNo, payload: $payload, totalLength: $totalLength)';
  }
}

/// @nodoc
abstract mixin class $VodEventCopyWith<$Res> {
  factory $VodEventCopyWith(VodEvent value, $Res Function(VodEvent) _then) =
      _$VodEventCopyWithImpl;
  @useResult
  $Res call({String channelId, int videoNo, Payload payload, int totalLength});
}

/// @nodoc
class _$VodEventCopyWithImpl<$Res> implements $VodEventCopyWith<$Res> {
  _$VodEventCopyWithImpl(this._self, this._then);

  final VodEvent _self;
  final $Res Function(VodEvent) _then;

  /// Create a copy of VodEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? videoNo = null,
    Object? payload = null,
    Object? totalLength = null,
  }) {
    return _then(VodEvent(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      videoNo: null == videoNo
          ? _self.videoNo
          : videoNo // ignore: cast_nullable_to_non_nullable
              as int,
      payload: null == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Payload,
      totalLength: null == totalLength
          ? _self.totalLength
          : totalLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$Payload {
  String get watchEventType;
  String get sessionId; // uuid v4
  int get duration;
  int get positionAt;
  int? get awt;

  /// Create a copy of Payload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PayloadCopyWith<Payload> get copyWith =>
      _$PayloadCopyWithImpl<Payload>(this as Payload, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Payload &&
            (identical(other.watchEventType, watchEventType) ||
                other.watchEventType == watchEventType) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.positionAt, positionAt) ||
                other.positionAt == positionAt) &&
            (identical(other.awt, awt) || other.awt == awt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, watchEventType, sessionId, duration, positionAt, awt);

  @override
  String toString() {
    return 'Payload(watchEventType: $watchEventType, sessionId: $sessionId, duration: $duration, positionAt: $positionAt, awt: $awt)';
  }
}

/// @nodoc
abstract mixin class $PayloadCopyWith<$Res> {
  factory $PayloadCopyWith(Payload value, $Res Function(Payload) _then) =
      _$PayloadCopyWithImpl;
  @useResult
  $Res call(
      {String watchEventType,
      String sessionId,
      int duration,
      int positionAt,
      int? awt});
}

/// @nodoc
class _$PayloadCopyWithImpl<$Res> implements $PayloadCopyWith<$Res> {
  _$PayloadCopyWithImpl(this._self, this._then);

  final Payload _self;
  final $Res Function(Payload) _then;

  /// Create a copy of Payload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchEventType = null,
    Object? sessionId = null,
    Object? duration = null,
    Object? positionAt = null,
    Object? awt = freezed,
  }) {
    return _then(Payload(
      watchEventType: null == watchEventType
          ? _self.watchEventType
          : watchEventType // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      positionAt: null == positionAt
          ? _self.positionAt
          : positionAt // ignore: cast_nullable_to_non_nullable
              as int,
      awt: freezed == awt
          ? _self.awt
          : awt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
