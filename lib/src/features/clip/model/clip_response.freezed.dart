// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PopularClipResponse {
  int get size;
  PopularClipPage? get page;
  List<NaverClip> get data;

  /// Create a copy of PopularClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PopularClipResponseCopyWith<PopularClipResponse> get copyWith =>
      _$PopularClipResponseCopyWithImpl<PopularClipResponse>(
          this as PopularClipResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PopularClipResponse &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'PopularClipResponse(size: $size, page: $page, data: $data)';
  }
}

/// @nodoc
abstract mixin class $PopularClipResponseCopyWith<$Res> {
  factory $PopularClipResponseCopyWith(
          PopularClipResponse value, $Res Function(PopularClipResponse) _then) =
      _$PopularClipResponseCopyWithImpl;
  @useResult
  $Res call({int size, PopularClipPage? page, List<NaverClip> data});
}

/// @nodoc
class _$PopularClipResponseCopyWithImpl<$Res>
    implements $PopularClipResponseCopyWith<$Res> {
  _$PopularClipResponseCopyWithImpl(this._self, this._then);

  final PopularClipResponse _self;
  final $Res Function(PopularClipResponse) _then;

  /// Create a copy of PopularClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(PopularClipResponse(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as PopularClipPage?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NaverClip>,
    ));
  }
}

/// @nodoc
mixin _$PopularClipPage {
  PopularClipNext? get next;

  /// Create a copy of PopularClipPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PopularClipPageCopyWith<PopularClipPage> get copyWith =>
      _$PopularClipPageCopyWithImpl<PopularClipPage>(
          this as PopularClipPage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PopularClipPage &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'PopularClipPage(next: $next)';
  }
}

/// @nodoc
abstract mixin class $PopularClipPageCopyWith<$Res> {
  factory $PopularClipPageCopyWith(
          PopularClipPage value, $Res Function(PopularClipPage) _then) =
      _$PopularClipPageCopyWithImpl;
  @useResult
  $Res call({PopularClipNext? next});
}

/// @nodoc
class _$PopularClipPageCopyWithImpl<$Res>
    implements $PopularClipPageCopyWith<$Res> {
  _$PopularClipPageCopyWithImpl(this._self, this._then);

  final PopularClipPage _self;
  final $Res Function(PopularClipPage) _then;

  /// Create a copy of PopularClipPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(PopularClipPage(
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as PopularClipNext?,
    ));
  }
}

/// @nodoc
mixin _$PopularClipNext {
  String? get next;

  /// Create a copy of PopularClipNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PopularClipNextCopyWith<PopularClipNext> get copyWith =>
      _$PopularClipNextCopyWithImpl<PopularClipNext>(
          this as PopularClipNext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PopularClipNext &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'PopularClipNext(next: $next)';
  }
}

/// @nodoc
abstract mixin class $PopularClipNextCopyWith<$Res> {
  factory $PopularClipNextCopyWith(
          PopularClipNext value, $Res Function(PopularClipNext) _then) =
      _$PopularClipNextCopyWithImpl;
  @useResult
  $Res call({String? next});
}

/// @nodoc
class _$PopularClipNextCopyWithImpl<$Res>
    implements $PopularClipNextCopyWith<$Res> {
  _$PopularClipNextCopyWithImpl(this._self, this._then);

  final PopularClipNext _self;
  final $Res Function(PopularClipNext) _then;

  /// Create a copy of PopularClipNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(PopularClipNext(
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$CategoryClipResponse {
  int get size;
  CategoryClipPage? get page;
  List<NaverClip> get data;

  /// Create a copy of CategoryClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryClipResponseCopyWith<CategoryClipResponse> get copyWith =>
      _$CategoryClipResponseCopyWithImpl<CategoryClipResponse>(
          this as CategoryClipResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryClipResponse &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'CategoryClipResponse(size: $size, page: $page, data: $data)';
  }
}

/// @nodoc
abstract mixin class $CategoryClipResponseCopyWith<$Res> {
  factory $CategoryClipResponseCopyWith(CategoryClipResponse value,
          $Res Function(CategoryClipResponse) _then) =
      _$CategoryClipResponseCopyWithImpl;
  @useResult
  $Res call({int size, CategoryClipPage? page, List<NaverClip> data});
}

/// @nodoc
class _$CategoryClipResponseCopyWithImpl<$Res>
    implements $CategoryClipResponseCopyWith<$Res> {
  _$CategoryClipResponseCopyWithImpl(this._self, this._then);

  final CategoryClipResponse _self;
  final $Res Function(CategoryClipResponse) _then;

  /// Create a copy of CategoryClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(CategoryClipResponse(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as CategoryClipPage?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NaverClip>,
    ));
  }
}

/// @nodoc
mixin _$CategoryClipPage {
  CategoryClipNext? get next;

  /// Create a copy of CategoryClipPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryClipPageCopyWith<CategoryClipPage> get copyWith =>
      _$CategoryClipPageCopyWithImpl<CategoryClipPage>(
          this as CategoryClipPage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryClipPage &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'CategoryClipPage(next: $next)';
  }
}

/// @nodoc
abstract mixin class $CategoryClipPageCopyWith<$Res> {
  factory $CategoryClipPageCopyWith(
          CategoryClipPage value, $Res Function(CategoryClipPage) _then) =
      _$CategoryClipPageCopyWithImpl;
  @useResult
  $Res call({CategoryClipNext? next});
}

/// @nodoc
class _$CategoryClipPageCopyWithImpl<$Res>
    implements $CategoryClipPageCopyWith<$Res> {
  _$CategoryClipPageCopyWithImpl(this._self, this._then);

  final CategoryClipPage _self;
  final $Res Function(CategoryClipPage) _then;

  /// Create a copy of CategoryClipPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(CategoryClipPage(
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as CategoryClipNext?,
    ));
  }
}

/// @nodoc
mixin _$CategoryClipNext {
  String? get clipUID;
  int? get readCount;

  /// Create a copy of CategoryClipNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryClipNextCopyWith<CategoryClipNext> get copyWith =>
      _$CategoryClipNextCopyWithImpl<CategoryClipNext>(
          this as CategoryClipNext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryClipNext &&
            (identical(other.clipUID, clipUID) || other.clipUID == clipUID) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clipUID, readCount);

  @override
  String toString() {
    return 'CategoryClipNext(clipUID: $clipUID, readCount: $readCount)';
  }
}

/// @nodoc
abstract mixin class $CategoryClipNextCopyWith<$Res> {
  factory $CategoryClipNextCopyWith(
          CategoryClipNext value, $Res Function(CategoryClipNext) _then) =
      _$CategoryClipNextCopyWithImpl;
  @useResult
  $Res call({String? clipUID, int? readCount});
}

/// @nodoc
class _$CategoryClipNextCopyWithImpl<$Res>
    implements $CategoryClipNextCopyWith<$Res> {
  _$CategoryClipNextCopyWithImpl(this._self, this._then);

  final CategoryClipNext _self;
  final $Res Function(CategoryClipNext) _then;

  /// Create a copy of CategoryClipNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clipUID = freezed,
    Object? readCount = freezed,
  }) {
    return _then(CategoryClipNext(
      clipUID: freezed == clipUID
          ? _self.clipUID
          : clipUID // ignore: cast_nullable_to_non_nullable
              as String?,
      readCount: freezed == readCount
          ? _self.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$ChannelClipResponse {
  int get size;
  ChannelClipPage? get page;
  List<NaverClip> get data;
  bool? get hasStreamerClips;

  /// Create a copy of ChannelClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelClipResponseCopyWith<ChannelClipResponse> get copyWith =>
      _$ChannelClipResponseCopyWithImpl<ChannelClipResponse>(
          this as ChannelClipResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelClipResponse &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.hasStreamerClips, hasStreamerClips) ||
                other.hasStreamerClips == hasStreamerClips));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, size, page,
      const DeepCollectionEquality().hash(data), hasStreamerClips);

  @override
  String toString() {
    return 'ChannelClipResponse(size: $size, page: $page, data: $data, hasStreamerClips: $hasStreamerClips)';
  }
}

/// @nodoc
abstract mixin class $ChannelClipResponseCopyWith<$Res> {
  factory $ChannelClipResponseCopyWith(
          ChannelClipResponse value, $Res Function(ChannelClipResponse) _then) =
      _$ChannelClipResponseCopyWithImpl;
  @useResult
  $Res call(
      {int size,
      ChannelClipPage? page,
      List<NaverClip> data,
      bool? hasStreamerClips});
}

/// @nodoc
class _$ChannelClipResponseCopyWithImpl<$Res>
    implements $ChannelClipResponseCopyWith<$Res> {
  _$ChannelClipResponseCopyWithImpl(this._self, this._then);

  final ChannelClipResponse _self;
  final $Res Function(ChannelClipResponse) _then;

  /// Create a copy of ChannelClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
    Object? hasStreamerClips = freezed,
  }) {
    return _then(ChannelClipResponse(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as ChannelClipPage?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NaverClip>,
      hasStreamerClips: freezed == hasStreamerClips
          ? _self.hasStreamerClips
          : hasStreamerClips // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$ChannelClipPage {
  ChannelClipNext? get next;

  /// Create a copy of ChannelClipPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelClipPageCopyWith<ChannelClipPage> get copyWith =>
      _$ChannelClipPageCopyWithImpl<ChannelClipPage>(
          this as ChannelClipPage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelClipPage &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'ChannelClipPage(next: $next)';
  }
}

/// @nodoc
abstract mixin class $ChannelClipPageCopyWith<$Res> {
  factory $ChannelClipPageCopyWith(
          ChannelClipPage value, $Res Function(ChannelClipPage) _then) =
      _$ChannelClipPageCopyWithImpl;
  @useResult
  $Res call({ChannelClipNext? next});
}

/// @nodoc
class _$ChannelClipPageCopyWithImpl<$Res>
    implements $ChannelClipPageCopyWith<$Res> {
  _$ChannelClipPageCopyWithImpl(this._self, this._then);

  final ChannelClipPage _self;
  final $Res Function(ChannelClipPage) _then;

  /// Create a copy of ChannelClipPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(ChannelClipPage(
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as ChannelClipNext?,
    ));
  }
}

/// @nodoc
mixin _$ChannelClipNext {
  String? get clipUID;
  int? get readCount;

  /// Create a copy of ChannelClipNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelClipNextCopyWith<ChannelClipNext> get copyWith =>
      _$ChannelClipNextCopyWithImpl<ChannelClipNext>(
          this as ChannelClipNext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelClipNext &&
            (identical(other.clipUID, clipUID) || other.clipUID == clipUID) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clipUID, readCount);

  @override
  String toString() {
    return 'ChannelClipNext(clipUID: $clipUID, readCount: $readCount)';
  }
}

/// @nodoc
abstract mixin class $ChannelClipNextCopyWith<$Res> {
  factory $ChannelClipNextCopyWith(
          ChannelClipNext value, $Res Function(ChannelClipNext) _then) =
      _$ChannelClipNextCopyWithImpl;
  @useResult
  $Res call({String? clipUID, int? readCount});
}

/// @nodoc
class _$ChannelClipNextCopyWithImpl<$Res>
    implements $ChannelClipNextCopyWith<$Res> {
  _$ChannelClipNextCopyWithImpl(this._self, this._then);

  final ChannelClipNext _self;
  final $Res Function(ChannelClipNext) _then;

  /// Create a copy of ChannelClipNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clipUID = freezed,
    Object? readCount = freezed,
  }) {
    return _then(ChannelClipNext(
      clipUID: freezed == clipUID
          ? _self.clipUID
          : clipUID // ignore: cast_nullable_to_non_nullable
              as String?,
      readCount: freezed == readCount
          ? _self.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
