// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watching_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WatchingHistory _$WatchingHistoryFromJson(Map<String, dynamic> json) {
  return _WatchingHistory.fromJson(json);
}

/// @nodoc
mixin _$WatchingHistory {
  String get historyNo => throw _privateConstructorUsedError;
  String get channelId => throw _privateConstructorUsedError;
  int get videoNo => throw _privateConstructorUsedError;
  String get contentType => throw _privateConstructorUsedError;
  int get timeline => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  Vod get videoResponse => throw _privateConstructorUsedError;

  /// Serializes this WatchingHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WatchingHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WatchingHistoryCopyWith<WatchingHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchingHistoryCopyWith<$Res> {
  factory $WatchingHistoryCopyWith(
          WatchingHistory value, $Res Function(WatchingHistory) then) =
      _$WatchingHistoryCopyWithImpl<$Res, WatchingHistory>;
  @useResult
  $Res call(
      {String historyNo,
      String channelId,
      int videoNo,
      String contentType,
      int timeline,
      String date,
      Vod videoResponse});

  $VodCopyWith<$Res> get videoResponse;
}

/// @nodoc
class _$WatchingHistoryCopyWithImpl<$Res, $Val extends WatchingHistory>
    implements $WatchingHistoryCopyWith<$Res> {
  _$WatchingHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchingHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyNo = null,
    Object? channelId = null,
    Object? videoNo = null,
    Object? contentType = null,
    Object? timeline = null,
    Object? date = null,
    Object? videoResponse = null,
  }) {
    return _then(_value.copyWith(
      historyNo: null == historyNo
          ? _value.historyNo
          : historyNo // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      videoNo: null == videoNo
          ? _value.videoNo
          : videoNo // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      timeline: null == timeline
          ? _value.timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      videoResponse: null == videoResponse
          ? _value.videoResponse
          : videoResponse // ignore: cast_nullable_to_non_nullable
              as Vod,
    ) as $Val);
  }

  /// Create a copy of WatchingHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodCopyWith<$Res> get videoResponse {
    return $VodCopyWith<$Res>(_value.videoResponse, (value) {
      return _then(_value.copyWith(videoResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WatchingHistoryImplCopyWith<$Res>
    implements $WatchingHistoryCopyWith<$Res> {
  factory _$$WatchingHistoryImplCopyWith(_$WatchingHistoryImpl value,
          $Res Function(_$WatchingHistoryImpl) then) =
      __$$WatchingHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String historyNo,
      String channelId,
      int videoNo,
      String contentType,
      int timeline,
      String date,
      Vod videoResponse});

  @override
  $VodCopyWith<$Res> get videoResponse;
}

/// @nodoc
class __$$WatchingHistoryImplCopyWithImpl<$Res>
    extends _$WatchingHistoryCopyWithImpl<$Res, _$WatchingHistoryImpl>
    implements _$$WatchingHistoryImplCopyWith<$Res> {
  __$$WatchingHistoryImplCopyWithImpl(
      _$WatchingHistoryImpl _value, $Res Function(_$WatchingHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of WatchingHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyNo = null,
    Object? channelId = null,
    Object? videoNo = null,
    Object? contentType = null,
    Object? timeline = null,
    Object? date = null,
    Object? videoResponse = null,
  }) {
    return _then(_$WatchingHistoryImpl(
      historyNo: null == historyNo
          ? _value.historyNo
          : historyNo // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      videoNo: null == videoNo
          ? _value.videoNo
          : videoNo // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      timeline: null == timeline
          ? _value.timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      videoResponse: null == videoResponse
          ? _value.videoResponse
          : videoResponse // ignore: cast_nullable_to_non_nullable
              as Vod,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchingHistoryImpl implements _WatchingHistory {
  const _$WatchingHistoryImpl(
      {required this.historyNo,
      required this.channelId,
      required this.videoNo,
      required this.contentType,
      required this.timeline,
      required this.date,
      required this.videoResponse});

  factory _$WatchingHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchingHistoryImplFromJson(json);

  @override
  final String historyNo;
  @override
  final String channelId;
  @override
  final int videoNo;
  @override
  final String contentType;
  @override
  final int timeline;
  @override
  final String date;
  @override
  final Vod videoResponse;

  @override
  String toString() {
    return 'WatchingHistory(historyNo: $historyNo, channelId: $channelId, videoNo: $videoNo, contentType: $contentType, timeline: $timeline, date: $date, videoResponse: $videoResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchingHistoryImpl &&
            (identical(other.historyNo, historyNo) ||
                other.historyNo == historyNo) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.timeline, timeline) ||
                other.timeline == timeline) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.videoResponse, videoResponse) ||
                other.videoResponse == videoResponse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, historyNo, channelId, videoNo,
      contentType, timeline, date, videoResponse);

  /// Create a copy of WatchingHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchingHistoryImplCopyWith<_$WatchingHistoryImpl> get copyWith =>
      __$$WatchingHistoryImplCopyWithImpl<_$WatchingHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchingHistoryImplToJson(
      this,
    );
  }
}

abstract class _WatchingHistory implements WatchingHistory {
  const factory _WatchingHistory(
      {required final String historyNo,
      required final String channelId,
      required final int videoNo,
      required final String contentType,
      required final int timeline,
      required final String date,
      required final Vod videoResponse}) = _$WatchingHistoryImpl;

  factory _WatchingHistory.fromJson(Map<String, dynamic> json) =
      _$WatchingHistoryImpl.fromJson;

  @override
  String get historyNo;
  @override
  String get channelId;
  @override
  int get videoNo;
  @override
  String get contentType;
  @override
  int get timeline;
  @override
  String get date;
  @override
  Vod get videoResponse;

  /// Create a copy of WatchingHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchingHistoryImplCopyWith<_$WatchingHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
