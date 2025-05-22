// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Channel {
/* Required */
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  List<String>? get activatedChannelBadgeIds; /* Optional */
  PersonalData? get personalData;
  String? get channelType;
  String? get channelDescription;
  int? get followerCount;
  bool? get openLive;

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelCopyWith<Channel> get copyWith =>
      _$ChannelCopyWithImpl<Channel>(this as Channel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Channel &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            const DeepCollectionEquality().equals(
                other.activatedChannelBadgeIds, activatedChannelBadgeIds) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData) &&
            (identical(other.channelType, channelType) ||
                other.channelType == channelType) &&
            (identical(other.channelDescription, channelDescription) ||
                other.channelDescription == channelDescription) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      channelId,
      channelName,
      channelImageUrl,
      verifiedMark,
      const DeepCollectionEquality().hash(activatedChannelBadgeIds),
      personalData,
      channelType,
      channelDescription,
      followerCount,
      openLive);

  @override
  String toString() {
    return 'Channel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData, channelType: $channelType, channelDescription: $channelDescription, followerCount: $followerCount, openLive: $openLive)';
  }
}

/// @nodoc
abstract mixin class $ChannelCopyWith<$Res> {
  factory $ChannelCopyWith(Channel value, $Res Function(Channel) _then) =
      _$ChannelCopyWithImpl;
  @useResult
  $Res call(
      {String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      PersonalData? personalData,
      List<String>? activatedChannelBadgeIds,
      String? channelType,
      String? channelDescription,
      int? followerCount,
      bool? openLive});
}

/// @nodoc
class _$ChannelCopyWithImpl<$Res> implements $ChannelCopyWith<$Res> {
  _$ChannelCopyWithImpl(this._self, this._then);

  final Channel _self;
  final $Res Function(Channel) _then;

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
    Object? activatedChannelBadgeIds = freezed,
    Object? channelType = freezed,
    Object? channelDescription = freezed,
    Object? followerCount = freezed,
    Object? openLive = freezed,
  }) {
    return _then(Channel(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _self.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      channelImageUrl: freezed == channelImageUrl
          ? _self.channelImageUrl
          : channelImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedMark: null == verifiedMark
          ? _self.verifiedMark
          : verifiedMark // ignore: cast_nullable_to_non_nullable
              as bool,
      personalData: freezed == personalData
          ? _self.personalData
          : personalData // ignore: cast_nullable_to_non_nullable
              as PersonalData?,
      activatedChannelBadgeIds: freezed == activatedChannelBadgeIds
          ? _self.activatedChannelBadgeIds
          : activatedChannelBadgeIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      channelType: freezed == channelType
          ? _self.channelType
          : channelType // ignore: cast_nullable_to_non_nullable
              as String?,
      channelDescription: freezed == channelDescription
          ? _self.channelDescription
          : channelDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      followerCount: freezed == followerCount
          ? _self.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      openLive: freezed == openLive
          ? _self.openLive
          : openLive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$PersonalData {
  PersonalFollowing? get following;
  bool get privateUserBlock;

  /// Create a copy of PersonalData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PersonalDataCopyWith<PersonalData> get copyWith =>
      _$PersonalDataCopyWithImpl<PersonalData>(
          this as PersonalData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PersonalData &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.privateUserBlock, privateUserBlock) ||
                other.privateUserBlock == privateUserBlock));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, following, privateUserBlock);

  @override
  String toString() {
    return 'PersonalData(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $PersonalDataCopyWith<$Res> {
  factory $PersonalDataCopyWith(
          PersonalData value, $Res Function(PersonalData) _then) =
      _$PersonalDataCopyWithImpl;
  @useResult
  $Res call({PersonalFollowing? following, bool privateUserBlock});
}

/// @nodoc
class _$PersonalDataCopyWithImpl<$Res> implements $PersonalDataCopyWith<$Res> {
  _$PersonalDataCopyWithImpl(this._self, this._then);

  final PersonalData _self;
  final $Res Function(PersonalData) _then;

  /// Create a copy of PersonalData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? following = freezed,
    Object? privateUserBlock = null,
  }) {
    return _then(PersonalData(
      following: freezed == following
          ? _self.following
          : following // ignore: cast_nullable_to_non_nullable
              as PersonalFollowing?,
      privateUserBlock: null == privateUserBlock
          ? _self.privateUserBlock
          : privateUserBlock // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$PersonalFollowing {
  bool get following;
  bool get notification;
  String? get followDate;

  /// Create a copy of PersonalFollowing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PersonalFollowingCopyWith<PersonalFollowing> get copyWith =>
      _$PersonalFollowingCopyWithImpl<PersonalFollowing>(
          this as PersonalFollowing, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PersonalFollowing &&
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

  @override
  String toString() {
    return 'PersonalFollowing(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class $PersonalFollowingCopyWith<$Res> {
  factory $PersonalFollowingCopyWith(
          PersonalFollowing value, $Res Function(PersonalFollowing) _then) =
      _$PersonalFollowingCopyWithImpl;
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class _$PersonalFollowingCopyWithImpl<$Res>
    implements $PersonalFollowingCopyWith<$Res> {
  _$PersonalFollowingCopyWithImpl(this._self, this._then);

  final PersonalFollowing _self;
  final $Res Function(PersonalFollowing) _then;

  /// Create a copy of PersonalFollowing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(PersonalFollowing(
      following: null == following
          ? _self.following
          : following // ignore: cast_nullable_to_non_nullable
              as bool,
      notification: null == notification
          ? _self.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool,
      followDate: freezed == followDate
          ? _self.followDate
          : followDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
