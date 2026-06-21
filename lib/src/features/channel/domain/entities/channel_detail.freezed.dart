// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelDetail {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  int get followerCount;
  String get description;
  List<String> get activatedChannelBadgeIds;
  bool get openLive;
  ChannelPersonalData? get personalData;

  /// Create a copy of ChannelDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelDetailCopyWith<ChannelDetail> get copyWith =>
      _$ChannelDetailCopyWithImpl<ChannelDetail>(
        this as ChannelDetail,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelDetail &&
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
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other.activatedChannelBadgeIds,
              activatedChannelBadgeIds,
            ) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
    followerCount,
    description,
    const DeepCollectionEquality().hash(activatedChannelBadgeIds),
    openLive,
    personalData,
  );

  @override
  String toString() {
    return 'ChannelDetail(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, followerCount: $followerCount, description: $description, activatedChannelBadgeIds: $activatedChannelBadgeIds, openLive: $openLive, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class $ChannelDetailCopyWith<$Res> {
  factory $ChannelDetailCopyWith(
    ChannelDetail value,
    $Res Function(ChannelDetail) _then,
  ) = _$ChannelDetailCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    int followerCount,
    String description,
    List<String> activatedChannelBadgeIds,
    bool openLive,
    ChannelPersonalData? personalData,
  });

  $ChannelPersonalDataCopyWith<$Res>? get personalData;
}

/// @nodoc
class _$ChannelDetailCopyWithImpl<$Res>
    implements $ChannelDetailCopyWith<$Res> {
  _$ChannelDetailCopyWithImpl(this._self, this._then);

  final ChannelDetail _self;
  final $Res Function(ChannelDetail) _then;

  /// Create a copy of ChannelDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? followerCount = null,
    Object? description = null,
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
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
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
                  as ChannelPersonalData?,
      ),
    );
  }

  /// Create a copy of ChannelDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPersonalDataCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $ChannelPersonalDataCopyWith<$Res>(_self.personalData!, (value) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChannelDetail].
extension ChannelDetailPatterns on ChannelDetail {
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
    TResult Function(_ChannelDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelDetail() when $default != null:
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
    TResult Function(_ChannelDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelDetail():
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
    TResult? Function(_ChannelDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelDetail() when $default != null:
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
      String description,
      List<String> activatedChannelBadgeIds,
      bool openLive,
      ChannelPersonalData? personalData,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelDetail() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.followerCount,
          _that.description,
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
      String description,
      List<String> activatedChannelBadgeIds,
      bool openLive,
      ChannelPersonalData? personalData,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelDetail():
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.followerCount,
          _that.description,
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
      String description,
      List<String> activatedChannelBadgeIds,
      bool openLive,
      ChannelPersonalData? personalData,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelDetail() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.followerCount,
          _that.description,
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

class _ChannelDetail implements ChannelDetail {
  const _ChannelDetail({
    required this.channelId,
    required this.channelName,
    this.channelImageUrl,
    required this.verifiedMark,
    required this.followerCount,
    required this.description,
    final List<String> activatedChannelBadgeIds = const <String>[],
    required this.openLive,
    this.personalData,
  }) : _activatedChannelBadgeIds = activatedChannelBadgeIds;

  @override
  final String channelId;
  @override
  final String channelName;
  @override
  final String? channelImageUrl;
  @override
  final bool verifiedMark;
  @override
  final int followerCount;
  @override
  final String description;
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
  final bool openLive;
  @override
  final ChannelPersonalData? personalData;

  /// Create a copy of ChannelDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelDetailCopyWith<_ChannelDetail> get copyWith =>
      __$ChannelDetailCopyWithImpl<_ChannelDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelDetail &&
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
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._activatedChannelBadgeIds,
              _activatedChannelBadgeIds,
            ) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
    followerCount,
    description,
    const DeepCollectionEquality().hash(_activatedChannelBadgeIds),
    openLive,
    personalData,
  );

  @override
  String toString() {
    return 'ChannelDetail(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, followerCount: $followerCount, description: $description, activatedChannelBadgeIds: $activatedChannelBadgeIds, openLive: $openLive, personalData: $personalData)';
  }
}

/// @nodoc
abstract mixin class _$ChannelDetailCopyWith<$Res>
    implements $ChannelDetailCopyWith<$Res> {
  factory _$ChannelDetailCopyWith(
    _ChannelDetail value,
    $Res Function(_ChannelDetail) _then,
  ) = __$ChannelDetailCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    int followerCount,
    String description,
    List<String> activatedChannelBadgeIds,
    bool openLive,
    ChannelPersonalData? personalData,
  });

  @override
  $ChannelPersonalDataCopyWith<$Res>? get personalData;
}

/// @nodoc
class __$ChannelDetailCopyWithImpl<$Res>
    implements _$ChannelDetailCopyWith<$Res> {
  __$ChannelDetailCopyWithImpl(this._self, this._then);

  final _ChannelDetail _self;
  final $Res Function(_ChannelDetail) _then;

  /// Create a copy of ChannelDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? followerCount = null,
    Object? description = null,
    Object? activatedChannelBadgeIds = null,
    Object? openLive = null,
    Object? personalData = freezed,
  }) {
    return _then(
      _ChannelDetail(
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
        description: null == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
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
                  as ChannelPersonalData?,
      ),
    );
  }

  /// Create a copy of ChannelDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPersonalDataCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $ChannelPersonalDataCopyWith<$Res>(_self.personalData!, (value) {
      return _then(_self.copyWith(personalData: value));
    });
  }
}

/// @nodoc
mixin _$ChannelPersonalData {
  ChannelPersonalFollowing? get following;
  bool get privateUserBlock;

  /// Create a copy of ChannelPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelPersonalDataCopyWith<ChannelPersonalData> get copyWith =>
      _$ChannelPersonalDataCopyWithImpl<ChannelPersonalData>(
        this as ChannelPersonalData,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelPersonalData &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.privateUserBlock, privateUserBlock) ||
                other.privateUserBlock == privateUserBlock));
  }

  @override
  int get hashCode => Object.hash(runtimeType, following, privateUserBlock);

  @override
  String toString() {
    return 'ChannelPersonalData(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $ChannelPersonalDataCopyWith<$Res> {
  factory $ChannelPersonalDataCopyWith(
    ChannelPersonalData value,
    $Res Function(ChannelPersonalData) _then,
  ) = _$ChannelPersonalDataCopyWithImpl;
  @useResult
  $Res call({ChannelPersonalFollowing? following, bool privateUserBlock});

  $ChannelPersonalFollowingCopyWith<$Res>? get following;
}

/// @nodoc
class _$ChannelPersonalDataCopyWithImpl<$Res>
    implements $ChannelPersonalDataCopyWith<$Res> {
  _$ChannelPersonalDataCopyWithImpl(this._self, this._then);

  final ChannelPersonalData _self;
  final $Res Function(ChannelPersonalData) _then;

  /// Create a copy of ChannelPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _self.copyWith(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as ChannelPersonalFollowing?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of ChannelPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPersonalFollowingCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $ChannelPersonalFollowingCopyWith<$Res>(_self.following!, (value) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChannelPersonalData].
extension ChannelPersonalDataPatterns on ChannelPersonalData {
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
    TResult Function(_ChannelPersonalData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalData() when $default != null:
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
    TResult Function(_ChannelPersonalData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalData():
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
    TResult? Function(_ChannelPersonalData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalData() when $default != null:
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
      ChannelPersonalFollowing? following,
      bool privateUserBlock,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalData() when $default != null:
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
    TResult Function(ChannelPersonalFollowing? following, bool privateUserBlock)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalData():
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
      ChannelPersonalFollowing? following,
      bool privateUserBlock,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalData() when $default != null:
        return $default(_that.following, _that.privateUserBlock);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChannelPersonalData implements ChannelPersonalData {
  const _ChannelPersonalData({this.following, required this.privateUserBlock});

  @override
  final ChannelPersonalFollowing? following;
  @override
  final bool privateUserBlock;

  /// Create a copy of ChannelPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelPersonalDataCopyWith<_ChannelPersonalData> get copyWith =>
      __$ChannelPersonalDataCopyWithImpl<_ChannelPersonalData>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelPersonalData &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.privateUserBlock, privateUserBlock) ||
                other.privateUserBlock == privateUserBlock));
  }

  @override
  int get hashCode => Object.hash(runtimeType, following, privateUserBlock);

  @override
  String toString() {
    return 'ChannelPersonalData(following: $following, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class _$ChannelPersonalDataCopyWith<$Res>
    implements $ChannelPersonalDataCopyWith<$Res> {
  factory _$ChannelPersonalDataCopyWith(
    _ChannelPersonalData value,
    $Res Function(_ChannelPersonalData) _then,
  ) = __$ChannelPersonalDataCopyWithImpl;
  @override
  @useResult
  $Res call({ChannelPersonalFollowing? following, bool privateUserBlock});

  @override
  $ChannelPersonalFollowingCopyWith<$Res>? get following;
}

/// @nodoc
class __$ChannelPersonalDataCopyWithImpl<$Res>
    implements _$ChannelPersonalDataCopyWith<$Res> {
  __$ChannelPersonalDataCopyWithImpl(this._self, this._then);

  final _ChannelPersonalData _self;
  final $Res Function(_ChannelPersonalData) _then;

  /// Create a copy of ChannelPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? following = freezed, Object? privateUserBlock = null}) {
    return _then(
      _ChannelPersonalData(
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as ChannelPersonalFollowing?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of ChannelPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPersonalFollowingCopyWith<$Res>? get following {
    if (_self.following == null) {
      return null;
    }

    return $ChannelPersonalFollowingCopyWith<$Res>(_self.following!, (value) {
      return _then(_self.copyWith(following: value));
    });
  }
}

/// @nodoc
mixin _$ChannelPersonalFollowing {
  bool get following;
  bool get notification;
  String? get followDate;

  /// Create a copy of ChannelPersonalFollowing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelPersonalFollowingCopyWith<ChannelPersonalFollowing> get copyWith =>
      _$ChannelPersonalFollowingCopyWithImpl<ChannelPersonalFollowing>(
        this as ChannelPersonalFollowing,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelPersonalFollowing &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.followDate, followDate) ||
                other.followDate == followDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, following, notification, followDate);

  @override
  String toString() {
    return 'ChannelPersonalFollowing(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class $ChannelPersonalFollowingCopyWith<$Res> {
  factory $ChannelPersonalFollowingCopyWith(
    ChannelPersonalFollowing value,
    $Res Function(ChannelPersonalFollowing) _then,
  ) = _$ChannelPersonalFollowingCopyWithImpl;
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class _$ChannelPersonalFollowingCopyWithImpl<$Res>
    implements $ChannelPersonalFollowingCopyWith<$Res> {
  _$ChannelPersonalFollowingCopyWithImpl(this._self, this._then);

  final ChannelPersonalFollowing _self;
  final $Res Function(ChannelPersonalFollowing) _then;

  /// Create a copy of ChannelPersonalFollowing
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

/// Adds pattern-matching-related methods to [ChannelPersonalFollowing].
extension ChannelPersonalFollowingPatterns on ChannelPersonalFollowing {
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
    TResult Function(_ChannelPersonalFollowing value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalFollowing() when $default != null:
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
    TResult Function(_ChannelPersonalFollowing value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalFollowing():
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
    TResult? Function(_ChannelPersonalFollowing value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelPersonalFollowing() when $default != null:
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
      case _ChannelPersonalFollowing() when $default != null:
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
      case _ChannelPersonalFollowing():
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
      case _ChannelPersonalFollowing() when $default != null:
        return $default(_that.following, _that.notification, _that.followDate);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChannelPersonalFollowing implements ChannelPersonalFollowing {
  const _ChannelPersonalFollowing({
    required this.following,
    required this.notification,
    this.followDate,
  });

  @override
  final bool following;
  @override
  final bool notification;
  @override
  final String? followDate;

  /// Create a copy of ChannelPersonalFollowing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelPersonalFollowingCopyWith<_ChannelPersonalFollowing> get copyWith =>
      __$ChannelPersonalFollowingCopyWithImpl<_ChannelPersonalFollowing>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelPersonalFollowing &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.followDate, followDate) ||
                other.followDate == followDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, following, notification, followDate);

  @override
  String toString() {
    return 'ChannelPersonalFollowing(following: $following, notification: $notification, followDate: $followDate)';
  }
}

/// @nodoc
abstract mixin class _$ChannelPersonalFollowingCopyWith<$Res>
    implements $ChannelPersonalFollowingCopyWith<$Res> {
  factory _$ChannelPersonalFollowingCopyWith(
    _ChannelPersonalFollowing value,
    $Res Function(_ChannelPersonalFollowing) _then,
  ) = __$ChannelPersonalFollowingCopyWithImpl;
  @override
  @useResult
  $Res call({bool following, bool notification, String? followDate});
}

/// @nodoc
class __$ChannelPersonalFollowingCopyWithImpl<$Res>
    implements _$ChannelPersonalFollowingCopyWith<$Res> {
  __$ChannelPersonalFollowingCopyWithImpl(this._self, this._then);

  final _ChannelPersonalFollowing _self;
  final $Res Function(_ChannelPersonalFollowing) _then;

  /// Create a copy of ChannelPersonalFollowing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
  }) {
    return _then(
      _ChannelPersonalFollowing(
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
