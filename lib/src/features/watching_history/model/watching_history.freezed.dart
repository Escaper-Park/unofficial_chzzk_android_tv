// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watching_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchingHistory {
  String get historyNo;
  String get channelId;
  int get videoNo;
  String get contentType;
  int get timeline;
  String get date;
  Vod get videoResponse;

  /// Create a copy of WatchingHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchingHistoryCopyWith<WatchingHistory> get copyWith =>
      _$WatchingHistoryCopyWithImpl<WatchingHistory>(
          this as WatchingHistory, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchingHistory &&
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

  @override
  String toString() {
    return 'WatchingHistory(historyNo: $historyNo, channelId: $channelId, videoNo: $videoNo, contentType: $contentType, timeline: $timeline, date: $date, videoResponse: $videoResponse)';
  }
}

/// @nodoc
abstract mixin class $WatchingHistoryCopyWith<$Res> {
  factory $WatchingHistoryCopyWith(
          WatchingHistory value, $Res Function(WatchingHistory) _then) =
      _$WatchingHistoryCopyWithImpl;
  @useResult
  $Res call(
      {String historyNo,
      String channelId,
      int videoNo,
      String contentType,
      int timeline,
      String date,
      Vod videoResponse});
}

/// @nodoc
class _$WatchingHistoryCopyWithImpl<$Res>
    implements $WatchingHistoryCopyWith<$Res> {
  _$WatchingHistoryCopyWithImpl(this._self, this._then);

  final WatchingHistory _self;
  final $Res Function(WatchingHistory) _then;

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
    return _then(WatchingHistory(
      historyNo: null == historyNo
          ? _self.historyNo
          : historyNo // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      videoNo: null == videoNo
          ? _self.videoNo
          : videoNo // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _self.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      timeline: null == timeline
          ? _self.timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      videoResponse: null == videoResponse
          ? _self.videoResponse
          : videoResponse // ignore: cast_nullable_to_non_nullable
              as Vod,
    ));
  }
}

// dart format on
