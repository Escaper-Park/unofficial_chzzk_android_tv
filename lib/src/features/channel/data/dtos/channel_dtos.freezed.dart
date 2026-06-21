// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelDetailDto {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  int get followerCount;
  String get channelDescription;
  List<String> get activatedChannelBadgeIds;
  bool get openLive;
  ChannelPersonalDataDto? get personalData;

  /// Create a copy of ChannelDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelDetailDtoCopyWith<ChannelDetailDto> get copyWith =>
      _$ChannelDetailDtoCopyWithImpl<ChannelDetailDto>(
        this as ChannelDetailDto,
        _$identity,
      );

  /// Serializes this ChannelDetailDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelDetailDto &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.channelDescription, channelDescription) ||
                other.channelDescription == channelDescription) &&
            const DeepCollectionEquality().equals(
              other.activatedChannelBadgeIds,
              activatedChannelBadgeIds,
            ) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
    followerCount,
    channelDescription,
    const DeepCollectionEquality().hash(activatedChannelBadgeIds),
    openLive,
    personalData,
  );

  @override
  String toString() {
    return 'ChannelDetailDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, followerCount: $followerCount, channelDescription: $channelDescription, activatedChannelBadgeIds: $activatedChannelBadgeIds, openLive: $openLive, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class $ChannelDetailDtoCopyWith<$Res> {
  factory $ChannelDetailDtoCopyWith(
    ChannelDetailDto value,
    $Res Function(ChannelDetailDto) _then,
  ) = _$ChannelDetailDtoCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    int followerCount,
    String channelDescription,
    List<String> activatedChannelBadgeIds,
    bool openLive,
    ChannelPersonalDataDto? personalData,
  });

  $ChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class _$ChannelDetailDtoCopyWithImpl<$Res>
    implements $ChannelDetailDtoCopyWith<$Res> {
  _$ChannelDetailDtoCopyWithImpl(this._self, this._then);

  final ChannelDetailDto _self;
  final $Res Function(ChannelDetailDto) _then;

  /// Create a copy of ChannelDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? followerCount = null,
    Object? channelDescription = null,
    Object? activatedChannelBadgeIds = null,
    Object? openLive = null,
    Object? personalData = freezed,
  }) {
    return _then(
      _self.copyWith(
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
        followerCount: null == followerCount
            ? _self.followerCount
            : followerCount // ignore: cast_nullable_to_non_nullable
                  as int,
        channelDescription: null == channelDescription
            ? _self.channelDescription
            : channelDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        activatedChannelBadgeIds: null == activatedChannelBadgeIds
            ? _self.activatedChannelBadgeIds
            : activatedChannelBadgeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        openLive: null == openLive
            ? _self.openLive
            : openLive // ignore: cast_nullable_to_non_nullable
                  as bool,
        personalData: freezed == personalData
            ? _self.personalData
            : personalData // ignore: cast_nullable_to_non_nullable
                  as ChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of ChannelDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $ChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (value) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChannelDetailDto].
extension ChannelDetailDtoPatterns on ChannelDetailDto {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChannelDetailDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelDetailDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChannelDetailDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelDetailDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChannelDetailDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelDetailDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      int followerCount,
      String channelDescription,
      List<String> activatedChannelBadgeIds,
      bool openLive,
      ChannelPersonalDataDto? personalData,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelDetailDto() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.followerCount,
          _that.channelDescription,
          _that.activatedChannelBadgeIds,
          _that.openLive,
          _that.personalData,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      int followerCount,
      String channelDescription,
      List<String> activatedChannelBadgeIds,
      bool openLive,
      ChannelPersonalDataDto? personalData,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelDetailDto():
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.followerCount,
          _that.channelDescription,
          _that.activatedChannelBadgeIds,
          _that.openLive,
          _that.personalData,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      int followerCount,
      String channelDescription,
      List<String> activatedChannelBadgeIds,
      bool openLive,
      ChannelPersonalDataDto? personalData,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelDetailDto() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.followerCount,
          _that.channelDescription,
          _that.activatedChannelBadgeIds,
          _that.openLive,
          _that.personalData,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChannelDetailDto implements ChannelDetailDto {
  const _ChannelDetailDto({
    required this.channelId,
    required this.channelName,
    this.channelImageUrl,
    this.verifiedMark = false,
    this.followerCount = 0,
    this.channelDescription = '',
    final List<String> activatedChannelBadgeIds = const <String>[],
    this.openLive = false,
    this.personalData,
  }) : _activatedChannelBadgeIds = activatedChannelBadgeIds;
  factory _ChannelDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelDetailDtoFromJson(json);

  @override
  final String channelId;
  @override
  final String channelName;
  @override
  final String? channelImageUrl;
  @override
  @JsonKey()
  final bool verifiedMark;
  @override
  @JsonKey()
  final int followerCount;
  @override
  @JsonKey()
  final String channelDescription;
  final List<String> _activatedChannelBadgeIds;
  @override
  @JsonKey()
  List<String> get activatedChannelBadgeIds {
    if (_activatedChannelBadgeIds is EqualUnmodifiableListView)
      return _activatedChannelBadgeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activatedChannelBadgeIds);
  }

  @override
  @JsonKey()
  final bool openLive;
  @override
  final ChannelPersonalDataDto? personalData;

  /// Create a copy of ChannelDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelDetailDtoCopyWith<_ChannelDetailDto> get copyWith =>
      __$ChannelDetailDtoCopyWithImpl<_ChannelDetailDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChannelDetailDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelDetailDto &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.channelDescription, channelDescription) ||
                other.channelDescription == channelDescription) &&
            const DeepCollectionEquality().equals(
              other._activatedChannelBadgeIds,
              _activatedChannelBadgeIds,
            ) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
    followerCount,
    channelDescription,
    const DeepCollectionEquality().hash(_activatedChannelBadgeIds),
    openLive,
    personalData,
  );

  @override
  String toString() {
    return 'ChannelDetailDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, followerCount: $followerCount, channelDescription: $channelDescription, activatedChannelBadgeIds: $activatedChannelBadgeIds, openLive: $openLive, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class _$ChannelDetailDtoCopyWith<$Res>
    implements $ChannelDetailDtoCopyWith<$Res> {
  factory _$ChannelDetailDtoCopyWith(
    _ChannelDetailDto value,
    $Res Function(_ChannelDetailDto) _then,
  ) = __$ChannelDetailDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    int followerCount,
    String channelDescription,
    List<String> activatedChannelBadgeIds,
    bool openLive,
    ChannelPersonalDataDto? personalData,
  });

  @override
  $ChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class __$ChannelDetailDtoCopyWithImpl<$Res>
    implements _$ChannelDetailDtoCopyWith<$Res> {
  __$ChannelDetailDtoCopyWithImpl(this._self, this._then);

  final _ChannelDetailDto _self;
  final $Res Function(_ChannelDetailDto) _then;

  /// Create a copy of ChannelDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? followerCount = null,
    Object? channelDescription = null,
    Object? activatedChannelBadgeIds = null,
    Object? openLive = null,
    Object? personalData = freezed,
  }) {
    return _then(
      _ChannelDetailDto(
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
        followerCount: null == followerCount
            ? _self.followerCount
            : followerCount // ignore: cast_nullable_to_non_nullable
                  as int,
        channelDescription: null == channelDescription
            ? _self.channelDescription
            : channelDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        activatedChannelBadgeIds: null == activatedChannelBadgeIds
            ? _self._activatedChannelBadgeIds
            : activatedChannelBadgeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        openLive: null == openLive
            ? _self.openLive
            : openLive // ignore: cast_nullable_to_non_nullable
                  as bool,
        personalData: freezed == personalData
            ? _self.personalData
            : personalData // ignore: cast_nullable_to_non_nullable
                  as ChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of ChannelDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $ChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (value) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// @nodoc
mixin _$ChannelMyInfoDto {
  String get channelId;
  ChannelPersonalFollowingDto? get following;
  bool get cheatKey;
  bool get naverMembership;

  /// Create a copy of ChannelMyInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelMyInfoDtoCopyWith<ChannelMyInfoDto> get copyWith =>
      _$ChannelMyInfoDtoCopyWithImpl<ChannelMyInfoDto>(
        this as ChannelMyInfoDto,
        _$identity,
      );

  /// Serializes this ChannelMyInfoDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelMyInfoDto &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.cheatKey, cheatKey) ||
                other.cheatKey == cheatKey) &&
            (identical(other.naverMembership, naverMembership) ||
                other.naverMembership == naverMembership));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, channelId, following, cheatKey, naverMembership);

  @override
  String toString() {
    return 'ChannelMyInfoDto(channelId: $channelId, following: $following, cheatKey: $cheatKey, naverMembership: $naverMembership)';
  }
}

/// @nodoc
abstract mixin class $ChannelMyInfoDtoCopyWith<$Res> {
  factory $ChannelMyInfoDtoCopyWith(
    ChannelMyInfoDto value,
    $Res Function(ChannelMyInfoDto) _then,
  ) = _$ChannelMyInfoDtoCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    ChannelPersonalFollowingDto? following,
    bool cheatKey,
    bool naverMembership,
  });

  $ChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class _$ChannelMyInfoDtoCopyWithImpl<$Res>
    implements $ChannelMyInfoDtoCopyWith<$Res> {
  _$ChannelMyInfoDtoCopyWithImpl(this._self, this._then);

  final ChannelMyInfoDto _self;
  final $Res Function(ChannelMyInfoDto) _then;

  /// Create a copy of ChannelMyInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? following = freezed,
    Object? cheatKey = null,
    Object? naverMembership = null,
  }) {
    return _then(
      _self.copyWith(
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as ChannelPersonalFollowingDto?,
        cheatKey: null == cheatKey
            ? _self.cheatKey
            : cheatKey // ignore: cast_nullable_to_non_nullable
                  as bool,
        naverMembership: null == naverMembership
            ? _self.naverMembership
            : naverMembership // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of ChannelMyInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $ChannelPersonalFollowingDtoCopyWith<$Res>(_self.following!, (
      value,
    ) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChannelMyInfoDto].
extension ChannelMyInfoDtoPatterns on ChannelMyInfoDto {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChannelMyInfoDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelMyInfoDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChannelMyInfoDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelMyInfoDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChannelMyInfoDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelMyInfoDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String channelId,
      ChannelPersonalFollowingDto? following,
      bool cheatKey,
      bool naverMembership,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelMyInfoDto() when $default != null:
        return $default(
          _that.channelId,
          _that.following,
          _that.cheatKey,
          _that.naverMembership,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String channelId,
      ChannelPersonalFollowingDto? following,
      bool cheatKey,
      bool naverMembership,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelMyInfoDto():
        return $default(
          _that.channelId,
          _that.following,
          _that.cheatKey,
          _that.naverMembership,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String channelId,
      ChannelPersonalFollowingDto? following,
      bool cheatKey,
      bool naverMembership,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelMyInfoDto() when $default != null:
        return $default(
          _that.channelId,
          _that.following,
          _that.cheatKey,
          _that.naverMembership,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChannelMyInfoDto implements ChannelMyInfoDto {
  const _ChannelMyInfoDto({
    required this.channelId,
    this.following,
    this.cheatKey = false,
    this.naverMembership = false,
  });
  factory _ChannelMyInfoDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelMyInfoDtoFromJson(json);

  @override
  final String channelId;
  @override
  final ChannelPersonalFollowingDto? following;
  @override
  @JsonKey()
  final bool cheatKey;
  @override
  @JsonKey()
  final bool naverMembership;

  /// Create a copy of ChannelMyInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelMyInfoDtoCopyWith<_ChannelMyInfoDto> get copyWith =>
      __$ChannelMyInfoDtoCopyWithImpl<_ChannelMyInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChannelMyInfoDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelMyInfoDto &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.cheatKey, cheatKey) ||
                other.cheatKey == cheatKey) &&
            (identical(other.naverMembership, naverMembership) ||
                other.naverMembership == naverMembership));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, channelId, following, cheatKey, naverMembership);

  @override
  String toString() {
    return 'ChannelMyInfoDto(channelId: $channelId, following: $following, cheatKey: $cheatKey, naverMembership: $naverMembership)';
  }
}

/// @nodoc
abstract mixin class _$ChannelMyInfoDtoCopyWith<$Res>
    implements $ChannelMyInfoDtoCopyWith<$Res> {
  factory _$ChannelMyInfoDtoCopyWith(
    _ChannelMyInfoDto value,
    $Res Function(_ChannelMyInfoDto) _then,
  ) = __$ChannelMyInfoDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    ChannelPersonalFollowingDto? following,
    bool cheatKey,
    bool naverMembership,
  });

  @override
  $ChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class __$ChannelMyInfoDtoCopyWithImpl<$Res>
    implements _$ChannelMyInfoDtoCopyWith<$Res> {
  __$ChannelMyInfoDtoCopyWithImpl(this._self, this._then);

  final _ChannelMyInfoDto _self;
  final $Res Function(_ChannelMyInfoDto) _then;

  /// Create a copy of ChannelMyInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? following = freezed,
    Object? cheatKey = null,
    Object? naverMembership = null,
  }) {
    return _then(
      _ChannelMyInfoDto(
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as ChannelPersonalFollowingDto?,
        cheatKey: null == cheatKey
            ? _self.cheatKey
            : cheatKey // ignore: cast_nullable_to_non_nullable
                  as bool,
        naverMembership: null == naverMembership
            ? _self.naverMembership
            : naverMembership // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of ChannelMyInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $ChannelPersonalFollowingDtoCopyWith<$Res>(_self.following!, (
      value,
    ) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// @nodoc
mixin _$ChannelVideoListDto {
  List<ChannelVideoDto> get data;
  int get page;
  int get size;
  int get totalCount;
  int get totalPages;

  /// Create a copy of ChannelVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelVideoListDtoCopyWith<ChannelVideoListDto> get copyWith =>
      _$ChannelVideoListDtoCopyWithImpl<ChannelVideoListDto>(
        this as ChannelVideoListDto,
        _$identity,
      );

  /// Serializes this ChannelVideoListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelVideoListDto &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(data),
    page,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'ChannelVideoListDto(data: $data, page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $ChannelVideoListDtoCopyWith<$Res> {
  factory $ChannelVideoListDtoCopyWith(
    ChannelVideoListDto value,
    $Res Function(ChannelVideoListDto) _then,
  ) = _$ChannelVideoListDtoCopyWithImpl;
  @useResult
  $Res call({
    List<ChannelVideoDto> data,
    int page,
    int size,
    int totalCount,
    int totalPages,
  });
}

/// @nodoc
class _$ChannelVideoListDtoCopyWithImpl<$Res>
    implements $ChannelVideoListDtoCopyWith<$Res> {
  _$ChannelVideoListDtoCopyWithImpl(this._self, this._then);

  final ChannelVideoListDto _self;
  final $Res Function(ChannelVideoListDto) _then;

  /// Create a copy of ChannelVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? page = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _self.copyWith(
        data: null == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<ChannelVideoDto>,
        page: null == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCount: null == totalCount
            ? _self.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _self.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ChannelVideoListDto].
extension ChannelVideoListDtoPatterns on ChannelVideoListDto {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChannelVideoListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoListDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChannelVideoListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoListDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChannelVideoListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoListDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      List<ChannelVideoDto> data,
      int page,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoListDto() when $default != null:
        return $default(
          _that.data,
          _that.page,
          _that.size,
          _that.totalCount,
          _that.totalPages,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      List<ChannelVideoDto> data,
      int page,
      int size,
      int totalCount,
      int totalPages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoListDto():
        return $default(
          _that.data,
          _that.page,
          _that.size,
          _that.totalCount,
          _that.totalPages,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      List<ChannelVideoDto> data,
      int page,
      int size,
      int totalCount,
      int totalPages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoListDto() when $default != null:
        return $default(
          _that.data,
          _that.page,
          _that.size,
          _that.totalCount,
          _that.totalPages,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChannelVideoListDto implements ChannelVideoListDto {
  const _ChannelVideoListDto({
    final List<ChannelVideoDto> data = const <ChannelVideoDto>[],
    this.page = 0,
    this.size = 0,
    this.totalCount = 0,
    this.totalPages = 0,
  }) : _data = data;
  factory _ChannelVideoListDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelVideoListDtoFromJson(json);

  final List<ChannelVideoDto> _data;
  @override
  @JsonKey()
  List<ChannelVideoDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int totalPages;

  /// Create a copy of ChannelVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelVideoListDtoCopyWith<_ChannelVideoListDto> get copyWith =>
      __$ChannelVideoListDtoCopyWithImpl<_ChannelVideoListDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$ChannelVideoListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelVideoListDto &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    page,
    size,
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'ChannelVideoListDto(data: $data, page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$ChannelVideoListDtoCopyWith<$Res>
    implements $ChannelVideoListDtoCopyWith<$Res> {
  factory _$ChannelVideoListDtoCopyWith(
    _ChannelVideoListDto value,
    $Res Function(_ChannelVideoListDto) _then,
  ) = __$ChannelVideoListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<ChannelVideoDto> data,
    int page,
    int size,
    int totalCount,
    int totalPages,
  });
}

/// @nodoc
class __$ChannelVideoListDtoCopyWithImpl<$Res>
    implements _$ChannelVideoListDtoCopyWith<$Res> {
  __$ChannelVideoListDtoCopyWithImpl(this._self, this._then);

  final _ChannelVideoListDto _self;
  final $Res Function(_ChannelVideoListDto) _then;

  /// Create a copy of ChannelVideoListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? page = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _ChannelVideoListDto(
        data: null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<ChannelVideoDto>,
        page: null == page
            ? _self.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _self.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCount: null == totalCount
            ? _self.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _self.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$ChannelVideoDto {
  int get videoNo;
  String? get videoId;
  String get videoTitle;
  String get videoType;
  String get publishDate;
  String? get thumbnailImageUrl;
  int get duration;
  int get readCount;
  int get publishDateAt;
  String? get videoCategoryValue;
  bool get adult;
  int get livePv;
  List<String> get tags;
  ChannelNestedDto? get channel;
  String? get blindType;
  int? get watchTimeline;

  /// Create a copy of ChannelVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelVideoDtoCopyWith<ChannelVideoDto> get copyWith =>
      _$ChannelVideoDtoCopyWithImpl<ChannelVideoDto>(
        this as ChannelVideoDto,
        _$identity,
      );

  /// Serializes this ChannelVideoDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelVideoDto &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.videoTitle, videoTitle) ||
                other.videoTitle == videoTitle) &&
            (identical(other.videoType, videoType) ||
                other.videoType == videoType) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            (identical(other.thumbnailImageUrl, thumbnailImageUrl) ||
                other.thumbnailImageUrl == thumbnailImageUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount) &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.videoCategoryValue, videoCategoryValue) ||
                other.videoCategoryValue == videoCategoryValue) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.livePv, livePv) || other.livePv == livePv) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchTimeline, watchTimeline) ||
                other.watchTimeline == watchTimeline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    videoNo,
    videoId,
    videoTitle,
    videoType,
    publishDate,
    thumbnailImageUrl,
    duration,
    readCount,
    publishDateAt,
    videoCategoryValue,
    adult,
    livePv,
    const DeepCollectionEquality().hash(tags),
    channel,
    blindType,
    watchTimeline,
  );

  @override
  String toString() {
    return 'ChannelVideoDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class $ChannelVideoDtoCopyWith<$Res> {
  factory $ChannelVideoDtoCopyWith(
    ChannelVideoDto value,
    $Res Function(ChannelVideoDto) _then,
  ) = _$ChannelVideoDtoCopyWithImpl;
  @useResult
  $Res call({
    int videoNo,
    String? videoId,
    String videoTitle,
    String videoType,
    String publishDate,
    String? thumbnailImageUrl,
    int duration,
    int readCount,
    int publishDateAt,
    String? videoCategoryValue,
    bool adult,
    int livePv,
    List<String> tags,
    ChannelNestedDto? channel,
    String? blindType,
    int? watchTimeline,
  });

  $ChannelNestedDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class _$ChannelVideoDtoCopyWithImpl<$Res>
    implements $ChannelVideoDtoCopyWith<$Res> {
  _$ChannelVideoDtoCopyWithImpl(this._self, this._then);

  final ChannelVideoDto _self;
  final $Res Function(ChannelVideoDto) _then;

  /// Create a copy of ChannelVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoNo = null,
    Object? videoId = freezed,
    Object? videoTitle = null,
    Object? videoType = null,
    Object? publishDate = null,
    Object? thumbnailImageUrl = freezed,
    Object? duration = null,
    Object? readCount = null,
    Object? publishDateAt = null,
    Object? videoCategoryValue = freezed,
    Object? adult = null,
    Object? livePv = null,
    Object? tags = null,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchTimeline = freezed,
  }) {
    return _then(
      _self.copyWith(
        videoNo: null == videoNo
            ? _self.videoNo
            : videoNo // ignore: cast_nullable_to_non_nullable
                  as int,
        videoId: freezed == videoId
            ? _self.videoId
            : videoId // ignore: cast_nullable_to_non_nullable
                  as String?,
        videoTitle: null == videoTitle
            ? _self.videoTitle
            : videoTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        videoType: null == videoType
            ? _self.videoType
            : videoType // ignore: cast_nullable_to_non_nullable
                  as String,
        publishDate: null == publishDate
            ? _self.publishDate
            : publishDate // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnailImageUrl: freezed == thumbnailImageUrl
            ? _self.thumbnailImageUrl
            : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        readCount: null == readCount
            ? _self.readCount
            : readCount // ignore: cast_nullable_to_non_nullable
                  as int,
        publishDateAt: null == publishDateAt
            ? _self.publishDateAt
            : publishDateAt // ignore: cast_nullable_to_non_nullable
                  as int,
        videoCategoryValue: freezed == videoCategoryValue
            ? _self.videoCategoryValue
            : videoCategoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        livePv: null == livePv
            ? _self.livePv
            : livePv // ignore: cast_nullable_to_non_nullable
                  as int,
        tags: null == tags
            ? _self.tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as ChannelNestedDto?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchTimeline: freezed == watchTimeline
            ? _self.watchTimeline
            : watchTimeline // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }

  /// Create a copy of ChannelVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelNestedDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $ChannelNestedDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChannelVideoDto].
extension ChannelVideoDtoPatterns on ChannelVideoDto {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChannelVideoDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChannelVideoDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChannelVideoDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int videoNo,
      String? videoId,
      String videoTitle,
      String videoType,
      String publishDate,
      String? thumbnailImageUrl,
      int duration,
      int readCount,
      int publishDateAt,
      String? videoCategoryValue,
      bool adult,
      int livePv,
      List<String> tags,
      ChannelNestedDto? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoDto() when $default != null:
        return $default(
          _that.videoNo,
          _that.videoId,
          _that.videoTitle,
          _that.videoType,
          _that.publishDate,
          _that.thumbnailImageUrl,
          _that.duration,
          _that.readCount,
          _that.publishDateAt,
          _that.videoCategoryValue,
          _that.adult,
          _that.livePv,
          _that.tags,
          _that.channel,
          _that.blindType,
          _that.watchTimeline,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int videoNo,
      String? videoId,
      String videoTitle,
      String videoType,
      String publishDate,
      String? thumbnailImageUrl,
      int duration,
      int readCount,
      int publishDateAt,
      String? videoCategoryValue,
      bool adult,
      int livePv,
      List<String> tags,
      ChannelNestedDto? channel,
      String? blindType,
      int? watchTimeline,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoDto():
        return $default(
          _that.videoNo,
          _that.videoId,
          _that.videoTitle,
          _that.videoType,
          _that.publishDate,
          _that.thumbnailImageUrl,
          _that.duration,
          _that.readCount,
          _that.publishDateAt,
          _that.videoCategoryValue,
          _that.adult,
          _that.livePv,
          _that.tags,
          _that.channel,
          _that.blindType,
          _that.watchTimeline,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int videoNo,
      String? videoId,
      String videoTitle,
      String videoType,
      String publishDate,
      String? thumbnailImageUrl,
      int duration,
      int readCount,
      int publishDateAt,
      String? videoCategoryValue,
      bool adult,
      int livePv,
      List<String> tags,
      ChannelNestedDto? channel,
      String? blindType,
      int? watchTimeline,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelVideoDto() when $default != null:
        return $default(
          _that.videoNo,
          _that.videoId,
          _that.videoTitle,
          _that.videoType,
          _that.publishDate,
          _that.thumbnailImageUrl,
          _that.duration,
          _that.readCount,
          _that.publishDateAt,
          _that.videoCategoryValue,
          _that.adult,
          _that.livePv,
          _that.tags,
          _that.channel,
          _that.blindType,
          _that.watchTimeline,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChannelVideoDto implements ChannelVideoDto {
  const _ChannelVideoDto({
    this.videoNo = 0,
    this.videoId,
    this.videoTitle = '',
    this.videoType = '',
    this.publishDate = '',
    this.thumbnailImageUrl,
    this.duration = 0,
    this.readCount = 0,
    this.publishDateAt = 0,
    this.videoCategoryValue,
    this.adult = false,
    this.livePv = 0,
    final List<String> tags = const <String>[],
    this.channel,
    this.blindType,
    this.watchTimeline,
  }) : _tags = tags;
  factory _ChannelVideoDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelVideoDtoFromJson(json);

  @override
  @JsonKey()
  final int videoNo;
  @override
  final String? videoId;
  @override
  @JsonKey()
  final String videoTitle;
  @override
  @JsonKey()
  final String videoType;
  @override
  @JsonKey()
  final String publishDate;
  @override
  final String? thumbnailImageUrl;
  @override
  @JsonKey()
  final int duration;
  @override
  @JsonKey()
  final int readCount;
  @override
  @JsonKey()
  final int publishDateAt;
  @override
  final String? videoCategoryValue;
  @override
  @JsonKey()
  final bool adult;
  @override
  @JsonKey()
  final int livePv;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final ChannelNestedDto? channel;
  @override
  final String? blindType;
  @override
  final int? watchTimeline;

  /// Create a copy of ChannelVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelVideoDtoCopyWith<_ChannelVideoDto> get copyWith =>
      __$ChannelVideoDtoCopyWithImpl<_ChannelVideoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChannelVideoDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelVideoDto &&
            (identical(other.videoNo, videoNo) || other.videoNo == videoNo) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.videoTitle, videoTitle) ||
                other.videoTitle == videoTitle) &&
            (identical(other.videoType, videoType) ||
                other.videoType == videoType) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            (identical(other.thumbnailImageUrl, thumbnailImageUrl) ||
                other.thumbnailImageUrl == thumbnailImageUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount) &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.videoCategoryValue, videoCategoryValue) ||
                other.videoCategoryValue == videoCategoryValue) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.livePv, livePv) || other.livePv == livePv) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchTimeline, watchTimeline) ||
                other.watchTimeline == watchTimeline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    videoNo,
    videoId,
    videoTitle,
    videoType,
    publishDate,
    thumbnailImageUrl,
    duration,
    readCount,
    publishDateAt,
    videoCategoryValue,
    adult,
    livePv,
    const DeepCollectionEquality().hash(_tags),
    channel,
    blindType,
    watchTimeline,
  );

  @override
  String toString() {
    return 'ChannelVideoDto(videoNo: $videoNo, videoId: $videoId, videoTitle: $videoTitle, videoType: $videoType, publishDate: $publishDate, thumbnailImageUrl: $thumbnailImageUrl, duration: $duration, readCount: $readCount, publishDateAt: $publishDateAt, videoCategoryValue: $videoCategoryValue, adult: $adult, livePv: $livePv, tags: $tags, channel: $channel, blindType: $blindType, watchTimeline: $watchTimeline)';
  }
}

/// @nodoc
abstract mixin class _$ChannelVideoDtoCopyWith<$Res>
    implements $ChannelVideoDtoCopyWith<$Res> {
  factory _$ChannelVideoDtoCopyWith(
    _ChannelVideoDto value,
    $Res Function(_ChannelVideoDto) _then,
  ) = __$ChannelVideoDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    int videoNo,
    String? videoId,
    String videoTitle,
    String videoType,
    String publishDate,
    String? thumbnailImageUrl,
    int duration,
    int readCount,
    int publishDateAt,
    String? videoCategoryValue,
    bool adult,
    int livePv,
    List<String> tags,
    ChannelNestedDto? channel,
    String? blindType,
    int? watchTimeline,
  });

  @override
  $ChannelNestedDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class __$ChannelVideoDtoCopyWithImpl<$Res>
    implements _$ChannelVideoDtoCopyWith<$Res> {
  __$ChannelVideoDtoCopyWithImpl(this._self, this._then);

  final _ChannelVideoDto _self;
  final $Res Function(_ChannelVideoDto) _then;

  /// Create a copy of ChannelVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoNo = null,
    Object? videoId = freezed,
    Object? videoTitle = null,
    Object? videoType = null,
    Object? publishDate = null,
    Object? thumbnailImageUrl = freezed,
    Object? duration = null,
    Object? readCount = null,
    Object? publishDateAt = null,
    Object? videoCategoryValue = freezed,
    Object? adult = null,
    Object? livePv = null,
    Object? tags = null,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchTimeline = freezed,
  }) {
    return _then(
      _ChannelVideoDto(
        videoNo: null == videoNo
            ? _self.videoNo
            : videoNo // ignore: cast_nullable_to_non_nullable
                  as int,
        videoId: freezed == videoId
            ? _self.videoId
            : videoId // ignore: cast_nullable_to_non_nullable
                  as String?,
        videoTitle: null == videoTitle
            ? _self.videoTitle
            : videoTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        videoType: null == videoType
            ? _self.videoType
            : videoType // ignore: cast_nullable_to_non_nullable
                  as String,
        publishDate: null == publishDate
            ? _self.publishDate
            : publishDate // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnailImageUrl: freezed == thumbnailImageUrl
            ? _self.thumbnailImageUrl
            : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        readCount: null == readCount
            ? _self.readCount
            : readCount // ignore: cast_nullable_to_non_nullable
                  as int,
        publishDateAt: null == publishDateAt
            ? _self.publishDateAt
            : publishDateAt // ignore: cast_nullable_to_non_nullable
                  as int,
        videoCategoryValue: freezed == videoCategoryValue
            ? _self.videoCategoryValue
            : videoCategoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        livePv: null == livePv
            ? _self.livePv
            : livePv // ignore: cast_nullable_to_non_nullable
                  as int,
        tags: null == tags
            ? _self._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as ChannelNestedDto?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchTimeline: freezed == watchTimeline
            ? _self.watchTimeline
            : watchTimeline // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }

  /// Create a copy of ChannelVideoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelNestedDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $ChannelNestedDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$ChannelNestedDto {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  List<String> get activatedChannelBadgeIds;
  ChannelPersonalDataDto? get personalData;

  /// Create a copy of ChannelNestedDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelNestedDtoCopyWith<ChannelNestedDto> get copyWith =>
      _$ChannelNestedDtoCopyWithImpl<ChannelNestedDto>(
        this as ChannelNestedDto,
        _$identity,
      );

  /// Serializes this ChannelNestedDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelNestedDto &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            const DeepCollectionEquality().equals(
              other.activatedChannelBadgeIds,
              activatedChannelBadgeIds,
            ) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData));
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
  );

  @override
  String toString() {
    return 'ChannelNestedDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class $ChannelNestedDtoCopyWith<$Res> {
  factory $ChannelNestedDtoCopyWith(
    ChannelNestedDto value,
    $Res Function(ChannelNestedDto) _then,
  ) = _$ChannelNestedDtoCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    ChannelPersonalDataDto? personalData,
  });

  $ChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class _$ChannelNestedDtoCopyWithImpl<$Res>
    implements $ChannelNestedDtoCopyWith<$Res> {
  _$ChannelNestedDtoCopyWithImpl(this._self, this._then);

  final ChannelNestedDto _self;
  final $Res Function(ChannelNestedDto) _then;

  /// Create a copy of ChannelNestedDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? activatedChannelBadgeIds = null,
    Object? personalData = freezed,
  }) {
    return _then(
      _self.copyWith(
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
        activatedChannelBadgeIds: null == activatedChannelBadgeIds
            ? _self.activatedChannelBadgeIds
            : activatedChannelBadgeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        personalData: freezed == personalData
            ? _self.personalData
            : personalData // ignore: cast_nullable_to_non_nullable
                  as ChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of ChannelNestedDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $ChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (value) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChannelNestedDto].
extension ChannelNestedDtoPatterns on ChannelNestedDto {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChannelNestedDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelNestedDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChannelNestedDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelNestedDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChannelNestedDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelNestedDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      List<String> activatedChannelBadgeIds,
      ChannelPersonalDataDto? personalData,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelNestedDto() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.activatedChannelBadgeIds,
          _that.personalData,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      List<String> activatedChannelBadgeIds,
      ChannelPersonalDataDto? personalData,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelNestedDto():
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.activatedChannelBadgeIds,
          _that.personalData,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      List<String> activatedChannelBadgeIds,
      ChannelPersonalDataDto? personalData,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelNestedDto() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.activatedChannelBadgeIds,
          _that.personalData,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChannelNestedDto implements ChannelNestedDto {
  const _ChannelNestedDto({
    this.channelId = '',
    this.channelName = '',
    this.channelImageUrl,
    this.verifiedMark = false,
    final List<String> activatedChannelBadgeIds = const <String>[],
    this.personalData,
  }) : _activatedChannelBadgeIds = activatedChannelBadgeIds;
  factory _ChannelNestedDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelNestedDtoFromJson(json);

  @override
  @JsonKey()
  final String channelId;
  @override
  @JsonKey()
  final String channelName;
  @override
  final String? channelImageUrl;
  @override
  @JsonKey()
  final bool verifiedMark;
  final List<String> _activatedChannelBadgeIds;
  @override
  @JsonKey()
  List<String> get activatedChannelBadgeIds {
    if (_activatedChannelBadgeIds is EqualUnmodifiableListView)
      return _activatedChannelBadgeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activatedChannelBadgeIds);
  }

  @override
  final ChannelPersonalDataDto? personalData;

  /// Create a copy of ChannelNestedDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelNestedDtoCopyWith<_ChannelNestedDto> get copyWith =>
      __$ChannelNestedDtoCopyWithImpl<_ChannelNestedDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChannelNestedDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelNestedDto &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            const DeepCollectionEquality().equals(
              other._activatedChannelBadgeIds,
              _activatedChannelBadgeIds,
            ) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
    const DeepCollectionEquality().hash(_activatedChannelBadgeIds),
    personalData,
  );

  @override
  String toString() {
    return 'ChannelNestedDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class _$ChannelNestedDtoCopyWith<$Res>
    implements $ChannelNestedDtoCopyWith<$Res> {
  factory _$ChannelNestedDtoCopyWith(
    _ChannelNestedDto value,
    $Res Function(_ChannelNestedDto) _then,
  ) = __$ChannelNestedDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    ChannelPersonalDataDto? personalData,
  });

  @override
  $ChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class __$ChannelNestedDtoCopyWithImpl<$Res>
    implements _$ChannelNestedDtoCopyWith<$Res> {
  __$ChannelNestedDtoCopyWithImpl(this._self, this._then);

  final _ChannelNestedDto _self;
  final $Res Function(_ChannelNestedDto) _then;

  /// Create a copy of ChannelNestedDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? activatedChannelBadgeIds = null,
    Object? personalData = freezed,
  }) {
    return _then(
      _ChannelNestedDto(
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
        activatedChannelBadgeIds: null == activatedChannelBadgeIds
            ? _self._activatedChannelBadgeIds
            : activatedChannelBadgeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        personalData: freezed == personalData
            ? _self.personalData
            : personalData // ignore: cast_nullable_to_non_nullable
                  as ChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of ChannelNestedDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $ChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (value) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// @nodoc
mixin _$ChannelPersonalDataDto {
  ChannelPersonalFollowingDto? get following;
  bool get privateUserBlock;

  /// Create a copy of ChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelPersonalDataDtoCopyWith<ChannelPersonalDataDto> get copyWith =>
      _$ChannelPersonalDataDtoCopyWithImpl<ChannelPersonalDataDto>(
        this as ChannelPersonalDataDto,
        _$identity,
      );

  /// Serializes this ChannelPersonalDataDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelPersonalDataDto &&
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
    return 'ChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $ChannelPersonalDataDtoCopyWith<$Res> {
  factory $ChannelPersonalDataDtoCopyWith(
    ChannelPersonalDataDto value,
    $Res Function(ChannelPersonalDataDto) _then,
  ) = _$ChannelPersonalDataDtoCopyWithImpl;
  @useResult
  $Res call({ChannelPersonalFollowingDto? following, bool privateUserBlock});

  $ChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class _$ChannelPersonalDataDtoCopyWithImpl<$Res>
    implements $ChannelPersonalDataDtoCopyWith<$Res> {
  _$ChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final ChannelPersonalDataDto _self;
  final $Res Function(ChannelPersonalDataDto) _then;

  /// Create a copy of ChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _self.copyWith(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as ChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of ChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $ChannelPersonalFollowingDtoCopyWith<$Res>(_self.following!, (
      value,
    ) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChannelPersonalDataDto].
extension ChannelPersonalDataDtoPatterns on ChannelPersonalDataDto {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChannelPersonalDataDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalDataDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChannelPersonalDataDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalDataDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChannelPersonalDataDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalDataDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      ChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalDataDto() when $default != null:
        return $default(_that.following, _that.privateUserBlock);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      ChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalDataDto():
        return $default(_that.following, _that.privateUserBlock);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      ChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalDataDto() when $default != null:
        return $default(_that.following, _that.privateUserBlock);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChannelPersonalDataDto implements ChannelPersonalDataDto {
  const _ChannelPersonalDataDto({
    this.following,
    this.privateUserBlock = false,
  });
  factory _ChannelPersonalDataDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelPersonalDataDtoFromJson(json);

  @override
  final ChannelPersonalFollowingDto? following;
  @override
  @JsonKey()
  final bool privateUserBlock;

  /// Create a copy of ChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelPersonalDataDtoCopyWith<_ChannelPersonalDataDto> get copyWith =>
      __$ChannelPersonalDataDtoCopyWithImpl<_ChannelPersonalDataDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$ChannelPersonalDataDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelPersonalDataDto &&
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
    return 'ChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class _$ChannelPersonalDataDtoCopyWith<$Res>
    implements $ChannelPersonalDataDtoCopyWith<$Res> {
  factory _$ChannelPersonalDataDtoCopyWith(
    _ChannelPersonalDataDto value,
    $Res Function(_ChannelPersonalDataDto) _then,
  ) = __$ChannelPersonalDataDtoCopyWithImpl;
  @override
  @useResult
  $Res call({ChannelPersonalFollowingDto? following, bool privateUserBlock});

  @override
  $ChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class __$ChannelPersonalDataDtoCopyWithImpl<$Res>
    implements _$ChannelPersonalDataDtoCopyWith<$Res> {
  __$ChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final _ChannelPersonalDataDto _self;
  final $Res Function(_ChannelPersonalDataDto) _then;

  /// Create a copy of ChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _ChannelPersonalDataDto(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as ChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of ChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $ChannelPersonalFollowingDtoCopyWith<$Res>(_self.following!, (
      value,
    ) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// @nodoc
mixin _$ChannelPersonalFollowingDto {
  bool get following;
  bool get notification;
  String? get followDate;

  /// Create a copy of ChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelPersonalFollowingDtoCopyWith<ChannelPersonalFollowingDto>
  get copyWith =>
      _$ChannelPersonalFollowingDtoCopyWithImpl<ChannelPersonalFollowingDto>(
        this as ChannelPersonalFollowingDto,
        _$identity,
      );

  /// Serializes this ChannelPersonalFollowingDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelPersonalFollowingDto &&
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
    return 'ChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class $ChannelPersonalFollowingDtoCopyWith<$Res> {
  factory $ChannelPersonalFollowingDtoCopyWith(
    ChannelPersonalFollowingDto value,
    $Res Function(ChannelPersonalFollowingDto) _then,
  ) = _$ChannelPersonalFollowingDtoCopyWithImpl;
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class _$ChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements $ChannelPersonalFollowingDtoCopyWith<$Res> {
  _$ChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final ChannelPersonalFollowingDto _self;
  final $Res Function(ChannelPersonalFollowingDto) _then;

  /// Create a copy of ChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(
      _self.copyWith(
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
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ChannelPersonalFollowingDto].
extension ChannelPersonalFollowingDtoPatterns on ChannelPersonalFollowingDto {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChannelPersonalFollowingDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalFollowingDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChannelPersonalFollowingDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalFollowingDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChannelPersonalFollowingDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalFollowingDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool following, bool notification, String? followDate)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalFollowingDto() when $default != null:
        return $default(_that.following, _that.notification, _that.followDate);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool following, bool notification, String? followDate)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalFollowingDto():
        return $default(_that.following, _that.notification, _that.followDate);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool following, bool notification, String? followDate)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalFollowingDto() when $default != null:
        return $default(_that.following, _that.notification, _that.followDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChannelPersonalFollowingDto implements ChannelPersonalFollowingDto {
  const _ChannelPersonalFollowingDto({
    this.following = false,
    this.notification = false,
    this.followDate,
  });
  factory _ChannelPersonalFollowingDto.fromJson(Map<String, dynamic> json) =>
      _$ChannelPersonalFollowingDtoFromJson(json);

  @override
  @JsonKey()
  final bool following;
  @override
  @JsonKey()
  final bool notification;
  @override
  final String? followDate;

  /// Create a copy of ChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelPersonalFollowingDtoCopyWith<_ChannelPersonalFollowingDto>
  get copyWith =>
      __$ChannelPersonalFollowingDtoCopyWithImpl<_ChannelPersonalFollowingDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$ChannelPersonalFollowingDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelPersonalFollowingDto &&
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
    return 'ChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class _$ChannelPersonalFollowingDtoCopyWith<$Res>
    implements $ChannelPersonalFollowingDtoCopyWith<$Res> {
  factory _$ChannelPersonalFollowingDtoCopyWith(
    _ChannelPersonalFollowingDto value,
    $Res Function(_ChannelPersonalFollowingDto) _then,
  ) = __$ChannelPersonalFollowingDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class __$ChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements _$ChannelPersonalFollowingDtoCopyWith<$Res> {
  __$ChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final _ChannelPersonalFollowingDto _self;
  final $Res Function(_ChannelPersonalFollowingDto) _then;

  /// Create a copy of ChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(
      _ChannelPersonalFollowingDto(
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
      ),
    );
  }
}
