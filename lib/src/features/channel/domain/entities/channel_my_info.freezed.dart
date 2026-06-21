// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_my_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelMyInfo {
  String get channelId;
  ChannelPersonalFollowing? get following;
  bool get cheatKey;
  bool get naverMembership;

  /// Create a copy of ChannelMyInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelMyInfoCopyWith<ChannelMyInfo> get copyWith =>
      _$ChannelMyInfoCopyWithImpl<ChannelMyInfo>(
        this as ChannelMyInfo,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelMyInfo &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.cheatKey, cheatKey) ||
                other.cheatKey == cheatKey) &&
            (identical(other.naverMembership, naverMembership) ||
                other.naverMembership == naverMembership));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, channelId, following, cheatKey, naverMembership);

  @override
  String toString() {
    return 'ChannelMyInfo(channelId: $channelId, following: $following, cheatKey: $cheatKey, naverMembership: $naverMembership)';
  }
}

/// @nodoc
abstract mixin class $ChannelMyInfoCopyWith<$Res> {
  factory $ChannelMyInfoCopyWith(
    ChannelMyInfo value,
    $Res Function(ChannelMyInfo) _then,
  ) = _$ChannelMyInfoCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    ChannelPersonalFollowing? following,
    bool cheatKey,
    bool naverMembership,
  });

  $ChannelPersonalFollowingCopyWith<$Res>? get following;
}

/// @nodoc
class _$ChannelMyInfoCopyWithImpl<$Res>
    implements $ChannelMyInfoCopyWith<$Res> {
  _$ChannelMyInfoCopyWithImpl(this._self, this._then);

  final ChannelMyInfo _self;
  final $Res Function(ChannelMyInfo) _then;

  /// Create a copy of ChannelMyInfo
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
                  as ChannelPersonalFollowing?,
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

  /// Create a copy of ChannelMyInfo
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

/// Adds pattern-matching-related methods to [ChannelMyInfo].
extension ChannelMyInfoPatterns on ChannelMyInfo {
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
    TResult Function(_ChannelMyInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelMyInfo() when $default != null:
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
    TResult Function(_ChannelMyInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelMyInfo():
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
    TResult? Function(_ChannelMyInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelMyInfo() when $default != null:
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
      ChannelPersonalFollowing? following,
      bool cheatKey,
      bool naverMembership,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelMyInfo() when $default != null:
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
      ChannelPersonalFollowing? following,
      bool cheatKey,
      bool naverMembership,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelMyInfo():
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
      ChannelPersonalFollowing? following,
      bool cheatKey,
      bool naverMembership,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelMyInfo() when $default != null:
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

class _ChannelMyInfo implements ChannelMyInfo {
  const _ChannelMyInfo({
    required this.channelId,
    this.following,
    required this.cheatKey,
    required this.naverMembership,
  });

  @override
  final String channelId;
  @override
  final ChannelPersonalFollowing? following;
  @override
  final bool cheatKey;
  @override
  final bool naverMembership;

  /// Create a copy of ChannelMyInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelMyInfoCopyWith<_ChannelMyInfo> get copyWith =>
      __$ChannelMyInfoCopyWithImpl<_ChannelMyInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelMyInfo &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.cheatKey, cheatKey) ||
                other.cheatKey == cheatKey) &&
            (identical(other.naverMembership, naverMembership) ||
                other.naverMembership == naverMembership));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, channelId, following, cheatKey, naverMembership);

  @override
  String toString() {
    return 'ChannelMyInfo(channelId: $channelId, following: $following, cheatKey: $cheatKey, naverMembership: $naverMembership)';
  }
}

/// @nodoc
abstract mixin class _$ChannelMyInfoCopyWith<$Res>
    implements $ChannelMyInfoCopyWith<$Res> {
  factory _$ChannelMyInfoCopyWith(
    _ChannelMyInfo value,
    $Res Function(_ChannelMyInfo) _then,
  ) = __$ChannelMyInfoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    ChannelPersonalFollowing? following,
    bool cheatKey,
    bool naverMembership,
  });

  @override
  $ChannelPersonalFollowingCopyWith<$Res>? get following;
}

/// @nodoc
class __$ChannelMyInfoCopyWithImpl<$Res>
    implements _$ChannelMyInfoCopyWith<$Res> {
  __$ChannelMyInfoCopyWithImpl(this._self, this._then);

  final _ChannelMyInfo _self;
  final $Res Function(_ChannelMyInfo) _then;

  /// Create a copy of ChannelMyInfo
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
      _ChannelMyInfo(
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
        following: freezed == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as ChannelPersonalFollowing?,
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

  /// Create a copy of ChannelMyInfo
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
