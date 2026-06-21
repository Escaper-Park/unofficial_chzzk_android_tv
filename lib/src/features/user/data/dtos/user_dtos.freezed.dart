// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserStatusDto {
  bool get hasProfile;
  bool get loggedIn;
  String? get nickname;
  bool get officialNotiAgree;
  String? get officialNotiAgreeUpdatedDate;
  List<String> get penalties;
  String? get profileImageUrl;
  String? get userIdHash;
  bool get verifiedMark;

  /// Create a copy of UserStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserStatusDtoCopyWith<UserStatusDto> get copyWith =>
      _$UserStatusDtoCopyWithImpl<UserStatusDto>(
        this as UserStatusDto,
        _$identity,
      );

  /// Serializes this UserStatusDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStatusDto &&
            (identical(other.hasProfile, hasProfile) ||
                other.hasProfile == hasProfile) &&
            (identical(other.loggedIn, loggedIn) ||
                other.loggedIn == loggedIn) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.officialNotiAgree, officialNotiAgree) ||
                other.officialNotiAgree == officialNotiAgree) &&
            (identical(
                  other.officialNotiAgreeUpdatedDate,
                  officialNotiAgreeUpdatedDate,
                ) ||
                other.officialNotiAgreeUpdatedDate ==
                    officialNotiAgreeUpdatedDate) &&
            const DeepCollectionEquality().equals(other.penalties, penalties) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.userIdHash, userIdHash) ||
                other.userIdHash == userIdHash) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    hasProfile,
    loggedIn,
    nickname,
    officialNotiAgree,
    officialNotiAgreeUpdatedDate,
    const DeepCollectionEquality().hash(penalties),
    profileImageUrl,
    userIdHash,
    verifiedMark,
  );

  @override
  String toString() {
    return 'UserStatusDto(hasProfile: $hasProfile, loggedIn: $loggedIn, nickname: $nickname, officialNotiAgree: $officialNotiAgree, officialNotiAgreeUpdatedDate: $officialNotiAgreeUpdatedDate, penalties: $penalties, profileImageUrl: $profileImageUrl, userIdHash: $userIdHash, verifiedMark: $verifiedMark)';
  }
}

/// @nodoc
abstract mixin class $UserStatusDtoCopyWith<$Res> {
  factory $UserStatusDtoCopyWith(
    UserStatusDto value,
    $Res Function(UserStatusDto) _then,
  ) = _$UserStatusDtoCopyWithImpl;
  @useResult
  $Res call({
    bool hasProfile,
    bool loggedIn,
    String? nickname,
    bool officialNotiAgree,
    String? officialNotiAgreeUpdatedDate,
    List<String> penalties,
    String? profileImageUrl,
    String? userIdHash,
    bool verifiedMark,
  });
}

/// @nodoc
class _$UserStatusDtoCopyWithImpl<$Res>
    implements $UserStatusDtoCopyWith<$Res> {
  _$UserStatusDtoCopyWithImpl(this._self, this._then);

  final UserStatusDto _self;
  final $Res Function(UserStatusDto) _then;

  /// Create a copy of UserStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasProfile = null,
    Object? loggedIn = null,
    Object? nickname = freezed,
    Object? officialNotiAgree = null,
    Object? officialNotiAgreeUpdatedDate = freezed,
    Object? penalties = null,
    Object? profileImageUrl = freezed,
    Object? userIdHash = freezed,
    Object? verifiedMark = null,
  }) {
    return _then(
      _self.copyWith(
        hasProfile: null == hasProfile
            ? _self.hasProfile
            : hasProfile // ignore: cast_nullable_to_non_nullable
                  as bool,
        loggedIn: null == loggedIn
            ? _self.loggedIn
            : loggedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        nickname: freezed == nickname
            ? _self.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String?,
        officialNotiAgree: null == officialNotiAgree
            ? _self.officialNotiAgree
            : officialNotiAgree // ignore: cast_nullable_to_non_nullable
                  as bool,
        officialNotiAgreeUpdatedDate: freezed == officialNotiAgreeUpdatedDate
            ? _self.officialNotiAgreeUpdatedDate
            : officialNotiAgreeUpdatedDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        penalties: null == penalties
            ? _self.penalties
            : penalties // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        profileImageUrl: freezed == profileImageUrl
            ? _self.profileImageUrl
            : profileImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        userIdHash: freezed == userIdHash
            ? _self.userIdHash
            : userIdHash // ignore: cast_nullable_to_non_nullable
                  as String?,
        verifiedMark: null == verifiedMark
            ? _self.verifiedMark
            : verifiedMark // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [UserStatusDto].
extension UserStatusDtoPatterns on UserStatusDto {
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
    TResult Function(_UserStatusDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserStatusDto() when $default != null:
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
    TResult Function(_UserStatusDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserStatusDto():
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
    TResult? Function(_UserStatusDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserStatusDto() when $default != null:
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
      bool hasProfile,
      bool loggedIn,
      String? nickname,
      bool officialNotiAgree,
      String? officialNotiAgreeUpdatedDate,
      List<String> penalties,
      String? profileImageUrl,
      String? userIdHash,
      bool verifiedMark,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserStatusDto() when $default != null:
        return $default(
          _that.hasProfile,
          _that.loggedIn,
          _that.nickname,
          _that.officialNotiAgree,
          _that.officialNotiAgreeUpdatedDate,
          _that.penalties,
          _that.profileImageUrl,
          _that.userIdHash,
          _that.verifiedMark,
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
      bool hasProfile,
      bool loggedIn,
      String? nickname,
      bool officialNotiAgree,
      String? officialNotiAgreeUpdatedDate,
      List<String> penalties,
      String? profileImageUrl,
      String? userIdHash,
      bool verifiedMark,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserStatusDto():
        return $default(
          _that.hasProfile,
          _that.loggedIn,
          _that.nickname,
          _that.officialNotiAgree,
          _that.officialNotiAgreeUpdatedDate,
          _that.penalties,
          _that.profileImageUrl,
          _that.userIdHash,
          _that.verifiedMark,
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
      bool hasProfile,
      bool loggedIn,
      String? nickname,
      bool officialNotiAgree,
      String? officialNotiAgreeUpdatedDate,
      List<String> penalties,
      String? profileImageUrl,
      String? userIdHash,
      bool verifiedMark,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserStatusDto() when $default != null:
        return $default(
          _that.hasProfile,
          _that.loggedIn,
          _that.nickname,
          _that.officialNotiAgree,
          _that.officialNotiAgreeUpdatedDate,
          _that.penalties,
          _that.profileImageUrl,
          _that.userIdHash,
          _that.verifiedMark,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserStatusDto implements UserStatusDto {
  const _UserStatusDto({
    required this.hasProfile,
    required this.loggedIn,
    this.nickname,
    this.officialNotiAgree = false,
    this.officialNotiAgreeUpdatedDate,
    final List<String> penalties = const <String>[],
    this.profileImageUrl,
    this.userIdHash,
    this.verifiedMark = false,
  }) : _penalties = penalties;
  factory _UserStatusDto.fromJson(Map<String, dynamic> json) =>
      _$UserStatusDtoFromJson(json);

  @override
  final bool hasProfile;
  @override
  final bool loggedIn;
  @override
  final String? nickname;
  @override
  @JsonKey()
  final bool officialNotiAgree;
  @override
  final String? officialNotiAgreeUpdatedDate;
  final List<String> _penalties;
  @override
  @JsonKey()
  List<String> get penalties {
    if (_penalties is EqualUnmodifiableListView) return _penalties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_penalties);
  }

  @override
  final String? profileImageUrl;
  @override
  final String? userIdHash;
  @override
  @JsonKey()
  final bool verifiedMark;

  /// Create a copy of UserStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserStatusDtoCopyWith<_UserStatusDto> get copyWith =>
      __$UserStatusDtoCopyWithImpl<_UserStatusDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserStatusDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserStatusDto &&
            (identical(other.hasProfile, hasProfile) ||
                other.hasProfile == hasProfile) &&
            (identical(other.loggedIn, loggedIn) ||
                other.loggedIn == loggedIn) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.officialNotiAgree, officialNotiAgree) ||
                other.officialNotiAgree == officialNotiAgree) &&
            (identical(
                  other.officialNotiAgreeUpdatedDate,
                  officialNotiAgreeUpdatedDate,
                ) ||
                other.officialNotiAgreeUpdatedDate ==
                    officialNotiAgreeUpdatedDate) &&
            const DeepCollectionEquality().equals(
              other._penalties,
              _penalties,
            ) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.userIdHash, userIdHash) ||
                other.userIdHash == userIdHash) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    hasProfile,
    loggedIn,
    nickname,
    officialNotiAgree,
    officialNotiAgreeUpdatedDate,
    const DeepCollectionEquality().hash(_penalties),
    profileImageUrl,
    userIdHash,
    verifiedMark,
  );

  @override
  String toString() {
    return 'UserStatusDto(hasProfile: $hasProfile, loggedIn: $loggedIn, nickname: $nickname, officialNotiAgree: $officialNotiAgree, officialNotiAgreeUpdatedDate: $officialNotiAgreeUpdatedDate, penalties: $penalties, profileImageUrl: $profileImageUrl, userIdHash: $userIdHash, verifiedMark: $verifiedMark)';
  }
}

/// @nodoc
abstract mixin class _$UserStatusDtoCopyWith<$Res>
    implements $UserStatusDtoCopyWith<$Res> {
  factory _$UserStatusDtoCopyWith(
    _UserStatusDto value,
    $Res Function(_UserStatusDto) _then,
  ) = __$UserStatusDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    bool hasProfile,
    bool loggedIn,
    String? nickname,
    bool officialNotiAgree,
    String? officialNotiAgreeUpdatedDate,
    List<String> penalties,
    String? profileImageUrl,
    String? userIdHash,
    bool verifiedMark,
  });
}

/// @nodoc
class __$UserStatusDtoCopyWithImpl<$Res>
    implements _$UserStatusDtoCopyWith<$Res> {
  __$UserStatusDtoCopyWithImpl(this._self, this._then);

  final _UserStatusDto _self;
  final $Res Function(_UserStatusDto) _then;

  /// Create a copy of UserStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hasProfile = null,
    Object? loggedIn = null,
    Object? nickname = freezed,
    Object? officialNotiAgree = null,
    Object? officialNotiAgreeUpdatedDate = freezed,
    Object? penalties = null,
    Object? profileImageUrl = freezed,
    Object? userIdHash = freezed,
    Object? verifiedMark = null,
  }) {
    return _then(
      _UserStatusDto(
        hasProfile: null == hasProfile
            ? _self.hasProfile
            : hasProfile // ignore: cast_nullable_to_non_nullable
                  as bool,
        loggedIn: null == loggedIn
            ? _self.loggedIn
            : loggedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        nickname: freezed == nickname
            ? _self.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String?,
        officialNotiAgree: null == officialNotiAgree
            ? _self.officialNotiAgree
            : officialNotiAgree // ignore: cast_nullable_to_non_nullable
                  as bool,
        officialNotiAgreeUpdatedDate: freezed == officialNotiAgreeUpdatedDate
            ? _self.officialNotiAgreeUpdatedDate
            : officialNotiAgreeUpdatedDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        penalties: null == penalties
            ? _self._penalties
            : penalties // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        profileImageUrl: freezed == profileImageUrl
            ? _self.profileImageUrl
            : profileImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        userIdHash: freezed == userIdHash
            ? _self.userIdHash
            : userIdHash // ignore: cast_nullable_to_non_nullable
                  as String?,
        verifiedMark: null == verifiedMark
            ? _self.verifiedMark
            : verifiedMark // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
