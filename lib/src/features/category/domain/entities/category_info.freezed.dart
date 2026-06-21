// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryInfo {
  String get categoryId;
  String get categoryType;
  String get title;
  String? get posterImageUrl;
  int get openLiveCount;
  int get concurrentUserCount;
  List<String> get tags;
  bool get following;

  /// Create a copy of CategoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryInfoCopyWith<CategoryInfo> get copyWith =>
      _$CategoryInfoCopyWithImpl<CategoryInfo>(
        this as CategoryInfo,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryInfo &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterImageUrl, posterImageUrl) ||
                other.posterImageUrl == posterImageUrl) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.following, following) ||
                other.following == following));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    categoryType,
    title,
    posterImageUrl,
    openLiveCount,
    concurrentUserCount,
    const DeepCollectionEquality().hash(tags),
    following,
  );

  @override
  String toString() {
    return 'CategoryInfo(categoryId: $categoryId, categoryType: $categoryType, title: $title, posterImageUrl: $posterImageUrl, openLiveCount: $openLiveCount, concurrentUserCount: $concurrentUserCount, tags: $tags, following: $following)';
  }
}

/// @nodoc
abstract mixin class $CategoryInfoCopyWith<$Res> {
  factory $CategoryInfoCopyWith(
    CategoryInfo value,
    $Res Function(CategoryInfo) _then,
  ) = _$CategoryInfoCopyWithImpl;
  @useResult
  $Res call({
    String categoryId,
    String categoryType,
    String title,
    String? posterImageUrl,
    int openLiveCount,
    int concurrentUserCount,
    List<String> tags,
    bool following,
  });
}

/// @nodoc
class _$CategoryInfoCopyWithImpl<$Res> implements $CategoryInfoCopyWith<$Res> {
  _$CategoryInfoCopyWithImpl(this._self, this._then);

  final CategoryInfo _self;
  final $Res Function(CategoryInfo) _then;

  /// Create a copy of CategoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryType = null,
    Object? title = null,
    Object? posterImageUrl = freezed,
    Object? openLiveCount = null,
    Object? concurrentUserCount = null,
    Object? tags = null,
    Object? following = null,
  }) {
    return _then(
      _self.copyWith(
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryType: null == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        posterImageUrl: freezed == posterImageUrl
            ? _self.posterImageUrl
            : posterImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        openLiveCount: null == openLiveCount
            ? _self.openLiveCount
            : openLiveCount // ignore: cast_nullable_to_non_nullable
                  as int,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        tags: null == tags
            ? _self.tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        following: null == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CategoryInfo].
extension CategoryInfoPatterns on CategoryInfo {
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
    TResult Function(_CategoryInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryInfo() when $default != null:
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
    TResult Function(_CategoryInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryInfo():
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
    TResult? Function(_CategoryInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryInfo() when $default != null:
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
      String categoryId,
      String categoryType,
      String title,
      String? posterImageUrl,
      int openLiveCount,
      int concurrentUserCount,
      List<String> tags,
      bool following,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryInfo() when $default != null:
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.title,
          _that.posterImageUrl,
          _that.openLiveCount,
          _that.concurrentUserCount,
          _that.tags,
          _that.following,
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
      String categoryId,
      String categoryType,
      String title,
      String? posterImageUrl,
      int openLiveCount,
      int concurrentUserCount,
      List<String> tags,
      bool following,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryInfo():
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.title,
          _that.posterImageUrl,
          _that.openLiveCount,
          _that.concurrentUserCount,
          _that.tags,
          _that.following,
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
      String categoryId,
      String categoryType,
      String title,
      String? posterImageUrl,
      int openLiveCount,
      int concurrentUserCount,
      List<String> tags,
      bool following,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryInfo() when $default != null:
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.title,
          _that.posterImageUrl,
          _that.openLiveCount,
          _that.concurrentUserCount,
          _that.tags,
          _that.following,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoryInfo implements CategoryInfo {
  const _CategoryInfo({
    required this.categoryId,
    required this.categoryType,
    required this.title,
    this.posterImageUrl,
    required this.openLiveCount,
    required this.concurrentUserCount,
    final List<String> tags = const <String>[],
    this.following = false,
  }) : _tags = tags;

  @override
  final String categoryId;
  @override
  final String categoryType;
  @override
  final String title;
  @override
  final String? posterImageUrl;
  @override
  final int openLiveCount;
  @override
  final int concurrentUserCount;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final bool following;

  /// Create a copy of CategoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryInfoCopyWith<_CategoryInfo> get copyWith =>
      __$CategoryInfoCopyWithImpl<_CategoryInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryInfo &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterImageUrl, posterImageUrl) ||
                other.posterImageUrl == posterImageUrl) &&
            (identical(other.openLiveCount, openLiveCount) ||
                other.openLiveCount == openLiveCount) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.following, following) ||
                other.following == following));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    categoryType,
    title,
    posterImageUrl,
    openLiveCount,
    concurrentUserCount,
    const DeepCollectionEquality().hash(_tags),
    following,
  );

  @override
  String toString() {
    return 'CategoryInfo(categoryId: $categoryId, categoryType: $categoryType, title: $title, posterImageUrl: $posterImageUrl, openLiveCount: $openLiveCount, concurrentUserCount: $concurrentUserCount, tags: $tags, following: $following)';
  }
}

/// @nodoc
abstract mixin class _$CategoryInfoCopyWith<$Res>
    implements $CategoryInfoCopyWith<$Res> {
  factory _$CategoryInfoCopyWith(
    _CategoryInfo value,
    $Res Function(_CategoryInfo) _then,
  ) = __$CategoryInfoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String categoryId,
    String categoryType,
    String title,
    String? posterImageUrl,
    int openLiveCount,
    int concurrentUserCount,
    List<String> tags,
    bool following,
  });
}

/// @nodoc
class __$CategoryInfoCopyWithImpl<$Res>
    implements _$CategoryInfoCopyWith<$Res> {
  __$CategoryInfoCopyWithImpl(this._self, this._then);

  final _CategoryInfo _self;
  final $Res Function(_CategoryInfo) _then;

  /// Create a copy of CategoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = null,
    Object? categoryType = null,
    Object? title = null,
    Object? posterImageUrl = freezed,
    Object? openLiveCount = null,
    Object? concurrentUserCount = null,
    Object? tags = null,
    Object? following = null,
  }) {
    return _then(
      _CategoryInfo(
        categoryId: null == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryType: null == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        posterImageUrl: freezed == posterImageUrl
            ? _self.posterImageUrl
            : posterImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        openLiveCount: null == openLiveCount
            ? _self.openLiveCount
            : openLiveCount // ignore: cast_nullable_to_non_nullable
                  as int,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        tags: null == tags
            ? _self._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        following: null == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
