// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryItem {
  String get categoryId;
  String get categoryType;
  String get title;
  String? get posterImageUrl;
  int get openLiveCount;
  int get concurrentUserCount;

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryItemCopyWith<CategoryItem> get copyWith =>
      _$CategoryItemCopyWithImpl<CategoryItem>(
        this as CategoryItem,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryItem &&
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
                other.concurrentUserCount == concurrentUserCount));
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
  );

  @override
  String toString() {
    return 'CategoryItem(categoryId: $categoryId, categoryType: $categoryType, title: $title, posterImageUrl: $posterImageUrl, openLiveCount: $openLiveCount, concurrentUserCount: $concurrentUserCount)';
  }
}

/// @nodoc
abstract mixin class $CategoryItemCopyWith<$Res> {
  factory $CategoryItemCopyWith(
    CategoryItem value,
    $Res Function(CategoryItem) _then,
  ) = _$CategoryItemCopyWithImpl;
  @useResult
  $Res call({
    String categoryId,
    String categoryType,
    String title,
    String? posterImageUrl,
    int openLiveCount,
    int concurrentUserCount,
  });
}

/// @nodoc
class _$CategoryItemCopyWithImpl<$Res> implements $CategoryItemCopyWith<$Res> {
  _$CategoryItemCopyWithImpl(this._self, this._then);

  final CategoryItem _self;
  final $Res Function(CategoryItem) _then;

  /// Create a copy of CategoryItem
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
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CategoryItem].
extension CategoryItemPatterns on CategoryItem {
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
    TResult Function(_CategoryItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryItem() when $default != null:
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
    TResult Function(_CategoryItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryItem():
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
    TResult? Function(_CategoryItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryItem() when $default != null:
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
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryItem() when $default != null:
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.title,
          _that.posterImageUrl,
          _that.openLiveCount,
          _that.concurrentUserCount,
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
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryItem():
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.title,
          _that.posterImageUrl,
          _that.openLiveCount,
          _that.concurrentUserCount,
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
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryItem() when $default != null:
        return $default(
          _that.categoryId,
          _that.categoryType,
          _that.title,
          _that.posterImageUrl,
          _that.openLiveCount,
          _that.concurrentUserCount,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategoryItem implements CategoryItem {
  const _CategoryItem({
    required this.categoryId,
    required this.categoryType,
    required this.title,
    this.posterImageUrl,
    required this.openLiveCount,
    required this.concurrentUserCount,
  });

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

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryItemCopyWith<_CategoryItem> get copyWith =>
      __$CategoryItemCopyWithImpl<_CategoryItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryItem &&
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
                other.concurrentUserCount == concurrentUserCount));
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
  );

  @override
  String toString() {
    return 'CategoryItem(categoryId: $categoryId, categoryType: $categoryType, title: $title, posterImageUrl: $posterImageUrl, openLiveCount: $openLiveCount, concurrentUserCount: $concurrentUserCount)';
  }
}

/// @nodoc
abstract mixin class _$CategoryItemCopyWith<$Res>
    implements $CategoryItemCopyWith<$Res> {
  factory _$CategoryItemCopyWith(
    _CategoryItem value,
    $Res Function(_CategoryItem) _then,
  ) = __$CategoryItemCopyWithImpl;
  @override
  @useResult
  $Res call({
    String categoryId,
    String categoryType,
    String title,
    String? posterImageUrl,
    int openLiveCount,
    int concurrentUserCount,
  });
}

/// @nodoc
class __$CategoryItemCopyWithImpl<$Res>
    implements _$CategoryItemCopyWith<$Res> {
  __$CategoryItemCopyWithImpl(this._self, this._then);

  final _CategoryItem _self;
  final $Res Function(_CategoryItem) _then;

  /// Create a copy of CategoryItem
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
  }) {
    return _then(
      _CategoryItem(
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
      ),
    );
  }
}
