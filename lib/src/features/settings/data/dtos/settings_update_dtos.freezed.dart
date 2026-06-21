// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_update_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsReleaseDto {
  @JsonKey(name: 'tag_name')
  String get tagName;
  String get body;

  /// Create a copy of SettingsReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsReleaseDtoCopyWith<SettingsReleaseDto> get copyWith =>
      _$SettingsReleaseDtoCopyWithImpl<SettingsReleaseDto>(
        this as SettingsReleaseDto,
        _$identity,
      );

  /// Serializes this SettingsReleaseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsReleaseDto &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tagName, body);

  @override
  String toString() {
    return 'SettingsReleaseDto(tagName: $tagName, body: $body)';
  }
}

/// @nodoc
abstract mixin class $SettingsReleaseDtoCopyWith<$Res> {
  factory $SettingsReleaseDtoCopyWith(
    SettingsReleaseDto value,
    $Res Function(SettingsReleaseDto) _then,
  ) = _$SettingsReleaseDtoCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'tag_name') String tagName, String body});
}

/// @nodoc
class _$SettingsReleaseDtoCopyWithImpl<$Res>
    implements $SettingsReleaseDtoCopyWith<$Res> {
  _$SettingsReleaseDtoCopyWithImpl(this._self, this._then);

  final SettingsReleaseDto _self;
  final $Res Function(SettingsReleaseDto) _then;

  /// Create a copy of SettingsReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tagName = null, Object? body = null}) {
    return _then(
      _self.copyWith(
        tagName: null == tagName
            ? _self.tagName
            : tagName // ignore: cast_nullable_to_non_nullable
                  as String,
        body: null == body
            ? _self.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SettingsReleaseDto].
extension SettingsReleaseDtoPatterns on SettingsReleaseDto {
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
    TResult Function(_SettingsReleaseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SettingsReleaseDto() when $default != null:
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
    TResult Function(_SettingsReleaseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsReleaseDto():
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
    TResult? Function(_SettingsReleaseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsReleaseDto() when $default != null:
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
    TResult Function(@JsonKey(name: 'tag_name') String tagName, String body)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SettingsReleaseDto() when $default != null:
        return $default(_that.tagName, _that.body);
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
    TResult Function(@JsonKey(name: 'tag_name') String tagName, String body)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsReleaseDto():
        return $default(_that.tagName, _that.body);
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
    TResult? Function(@JsonKey(name: 'tag_name') String tagName, String body)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsReleaseDto() when $default != null:
        return $default(_that.tagName, _that.body);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SettingsReleaseDto implements SettingsReleaseDto {
  const _SettingsReleaseDto({
    @JsonKey(name: 'tag_name') required this.tagName,
    this.body = '',
  });
  factory _SettingsReleaseDto.fromJson(Map<String, dynamic> json) =>
      _$SettingsReleaseDtoFromJson(json);

  @override
  @JsonKey(name: 'tag_name')
  final String tagName;
  @override
  @JsonKey()
  final String body;

  /// Create a copy of SettingsReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingsReleaseDtoCopyWith<_SettingsReleaseDto> get copyWith =>
      __$SettingsReleaseDtoCopyWithImpl<_SettingsReleaseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SettingsReleaseDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsReleaseDto &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tagName, body);

  @override
  String toString() {
    return 'SettingsReleaseDto(tagName: $tagName, body: $body)';
  }
}

/// @nodoc
abstract mixin class _$SettingsReleaseDtoCopyWith<$Res>
    implements $SettingsReleaseDtoCopyWith<$Res> {
  factory _$SettingsReleaseDtoCopyWith(
    _SettingsReleaseDto value,
    $Res Function(_SettingsReleaseDto) _then,
  ) = __$SettingsReleaseDtoCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'tag_name') String tagName, String body});
}

/// @nodoc
class __$SettingsReleaseDtoCopyWithImpl<$Res>
    implements _$SettingsReleaseDtoCopyWith<$Res> {
  __$SettingsReleaseDtoCopyWithImpl(this._self, this._then);

  final _SettingsReleaseDto _self;
  final $Res Function(_SettingsReleaseDto) _then;

  /// Create a copy of SettingsReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? tagName = null, Object? body = null}) {
    return _then(
      _SettingsReleaseDto(
        tagName: null == tagName
            ? _self.tagName
            : tagName // ignore: cast_nullable_to_non_nullable
                  as String,
        body: null == body
            ? _self.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
