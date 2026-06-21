// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowingChannelListDto {
  List<FollowingChannelDto> get followingList;
  int get totalCount;
  int get totalPage;

  /// Create a copy of FollowingChannelListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingChannelListDtoCopyWith<FollowingChannelListDto> get copyWith =>
      _$FollowingChannelListDtoCopyWithImpl<FollowingChannelListDto>(
        this as FollowingChannelListDto,
        _$identity,
      );

  /// Serializes this FollowingChannelListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingChannelListDto &&
            const DeepCollectionEquality().equals(
              other.followingList,
              followingList,
            ) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(followingList),
    totalCount,
    totalPage,
  );

  @override
  String toString() {
    return 'FollowingChannelListDto(followingList: $followingList, totalCount: $totalCount, totalPage: $totalPage)';
  }
}

/// @nodoc
abstract mixin class $FollowingChannelListDtoCopyWith<$Res> {
  factory $FollowingChannelListDtoCopyWith(
    FollowingChannelListDto value,
    $Res Function(FollowingChannelListDto) _then,
  ) = _$FollowingChannelListDtoCopyWithImpl;
  @useResult
  $Res call({
    List<FollowingChannelDto> followingList,
    int totalCount,
    int totalPage,
  });
}

/// @nodoc
class _$FollowingChannelListDtoCopyWithImpl<$Res>
    implements $FollowingChannelListDtoCopyWith<$Res> {
  _$FollowingChannelListDtoCopyWithImpl(this._self, this._then);

  final FollowingChannelListDto _self;
  final $Res Function(FollowingChannelListDto) _then;

  /// Create a copy of FollowingChannelListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingList = null,
    Object? totalCount = null,
    Object? totalPage = null,
  }) {
    return _then(
      _self.copyWith(
        followingList: null == followingList
            ? _self.followingList
            : followingList // ignore: cast_nullable_to_non_nullable
                  as List<FollowingChannelDto>,
        totalCount: null == totalCount
            ? _self.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPage: null == totalPage
            ? _self.totalPage
            : totalPage // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingChannelListDto].
extension FollowingChannelListDtoPatterns on FollowingChannelListDto {
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
    TResult Function(_FollowingChannelListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelListDto() when $default != null:
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
    TResult Function(_FollowingChannelListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelListDto():
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
    TResult? Function(_FollowingChannelListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelListDto() when $default != null:
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
      List<FollowingChannelDto> followingList,
      int totalCount,
      int totalPage,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelListDto() when $default != null:
        return $default(_that.followingList, _that.totalCount, _that.totalPage);
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
      List<FollowingChannelDto> followingList,
      int totalCount,
      int totalPage,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelListDto():
        return $default(_that.followingList, _that.totalCount, _that.totalPage);
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
      List<FollowingChannelDto> followingList,
      int totalCount,
      int totalPage,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelListDto() when $default != null:
        return $default(_that.followingList, _that.totalCount, _that.totalPage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowingChannelListDto implements FollowingChannelListDto {
  const _FollowingChannelListDto({
    final List<FollowingChannelDto> followingList =
        const <FollowingChannelDto>[],
    this.totalCount = 0,
    this.totalPage = 0,
  }) : _followingList = followingList;
  factory _FollowingChannelListDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingChannelListDtoFromJson(json);

  final List<FollowingChannelDto> _followingList;
  @override
  @JsonKey()
  List<FollowingChannelDto> get followingList {
    if (_followingList is EqualUnmodifiableListView) return _followingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followingList);
  }

  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int totalPage;

  /// Create a copy of FollowingChannelListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingChannelListDtoCopyWith<_FollowingChannelListDto> get copyWith =>
      __$FollowingChannelListDtoCopyWithImpl<_FollowingChannelListDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$FollowingChannelListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingChannelListDto &&
            const DeepCollectionEquality().equals(
              other._followingList,
              _followingList,
            ) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_followingList),
    totalCount,
    totalPage,
  );

  @override
  String toString() {
    return 'FollowingChannelListDto(followingList: $followingList, totalCount: $totalCount, totalPage: $totalPage)';
  }
}

/// @nodoc
abstract mixin class _$FollowingChannelListDtoCopyWith<$Res>
    implements $FollowingChannelListDtoCopyWith<$Res> {
  factory _$FollowingChannelListDtoCopyWith(
    _FollowingChannelListDto value,
    $Res Function(_FollowingChannelListDto) _then,
  ) = __$FollowingChannelListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<FollowingChannelDto> followingList,
    int totalCount,
    int totalPage,
  });
}

/// @nodoc
class __$FollowingChannelListDtoCopyWithImpl<$Res>
    implements _$FollowingChannelListDtoCopyWith<$Res> {
  __$FollowingChannelListDtoCopyWithImpl(this._self, this._then);

  final _FollowingChannelListDto _self;
  final $Res Function(_FollowingChannelListDto) _then;

  /// Create a copy of FollowingChannelListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? followingList = null,
    Object? totalCount = null,
    Object? totalPage = null,
  }) {
    return _then(
      _FollowingChannelListDto(
        followingList: null == followingList
            ? _self._followingList
            : followingList // ignore: cast_nullable_to_non_nullable
                  as List<FollowingChannelDto>,
        totalCount: null == totalCount
            ? _self.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPage: null == totalPage
            ? _self.totalPage
            : totalPage // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$FollowingLiveListDto {
  List<FollowingChannelDto> get followingList;
  int? get totalCount;
  int? get totalLiveCount;
  int? get totalPage;

  /// Create a copy of FollowingLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingLiveListDtoCopyWith<FollowingLiveListDto> get copyWith =>
      _$FollowingLiveListDtoCopyWithImpl<FollowingLiveListDto>(
        this as FollowingLiveListDto,
        _$identity,
      );

  /// Serializes this FollowingLiveListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingLiveListDto &&
            const DeepCollectionEquality().equals(
              other.followingList,
              followingList,
            ) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalLiveCount, totalLiveCount) ||
                other.totalLiveCount == totalLiveCount) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(followingList),
    totalCount,
    totalLiveCount,
    totalPage,
  );

  @override
  String toString() {
    return 'FollowingLiveListDto(followingList: $followingList, totalCount: $totalCount, totalLiveCount: $totalLiveCount, totalPage: $totalPage)';
  }
}

/// @nodoc
abstract mixin class $FollowingLiveListDtoCopyWith<$Res> {
  factory $FollowingLiveListDtoCopyWith(
    FollowingLiveListDto value,
    $Res Function(FollowingLiveListDto) _then,
  ) = _$FollowingLiveListDtoCopyWithImpl;
  @useResult
  $Res call({
    List<FollowingChannelDto> followingList,
    int? totalCount,
    int? totalLiveCount,
    int? totalPage,
  });
}

/// @nodoc
class _$FollowingLiveListDtoCopyWithImpl<$Res>
    implements $FollowingLiveListDtoCopyWith<$Res> {
  _$FollowingLiveListDtoCopyWithImpl(this._self, this._then);

  final FollowingLiveListDto _self;
  final $Res Function(FollowingLiveListDto) _then;

  /// Create a copy of FollowingLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingList = null,
    Object? totalCount = freezed,
    Object? totalLiveCount = freezed,
    Object? totalPage = freezed,
  }) {
    return _then(
      _self.copyWith(
        followingList: null == followingList
            ? _self.followingList
            : followingList // ignore: cast_nullable_to_non_nullable
                  as List<FollowingChannelDto>,
        totalCount: freezed == totalCount
            ? _self.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalLiveCount: freezed == totalLiveCount
            ? _self.totalLiveCount
            : totalLiveCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalPage: freezed == totalPage
            ? _self.totalPage
            : totalPage // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingLiveListDto].
extension FollowingLiveListDtoPatterns on FollowingLiveListDto {
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
    TResult Function(_FollowingLiveListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveListDto() when $default != null:
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
    TResult Function(_FollowingLiveListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveListDto():
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
    TResult? Function(_FollowingLiveListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveListDto() when $default != null:
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
      List<FollowingChannelDto> followingList,
      int? totalCount,
      int? totalLiveCount,
      int? totalPage,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveListDto() when $default != null:
        return $default(
          _that.followingList,
          _that.totalCount,
          _that.totalLiveCount,
          _that.totalPage,
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
      List<FollowingChannelDto> followingList,
      int? totalCount,
      int? totalLiveCount,
      int? totalPage,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveListDto():
        return $default(
          _that.followingList,
          _that.totalCount,
          _that.totalLiveCount,
          _that.totalPage,
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
      List<FollowingChannelDto> followingList,
      int? totalCount,
      int? totalLiveCount,
      int? totalPage,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveListDto() when $default != null:
        return $default(
          _that.followingList,
          _that.totalCount,
          _that.totalLiveCount,
          _that.totalPage,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowingLiveListDto implements FollowingLiveListDto {
  const _FollowingLiveListDto({
    final List<FollowingChannelDto> followingList =
        const <FollowingChannelDto>[],
    this.totalCount,
    this.totalLiveCount,
    this.totalPage,
  }) : _followingList = followingList;
  factory _FollowingLiveListDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingLiveListDtoFromJson(json);

  final List<FollowingChannelDto> _followingList;
  @override
  @JsonKey()
  List<FollowingChannelDto> get followingList {
    if (_followingList is EqualUnmodifiableListView) return _followingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followingList);
  }

  @override
  final int? totalCount;
  @override
  final int? totalLiveCount;
  @override
  final int? totalPage;

  /// Create a copy of FollowingLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingLiveListDtoCopyWith<_FollowingLiveListDto> get copyWith =>
      __$FollowingLiveListDtoCopyWithImpl<_FollowingLiveListDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$FollowingLiveListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingLiveListDto &&
            const DeepCollectionEquality().equals(
              other._followingList,
              _followingList,
            ) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalLiveCount, totalLiveCount) ||
                other.totalLiveCount == totalLiveCount) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_followingList),
    totalCount,
    totalLiveCount,
    totalPage,
  );

  @override
  String toString() {
    return 'FollowingLiveListDto(followingList: $followingList, totalCount: $totalCount, totalLiveCount: $totalLiveCount, totalPage: $totalPage)';
  }
}

/// @nodoc
abstract mixin class _$FollowingLiveListDtoCopyWith<$Res>
    implements $FollowingLiveListDtoCopyWith<$Res> {
  factory _$FollowingLiveListDtoCopyWith(
    _FollowingLiveListDto value,
    $Res Function(_FollowingLiveListDto) _then,
  ) = __$FollowingLiveListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<FollowingChannelDto> followingList,
    int? totalCount,
    int? totalLiveCount,
    int? totalPage,
  });
}

/// @nodoc
class __$FollowingLiveListDtoCopyWithImpl<$Res>
    implements _$FollowingLiveListDtoCopyWith<$Res> {
  __$FollowingLiveListDtoCopyWithImpl(this._self, this._then);

  final _FollowingLiveListDto _self;
  final $Res Function(_FollowingLiveListDto) _then;

  /// Create a copy of FollowingLiveListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? followingList = null,
    Object? totalCount = freezed,
    Object? totalLiveCount = freezed,
    Object? totalPage = freezed,
  }) {
    return _then(
      _FollowingLiveListDto(
        followingList: null == followingList
            ? _self._followingList
            : followingList // ignore: cast_nullable_to_non_nullable
                  as List<FollowingChannelDto>,
        totalCount: freezed == totalCount
            ? _self.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalLiveCount: freezed == totalLiveCount
            ? _self.totalLiveCount
            : totalLiveCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalPage: freezed == totalPage
            ? _self.totalPage
            : totalPage // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
mixin _$FollowingChannelDto {
  FollowingChannelInfoDto? get channel;
  String get channelId;
  FollowingLiveInfoDto? get liveInfo;
  FollowingStreamerDto? get streamer;

  /// Create a copy of FollowingChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingChannelDtoCopyWith<FollowingChannelDto> get copyWith =>
      _$FollowingChannelDtoCopyWithImpl<FollowingChannelDto>(
        this as FollowingChannelDto,
        _$identity,
      );

  /// Serializes this FollowingChannelDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingChannelDto &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.liveInfo, liveInfo) ||
                other.liveInfo == liveInfo) &&
            (identical(other.streamer, streamer) ||
                other.streamer == streamer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, channel, channelId, liveInfo, streamer);

  @override
  String toString() {
    return 'FollowingChannelDto(channel: $channel, channelId: $channelId, liveInfo: $liveInfo, streamer: $streamer)';
  }
}

/// @nodoc
abstract mixin class $FollowingChannelDtoCopyWith<$Res> {
  factory $FollowingChannelDtoCopyWith(
    FollowingChannelDto value,
    $Res Function(FollowingChannelDto) _then,
  ) = _$FollowingChannelDtoCopyWithImpl;
  @useResult
  $Res call({
    FollowingChannelInfoDto? channel,
    String channelId,
    FollowingLiveInfoDto? liveInfo,
    FollowingStreamerDto? streamer,
  });

  $FollowingChannelInfoDtoCopyWith<$Res>? get channel;
  $FollowingLiveInfoDtoCopyWith<$Res>? get liveInfo;
  $FollowingStreamerDtoCopyWith<$Res>? get streamer;
}

/// @nodoc
class _$FollowingChannelDtoCopyWithImpl<$Res>
    implements $FollowingChannelDtoCopyWith<$Res> {
  _$FollowingChannelDtoCopyWithImpl(this._self, this._then);

  final FollowingChannelDto _self;
  final $Res Function(FollowingChannelDto) _then;

  /// Create a copy of FollowingChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = freezed,
    Object? channelId = null,
    Object? liveInfo = freezed,
    Object? streamer = freezed,
  }) {
    return _then(
      _self.copyWith(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as FollowingChannelInfoDto?,
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
        liveInfo: freezed == liveInfo
            ? _self.liveInfo
            : liveInfo // ignore: cast_nullable_to_non_nullable
                  as FollowingLiveInfoDto?,
        streamer: freezed == streamer
            ? _self.streamer
            : streamer // ignore: cast_nullable_to_non_nullable
                  as FollowingStreamerDto?,
      ),
    );
  }

  /// Create a copy of FollowingChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelInfoDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $FollowingChannelInfoDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of FollowingChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingLiveInfoDtoCopyWith<$Res>? get liveInfo {
    if (_self.liveInfo == null) {
      return null;
    }

    return $FollowingLiveInfoDtoCopyWith<$Res>(_self.liveInfo!, (value) {
      return _then(_self.copyWith(liveInfo: value));
    });
  }

  /// Create a copy of FollowingChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingStreamerDtoCopyWith<$Res>? get streamer {
    if (_self.streamer == null) {
      return null;
    }

    return $FollowingStreamerDtoCopyWith<$Res>(_self.streamer!, (value) {
      return _then(_self.copyWith(streamer: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FollowingChannelDto].
extension FollowingChannelDtoPatterns on FollowingChannelDto {
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
    TResult Function(_FollowingChannelDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelDto() when $default != null:
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
    TResult Function(_FollowingChannelDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelDto():
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
    TResult? Function(_FollowingChannelDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelDto() when $default != null:
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
      FollowingChannelInfoDto? channel,
      String channelId,
      FollowingLiveInfoDto? liveInfo,
      FollowingStreamerDto? streamer,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelDto() when $default != null:
        return $default(
          _that.channel,
          _that.channelId,
          _that.liveInfo,
          _that.streamer,
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
      FollowingChannelInfoDto? channel,
      String channelId,
      FollowingLiveInfoDto? liveInfo,
      FollowingStreamerDto? streamer,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelDto():
        return $default(
          _that.channel,
          _that.channelId,
          _that.liveInfo,
          _that.streamer,
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
      FollowingChannelInfoDto? channel,
      String channelId,
      FollowingLiveInfoDto? liveInfo,
      FollowingStreamerDto? streamer,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelDto() when $default != null:
        return $default(
          _that.channel,
          _that.channelId,
          _that.liveInfo,
          _that.streamer,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowingChannelDto implements FollowingChannelDto {
  const _FollowingChannelDto({
    this.channel,
    this.channelId = '',
    this.liveInfo,
    this.streamer,
  });
  factory _FollowingChannelDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingChannelDtoFromJson(json);

  @override
  final FollowingChannelInfoDto? channel;
  @override
  @JsonKey()
  final String channelId;
  @override
  final FollowingLiveInfoDto? liveInfo;
  @override
  final FollowingStreamerDto? streamer;

  /// Create a copy of FollowingChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingChannelDtoCopyWith<_FollowingChannelDto> get copyWith =>
      __$FollowingChannelDtoCopyWithImpl<_FollowingChannelDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$FollowingChannelDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingChannelDto &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.liveInfo, liveInfo) ||
                other.liveInfo == liveInfo) &&
            (identical(other.streamer, streamer) ||
                other.streamer == streamer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, channel, channelId, liveInfo, streamer);

  @override
  String toString() {
    return 'FollowingChannelDto(channel: $channel, channelId: $channelId, liveInfo: $liveInfo, streamer: $streamer)';
  }
}

/// @nodoc
abstract mixin class _$FollowingChannelDtoCopyWith<$Res>
    implements $FollowingChannelDtoCopyWith<$Res> {
  factory _$FollowingChannelDtoCopyWith(
    _FollowingChannelDto value,
    $Res Function(_FollowingChannelDto) _then,
  ) = __$FollowingChannelDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    FollowingChannelInfoDto? channel,
    String channelId,
    FollowingLiveInfoDto? liveInfo,
    FollowingStreamerDto? streamer,
  });

  @override
  $FollowingChannelInfoDtoCopyWith<$Res>? get channel;
  @override
  $FollowingLiveInfoDtoCopyWith<$Res>? get liveInfo;
  @override
  $FollowingStreamerDtoCopyWith<$Res>? get streamer;
}

/// @nodoc
class __$FollowingChannelDtoCopyWithImpl<$Res>
    implements _$FollowingChannelDtoCopyWith<$Res> {
  __$FollowingChannelDtoCopyWithImpl(this._self, this._then);

  final _FollowingChannelDto _self;
  final $Res Function(_FollowingChannelDto) _then;

  /// Create a copy of FollowingChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channel = freezed,
    Object? channelId = null,
    Object? liveInfo = freezed,
    Object? streamer = freezed,
  }) {
    return _then(
      _FollowingChannelDto(
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as FollowingChannelInfoDto?,
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
        liveInfo: freezed == liveInfo
            ? _self.liveInfo
            : liveInfo // ignore: cast_nullable_to_non_nullable
                  as FollowingLiveInfoDto?,
        streamer: freezed == streamer
            ? _self.streamer
            : streamer // ignore: cast_nullable_to_non_nullable
                  as FollowingStreamerDto?,
      ),
    );
  }

  /// Create a copy of FollowingChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelInfoDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $FollowingChannelInfoDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }

  /// Create a copy of FollowingChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingLiveInfoDtoCopyWith<$Res>? get liveInfo {
    if (_self.liveInfo == null) {
      return null;
    }

    return $FollowingLiveInfoDtoCopyWith<$Res>(_self.liveInfo!, (value) {
      return _then(_self.copyWith(liveInfo: value));
    });
  }

  /// Create a copy of FollowingChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingStreamerDtoCopyWith<$Res>? get streamer {
    if (_self.streamer == null) {
      return null;
    }

    return $FollowingStreamerDtoCopyWith<$Res>(_self.streamer!, (value) {
      return _then(_self.copyWith(streamer: value));
    });
  }
}

/// @nodoc
mixin _$FollowingLiveInfoDto {
  int? get liveId;
  String? get liveTitle;
  String? get liveImageUrl;
  String? get defaultThumbnailImageUrl;
  int get concurrentUserCount;
  bool get adult;
  List<String> get tags;
  String? get liveCategoryValue;
  String? get blindType;
  String? get watchPartyTag;
  String? get watchPartyType;
  Map<String, dynamic>? get party;

  /// Create a copy of FollowingLiveInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingLiveInfoDtoCopyWith<FollowingLiveInfoDto> get copyWith =>
      _$FollowingLiveInfoDtoCopyWithImpl<FollowingLiveInfoDto>(
        this as FollowingLiveInfoDto,
        _$identity,
      );

  /// Serializes this FollowingLiveInfoDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingLiveInfoDto &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.liveImageUrl, liveImageUrl) ||
                other.liveImageUrl == liveImageUrl) &&
            (identical(
                  other.defaultThumbnailImageUrl,
                  defaultThumbnailImageUrl,
                ) ||
                other.defaultThumbnailImageUrl == defaultThumbnailImageUrl) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            const DeepCollectionEquality().equals(other.party, party));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    liveId,
    liveTitle,
    liveImageUrl,
    defaultThumbnailImageUrl,
    concurrentUserCount,
    adult,
    const DeepCollectionEquality().hash(tags),
    liveCategoryValue,
    blindType,
    watchPartyTag,
    watchPartyType,
    const DeepCollectionEquality().hash(party),
  );

  @override
  String toString() {
    return 'FollowingLiveInfoDto(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, adult: $adult, tags: $tags, liveCategoryValue: $liveCategoryValue, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, party: $party)';
  }
}

/// @nodoc
abstract mixin class $FollowingLiveInfoDtoCopyWith<$Res> {
  factory $FollowingLiveInfoDtoCopyWith(
    FollowingLiveInfoDto value,
    $Res Function(FollowingLiveInfoDto) _then,
  ) = _$FollowingLiveInfoDtoCopyWithImpl;
  @useResult
  $Res call({
    int? liveId,
    String? liveTitle,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    bool adult,
    List<String> tags,
    String? liveCategoryValue,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    Map<String, dynamic>? party,
  });
}

/// @nodoc
class _$FollowingLiveInfoDtoCopyWithImpl<$Res>
    implements $FollowingLiveInfoDtoCopyWith<$Res> {
  _$FollowingLiveInfoDtoCopyWithImpl(this._self, this._then);

  final FollowingLiveInfoDto _self;
  final $Res Function(FollowingLiveInfoDto) _then;

  /// Create a copy of FollowingLiveInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveId = freezed,
    Object? liveTitle = freezed,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? adult = null,
    Object? tags = null,
    Object? liveCategoryValue = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? party = freezed,
  }) {
    return _then(
      _self.copyWith(
        liveId: freezed == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int?,
        liveTitle: freezed == liveTitle
            ? _self.liveTitle
            : liveTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveImageUrl: freezed == liveImageUrl
            ? _self.liveImageUrl
            : liveImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultThumbnailImageUrl: freezed == defaultThumbnailImageUrl
            ? _self.defaultThumbnailImageUrl
            : defaultThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        tags: null == tags
            ? _self.tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        liveCategoryValue: freezed == liveCategoryValue
            ? _self.liveCategoryValue
            : liveCategoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyTag: freezed == watchPartyTag
            ? _self.watchPartyTag
            : watchPartyTag // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyType: freezed == watchPartyType
            ? _self.watchPartyType
            : watchPartyType // ignore: cast_nullable_to_non_nullable
                  as String?,
        party: freezed == party
            ? _self.party
            : party // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingLiveInfoDto].
extension FollowingLiveInfoDtoPatterns on FollowingLiveInfoDto {
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
    TResult Function(_FollowingLiveInfoDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveInfoDto() when $default != null:
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
    TResult Function(_FollowingLiveInfoDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveInfoDto():
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
    TResult? Function(_FollowingLiveInfoDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveInfoDto() when $default != null:
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
      int? liveId,
      String? liveTitle,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      bool adult,
      List<String> tags,
      String? liveCategoryValue,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      Map<String, dynamic>? party,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveInfoDto() when $default != null:
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.adult,
          _that.tags,
          _that.liveCategoryValue,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.party,
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
      int? liveId,
      String? liveTitle,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      bool adult,
      List<String> tags,
      String? liveCategoryValue,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      Map<String, dynamic>? party,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveInfoDto():
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.adult,
          _that.tags,
          _that.liveCategoryValue,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.party,
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
      int? liveId,
      String? liveTitle,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      bool adult,
      List<String> tags,
      String? liveCategoryValue,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      Map<String, dynamic>? party,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveInfoDto() when $default != null:
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.adult,
          _that.tags,
          _that.liveCategoryValue,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.party,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowingLiveInfoDto implements FollowingLiveInfoDto {
  const _FollowingLiveInfoDto({
    this.liveId,
    this.liveTitle,
    this.liveImageUrl,
    this.defaultThumbnailImageUrl,
    this.concurrentUserCount = 0,
    this.adult = false,
    final List<String> tags = const <String>[],
    this.liveCategoryValue,
    this.blindType,
    this.watchPartyTag,
    this.watchPartyType,
    final Map<String, dynamic>? party,
  }) : _tags = tags,
       _party = party;
  factory _FollowingLiveInfoDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingLiveInfoDtoFromJson(json);

  @override
  final int? liveId;
  @override
  final String? liveTitle;
  @override
  final String? liveImageUrl;
  @override
  final String? defaultThumbnailImageUrl;
  @override
  @JsonKey()
  final int concurrentUserCount;
  @override
  @JsonKey()
  final bool adult;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? liveCategoryValue;
  @override
  final String? blindType;
  @override
  final String? watchPartyTag;
  @override
  final String? watchPartyType;
  final Map<String, dynamic>? _party;
  @override
  Map<String, dynamic>? get party {
    final value = _party;
    if (value == null) return null;
    if (_party is EqualUnmodifiableMapView) return _party;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of FollowingLiveInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingLiveInfoDtoCopyWith<_FollowingLiveInfoDto> get copyWith =>
      __$FollowingLiveInfoDtoCopyWithImpl<_FollowingLiveInfoDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$FollowingLiveInfoDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingLiveInfoDto &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.liveTitle, liveTitle) ||
                other.liveTitle == liveTitle) &&
            (identical(other.liveImageUrl, liveImageUrl) ||
                other.liveImageUrl == liveImageUrl) &&
            (identical(
                  other.defaultThumbnailImageUrl,
                  defaultThumbnailImageUrl,
                ) ||
                other.defaultThumbnailImageUrl == defaultThumbnailImageUrl) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            const DeepCollectionEquality().equals(other._party, _party));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    liveId,
    liveTitle,
    liveImageUrl,
    defaultThumbnailImageUrl,
    concurrentUserCount,
    adult,
    const DeepCollectionEquality().hash(_tags),
    liveCategoryValue,
    blindType,
    watchPartyTag,
    watchPartyType,
    const DeepCollectionEquality().hash(_party),
  );

  @override
  String toString() {
    return 'FollowingLiveInfoDto(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, adult: $adult, tags: $tags, liveCategoryValue: $liveCategoryValue, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, party: $party)';
  }
}

/// @nodoc
abstract mixin class _$FollowingLiveInfoDtoCopyWith<$Res>
    implements $FollowingLiveInfoDtoCopyWith<$Res> {
  factory _$FollowingLiveInfoDtoCopyWith(
    _FollowingLiveInfoDto value,
    $Res Function(_FollowingLiveInfoDto) _then,
  ) = __$FollowingLiveInfoDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    int? liveId,
    String? liveTitle,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    bool adult,
    List<String> tags,
    String? liveCategoryValue,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    Map<String, dynamic>? party,
  });
}

/// @nodoc
class __$FollowingLiveInfoDtoCopyWithImpl<$Res>
    implements _$FollowingLiveInfoDtoCopyWith<$Res> {
  __$FollowingLiveInfoDtoCopyWithImpl(this._self, this._then);

  final _FollowingLiveInfoDto _self;
  final $Res Function(_FollowingLiveInfoDto) _then;

  /// Create a copy of FollowingLiveInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? liveId = freezed,
    Object? liveTitle = freezed,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? adult = null,
    Object? tags = null,
    Object? liveCategoryValue = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? party = freezed,
  }) {
    return _then(
      _FollowingLiveInfoDto(
        liveId: freezed == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int?,
        liveTitle: freezed == liveTitle
            ? _self.liveTitle
            : liveTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveImageUrl: freezed == liveImageUrl
            ? _self.liveImageUrl
            : liveImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultThumbnailImageUrl: freezed == defaultThumbnailImageUrl
            ? _self.defaultThumbnailImageUrl
            : defaultThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        tags: null == tags
            ? _self._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        liveCategoryValue: freezed == liveCategoryValue
            ? _self.liveCategoryValue
            : liveCategoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyTag: freezed == watchPartyTag
            ? _self.watchPartyTag
            : watchPartyTag // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyType: freezed == watchPartyType
            ? _self.watchPartyType
            : watchPartyType // ignore: cast_nullable_to_non_nullable
                  as String?,
        party: freezed == party
            ? _self._party
            : party // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
mixin _$FollowingStreamerDto {
  bool get openLive;

  /// Create a copy of FollowingStreamerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingStreamerDtoCopyWith<FollowingStreamerDto> get copyWith =>
      _$FollowingStreamerDtoCopyWithImpl<FollowingStreamerDto>(
        this as FollowingStreamerDto,
        _$identity,
      );

  /// Serializes this FollowingStreamerDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingStreamerDto &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, openLive);

  @override
  String toString() {
    return 'FollowingStreamerDto(openLive: $openLive)';
  }
}

/// @nodoc
abstract mixin class $FollowingStreamerDtoCopyWith<$Res> {
  factory $FollowingStreamerDtoCopyWith(
    FollowingStreamerDto value,
    $Res Function(FollowingStreamerDto) _then,
  ) = _$FollowingStreamerDtoCopyWithImpl;
  @useResult
  $Res call({bool openLive});
}

/// @nodoc
class _$FollowingStreamerDtoCopyWithImpl<$Res>
    implements $FollowingStreamerDtoCopyWith<$Res> {
  _$FollowingStreamerDtoCopyWithImpl(this._self, this._then);

  final FollowingStreamerDto _self;
  final $Res Function(FollowingStreamerDto) _then;

  /// Create a copy of FollowingStreamerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? openLive = null}) {
    return _then(
      _self.copyWith(
        openLive: null == openLive
            ? _self.openLive
            : openLive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingStreamerDto].
extension FollowingStreamerDtoPatterns on FollowingStreamerDto {
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
    TResult Function(_FollowingStreamerDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingStreamerDto() when $default != null:
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
    TResult Function(_FollowingStreamerDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingStreamerDto():
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
    TResult? Function(_FollowingStreamerDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingStreamerDto() when $default != null:
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
    TResult Function(bool openLive)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingStreamerDto() when $default != null:
        return $default(_that.openLive);
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
    TResult Function(bool openLive) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingStreamerDto():
        return $default(_that.openLive);
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
    TResult? Function(bool openLive)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingStreamerDto() when $default != null:
        return $default(_that.openLive);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowingStreamerDto implements FollowingStreamerDto {
  const _FollowingStreamerDto({this.openLive = false});
  factory _FollowingStreamerDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingStreamerDtoFromJson(json);

  @override
  @JsonKey()
  final bool openLive;

  /// Create a copy of FollowingStreamerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingStreamerDtoCopyWith<_FollowingStreamerDto> get copyWith =>
      __$FollowingStreamerDtoCopyWithImpl<_FollowingStreamerDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$FollowingStreamerDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingStreamerDto &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, openLive);

  @override
  String toString() {
    return 'FollowingStreamerDto(openLive: $openLive)';
  }
}

/// @nodoc
abstract mixin class _$FollowingStreamerDtoCopyWith<$Res>
    implements $FollowingStreamerDtoCopyWith<$Res> {
  factory _$FollowingStreamerDtoCopyWith(
    _FollowingStreamerDto value,
    $Res Function(_FollowingStreamerDto) _then,
  ) = __$FollowingStreamerDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool openLive});
}

/// @nodoc
class __$FollowingStreamerDtoCopyWithImpl<$Res>
    implements _$FollowingStreamerDtoCopyWith<$Res> {
  __$FollowingStreamerDtoCopyWithImpl(this._self, this._then);

  final _FollowingStreamerDto _self;
  final $Res Function(_FollowingStreamerDto) _then;

  /// Create a copy of FollowingStreamerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? openLive = null}) {
    return _then(
      _FollowingStreamerDto(
        openLive: null == openLive
            ? _self.openLive
            : openLive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$FollowingChannelInfoDto {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  List<String> get activatedChannelBadgeIds;
  FollowingChannelPersonalDataDto? get personalData;

  /// Create a copy of FollowingChannelInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingChannelInfoDtoCopyWith<FollowingChannelInfoDto> get copyWith =>
      _$FollowingChannelInfoDtoCopyWithImpl<FollowingChannelInfoDto>(
        this as FollowingChannelInfoDto,
        _$identity,
      );

  /// Serializes this FollowingChannelInfoDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingChannelInfoDto &&
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
    return 'FollowingChannelInfoDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class $FollowingChannelInfoDtoCopyWith<$Res> {
  factory $FollowingChannelInfoDtoCopyWith(
    FollowingChannelInfoDto value,
    $Res Function(FollowingChannelInfoDto) _then,
  ) = _$FollowingChannelInfoDtoCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    FollowingChannelPersonalDataDto? personalData,
  });

  $FollowingChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class _$FollowingChannelInfoDtoCopyWithImpl<$Res>
    implements $FollowingChannelInfoDtoCopyWith<$Res> {
  _$FollowingChannelInfoDtoCopyWithImpl(this._self, this._then);

  final FollowingChannelInfoDto _self;
  final $Res Function(FollowingChannelInfoDto) _then;

  /// Create a copy of FollowingChannelInfoDto
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
                  as FollowingChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of FollowingChannelInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $FollowingChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FollowingChannelInfoDto].
extension FollowingChannelInfoDtoPatterns on FollowingChannelInfoDto {
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
    TResult Function(_FollowingChannelInfoDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelInfoDto() when $default != null:
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
    TResult Function(_FollowingChannelInfoDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelInfoDto():
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
    TResult? Function(_FollowingChannelInfoDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelInfoDto() when $default != null:
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
      FollowingChannelPersonalDataDto? personalData,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelInfoDto() when $default != null:
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
      FollowingChannelPersonalDataDto? personalData,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelInfoDto():
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
      FollowingChannelPersonalDataDto? personalData,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelInfoDto() when $default != null:
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
class _FollowingChannelInfoDto implements FollowingChannelInfoDto {
  const _FollowingChannelInfoDto({
    this.channelId = '',
    this.channelName = '',
    this.channelImageUrl,
    this.verifiedMark = false,
    final List<String> activatedChannelBadgeIds = const <String>[],
    this.personalData,
  }) : _activatedChannelBadgeIds = activatedChannelBadgeIds;
  factory _FollowingChannelInfoDto.fromJson(Map<String, dynamic> json) =>
      _$FollowingChannelInfoDtoFromJson(json);

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
  final FollowingChannelPersonalDataDto? personalData;

  /// Create a copy of FollowingChannelInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingChannelInfoDtoCopyWith<_FollowingChannelInfoDto> get copyWith =>
      __$FollowingChannelInfoDtoCopyWithImpl<_FollowingChannelInfoDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$FollowingChannelInfoDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingChannelInfoDto &&
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
    return 'FollowingChannelInfoDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class _$FollowingChannelInfoDtoCopyWith<$Res>
    implements $FollowingChannelInfoDtoCopyWith<$Res> {
  factory _$FollowingChannelInfoDtoCopyWith(
    _FollowingChannelInfoDto value,
    $Res Function(_FollowingChannelInfoDto) _then,
  ) = __$FollowingChannelInfoDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    FollowingChannelPersonalDataDto? personalData,
  });

  @override
  $FollowingChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class __$FollowingChannelInfoDtoCopyWithImpl<$Res>
    implements _$FollowingChannelInfoDtoCopyWith<$Res> {
  __$FollowingChannelInfoDtoCopyWithImpl(this._self, this._then);

  final _FollowingChannelInfoDto _self;
  final $Res Function(_FollowingChannelInfoDto) _then;

  /// Create a copy of FollowingChannelInfoDto
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
      _FollowingChannelInfoDto(
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
                  as FollowingChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of FollowingChannelInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $FollowingChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// @nodoc
mixin _$FollowingChannelPersonalDataDto {
  FollowingChannelPersonalFollowingDto? get following;
  bool get privateUserBlock;

  /// Create a copy of FollowingChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingChannelPersonalDataDtoCopyWith<FollowingChannelPersonalDataDto>
  get copyWith =>
      _$FollowingChannelPersonalDataDtoCopyWithImpl<
        FollowingChannelPersonalDataDto
      >(this as FollowingChannelPersonalDataDto, _$identity);

  /// Serializes this FollowingChannelPersonalDataDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingChannelPersonalDataDto &&
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
    return 'FollowingChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $FollowingChannelPersonalDataDtoCopyWith<$Res> {
  factory $FollowingChannelPersonalDataDtoCopyWith(
    FollowingChannelPersonalDataDto value,
    $Res Function(FollowingChannelPersonalDataDto) _then,
  ) = _$FollowingChannelPersonalDataDtoCopyWithImpl;
  @useResult
  $Res call({
    FollowingChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  $FollowingChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class _$FollowingChannelPersonalDataDtoCopyWithImpl<$Res>
    implements $FollowingChannelPersonalDataDtoCopyWith<$Res> {
  _$FollowingChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final FollowingChannelPersonalDataDto _self;
  final $Res Function(FollowingChannelPersonalDataDto) _then;

  /// Create a copy of FollowingChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _self.copyWith(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as FollowingChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of FollowingChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $FollowingChannelPersonalFollowingDtoCopyWith<$Res>(
      _self.following!,
      (value) {
        return _then(_self.copyWith(following: value));
      },
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingChannelPersonalDataDto].
extension FollowingChannelPersonalDataDtoPatterns
    on FollowingChannelPersonalDataDto {
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
    TResult Function(_FollowingChannelPersonalDataDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPersonalDataDto() when $default != null:
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
    TResult Function(_FollowingChannelPersonalDataDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPersonalDataDto():
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
    TResult? Function(_FollowingChannelPersonalDataDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPersonalDataDto() when $default != null:
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
      FollowingChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPersonalDataDto() when $default != null:
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
      FollowingChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPersonalDataDto():
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
      FollowingChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPersonalDataDto() when $default != null:
        return $default(_that.following, _that.privateUserBlock);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowingChannelPersonalDataDto
    implements FollowingChannelPersonalDataDto {
  const _FollowingChannelPersonalDataDto({
    this.following,
    this.privateUserBlock = false,
  });
  factory _FollowingChannelPersonalDataDto.fromJson(
    Map<String, dynamic> json,
  ) => _$FollowingChannelPersonalDataDtoFromJson(json);

  @override
  final FollowingChannelPersonalFollowingDto? following;
  @override
  @JsonKey()
  final bool privateUserBlock;

  /// Create a copy of FollowingChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingChannelPersonalDataDtoCopyWith<_FollowingChannelPersonalDataDto>
  get copyWith =>
      __$FollowingChannelPersonalDataDtoCopyWithImpl<
        _FollowingChannelPersonalDataDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FollowingChannelPersonalDataDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingChannelPersonalDataDto &&
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
    return 'FollowingChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class _$FollowingChannelPersonalDataDtoCopyWith<$Res>
    implements $FollowingChannelPersonalDataDtoCopyWith<$Res> {
  factory _$FollowingChannelPersonalDataDtoCopyWith(
    _FollowingChannelPersonalDataDto value,
    $Res Function(_FollowingChannelPersonalDataDto) _then,
  ) = __$FollowingChannelPersonalDataDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    FollowingChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  @override
  $FollowingChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class __$FollowingChannelPersonalDataDtoCopyWithImpl<$Res>
    implements _$FollowingChannelPersonalDataDtoCopyWith<$Res> {
  __$FollowingChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final _FollowingChannelPersonalDataDto _self;
  final $Res Function(_FollowingChannelPersonalDataDto) _then;

  /// Create a copy of FollowingChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _FollowingChannelPersonalDataDto(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as FollowingChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of FollowingChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $FollowingChannelPersonalFollowingDtoCopyWith<$Res>(
      _self.following!,
      (value) {
        return _then(_self.copyWith(following: value));
      },
    );
  }
}

/// @nodoc
mixin _$FollowingChannelPersonalFollowingDto {
  bool get following;
  bool get notification;
  String? get followDate;

  /// Create a copy of FollowingChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingChannelPersonalFollowingDtoCopyWith<
    FollowingChannelPersonalFollowingDto
  >
  get copyWith =>
      _$FollowingChannelPersonalFollowingDtoCopyWithImpl<
        FollowingChannelPersonalFollowingDto
      >(this as FollowingChannelPersonalFollowingDto, _$identity);

  /// Serializes this FollowingChannelPersonalFollowingDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingChannelPersonalFollowingDto &&
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
    return 'FollowingChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class $FollowingChannelPersonalFollowingDtoCopyWith<$Res> {
  factory $FollowingChannelPersonalFollowingDtoCopyWith(
    FollowingChannelPersonalFollowingDto value,
    $Res Function(FollowingChannelPersonalFollowingDto) _then,
  ) = _$FollowingChannelPersonalFollowingDtoCopyWithImpl;
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class _$FollowingChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements $FollowingChannelPersonalFollowingDtoCopyWith<$Res> {
  _$FollowingChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final FollowingChannelPersonalFollowingDto _self;
  final $Res Function(FollowingChannelPersonalFollowingDto) _then;

  /// Create a copy of FollowingChannelPersonalFollowingDto
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

/// Adds pattern-matching-related methods to [FollowingChannelPersonalFollowingDto].
extension FollowingChannelPersonalFollowingDtoPatterns
    on FollowingChannelPersonalFollowingDto {
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
    TResult Function(_FollowingChannelPersonalFollowingDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPersonalFollowingDto() when $default != null:
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
    TResult Function(_FollowingChannelPersonalFollowingDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPersonalFollowingDto():
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
    TResult? Function(_FollowingChannelPersonalFollowingDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPersonalFollowingDto() when $default != null:
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
      case _FollowingChannelPersonalFollowingDto() when $default != null:
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
      case _FollowingChannelPersonalFollowingDto():
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
      case _FollowingChannelPersonalFollowingDto() when $default != null:
        return $default(_that.following, _that.notification, _that.followDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowingChannelPersonalFollowingDto
    implements FollowingChannelPersonalFollowingDto {
  const _FollowingChannelPersonalFollowingDto({
    this.following = false,
    this.notification = false,
    this.followDate,
  });
  factory _FollowingChannelPersonalFollowingDto.fromJson(
    Map<String, dynamic> json,
  ) => _$FollowingChannelPersonalFollowingDtoFromJson(json);

  @override
  @JsonKey()
  final bool following;
  @override
  @JsonKey()
  final bool notification;
  @override
  final String? followDate;

  /// Create a copy of FollowingChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingChannelPersonalFollowingDtoCopyWith<
    _FollowingChannelPersonalFollowingDto
  >
  get copyWith =>
      __$FollowingChannelPersonalFollowingDtoCopyWithImpl<
        _FollowingChannelPersonalFollowingDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FollowingChannelPersonalFollowingDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingChannelPersonalFollowingDto &&
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
    return 'FollowingChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class _$FollowingChannelPersonalFollowingDtoCopyWith<$Res>
    implements $FollowingChannelPersonalFollowingDtoCopyWith<$Res> {
  factory _$FollowingChannelPersonalFollowingDtoCopyWith(
    _FollowingChannelPersonalFollowingDto value,
    $Res Function(_FollowingChannelPersonalFollowingDto) _then,
  ) = __$FollowingChannelPersonalFollowingDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class __$FollowingChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements _$FollowingChannelPersonalFollowingDtoCopyWith<$Res> {
  __$FollowingChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final _FollowingChannelPersonalFollowingDto _self;
  final $Res Function(_FollowingChannelPersonalFollowingDto) _then;

  /// Create a copy of FollowingChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(
      _FollowingChannelPersonalFollowingDto(
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
