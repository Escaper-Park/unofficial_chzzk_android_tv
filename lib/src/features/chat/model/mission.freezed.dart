// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Mission _$MissionFromJson(Map<String, dynamic> json) {
  return _Mission.fromJson(json);
}

/// @nodoc
mixin _$Mission {
  String get missionDonationId => throw _privateConstructorUsedError;
  String get missionText => throw _privateConstructorUsedError;
  String get channelId => throw _privateConstructorUsedError;
  String get missionType => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get failCheeringRate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get missionDurationTime => throw _privateConstructorUsedError;
  String get missionStartTime => throw _privateConstructorUsedError;
  String get missionEndTime => throw _privateConstructorUsedError;
  String get createdTime => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get channel => throw _privateConstructorUsedError;
  bool get anonymous => throw _privateConstructorUsedError;
  Object? get createdBadge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionCopyWith<Mission> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionCopyWith<$Res> {
  factory $MissionCopyWith(Mission value, $Res Function(Mission) then) =
      _$MissionCopyWithImpl<$Res, Mission>;
  @useResult
  $Res call(
      {String missionDonationId,
      String missionText,
      String channelId,
      String missionType,
      int amount,
      int failCheeringRate,
      String status,
      int missionDurationTime,
      String missionStartTime,
      String missionEndTime,
      String createdTime,
      User? user,
      String? channel,
      bool anonymous,
      Object? createdBadge});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$MissionCopyWithImpl<$Res, $Val extends Mission>
    implements $MissionCopyWith<$Res> {
  _$MissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionDonationId = null,
    Object? missionText = null,
    Object? channelId = null,
    Object? missionType = null,
    Object? amount = null,
    Object? failCheeringRate = null,
    Object? status = null,
    Object? missionDurationTime = null,
    Object? missionStartTime = null,
    Object? missionEndTime = null,
    Object? createdTime = null,
    Object? user = freezed,
    Object? channel = freezed,
    Object? anonymous = null,
    Object? createdBadge = freezed,
  }) {
    return _then(_value.copyWith(
      missionDonationId: null == missionDonationId
          ? _value.missionDonationId
          : missionDonationId // ignore: cast_nullable_to_non_nullable
              as String,
      missionText: null == missionText
          ? _value.missionText
          : missionText // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      missionType: null == missionType
          ? _value.missionType
          : missionType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      failCheeringRate: null == failCheeringRate
          ? _value.failCheeringRate
          : failCheeringRate // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      missionDurationTime: null == missionDurationTime
          ? _value.missionDurationTime
          : missionDurationTime // ignore: cast_nullable_to_non_nullable
              as int,
      missionStartTime: null == missionStartTime
          ? _value.missionStartTime
          : missionStartTime // ignore: cast_nullable_to_non_nullable
              as String,
      missionEndTime: null == missionEndTime
          ? _value.missionEndTime
          : missionEndTime // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      anonymous: null == anonymous
          ? _value.anonymous
          : anonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBadge:
          freezed == createdBadge ? _value.createdBadge : createdBadge,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MissionImplCopyWith<$Res> implements $MissionCopyWith<$Res> {
  factory _$$MissionImplCopyWith(
          _$MissionImpl value, $Res Function(_$MissionImpl) then) =
      __$$MissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String missionDonationId,
      String missionText,
      String channelId,
      String missionType,
      int amount,
      int failCheeringRate,
      String status,
      int missionDurationTime,
      String missionStartTime,
      String missionEndTime,
      String createdTime,
      User? user,
      String? channel,
      bool anonymous,
      Object? createdBadge});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$MissionImplCopyWithImpl<$Res>
    extends _$MissionCopyWithImpl<$Res, _$MissionImpl>
    implements _$$MissionImplCopyWith<$Res> {
  __$$MissionImplCopyWithImpl(
      _$MissionImpl _value, $Res Function(_$MissionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionDonationId = null,
    Object? missionText = null,
    Object? channelId = null,
    Object? missionType = null,
    Object? amount = null,
    Object? failCheeringRate = null,
    Object? status = null,
    Object? missionDurationTime = null,
    Object? missionStartTime = null,
    Object? missionEndTime = null,
    Object? createdTime = null,
    Object? user = freezed,
    Object? channel = freezed,
    Object? anonymous = null,
    Object? createdBadge = freezed,
  }) {
    return _then(_$MissionImpl(
      missionDonationId: null == missionDonationId
          ? _value.missionDonationId
          : missionDonationId // ignore: cast_nullable_to_non_nullable
              as String,
      missionText: null == missionText
          ? _value.missionText
          : missionText // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      missionType: null == missionType
          ? _value.missionType
          : missionType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      failCheeringRate: null == failCheeringRate
          ? _value.failCheeringRate
          : failCheeringRate // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      missionDurationTime: null == missionDurationTime
          ? _value.missionDurationTime
          : missionDurationTime // ignore: cast_nullable_to_non_nullable
              as int,
      missionStartTime: null == missionStartTime
          ? _value.missionStartTime
          : missionStartTime // ignore: cast_nullable_to_non_nullable
              as String,
      missionEndTime: null == missionEndTime
          ? _value.missionEndTime
          : missionEndTime // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      anonymous: null == anonymous
          ? _value.anonymous
          : anonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBadge:
          freezed == createdBadge ? _value.createdBadge : createdBadge,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissionImpl implements _Mission {
  const _$MissionImpl(
      {required this.missionDonationId,
      required this.missionText,
      required this.channelId,
      required this.missionType,
      required this.amount,
      required this.failCheeringRate,
      required this.status,
      required this.missionDurationTime,
      required this.missionStartTime,
      required this.missionEndTime,
      required this.createdTime,
      required this.user,
      required this.channel,
      required this.anonymous,
      required this.createdBadge});

  factory _$MissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissionImplFromJson(json);

  @override
  final String missionDonationId;
  @override
  final String missionText;
  @override
  final String channelId;
  @override
  final String missionType;
  @override
  final int amount;
  @override
  final int failCheeringRate;
  @override
  final String status;
  @override
  final int missionDurationTime;
  @override
  final String missionStartTime;
  @override
  final String missionEndTime;
  @override
  final String createdTime;
  @override
  final User? user;
  @override
  final String? channel;
  @override
  final bool anonymous;
  @override
  final Object? createdBadge;

  @override
  String toString() {
    return 'Mission(missionDonationId: $missionDonationId, missionText: $missionText, channelId: $channelId, missionType: $missionType, amount: $amount, failCheeringRate: $failCheeringRate, status: $status, missionDurationTime: $missionDurationTime, missionStartTime: $missionStartTime, missionEndTime: $missionEndTime, createdTime: $createdTime, user: $user, channel: $channel, anonymous: $anonymous, createdBadge: $createdBadge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionImpl &&
            (identical(other.missionDonationId, missionDonationId) ||
                other.missionDonationId == missionDonationId) &&
            (identical(other.missionText, missionText) ||
                other.missionText == missionText) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.missionType, missionType) ||
                other.missionType == missionType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.failCheeringRate, failCheeringRate) ||
                other.failCheeringRate == failCheeringRate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.missionDurationTime, missionDurationTime) ||
                other.missionDurationTime == missionDurationTime) &&
            (identical(other.missionStartTime, missionStartTime) ||
                other.missionStartTime == missionStartTime) &&
            (identical(other.missionEndTime, missionEndTime) ||
                other.missionEndTime == missionEndTime) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.anonymous, anonymous) ||
                other.anonymous == anonymous) &&
            const DeepCollectionEquality()
                .equals(other.createdBadge, createdBadge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      missionDonationId,
      missionText,
      channelId,
      missionType,
      amount,
      failCheeringRate,
      status,
      missionDurationTime,
      missionStartTime,
      missionEndTime,
      createdTime,
      user,
      channel,
      anonymous,
      const DeepCollectionEquality().hash(createdBadge));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissionImplCopyWith<_$MissionImpl> get copyWith =>
      __$$MissionImplCopyWithImpl<_$MissionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MissionImplToJson(
      this,
    );
  }
}

abstract class _Mission implements Mission {
  const factory _Mission(
      {required final String missionDonationId,
      required final String missionText,
      required final String channelId,
      required final String missionType,
      required final int amount,
      required final int failCheeringRate,
      required final String status,
      required final int missionDurationTime,
      required final String missionStartTime,
      required final String missionEndTime,
      required final String createdTime,
      required final User? user,
      required final String? channel,
      required final bool anonymous,
      required final Object? createdBadge}) = _$MissionImpl;

  factory _Mission.fromJson(Map<String, dynamic> json) = _$MissionImpl.fromJson;

  @override
  String get missionDonationId;
  @override
  String get missionText;
  @override
  String get channelId;
  @override
  String get missionType;
  @override
  int get amount;
  @override
  int get failCheeringRate;
  @override
  String get status;
  @override
  int get missionDurationTime;
  @override
  String get missionStartTime;
  @override
  String get missionEndTime;
  @override
  String get createdTime;
  @override
  User? get user;
  @override
  String? get channel;
  @override
  bool get anonymous;
  @override
  Object? get createdBadge;
  @override
  @JsonKey(ignore: true)
  _$$MissionImplCopyWith<_$MissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
