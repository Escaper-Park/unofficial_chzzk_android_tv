// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VodEvent _$VodEventFromJson(Map<String, dynamic> json) {
  return _VodEvent.fromJson(json);
}

/// @nodoc
mixin _$VodEvent {
  String get channelId => throw _privateConstructorUsedError;
  int get videoNo => throw _privateConstructorUsedError;
  Payload get payload => throw _privateConstructorUsedError;
  int get totalLength => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VodEventCopyWith<VodEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VodEventCopyWith<$Res> {
  factory $VodEventCopyWith(VodEvent value, $Res Function(VodEvent) then) =
      _$VodEventCopyWithImpl<$Res, VodEvent>;
  @useResult
  $Res call({String channelId, int videoNo, Payload payload, int totalLength});

  $PayloadCopyWith<$Res> get payload;
}

/// @nodoc
class _$VodEventCopyWithImpl<$Res, $Val extends VodEvent>
    implements $VodEventCopyWith<$Res> {
  _$VodEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? videoNo = null,
    Object? payload = null,
    Object? totalLength = null,
  }) {
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      videoNo: null == videoNo
          ? _value.videoNo
          : videoNo // ignore: cast_nullable_to_non_nullable
              as int,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Payload,
      totalLength: null == totalLength
          ? _value.totalLength
          : totalLength // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PayloadCopyWith<$Res> get payload {
    return $PayloadCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VodEventImplCopyWith<$Res>
    implements $VodEventCopyWith<$Res> {
  factory _$$VodEventImplCopyWith(
          _$VodEventImpl value, $Res Function(_$VodEventImpl) then) =
      __$$VodEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String channelId, int videoNo, Payload payload, int totalLength});

  @override
  $PayloadCopyWith<$Res> get payload;
}

/// @nodoc
class __$$VodEventImplCopyWithImpl<$Res>
    extends _$VodEventCopyWithImpl<$Res, _$VodEventImpl>
    implements _$$VodEventImplCopyWith<$Res> {
  __$$VodEventImplCopyWithImpl(
      _$VodEventImpl _value, $Res Function(_$VodEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? videoNo = null,
    Object? payload = null,
    Object? totalLength = null,
  }) {
    return _then(_$VodEventImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      videoNo: null == videoNo
          ? _value.videoNo
          : videoNo // ignore: cast_nullable_to_non_nullable
              as int,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Payload,
      totalLength: null == totalLength
          ? _value.totalLength
          : totalLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VodEventImpl implements _VodEvent {
  const _$VodEventImpl(
      {required this.channelId,
      required this.videoNo,
      required this.payload,
      required this.totalLength});

  factory _$VodEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$VodEventImplFromJson(json);

  @override
  final String channelId;
  @override
  final int videoNo;
  @override
  final Payload payload;
  @override
  final int totalLength;

  @override
  String toString() {
    return 'VodEvent(channelId: $channelId, videoNo: $videoNo, payload: $payload, totalLength: $totalLength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VodEventImpl &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.totalLength, totalLength) ||
                other.totalLength == totalLength));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, channelId, videoNo, payload, totalLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VodEventImplCopyWith<_$VodEventImpl> get copyWith =>
      __$$VodEventImplCopyWithImpl<_$VodEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VodEventImplToJson(
      this,
    );
  }
}

abstract class _VodEvent implements VodEvent {
  const factory _VodEvent(
      {required final String channelId,
      required final int videoNo,
      required final Payload payload,
      required final int totalLength}) = _$VodEventImpl;

  factory _VodEvent.fromJson(Map<String, dynamic> json) =
      _$VodEventImpl.fromJson;

  @override
  String get channelId;
  @override
  int get videoNo;
  @override
  Payload get payload;
  @override
  int get totalLength;
  @override
  @JsonKey(ignore: true)
  _$$VodEventImplCopyWith<_$VodEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Payload _$PayloadFromJson(Map<String, dynamic> json) {
  return _Payload.fromJson(json);
}

/// @nodoc
mixin _$Payload {
  String get watchEventType => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get positionAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PayloadCopyWith<Payload> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayloadCopyWith<$Res> {
  factory $PayloadCopyWith(Payload value, $Res Function(Payload) then) =
      _$PayloadCopyWithImpl<$Res, Payload>;
  @useResult
  $Res call(
      {String watchEventType, String sessionId, int duration, int positionAt});
}

/// @nodoc
class _$PayloadCopyWithImpl<$Res, $Val extends Payload>
    implements $PayloadCopyWith<$Res> {
  _$PayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchEventType = null,
    Object? sessionId = null,
    Object? duration = null,
    Object? positionAt = null,
  }) {
    return _then(_value.copyWith(
      watchEventType: null == watchEventType
          ? _value.watchEventType
          : watchEventType // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      positionAt: null == positionAt
          ? _value.positionAt
          : positionAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayloadImplCopyWith<$Res> implements $PayloadCopyWith<$Res> {
  factory _$$PayloadImplCopyWith(
          _$PayloadImpl value, $Res Function(_$PayloadImpl) then) =
      __$$PayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String watchEventType, String sessionId, int duration, int positionAt});
}

/// @nodoc
class __$$PayloadImplCopyWithImpl<$Res>
    extends _$PayloadCopyWithImpl<$Res, _$PayloadImpl>
    implements _$$PayloadImplCopyWith<$Res> {
  __$$PayloadImplCopyWithImpl(
      _$PayloadImpl _value, $Res Function(_$PayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchEventType = null,
    Object? sessionId = null,
    Object? duration = null,
    Object? positionAt = null,
  }) {
    return _then(_$PayloadImpl(
      watchEventType: null == watchEventType
          ? _value.watchEventType
          : watchEventType // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      positionAt: null == positionAt
          ? _value.positionAt
          : positionAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayloadImpl implements _Payload {
  const _$PayloadImpl(
      {required this.watchEventType,
      required this.sessionId,
      required this.duration,
      required this.positionAt});

  factory _$PayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayloadImplFromJson(json);

  @override
  final String watchEventType;
  @override
  final String sessionId;
  @override
  final int duration;
  @override
  final int positionAt;

  @override
  String toString() {
    return 'Payload(watchEventType: $watchEventType, sessionId: $sessionId, duration: $duration, positionAt: $positionAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayloadImpl &&
            (identical(other.watchEventType, watchEventType) ||
                other.watchEventType == watchEventType) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.positionAt, positionAt) ||
                other.positionAt == positionAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, watchEventType, sessionId, duration, positionAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayloadImplCopyWith<_$PayloadImpl> get copyWith =>
      __$$PayloadImplCopyWithImpl<_$PayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayloadImplToJson(
      this,
    );
  }
}

abstract class _Payload implements Payload {
  const factory _Payload(
      {required final String watchEventType,
      required final String sessionId,
      required final int duration,
      required final int positionAt}) = _$PayloadImpl;

  factory _Payload.fromJson(Map<String, dynamic> json) = _$PayloadImpl.fromJson;

  @override
  String get watchEventType;
  @override
  String get sessionId;
  @override
  int get duration;
  @override
  int get positionAt;
  @override
  @JsonKey(ignore: true)
  _$$PayloadImplCopyWith<_$PayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
