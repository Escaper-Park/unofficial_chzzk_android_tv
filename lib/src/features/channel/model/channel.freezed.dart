// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return _Channel.fromJson(json);
}

/// @nodoc
mixin _$Channel {
// required
  String get channelId => throw _privateConstructorUsedError;
  String get channelName => throw _privateConstructorUsedError;
  String? get channelImageUrl => throw _privateConstructorUsedError;
  bool get verifiedMark => throw _privateConstructorUsedError; // optional
  PersonalData? get personalData => throw _privateConstructorUsedError;
  int? get followerCount => throw _privateConstructorUsedError;
  bool? get openLive => throw _privateConstructorUsedError;
  String? get channelType => throw _privateConstructorUsedError;
  String? get channelDescription => throw _privateConstructorUsedError;

  /// Serializes this Channel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelCopyWith<Channel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelCopyWith<$Res> {
  factory $ChannelCopyWith(Channel value, $Res Function(Channel) then) =
      _$ChannelCopyWithImpl<$Res, Channel>;
  @useResult
  $Res call(
      {String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      PersonalData? personalData,
      int? followerCount,
      bool? openLive,
      String? channelType,
      String? channelDescription});

  $PersonalDataCopyWith<$Res>? get personalData;
}

/// @nodoc
class _$ChannelCopyWithImpl<$Res, $Val extends Channel>
    implements $ChannelCopyWith<$Res> {
  _$ChannelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? personalData = freezed,
    Object? followerCount = freezed,
    Object? openLive = freezed,
    Object? channelType = freezed,
    Object? channelDescription = freezed,
  }) {
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      channelImageUrl: freezed == channelImageUrl
          ? _value.channelImageUrl
          : channelImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedMark: null == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool,
      personalData: freezed == personalData
          ? _value.personalData
          : personalData // ignore: cast_nullable_to_non_nullable
              as PersonalData?,
      followerCount: freezed == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      openLive: freezed == openLive
          ? _value.openLive
          : openLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      channelType: freezed == channelType
          ? _value.channelType
          : channelType // ignore: cast_nullable_to_non_nullable
              as String?,
      channelDescription: freezed == channelDescription
          ? _value.channelDescription
          : channelDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonalDataCopyWith<$Res>? get personalData {
    if (_value.personalData == null) {
      return null;
    }

    return $PersonalDataCopyWith<$Res>(_value.personalData!, (value) {
      return _then(_value.copyWith(personalData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChannelImplCopyWith<$Res> implements $ChannelCopyWith<$Res> {
  factory _$$ChannelImplCopyWith(
          _$ChannelImpl value, $Res Function(_$ChannelImpl) then) =
      __$$ChannelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      PersonalData? personalData,
      int? followerCount,
      bool? openLive,
      String? channelType,
      String? channelDescription});

  @override
  $PersonalDataCopyWith<$Res>? get personalData;
}

/// @nodoc
class __$$ChannelImplCopyWithImpl<$Res>
    extends _$ChannelCopyWithImpl<$Res, _$ChannelImpl>
    implements _$$ChannelImplCopyWith<$Res> {
  __$$ChannelImplCopyWithImpl(
      _$ChannelImpl _value, $Res Function(_$ChannelImpl) _then)
      : super(_value, _then);

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? personalData = freezed,
    Object? followerCount = freezed,
    Object? openLive = freezed,
    Object? channelType = freezed,
    Object? channelDescription = freezed,
  }) {
    return _then(_$ChannelImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      channelImageUrl: freezed == channelImageUrl
          ? _value.channelImageUrl
          : channelImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedMark: null == verifiedMark
          ? _value.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool,
      personalData: freezed == personalData
          ? _value.personalData
          : personalData // ignore: cast_nullable_to_non_nullable
              as PersonalData?,
      followerCount: freezed == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      openLive: freezed == openLive
          ? _value.openLive
          : openLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      channelType: freezed == channelType
          ? _value.channelType
          : channelType // ignore: cast_nullable_to_non_nullable
              as String?,
      channelDescription: freezed == channelDescription
          ? _value.channelDescription
          : channelDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelImpl implements _Channel {
  _$ChannelImpl(
      {required this.channelId,
      required this.channelName,
      required this.channelImageUrl,
      required this.verifiedMark,
      required this.personalData,
      required this.followerCount,
      required this.openLive,
      required this.channelType,
      required this.channelDescription});

  factory _$ChannelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelImplFromJson(json);

// required
  @override
  final String channelId;
  @override
  final String channelName;
  @override
  final String? channelImageUrl;
  @override
  final bool verifiedMark;
// optional
  @override
  final PersonalData? personalData;
  @override
  final int? followerCount;
  @override
  final bool? openLive;
  @override
  final String? channelType;
  @override
  final String? channelDescription;

  @override
  String toString() {
    return 'Channel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, personalData: $personalData, followerCount: $followerCount, openLive: $openLive, channelType: $channelType, channelDescription: $channelDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelImpl &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive) &&
            (identical(other.channelType, channelType) ||
                other.channelType == channelType) &&
            (identical(other.channelDescription, channelDescription) ||
                other.channelDescription == channelDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      channelId,
      channelName,
      channelImageUrl,
      verifiedMark,
      personalData,
      followerCount,
      openLive,
      channelType,
      channelDescription);

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelImplCopyWith<_$ChannelImpl> get copyWith =>
      __$$ChannelImplCopyWithImpl<_$ChannelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelImplToJson(
      this,
    );
  }
}

abstract class _Channel implements Channel {
  factory _Channel(
      {required final String channelId,
      required final String channelName,
      required final String? channelImageUrl,
      required final bool verifiedMark,
      required final PersonalData? personalData,
      required final int? followerCount,
      required final bool? openLive,
      required final String? channelType,
      required final String? channelDescription}) = _$ChannelImpl;

  factory _Channel.fromJson(Map<String, dynamic> json) = _$ChannelImpl.fromJson;

// required
  @override
  String get channelId;
  @override
  String get channelName;
  @override
  String? get channelImageUrl;
  @override
  bool get verifiedMark; // optional
  @override
  PersonalData? get personalData;
  @override
  int? get followerCount;
  @override
  bool? get openLive;
  @override
  String? get channelType;
  @override
  String? get channelDescription;

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelImplCopyWith<_$ChannelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonalData _$PersonalDataFromJson(Map<String, dynamic> json) {
  return _PersonalData.fromJson(json);
}

/// @nodoc
mixin _$PersonalData {
  PersonalFollowing? get following => throw _privateConstructorUsedError;
  bool get privateUserBlock => throw _privateConstructorUsedError;
  bool? get subscription => throw _privateConstructorUsedError;

  /// Serializes this PersonalData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonalData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalDataCopyWith<PersonalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalDataCopyWith<$Res> {
  factory $PersonalDataCopyWith(
          PersonalData value, $Res Function(PersonalData) then) =
      _$PersonalDataCopyWithImpl<$Res, PersonalData>;
  @useResult
  $Res call(
      {PersonalFollowing? following,
      bool privateUserBlock,
      bool? subscription});

  $PersonalFollowingCopyWith<$Res>? get following;
}

/// @nodoc
class _$PersonalDataCopyWithImpl<$Res, $Val extends PersonalData>
    implements $PersonalDataCopyWith<$Res> {
  _$PersonalDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonalData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? following = freezed,
    Object? privateUserBlock = null,
    Object? subscription = freezed,
  }) {
    return _then(_value.copyWith(
      following: freezed == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as PersonalFollowing?,
      privateUserBlock: null == privateUserBlock
          ? _value.privateUserBlock
          : privateUserBlock // ignore: cast_nullable_to_non_nullable
              as bool,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of PersonalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonalFollowingCopyWith<$Res>? get following {
    if (_value.following == null) {
      return null;
    }

    return $PersonalFollowingCopyWith<$Res>(_value.following!, (value) {
      return _then(_value.copyWith(following: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PersonalDataImplCopyWith<$Res>
    implements $PersonalDataCopyWith<$Res> {
  factory _$$PersonalDataImplCopyWith(
          _$PersonalDataImpl value, $Res Function(_$PersonalDataImpl) then) =
      __$$PersonalDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PersonalFollowing? following,
      bool privateUserBlock,
      bool? subscription});

  @override
  $PersonalFollowingCopyWith<$Res>? get following;
}

/// @nodoc
class __$$PersonalDataImplCopyWithImpl<$Res>
    extends _$PersonalDataCopyWithImpl<$Res, _$PersonalDataImpl>
    implements _$$PersonalDataImplCopyWith<$Res> {
  __$$PersonalDataImplCopyWithImpl(
      _$PersonalDataImpl _value, $Res Function(_$PersonalDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonalData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? following = freezed,
    Object? privateUserBlock = null,
    Object? subscription = freezed,
  }) {
    return _then(_$PersonalDataImpl(
      following: freezed == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as PersonalFollowing?,
      privateUserBlock: null == privateUserBlock
          ? _value.privateUserBlock
          : privateUserBlock // ignore: cast_nullable_to_non_nullable
              as bool,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalDataImpl implements _PersonalData {
  const _$PersonalDataImpl(
      {required this.following,
      required this.privateUserBlock,
      required this.subscription});

  factory _$PersonalDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalDataImplFromJson(json);

  @override
  final PersonalFollowing? following;
  @override
  final bool privateUserBlock;
  @override
  final bool? subscription;

  @override
  String toString() {
    return 'PersonalData(following: $following, privateUserBlock: $privateUserBlock, subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalDataImpl &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.privateUserBlock, privateUserBlock) ||
                other.privateUserBlock == privateUserBlock) &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, following, privateUserBlock, subscription);

  /// Create a copy of PersonalData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalDataImplCopyWith<_$PersonalDataImpl> get copyWith =>
      __$$PersonalDataImplCopyWithImpl<_$PersonalDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalDataImplToJson(
      this,
    );
  }
}

abstract class _PersonalData implements PersonalData {
  const factory _PersonalData(
      {required final PersonalFollowing? following,
      required final bool privateUserBlock,
      required final bool? subscription}) = _$PersonalDataImpl;

  factory _PersonalData.fromJson(Map<String, dynamic> json) =
      _$PersonalDataImpl.fromJson;

  @override
  PersonalFollowing? get following;
  @override
  bool get privateUserBlock;
  @override
  bool? get subscription;

  /// Create a copy of PersonalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalDataImplCopyWith<_$PersonalDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonalFollowing _$PersonalFollowingFromJson(Map<String, dynamic> json) {
  return _PersonalFollowing.fromJson(json);
}

/// @nodoc
mixin _$PersonalFollowing {
  bool get following => throw _privateConstructorUsedError;
  bool get notification => throw _privateConstructorUsedError;
  String? get followDate => throw _privateConstructorUsedError;

  /// Serializes this PersonalFollowing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonalFollowing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalFollowingCopyWith<PersonalFollowing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalFollowingCopyWith<$Res> {
  factory $PersonalFollowingCopyWith(
          PersonalFollowing value, $Res Function(PersonalFollowing) then) =
      _$PersonalFollowingCopyWithImpl<$Res, PersonalFollowing>;
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class _$PersonalFollowingCopyWithImpl<$Res, $Val extends PersonalFollowing>
    implements $PersonalFollowingCopyWith<$Res> {
  _$PersonalFollowingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonalFollowing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(_value.copyWith(
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as bool,
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool,
      followDate: freezed == followDate
          ? _value.followDate
          : followDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalFollowingImplCopyWith<$Res>
    implements $PersonalFollowingCopyWith<$Res> {
  factory _$$PersonalFollowingImplCopyWith(_$PersonalFollowingImpl value,
          $Res Function(_$PersonalFollowingImpl) then) =
      __$$PersonalFollowingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class __$$PersonalFollowingImplCopyWithImpl<$Res>
    extends _$PersonalFollowingCopyWithImpl<$Res, _$PersonalFollowingImpl>
    implements _$$PersonalFollowingImplCopyWith<$Res> {
  __$$PersonalFollowingImplCopyWithImpl(_$PersonalFollowingImpl _value,
      $Res Function(_$PersonalFollowingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonalFollowing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(_$PersonalFollowingImpl(
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as bool,
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool,
      followDate: freezed == followDate
          ? _value.followDate
          : followDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalFollowingImpl implements _PersonalFollowing {
  const _$PersonalFollowingImpl(
      {required this.following,
      required this.notification,
      required this.followDate});

  factory _$PersonalFollowingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalFollowingImplFromJson(json);

  @override
  final bool following;
  @override
  final bool notification;
  @override
  final String? followDate;

  @override
  String toString() {
    return 'PersonalFollowing(following: $following, notification: $notification, followDate: $followDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalFollowingImpl &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.followDate, followDate) ||
                other.followDate == followDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, following, notification, followDate);

  /// Create a copy of PersonalFollowing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalFollowingImplCopyWith<_$PersonalFollowingImpl> get copyWith =>
      __$$PersonalFollowingImplCopyWithImpl<_$PersonalFollowingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalFollowingImplToJson(
      this,
    );
  }
}

abstract class _PersonalFollowing implements PersonalFollowing {
  const factory _PersonalFollowing(
      {required final bool following,
      required final bool notification,
      required final String? followDate}) = _$PersonalFollowingImpl;

  factory _PersonalFollowing.fromJson(Map<String, dynamic> json) =
      _$PersonalFollowingImpl.fromJson;

  @override
  bool get following;
  @override
  bool get notification;
  @override
  String? get followDate;

  /// Create a copy of PersonalFollowing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalFollowingImplCopyWith<_$PersonalFollowingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
