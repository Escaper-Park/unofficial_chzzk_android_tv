// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_playback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VodPlayback {
  String? get masterPlaylistUrl;
  VodSeekThumbnail? get seekThumbnail;

  /// Create a copy of VodPlayback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPlaybackCopyWith<VodPlayback> get copyWith =>
      _$VodPlaybackCopyWithImpl<VodPlayback>(this as VodPlayback, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPlayback &&
            (identical(other.masterPlaylistUrl, masterPlaylistUrl) ||
                other.masterPlaylistUrl == masterPlaylistUrl) &&
            (identical(other.seekThumbnail, seekThumbnail) ||
                other.seekThumbnail == seekThumbnail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, masterPlaylistUrl, seekThumbnail);

  @override
  String toString() {
    return 'VodPlayback(masterPlaylistUrl: $masterPlaylistUrl, seekThumbnail: $seekThumbnail)';
  }
}

/// @nodoc
abstract mixin class $VodPlaybackCopyWith<$Res> {
  factory $VodPlaybackCopyWith(
    VodPlayback value,
    $Res Function(VodPlayback) _then,
  ) = _$VodPlaybackCopyWithImpl;
  @useResult
  $Res call({String? masterPlaylistUrl, VodSeekThumbnail? seekThumbnail});

  $VodSeekThumbnailCopyWith<$Res>? get seekThumbnail;
}

/// @nodoc
class _$VodPlaybackCopyWithImpl<$Res> implements $VodPlaybackCopyWith<$Res> {
  _$VodPlaybackCopyWithImpl(this._self, this._then);

  final VodPlayback _self;
  final $Res Function(VodPlayback) _then;

  /// Create a copy of VodPlayback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? masterPlaylistUrl = freezed,
    Object? seekThumbnail = freezed,
  }) {
    return _then(
      _self.copyWith(
        masterPlaylistUrl: freezed == masterPlaylistUrl
            ? _self.masterPlaylistUrl
            : masterPlaylistUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        seekThumbnail: freezed == seekThumbnail
            ? _self.seekThumbnail
            : seekThumbnail // ignore: cast_nullable_to_non_nullable
                  as VodSeekThumbnail?,
      ),
    );
  }

  /// Create a copy of VodPlayback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodSeekThumbnailCopyWith<$Res>? get seekThumbnail {
    if (_self.seekThumbnail == null) {
      return null;
    }

    return $VodSeekThumbnailCopyWith<$Res>(_self.seekThumbnail!, (value) {
      return _then(_self.copyWith(seekThumbnail: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VodPlayback].
extension VodPlaybackPatterns on VodPlayback {
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
    TResult Function(_VodPlayback value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlayback() when $default != null:
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
    TResult Function(_VodPlayback value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlayback():
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
    TResult? Function(_VodPlayback value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlayback() when $default != null:
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
      String? masterPlaylistUrl,
      VodSeekThumbnail? seekThumbnail,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodPlayback() when $default != null:
        return $default(_that.masterPlaylistUrl, _that.seekThumbnail);
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
    TResult Function(String? masterPlaylistUrl, VodSeekThumbnail? seekThumbnail)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlayback():
        return $default(_that.masterPlaylistUrl, _that.seekThumbnail);
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
      String? masterPlaylistUrl,
      VodSeekThumbnail? seekThumbnail,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodPlayback() when $default != null:
        return $default(_that.masterPlaylistUrl, _that.seekThumbnail);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VodPlayback implements VodPlayback {
  const _VodPlayback({this.masterPlaylistUrl, this.seekThumbnail});

  @override
  final String? masterPlaylistUrl;
  @override
  final VodSeekThumbnail? seekThumbnail;

  /// Create a copy of VodPlayback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodPlaybackCopyWith<_VodPlayback> get copyWith =>
      __$VodPlaybackCopyWithImpl<_VodPlayback>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodPlayback &&
            (identical(other.masterPlaylistUrl, masterPlaylistUrl) ||
                other.masterPlaylistUrl == masterPlaylistUrl) &&
            (identical(other.seekThumbnail, seekThumbnail) ||
                other.seekThumbnail == seekThumbnail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, masterPlaylistUrl, seekThumbnail);

  @override
  String toString() {
    return 'VodPlayback(masterPlaylistUrl: $masterPlaylistUrl, seekThumbnail: $seekThumbnail)';
  }
}

/// @nodoc
abstract mixin class _$VodPlaybackCopyWith<$Res>
    implements $VodPlaybackCopyWith<$Res> {
  factory _$VodPlaybackCopyWith(
    _VodPlayback value,
    $Res Function(_VodPlayback) _then,
  ) = __$VodPlaybackCopyWithImpl;
  @override
  @useResult
  $Res call({String? masterPlaylistUrl, VodSeekThumbnail? seekThumbnail});

  @override
  $VodSeekThumbnailCopyWith<$Res>? get seekThumbnail;
}

/// @nodoc
class __$VodPlaybackCopyWithImpl<$Res> implements _$VodPlaybackCopyWith<$Res> {
  __$VodPlaybackCopyWithImpl(this._self, this._then);

  final _VodPlayback _self;
  final $Res Function(_VodPlayback) _then;

  /// Create a copy of VodPlayback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? masterPlaylistUrl = freezed,
    Object? seekThumbnail = freezed,
  }) {
    return _then(
      _VodPlayback(
        masterPlaylistUrl: freezed == masterPlaylistUrl
            ? _self.masterPlaylistUrl
            : masterPlaylistUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        seekThumbnail: freezed == seekThumbnail
            ? _self.seekThumbnail
            : seekThumbnail // ignore: cast_nullable_to_non_nullable
                  as VodSeekThumbnail?,
      ),
    );
  }

  /// Create a copy of VodPlayback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodSeekThumbnailCopyWith<$Res>? get seekThumbnail {
    if (_self.seekThumbnail == null) {
      return null;
    }

    return $VodSeekThumbnailCopyWith<$Res>(_self.seekThumbnail!, (value) {
      return _then(_self.copyWith(seekThumbnail: value));
    });
  }
}

/// @nodoc
mixin _$VodSeekThumbnail {
  String get source;
  String get sourcePatternType;
  String get indexPlaceholder;
  VodSeekThumbnailIndexMode get indexMode;
  int get totalPage;
  int get rowCount;
  int get columnCount;
  int get intervalMilliseconds;
  int get thumbnailWidth;
  int get thumbnailHeight;
  int get allThumbnailCount;
  int? get baseTimeMilliseconds;

  /// Create a copy of VodSeekThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodSeekThumbnailCopyWith<VodSeekThumbnail> get copyWith =>
      _$VodSeekThumbnailCopyWithImpl<VodSeekThumbnail>(
        this as VodSeekThumbnail,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodSeekThumbnail &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sourcePatternType, sourcePatternType) ||
                other.sourcePatternType == sourcePatternType) &&
            (identical(other.indexPlaceholder, indexPlaceholder) ||
                other.indexPlaceholder == indexPlaceholder) &&
            (identical(other.indexMode, indexMode) ||
                other.indexMode == indexMode) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.rowCount, rowCount) ||
                other.rowCount == rowCount) &&
            (identical(other.columnCount, columnCount) ||
                other.columnCount == columnCount) &&
            (identical(other.intervalMilliseconds, intervalMilliseconds) ||
                other.intervalMilliseconds == intervalMilliseconds) &&
            (identical(other.thumbnailWidth, thumbnailWidth) ||
                other.thumbnailWidth == thumbnailWidth) &&
            (identical(other.thumbnailHeight, thumbnailHeight) ||
                other.thumbnailHeight == thumbnailHeight) &&
            (identical(other.allThumbnailCount, allThumbnailCount) ||
                other.allThumbnailCount == allThumbnailCount) &&
            (identical(other.baseTimeMilliseconds, baseTimeMilliseconds) ||
                other.baseTimeMilliseconds == baseTimeMilliseconds));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    source,
    sourcePatternType,
    indexPlaceholder,
    indexMode,
    totalPage,
    rowCount,
    columnCount,
    intervalMilliseconds,
    thumbnailWidth,
    thumbnailHeight,
    allThumbnailCount,
    baseTimeMilliseconds,
  );

  @override
  String toString() {
    return 'VodSeekThumbnail(source: $source, sourcePatternType: $sourcePatternType, indexPlaceholder: $indexPlaceholder, indexMode: $indexMode, totalPage: $totalPage, rowCount: $rowCount, columnCount: $columnCount, intervalMilliseconds: $intervalMilliseconds, thumbnailWidth: $thumbnailWidth, thumbnailHeight: $thumbnailHeight, allThumbnailCount: $allThumbnailCount, baseTimeMilliseconds: $baseTimeMilliseconds)';
  }
}

/// @nodoc
abstract mixin class $VodSeekThumbnailCopyWith<$Res> {
  factory $VodSeekThumbnailCopyWith(
    VodSeekThumbnail value,
    $Res Function(VodSeekThumbnail) _then,
  ) = _$VodSeekThumbnailCopyWithImpl;
  @useResult
  $Res call({
    String source,
    String sourcePatternType,
    String indexPlaceholder,
    VodSeekThumbnailIndexMode indexMode,
    int totalPage,
    int rowCount,
    int columnCount,
    int intervalMilliseconds,
    int thumbnailWidth,
    int thumbnailHeight,
    int allThumbnailCount,
    int? baseTimeMilliseconds,
  });
}

/// @nodoc
class _$VodSeekThumbnailCopyWithImpl<$Res>
    implements $VodSeekThumbnailCopyWith<$Res> {
  _$VodSeekThumbnailCopyWithImpl(this._self, this._then);

  final VodSeekThumbnail _self;
  final $Res Function(VodSeekThumbnail) _then;

  /// Create a copy of VodSeekThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? sourcePatternType = null,
    Object? indexPlaceholder = null,
    Object? indexMode = null,
    Object? totalPage = null,
    Object? rowCount = null,
    Object? columnCount = null,
    Object? intervalMilliseconds = null,
    Object? thumbnailWidth = null,
    Object? thumbnailHeight = null,
    Object? allThumbnailCount = null,
    Object? baseTimeMilliseconds = freezed,
  }) {
    return _then(
      _self.copyWith(
        source: null == source
            ? _self.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String,
        sourcePatternType: null == sourcePatternType
            ? _self.sourcePatternType
            : sourcePatternType // ignore: cast_nullable_to_non_nullable
                  as String,
        indexPlaceholder: null == indexPlaceholder
            ? _self.indexPlaceholder
            : indexPlaceholder // ignore: cast_nullable_to_non_nullable
                  as String,
        indexMode: null == indexMode
            ? _self.indexMode
            : indexMode // ignore: cast_nullable_to_non_nullable
                  as VodSeekThumbnailIndexMode,
        totalPage: null == totalPage
            ? _self.totalPage
            : totalPage // ignore: cast_nullable_to_non_nullable
                  as int,
        rowCount: null == rowCount
            ? _self.rowCount
            : rowCount // ignore: cast_nullable_to_non_nullable
                  as int,
        columnCount: null == columnCount
            ? _self.columnCount
            : columnCount // ignore: cast_nullable_to_non_nullable
                  as int,
        intervalMilliseconds: null == intervalMilliseconds
            ? _self.intervalMilliseconds
            : intervalMilliseconds // ignore: cast_nullable_to_non_nullable
                  as int,
        thumbnailWidth: null == thumbnailWidth
            ? _self.thumbnailWidth
            : thumbnailWidth // ignore: cast_nullable_to_non_nullable
                  as int,
        thumbnailHeight: null == thumbnailHeight
            ? _self.thumbnailHeight
            : thumbnailHeight // ignore: cast_nullable_to_non_nullable
                  as int,
        allThumbnailCount: null == allThumbnailCount
            ? _self.allThumbnailCount
            : allThumbnailCount // ignore: cast_nullable_to_non_nullable
                  as int,
        baseTimeMilliseconds: freezed == baseTimeMilliseconds
            ? _self.baseTimeMilliseconds
            : baseTimeMilliseconds // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VodSeekThumbnail].
extension VodSeekThumbnailPatterns on VodSeekThumbnail {
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
    TResult Function(_VodSeekThumbnail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodSeekThumbnail() when $default != null:
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
    TResult Function(_VodSeekThumbnail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodSeekThumbnail():
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
    TResult? Function(_VodSeekThumbnail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodSeekThumbnail() when $default != null:
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
      String source,
      String sourcePatternType,
      String indexPlaceholder,
      VodSeekThumbnailIndexMode indexMode,
      int totalPage,
      int rowCount,
      int columnCount,
      int intervalMilliseconds,
      int thumbnailWidth,
      int thumbnailHeight,
      int allThumbnailCount,
      int? baseTimeMilliseconds,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VodSeekThumbnail() when $default != null:
        return $default(
          _that.source,
          _that.sourcePatternType,
          _that.indexPlaceholder,
          _that.indexMode,
          _that.totalPage,
          _that.rowCount,
          _that.columnCount,
          _that.intervalMilliseconds,
          _that.thumbnailWidth,
          _that.thumbnailHeight,
          _that.allThumbnailCount,
          _that.baseTimeMilliseconds,
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
      String source,
      String sourcePatternType,
      String indexPlaceholder,
      VodSeekThumbnailIndexMode indexMode,
      int totalPage,
      int rowCount,
      int columnCount,
      int intervalMilliseconds,
      int thumbnailWidth,
      int thumbnailHeight,
      int allThumbnailCount,
      int? baseTimeMilliseconds,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodSeekThumbnail():
        return $default(
          _that.source,
          _that.sourcePatternType,
          _that.indexPlaceholder,
          _that.indexMode,
          _that.totalPage,
          _that.rowCount,
          _that.columnCount,
          _that.intervalMilliseconds,
          _that.thumbnailWidth,
          _that.thumbnailHeight,
          _that.allThumbnailCount,
          _that.baseTimeMilliseconds,
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
      String source,
      String sourcePatternType,
      String indexPlaceholder,
      VodSeekThumbnailIndexMode indexMode,
      int totalPage,
      int rowCount,
      int columnCount,
      int intervalMilliseconds,
      int thumbnailWidth,
      int thumbnailHeight,
      int allThumbnailCount,
      int? baseTimeMilliseconds,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VodSeekThumbnail() when $default != null:
        return $default(
          _that.source,
          _that.sourcePatternType,
          _that.indexPlaceholder,
          _that.indexMode,
          _that.totalPage,
          _that.rowCount,
          _that.columnCount,
          _that.intervalMilliseconds,
          _that.thumbnailWidth,
          _that.thumbnailHeight,
          _that.allThumbnailCount,
          _that.baseTimeMilliseconds,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VodSeekThumbnail implements VodSeekThumbnail {
  const _VodSeekThumbnail({
    required this.source,
    this.sourcePatternType = 'sequence_pattern',
    this.indexPlaceholder = '#',
    this.indexMode = VodSeekThumbnailIndexMode.ratio,
    this.totalPage = 0,
    this.rowCount = 0,
    this.columnCount = 0,
    this.intervalMilliseconds = 0,
    this.thumbnailWidth = 0,
    this.thumbnailHeight = 0,
    this.allThumbnailCount = 0,
    this.baseTimeMilliseconds,
  });

  @override
  final String source;
  @override
  @JsonKey()
  final String sourcePatternType;
  @override
  @JsonKey()
  final String indexPlaceholder;
  @override
  @JsonKey()
  final VodSeekThumbnailIndexMode indexMode;
  @override
  @JsonKey()
  final int totalPage;
  @override
  @JsonKey()
  final int rowCount;
  @override
  @JsonKey()
  final int columnCount;
  @override
  @JsonKey()
  final int intervalMilliseconds;
  @override
  @JsonKey()
  final int thumbnailWidth;
  @override
  @JsonKey()
  final int thumbnailHeight;
  @override
  @JsonKey()
  final int allThumbnailCount;
  @override
  final int? baseTimeMilliseconds;

  /// Create a copy of VodSeekThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VodSeekThumbnailCopyWith<_VodSeekThumbnail> get copyWith =>
      __$VodSeekThumbnailCopyWithImpl<_VodSeekThumbnail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VodSeekThumbnail &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sourcePatternType, sourcePatternType) ||
                other.sourcePatternType == sourcePatternType) &&
            (identical(other.indexPlaceholder, indexPlaceholder) ||
                other.indexPlaceholder == indexPlaceholder) &&
            (identical(other.indexMode, indexMode) ||
                other.indexMode == indexMode) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.rowCount, rowCount) ||
                other.rowCount == rowCount) &&
            (identical(other.columnCount, columnCount) ||
                other.columnCount == columnCount) &&
            (identical(other.intervalMilliseconds, intervalMilliseconds) ||
                other.intervalMilliseconds == intervalMilliseconds) &&
            (identical(other.thumbnailWidth, thumbnailWidth) ||
                other.thumbnailWidth == thumbnailWidth) &&
            (identical(other.thumbnailHeight, thumbnailHeight) ||
                other.thumbnailHeight == thumbnailHeight) &&
            (identical(other.allThumbnailCount, allThumbnailCount) ||
                other.allThumbnailCount == allThumbnailCount) &&
            (identical(other.baseTimeMilliseconds, baseTimeMilliseconds) ||
                other.baseTimeMilliseconds == baseTimeMilliseconds));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    source,
    sourcePatternType,
    indexPlaceholder,
    indexMode,
    totalPage,
    rowCount,
    columnCount,
    intervalMilliseconds,
    thumbnailWidth,
    thumbnailHeight,
    allThumbnailCount,
    baseTimeMilliseconds,
  );

  @override
  String toString() {
    return 'VodSeekThumbnail(source: $source, sourcePatternType: $sourcePatternType, indexPlaceholder: $indexPlaceholder, indexMode: $indexMode, totalPage: $totalPage, rowCount: $rowCount, columnCount: $columnCount, intervalMilliseconds: $intervalMilliseconds, thumbnailWidth: $thumbnailWidth, thumbnailHeight: $thumbnailHeight, allThumbnailCount: $allThumbnailCount, baseTimeMilliseconds: $baseTimeMilliseconds)';
  }
}

/// @nodoc
abstract mixin class _$VodSeekThumbnailCopyWith<$Res>
    implements $VodSeekThumbnailCopyWith<$Res> {
  factory _$VodSeekThumbnailCopyWith(
    _VodSeekThumbnail value,
    $Res Function(_VodSeekThumbnail) _then,
  ) = __$VodSeekThumbnailCopyWithImpl;
  @override
  @useResult
  $Res call({
    String source,
    String sourcePatternType,
    String indexPlaceholder,
    VodSeekThumbnailIndexMode indexMode,
    int totalPage,
    int rowCount,
    int columnCount,
    int intervalMilliseconds,
    int thumbnailWidth,
    int thumbnailHeight,
    int allThumbnailCount,
    int? baseTimeMilliseconds,
  });
}

/// @nodoc
class __$VodSeekThumbnailCopyWithImpl<$Res>
    implements _$VodSeekThumbnailCopyWith<$Res> {
  __$VodSeekThumbnailCopyWithImpl(this._self, this._then);

  final _VodSeekThumbnail _self;
  final $Res Function(_VodSeekThumbnail) _then;

  /// Create a copy of VodSeekThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? source = null,
    Object? sourcePatternType = null,
    Object? indexPlaceholder = null,
    Object? indexMode = null,
    Object? totalPage = null,
    Object? rowCount = null,
    Object? columnCount = null,
    Object? intervalMilliseconds = null,
    Object? thumbnailWidth = null,
    Object? thumbnailHeight = null,
    Object? allThumbnailCount = null,
    Object? baseTimeMilliseconds = freezed,
  }) {
    return _then(
      _VodSeekThumbnail(
        source: null == source
            ? _self.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String,
        sourcePatternType: null == sourcePatternType
            ? _self.sourcePatternType
            : sourcePatternType // ignore: cast_nullable_to_non_nullable
                  as String,
        indexPlaceholder: null == indexPlaceholder
            ? _self.indexPlaceholder
            : indexPlaceholder // ignore: cast_nullable_to_non_nullable
                  as String,
        indexMode: null == indexMode
            ? _self.indexMode
            : indexMode // ignore: cast_nullable_to_non_nullable
                  as VodSeekThumbnailIndexMode,
        totalPage: null == totalPage
            ? _self.totalPage
            : totalPage // ignore: cast_nullable_to_non_nullable
                  as int,
        rowCount: null == rowCount
            ? _self.rowCount
            : rowCount // ignore: cast_nullable_to_non_nullable
                  as int,
        columnCount: null == columnCount
            ? _self.columnCount
            : columnCount // ignore: cast_nullable_to_non_nullable
                  as int,
        intervalMilliseconds: null == intervalMilliseconds
            ? _self.intervalMilliseconds
            : intervalMilliseconds // ignore: cast_nullable_to_non_nullable
                  as int,
        thumbnailWidth: null == thumbnailWidth
            ? _self.thumbnailWidth
            : thumbnailWidth // ignore: cast_nullable_to_non_nullable
                  as int,
        thumbnailHeight: null == thumbnailHeight
            ? _self.thumbnailHeight
            : thumbnailHeight // ignore: cast_nullable_to_non_nullable
                  as int,
        allThumbnailCount: null == allThumbnailCount
            ? _self.allThumbnailCount
            : allThumbnailCount // ignore: cast_nullable_to_non_nullable
                  as int,
        baseTimeMilliseconds: freezed == baseTimeMilliseconds
            ? _self.baseTimeMilliseconds
            : baseTimeMilliseconds // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}
