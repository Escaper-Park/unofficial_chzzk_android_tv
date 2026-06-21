// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VodSettings {
  int get resolutionIndex;
  int get chatWindowIndex;
  int get playbackIntervalIndex;

  /// Create a copy of VodSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodSettingsCopyWith<VodSettings> get copyWith =>
      _$VodSettingsCopyWithImpl<VodSettings>(this as VodSettings, _$identity);

  /// Serializes this VodSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodSettings &&
            (identical(other.resolutionIndex, resolutionIndex) ||
                other.resolutionIndex == resolutionIndex) &&
            (identical(other.chatWindowIndex, chatWindowIndex) ||
                other.chatWindowIndex == chatWindowIndex) &&
            (identical(other.playbackIntervalIndex, playbackIntervalIndex) ||
                other.playbackIntervalIndex == playbackIntervalIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    resolutionIndex,
    chatWindowIndex,
    playbackIntervalIndex,
  );

  @override
  String toString() {
    return 'VodSettings(resolutionIndex: $resolutionIndex, chatWindowIndex: $chatWindowIndex, playbackIntervalIndex: $playbackIntervalIndex)';
  }
}

/// @nodoc
abstract mixin class $VodSettingsCopyWith<$Res> {
  factory $VodSettingsCopyWith(
    VodSettings value,
    $Res Function(VodSettings) _then,
  ) = _$VodSettingsCopyWithImpl;
  @useResult
  $Res call({
    int resolutionIndex,
    int chatWindowIndex,
    int playbackIntervalIndex,
  });
}

/// @nodoc
class _$VodSettingsCopyWithImpl<$Res> implements $VodSettingsCopyWith<$Res> {
  _$VodSettingsCopyWithImpl(this._self, this._then);

  final VodSettings _self;
  final $Res Function(VodSettings) _then;

  /// Create a copy of VodSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resolutionIndex = null,
    Object? chatWindowIndex = null,
    Object? playbackIntervalIndex = null,
  }) {
    return _then(
      _self.copyWith(
        resolutionIndex: null == resolutionIndex
            ? _self.resolutionIndex
            : resolutionIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        chatWindowIndex: null == chatWindowIndex
            ? _self.chatWindowIndex
            : chatWindowIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        playbackIntervalIndex: null == playbackIntervalIndex
            ? _self.playbackIntervalIndex
            : playbackIntervalIndex // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodSettings].
extension VodSettingsPatterns on VodSettings {
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
    TResult Function(_VodSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodSettings() when $default != null:
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
    TResult Function(_VodSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodSettings():
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
    TResult? Function(_VodSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodSettings() when $default != null:
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
      int resolutionIndex,
      int chatWindowIndex,
      int playbackIntervalIndex,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodSettings() when $default != null:
        return $default(
          _that.resolutionIndex,
          _that.chatWindowIndex,
          _that.playbackIntervalIndex,
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
      int resolutionIndex,
      int chatWindowIndex,
      int playbackIntervalIndex,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodSettings():
        return $default(
          _that.resolutionIndex,
          _that.chatWindowIndex,
          _that.playbackIntervalIndex,
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
      int resolutionIndex,
      int chatWindowIndex,
      int playbackIntervalIndex,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodSettings() when $default != null:
        return $default(
          _that.resolutionIndex,
          _that.chatWindowIndex,
          _that.playbackIntervalIndex,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VodSettings extends VodSettings {
  const _VodSettings({
    this.resolutionIndex = 3,
    this.chatWindowIndex = 0,
    this.playbackIntervalIndex = 1,
  }) : super._();
  factory _VodSettings.fromJson(Map<String, dynamic> json) =>
      _$VodSettingsFromJson(json);

  @override
  @JsonKey()
  final int resolutionIndex;
  @override
  @JsonKey()
  final int chatWindowIndex;
  @override
  @JsonKey()
  final int playbackIntervalIndex;

  /// Create a copy of VodSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodSettingsCopyWith<_VodSettings> get copyWith =>
      __$VodSettingsCopyWithImpl<_VodSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VodSettingsToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodSettings &&
            (identical(other.resolutionIndex, resolutionIndex) ||
                other.resolutionIndex == resolutionIndex) &&
            (identical(other.chatWindowIndex, chatWindowIndex) ||
                other.chatWindowIndex == chatWindowIndex) &&
            (identical(other.playbackIntervalIndex, playbackIntervalIndex) ||
                other.playbackIntervalIndex == playbackIntervalIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    resolutionIndex,
    chatWindowIndex,
    playbackIntervalIndex,
  );

  @override
  String toString() {
    return 'VodSettings(resolutionIndex: $resolutionIndex, chatWindowIndex: $chatWindowIndex, playbackIntervalIndex: $playbackIntervalIndex)';
  }
}

/// @nodoc
abstract mixin class _$VodSettingsCopyWith<$Res>
    implements $VodSettingsCopyWith<$Res> {
  factory _$VodSettingsCopyWith(
    _VodSettings value,
    $Res Function(_VodSettings) _then,
  ) = __$VodSettingsCopyWithImpl;
  @override
  @useResult
  $Res call({
    int resolutionIndex,
    int chatWindowIndex,
    int playbackIntervalIndex,
  });
}

/// @nodoc
class __$VodSettingsCopyWithImpl<$Res> implements _$VodSettingsCopyWith<$Res> {
  __$VodSettingsCopyWithImpl(this._self, this._then);

  final _VodSettings _self;
  final $Res Function(_VodSettings) _then;

  /// Create a copy of VodSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? resolutionIndex = null,
    Object? chatWindowIndex = null,
    Object? playbackIntervalIndex = null,
  }) {
    return _then(
      _VodSettings(
        resolutionIndex: null == resolutionIndex
            ? _self.resolutionIndex
            : resolutionIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        chatWindowIndex: null == chatWindowIndex
            ? _self.chatWindowIndex
            : chatWindowIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        playbackIntervalIndex: null == playbackIntervalIndex
            ? _self.playbackIntervalIndex
            : playbackIntervalIndex // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
