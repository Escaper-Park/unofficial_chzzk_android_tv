// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeMainDto {
  List<HomeLiveDto> get topLives;

  /// Create a copy of HomeMainDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeMainDtoCopyWith<HomeMainDto> get copyWith =>
      _$HomeMainDtoCopyWithImpl<HomeMainDto>(this as HomeMainDto, _$identity);

  /// Serializes this HomeMainDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeMainDto &&
            const DeepCollectionEquality().equals(other.topLives, topLives));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(topLives));

  @override
  String toString() {
    return 'HomeMainDto(topLives: $topLives)';
  }
}

/// @nodoc
abstract mixin class $HomeMainDtoCopyWith<$Res> {
  factory $HomeMainDtoCopyWith(
    HomeMainDto value,
    $Res Function(HomeMainDto) _then,
  ) = _$HomeMainDtoCopyWithImpl;
  @useResult
  $Res call({List<HomeLiveDto> topLives});
}

/// @nodoc
class _$HomeMainDtoCopyWithImpl<$Res> implements $HomeMainDtoCopyWith<$Res> {
  _$HomeMainDtoCopyWithImpl(this._self, this._then);

  final HomeMainDto _self;
  final $Res Function(HomeMainDto) _then;

  /// Create a copy of HomeMainDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? topLives = null}) {
    return _then(
      _self.copyWith(
        topLives: null == topLives
            ? _self.topLives
            : topLives // ignore: cast_nullable_to_non_nullable
                  as List<HomeLiveDto>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [HomeMainDto].
extension HomeMainDtoPatterns on HomeMainDto {
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
    TResult Function(_HomeMainDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeMainDto() when $default != null:
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
    TResult Function(_HomeMainDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeMainDto():
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
    TResult? Function(_HomeMainDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeMainDto() when $default != null:
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
    TResult Function(List<HomeLiveDto> topLives)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeMainDto() when $default != null:
        return $default(_that.topLives);
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
    TResult Function(List<HomeLiveDto> topLives) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeMainDto():
        return $default(_that.topLives);
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
    TResult? Function(List<HomeLiveDto> topLives)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeMainDto() when $default != null:
        return $default(_that.topLives);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HomeMainDto implements HomeMainDto {
  const _HomeMainDto({final List<HomeLiveDto> topLives = const <HomeLiveDto>[]})
    : _topLives = topLives;
  factory _HomeMainDto.fromJson(Map<String, dynamic> json) =>
      _$HomeMainDtoFromJson(json);

  final List<HomeLiveDto> _topLives;
  @override
  @JsonKey()
  List<HomeLiveDto> get topLives {
    if (_topLives is EqualUnmodifiableListView) return _topLives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topLives);
  }

  /// Create a copy of HomeMainDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeMainDtoCopyWith<_HomeMainDto> get copyWith =>
      __$HomeMainDtoCopyWithImpl<_HomeMainDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeMainDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeMainDto &&
            const DeepCollectionEquality().equals(other._topLives, _topLives));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_topLives));

  @override
  String toString() {
    return 'HomeMainDto(topLives: $topLives)';
  }
}

/// @nodoc
abstract mixin class _$HomeMainDtoCopyWith<$Res>
    implements $HomeMainDtoCopyWith<$Res> {
  factory _$HomeMainDtoCopyWith(
    _HomeMainDto value,
    $Res Function(_HomeMainDto) _then,
  ) = __$HomeMainDtoCopyWithImpl;
  @override
  @useResult
  $Res call({List<HomeLiveDto> topLives});
}

/// @nodoc
class __$HomeMainDtoCopyWithImpl<$Res> implements _$HomeMainDtoCopyWith<$Res> {
  __$HomeMainDtoCopyWithImpl(this._self, this._then);

  final _HomeMainDto _self;
  final $Res Function(_HomeMainDto) _then;

  /// Create a copy of HomeMainDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? topLives = null}) {
    return _then(
      _HomeMainDto(
        topLives: null == topLives
            ? _self._topLives
            : topLives // ignore: cast_nullable_to_non_nullable
                  as List<HomeLiveDto>,
      ),
    );
  }
}

/// @nodoc
mixin _$HomeLiveDto {
  int get liveId;
  String get liveTitle;
  String? get liveImageUrl;
  String? get defaultThumbnailImageUrl;
  int get concurrentUserCount;
  bool get adult;
  List<String> get tags;
  String? get openDate;
  String? get liveCategoryValue;
  HomeChannelDto? get channel;
  String? get blindType;
  String? get watchPartyTag;
  String? get watchPartyType;
  String? get membershipBenefitType;
  Map<String, dynamic>? get party;

  /// Create a copy of HomeLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeLiveDtoCopyWith<HomeLiveDto> get copyWith =>
      _$HomeLiveDtoCopyWithImpl<HomeLiveDto>(this as HomeLiveDto, _$identity);

  /// Serializes this HomeLiveDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeLiveDto &&
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
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType) &&
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
    openDate,
    liveCategoryValue,
    channel,
    blindType,
    watchPartyTag,
    watchPartyType,
    membershipBenefitType,
    const DeepCollectionEquality().hash(party),
  );

  @override
  String toString() {
    return 'HomeLiveDto(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, adult: $adult, tags: $tags, openDate: $openDate, liveCategoryValue: $liveCategoryValue, channel: $channel, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, membershipBenefitType: $membershipBenefitType, party: $party)';
  }
}

/// @nodoc
abstract mixin class $HomeLiveDtoCopyWith<$Res> {
  factory $HomeLiveDtoCopyWith(
    HomeLiveDto value,
    $Res Function(HomeLiveDto) _then,
  ) = _$HomeLiveDtoCopyWithImpl;
  @useResult
  $Res call({
    int liveId,
    String liveTitle,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    bool adult,
    List<String> tags,
    String? openDate,
    String? liveCategoryValue,
    HomeChannelDto? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? membershipBenefitType,
    Map<String, dynamic>? party,
  });

  $HomeChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class _$HomeLiveDtoCopyWithImpl<$Res> implements $HomeLiveDtoCopyWith<$Res> {
  _$HomeLiveDtoCopyWithImpl(this._self, this._then);

  final HomeLiveDto _self;
  final $Res Function(HomeLiveDto) _then;

  /// Create a copy of HomeLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveId = null,
    Object? liveTitle = null,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? adult = null,
    Object? tags = null,
    Object? openDate = freezed,
    Object? liveCategoryValue = freezed,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? membershipBenefitType = freezed,
    Object? party = freezed,
  }) {
    return _then(
      _self.copyWith(
        liveId: null == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int,
        liveTitle: null == liveTitle
            ? _self.liveTitle
            : liveTitle // ignore: cast_nullable_to_non_nullable
                  as String,
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
        openDate: freezed == openDate
            ? _self.openDate
            : openDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveCategoryValue: freezed == liveCategoryValue
            ? _self.liveCategoryValue
            : liveCategoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as HomeChannelDto?,
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
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
        party: freezed == party
            ? _self.party
            : party // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }

  /// Create a copy of HomeLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $HomeChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [HomeLiveDto].
extension HomeLiveDtoPatterns on HomeLiveDto {
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
    TResult Function(_HomeLiveDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeLiveDto() when $default != null:
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
    TResult Function(_HomeLiveDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeLiveDto():
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
    TResult? Function(_HomeLiveDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeLiveDto() when $default != null:
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
      int liveId,
      String liveTitle,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      bool adult,
      List<String> tags,
      String? openDate,
      String? liveCategoryValue,
      HomeChannelDto? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      String? membershipBenefitType,
      Map<String, dynamic>? party,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeLiveDto() when $default != null:
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.adult,
          _that.tags,
          _that.openDate,
          _that.liveCategoryValue,
          _that.channel,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.membershipBenefitType,
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
      int liveId,
      String liveTitle,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      bool adult,
      List<String> tags,
      String? openDate,
      String? liveCategoryValue,
      HomeChannelDto? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      String? membershipBenefitType,
      Map<String, dynamic>? party,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeLiveDto():
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.adult,
          _that.tags,
          _that.openDate,
          _that.liveCategoryValue,
          _that.channel,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.membershipBenefitType,
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
      int liveId,
      String liveTitle,
      String? liveImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      bool adult,
      List<String> tags,
      String? openDate,
      String? liveCategoryValue,
      HomeChannelDto? channel,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      String? membershipBenefitType,
      Map<String, dynamic>? party,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeLiveDto() when $default != null:
        return $default(
          _that.liveId,
          _that.liveTitle,
          _that.liveImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.adult,
          _that.tags,
          _that.openDate,
          _that.liveCategoryValue,
          _that.channel,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.membershipBenefitType,
          _that.party,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HomeLiveDto implements HomeLiveDto {
  const _HomeLiveDto({
    this.liveId = 0,
    this.liveTitle = '',
    this.liveImageUrl,
    this.defaultThumbnailImageUrl,
    this.concurrentUserCount = 0,
    this.adult = false,
    final List<String> tags = const <String>[],
    this.openDate,
    this.liveCategoryValue,
    this.channel,
    this.blindType,
    this.watchPartyTag,
    this.watchPartyType,
    this.membershipBenefitType,
    final Map<String, dynamic>? party,
  }) : _tags = tags,
       _party = party;
  factory _HomeLiveDto.fromJson(Map<String, dynamic> json) =>
      _$HomeLiveDtoFromJson(json);

  @override
  @JsonKey()
  final int liveId;
  @override
  @JsonKey()
  final String liveTitle;
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
  final String? openDate;
  @override
  final String? liveCategoryValue;
  @override
  final HomeChannelDto? channel;
  @override
  final String? blindType;
  @override
  final String? watchPartyTag;
  @override
  final String? watchPartyType;
  @override
  final String? membershipBenefitType;
  final Map<String, dynamic>? _party;
  @override
  Map<String, dynamic>? get party {
    final value = _party;
    if (value == null) return null;
    if (_party is EqualUnmodifiableMapView) return _party;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of HomeLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeLiveDtoCopyWith<_HomeLiveDto> get copyWith =>
      __$HomeLiveDtoCopyWithImpl<_HomeLiveDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeLiveDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeLiveDto &&
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
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.liveCategoryValue, liveCategoryValue) ||
                other.liveCategoryValue == liveCategoryValue) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType) &&
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
    openDate,
    liveCategoryValue,
    channel,
    blindType,
    watchPartyTag,
    watchPartyType,
    membershipBenefitType,
    const DeepCollectionEquality().hash(_party),
  );

  @override
  String toString() {
    return 'HomeLiveDto(liveId: $liveId, liveTitle: $liveTitle, liveImageUrl: $liveImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, adult: $adult, tags: $tags, openDate: $openDate, liveCategoryValue: $liveCategoryValue, channel: $channel, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, membershipBenefitType: $membershipBenefitType, party: $party)';
  }
}

/// @nodoc
abstract mixin class _$HomeLiveDtoCopyWith<$Res>
    implements $HomeLiveDtoCopyWith<$Res> {
  factory _$HomeLiveDtoCopyWith(
    _HomeLiveDto value,
    $Res Function(_HomeLiveDto) _then,
  ) = __$HomeLiveDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    int liveId,
    String liveTitle,
    String? liveImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    bool adult,
    List<String> tags,
    String? openDate,
    String? liveCategoryValue,
    HomeChannelDto? channel,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? membershipBenefitType,
    Map<String, dynamic>? party,
  });

  @override
  $HomeChannelDtoCopyWith<$Res>? get channel;
}

/// @nodoc
class __$HomeLiveDtoCopyWithImpl<$Res> implements _$HomeLiveDtoCopyWith<$Res> {
  __$HomeLiveDtoCopyWithImpl(this._self, this._then);

  final _HomeLiveDto _self;
  final $Res Function(_HomeLiveDto) _then;

  /// Create a copy of HomeLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? liveId = null,
    Object? liveTitle = null,
    Object? liveImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? adult = null,
    Object? tags = null,
    Object? openDate = freezed,
    Object? liveCategoryValue = freezed,
    Object? channel = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? membershipBenefitType = freezed,
    Object? party = freezed,
  }) {
    return _then(
      _HomeLiveDto(
        liveId: null == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int,
        liveTitle: null == liveTitle
            ? _self.liveTitle
            : liveTitle // ignore: cast_nullable_to_non_nullable
                  as String,
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
        openDate: freezed == openDate
            ? _self.openDate
            : openDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveCategoryValue: freezed == liveCategoryValue
            ? _self.liveCategoryValue
            : liveCategoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        channel: freezed == channel
            ? _self.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as HomeChannelDto?,
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
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
        party: freezed == party
            ? _self._party
            : party // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }

  /// Create a copy of HomeLiveDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeChannelDtoCopyWith<$Res>? get channel {
    if (_self.channel == null) {
      return null;
    }

    return $HomeChannelDtoCopyWith<$Res>(_self.channel!, (value) {
      return _then(_self.copyWith(channel: value));
    });
  }
}

/// @nodoc
mixin _$HomeChannelDto {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  List<String> get activatedChannelBadgeIds;
  HomeChannelPersonalDataDto? get personalData;

  /// Create a copy of HomeChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeChannelDtoCopyWith<HomeChannelDto> get copyWith =>
      _$HomeChannelDtoCopyWithImpl<HomeChannelDto>(
        this as HomeChannelDto,
        _$identity,
      );

  /// Serializes this HomeChannelDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeChannelDto &&
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
    return 'HomeChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class $HomeChannelDtoCopyWith<$Res> {
  factory $HomeChannelDtoCopyWith(
    HomeChannelDto value,
    $Res Function(HomeChannelDto) _then,
  ) = _$HomeChannelDtoCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    HomeChannelPersonalDataDto? personalData,
  });

  $HomeChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class _$HomeChannelDtoCopyWithImpl<$Res>
    implements $HomeChannelDtoCopyWith<$Res> {
  _$HomeChannelDtoCopyWithImpl(this._self, this._then);

  final HomeChannelDto _self;
  final $Res Function(HomeChannelDto) _then;

  /// Create a copy of HomeChannelDto
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
                  as HomeChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of HomeChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $HomeChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [HomeChannelDto].
extension HomeChannelDtoPatterns on HomeChannelDto {
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
    TResult Function(_HomeChannelDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeChannelDto() when $default != null:
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
    TResult Function(_HomeChannelDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeChannelDto():
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
    TResult? Function(_HomeChannelDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeChannelDto() when $default != null:
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
      HomeChannelPersonalDataDto? personalData,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeChannelDto() when $default != null:
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
      HomeChannelPersonalDataDto? personalData,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeChannelDto():
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
      HomeChannelPersonalDataDto? personalData,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeChannelDto() when $default != null:
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
class _HomeChannelDto implements HomeChannelDto {
  const _HomeChannelDto({
    this.channelId = '',
    this.channelName = '',
    this.channelImageUrl,
    this.verifiedMark = false,
    final List<String> activatedChannelBadgeIds = const <String>[],
    this.personalData,
  }) : _activatedChannelBadgeIds = activatedChannelBadgeIds;
  factory _HomeChannelDto.fromJson(Map<String, dynamic> json) =>
      _$HomeChannelDtoFromJson(json);

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
  final HomeChannelPersonalDataDto? personalData;

  /// Create a copy of HomeChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeChannelDtoCopyWith<_HomeChannelDto> get copyWith =>
      __$HomeChannelDtoCopyWithImpl<_HomeChannelDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeChannelDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeChannelDto &&
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
    return 'HomeChannelDto(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class _$HomeChannelDtoCopyWith<$Res>
    implements $HomeChannelDtoCopyWith<$Res> {
  factory _$HomeChannelDtoCopyWith(
    _HomeChannelDto value,
    $Res Function(_HomeChannelDto) _then,
  ) = __$HomeChannelDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    HomeChannelPersonalDataDto? personalData,
  });

  @override
  $HomeChannelPersonalDataDtoCopyWith<$Res>? get personalData;
}

/// @nodoc
class __$HomeChannelDtoCopyWithImpl<$Res>
    implements _$HomeChannelDtoCopyWith<$Res> {
  __$HomeChannelDtoCopyWithImpl(this._self, this._then);

  final _HomeChannelDto _self;
  final $Res Function(_HomeChannelDto) _then;

  /// Create a copy of HomeChannelDto
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
      _HomeChannelDto(
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
                  as HomeChannelPersonalDataDto?,
      ),
    );
  }

  /// Create a copy of HomeChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeChannelPersonalDataDtoCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $HomeChannelPersonalDataDtoCopyWith<$Res>(_self.personalData!, (
      value,
    ) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// @nodoc
mixin _$HomeChannelPersonalDataDto {
  HomeChannelPersonalFollowingDto? get following;
  bool get privateUserBlock;

  /// Create a copy of HomeChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeChannelPersonalDataDtoCopyWith<HomeChannelPersonalDataDto>
  get copyWith =>
      _$HomeChannelPersonalDataDtoCopyWithImpl<HomeChannelPersonalDataDto>(
        this as HomeChannelPersonalDataDto,
        _$identity,
      );

  /// Serializes this HomeChannelPersonalDataDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeChannelPersonalDataDto &&
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
    return 'HomeChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $HomeChannelPersonalDataDtoCopyWith<$Res> {
  factory $HomeChannelPersonalDataDtoCopyWith(
    HomeChannelPersonalDataDto value,
    $Res Function(HomeChannelPersonalDataDto) _then,
  ) = _$HomeChannelPersonalDataDtoCopyWithImpl;
  @useResult
  $Res call({
    HomeChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  $HomeChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class _$HomeChannelPersonalDataDtoCopyWithImpl<$Res>
    implements $HomeChannelPersonalDataDtoCopyWith<$Res> {
  _$HomeChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final HomeChannelPersonalDataDto _self;
  final $Res Function(HomeChannelPersonalDataDto) _then;

  /// Create a copy of HomeChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _self.copyWith(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as HomeChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of HomeChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $HomeChannelPersonalFollowingDtoCopyWith<$Res>(_self.following!, (
      value,
    ) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// Adds pattern-matching-related methods to [HomeChannelPersonalDataDto].
extension HomeChannelPersonalDataDtoPatterns on HomeChannelPersonalDataDto {
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
    TResult Function(_HomeChannelPersonalDataDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeChannelPersonalDataDto() when $default != null:
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
    TResult Function(_HomeChannelPersonalDataDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeChannelPersonalDataDto():
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
    TResult? Function(_HomeChannelPersonalDataDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeChannelPersonalDataDto() when $default != null:
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
      HomeChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeChannelPersonalDataDto() when $default != null:
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
      HomeChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeChannelPersonalDataDto():
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
      HomeChannelPersonalFollowingDto? following,
      bool privateUserBlock,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeChannelPersonalDataDto() when $default != null:
        return $default(_that.following, _that.privateUserBlock);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HomeChannelPersonalDataDto implements HomeChannelPersonalDataDto {
  const _HomeChannelPersonalDataDto({
    this.following,
    this.privateUserBlock = false,
  });
  factory _HomeChannelPersonalDataDto.fromJson(Map<String, dynamic> json) =>
      _$HomeChannelPersonalDataDtoFromJson(json);

  @override
  final HomeChannelPersonalFollowingDto? following;
  @override
  @JsonKey()
  final bool privateUserBlock;

  /// Create a copy of HomeChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeChannelPersonalDataDtoCopyWith<_HomeChannelPersonalDataDto>
  get copyWith =>
      __$HomeChannelPersonalDataDtoCopyWithImpl<_HomeChannelPersonalDataDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$HomeChannelPersonalDataDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeChannelPersonalDataDto &&
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
    return 'HomeChannelPersonalDataDto(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class _$HomeChannelPersonalDataDtoCopyWith<$Res>
    implements $HomeChannelPersonalDataDtoCopyWith<$Res> {
  factory _$HomeChannelPersonalDataDtoCopyWith(
    _HomeChannelPersonalDataDto value,
    $Res Function(_HomeChannelPersonalDataDto) _then,
  ) = __$HomeChannelPersonalDataDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    HomeChannelPersonalFollowingDto? following,
    bool privateUserBlock,
  });

  @override
  $HomeChannelPersonalFollowingDtoCopyWith<$Res>? get following;
}

/// @nodoc
class __$HomeChannelPersonalDataDtoCopyWithImpl<$Res>
    implements _$HomeChannelPersonalDataDtoCopyWith<$Res> {
  __$HomeChannelPersonalDataDtoCopyWithImpl(this._self, this._then);

  final _HomeChannelPersonalDataDto _self;
  final $Res Function(_HomeChannelPersonalDataDto) _then;

  /// Create a copy of HomeChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _HomeChannelPersonalDataDto(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as HomeChannelPersonalFollowingDto?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of HomeChannelPersonalDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeChannelPersonalFollowingDtoCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $HomeChannelPersonalFollowingDtoCopyWith<$Res>(_self.following!, (
      value,
    ) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// @nodoc
mixin _$HomeChannelPersonalFollowingDto {
  bool get following;
  bool get notification;
  String? get followDate;

  /// Create a copy of HomeChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeChannelPersonalFollowingDtoCopyWith<HomeChannelPersonalFollowingDto>
  get copyWith =>
      _$HomeChannelPersonalFollowingDtoCopyWithImpl<
        HomeChannelPersonalFollowingDto
      >(this as HomeChannelPersonalFollowingDto, _$identity);

  /// Serializes this HomeChannelPersonalFollowingDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeChannelPersonalFollowingDto &&
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
    return 'HomeChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class $HomeChannelPersonalFollowingDtoCopyWith<$Res> {
  factory $HomeChannelPersonalFollowingDtoCopyWith(
    HomeChannelPersonalFollowingDto value,
    $Res Function(HomeChannelPersonalFollowingDto) _then,
  ) = _$HomeChannelPersonalFollowingDtoCopyWithImpl;
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class _$HomeChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements $HomeChannelPersonalFollowingDtoCopyWith<$Res> {
  _$HomeChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final HomeChannelPersonalFollowingDto _self;
  final $Res Function(HomeChannelPersonalFollowingDto) _then;

  /// Create a copy of HomeChannelPersonalFollowingDto
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

/// Adds pattern-matching-related methods to [HomeChannelPersonalFollowingDto].
extension HomeChannelPersonalFollowingDtoPatterns
    on HomeChannelPersonalFollowingDto {
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
    TResult Function(_HomeChannelPersonalFollowingDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeChannelPersonalFollowingDto() when $default != null:
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
    TResult Function(_HomeChannelPersonalFollowingDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeChannelPersonalFollowingDto():
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
    TResult? Function(_HomeChannelPersonalFollowingDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeChannelPersonalFollowingDto() when $default != null:
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
      case _HomeChannelPersonalFollowingDto() when $default != null:
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
      case _HomeChannelPersonalFollowingDto():
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
      case _HomeChannelPersonalFollowingDto() when $default != null:
        return $default(_that.following, _that.notification, _that.followDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HomeChannelPersonalFollowingDto
    implements HomeChannelPersonalFollowingDto {
  const _HomeChannelPersonalFollowingDto({
    this.following = false,
    this.notification = false,
    this.followDate,
  });
  factory _HomeChannelPersonalFollowingDto.fromJson(
    Map<String, dynamic> json,
  ) => _$HomeChannelPersonalFollowingDtoFromJson(json);

  @override
  @JsonKey()
  final bool following;
  @override
  @JsonKey()
  final bool notification;
  @override
  final String? followDate;

  /// Create a copy of HomeChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeChannelPersonalFollowingDtoCopyWith<_HomeChannelPersonalFollowingDto>
  get copyWith =>
      __$HomeChannelPersonalFollowingDtoCopyWithImpl<
        _HomeChannelPersonalFollowingDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeChannelPersonalFollowingDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeChannelPersonalFollowingDto &&
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
    return 'HomeChannelPersonalFollowingDto(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class _$HomeChannelPersonalFollowingDtoCopyWith<$Res>
    implements $HomeChannelPersonalFollowingDtoCopyWith<$Res> {
  factory _$HomeChannelPersonalFollowingDtoCopyWith(
    _HomeChannelPersonalFollowingDto value,
    $Res Function(_HomeChannelPersonalFollowingDto) _then,
  ) = __$HomeChannelPersonalFollowingDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class __$HomeChannelPersonalFollowingDtoCopyWithImpl<$Res>
    implements _$HomeChannelPersonalFollowingDtoCopyWith<$Res> {
  __$HomeChannelPersonalFollowingDtoCopyWithImpl(this._self, this._then);

  final _HomeChannelPersonalFollowingDto _self;
  final $Res Function(_HomeChannelPersonalFollowingDto) _then;

  /// Create a copy of HomeChannelPersonalFollowingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(
      _HomeChannelPersonalFollowingDto(
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
