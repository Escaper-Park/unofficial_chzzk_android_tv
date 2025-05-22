// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vod_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VodResponse {
  int get size;
  VodPage? get page;
  List<Vod> get data;

  /// Create a copy of VodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodResponseCopyWith<VodResponse> get copyWith =>
      _$VodResponseCopyWithImpl<VodResponse>(this as VodResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodResponse &&
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
    return 'VodResponse(size: $size, page: $page, data: $data)';
  }
}

/// @nodoc
abstract mixin class $VodResponseCopyWith<$Res> {
  factory $VodResponseCopyWith(
          VodResponse value, $Res Function(VodResponse) _then) =
      _$VodResponseCopyWithImpl;
  @useResult
  $Res call({int size, VodPage? page, List<Vod> data});
}

/// @nodoc
class _$VodResponseCopyWithImpl<$Res> implements $VodResponseCopyWith<$Res> {
  _$VodResponseCopyWithImpl(this._self, this._then);

  final VodResponse _self;
  final $Res Function(VodResponse) _then;

  /// Create a copy of VodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(VodResponse(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as VodPage?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ));
  }
}

/// @nodoc
mixin _$VodPage {
  VodNext? get next;

  /// Create a copy of VodPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodPageCopyWith<VodPage> get copyWith =>
      _$VodPageCopyWithImpl<VodPage>(this as VodPage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodPage &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'VodPage(next: $next)';
  }
}

/// @nodoc
abstract mixin class $VodPageCopyWith<$Res> {
  factory $VodPageCopyWith(VodPage value, $Res Function(VodPage) _then) =
      _$VodPageCopyWithImpl;
  @useResult
  $Res call({VodNext? next});
}

/// @nodoc
class _$VodPageCopyWithImpl<$Res> implements $VodPageCopyWith<$Res> {
  _$VodPageCopyWithImpl(this._self, this._then);

  final VodPage _self;
  final $Res Function(VodPage) _then;

  /// Create a copy of VodPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(VodPage(
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as VodNext?,
    ));
  }
}

/// @nodoc
mixin _$VodNext {
  int? get publishDateAt;
  int? get readCount;

  /// Create a copy of VodNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VodNextCopyWith<VodNext> get copyWith =>
      _$VodNextCopyWithImpl<VodNext>(this as VodNext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VodNext &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, publishDateAt, readCount);

  @override
  String toString() {
    return 'VodNext(publishDateAt: $publishDateAt, readCount: $readCount)';
  }
}

/// @nodoc
abstract mixin class $VodNextCopyWith<$Res> {
  factory $VodNextCopyWith(VodNext value, $Res Function(VodNext) _then) =
      _$VodNextCopyWithImpl;
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class _$VodNextCopyWithImpl<$Res> implements $VodNextCopyWith<$Res> {
  _$VodNextCopyWithImpl(this._self, this._then);

  final VodNext _self;
  final $Res Function(VodNext) _then;

  /// Create a copy of VodNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishDateAt = freezed,
    Object? readCount = freezed,
  }) {
    return _then(VodNext(
      publishDateAt: freezed == publishDateAt
          ? _self.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int?,
      readCount: freezed == readCount
          ? _self.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$ChannelVodResponse {
  int get page;
  int get size;
  int get totalCount;
  int get totalPages;
  List<Vod> get data;

  /// Create a copy of ChannelVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelVodResponseCopyWith<ChannelVodResponse> get copyWith =>
      _$ChannelVodResponseCopyWithImpl<ChannelVodResponse>(
          this as ChannelVodResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelVodResponse &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, size, totalCount,
      totalPages, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'ChannelVodResponse(page: $page, size: $size, totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ChannelVodResponseCopyWith<$Res> {
  factory $ChannelVodResponseCopyWith(
          ChannelVodResponse value, $Res Function(ChannelVodResponse) _then) =
      _$ChannelVodResponseCopyWithImpl;
  @useResult
  $Res call(
      {int page, int size, int totalCount, int totalPages, List<Vod> data});
}

/// @nodoc
class _$ChannelVodResponseCopyWithImpl<$Res>
    implements $ChannelVodResponseCopyWith<$Res> {
  _$ChannelVodResponseCopyWithImpl(this._self, this._then);

  final ChannelVodResponse _self;
  final $Res Function(ChannelVodResponse) _then;

  /// Create a copy of ChannelVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? totalCount = null,
    Object? totalPages = null,
    Object? data = null,
  }) {
    return _then(ChannelVodResponse(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ));
  }
}

/// @nodoc
mixin _$FollowingVodResponse {
  int get size;
  FollowingVodPage? get page;
  List<Vod> get data;

  /// Create a copy of FollowingVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingVodResponseCopyWith<FollowingVodResponse> get copyWith =>
      _$FollowingVodResponseCopyWithImpl<FollowingVodResponse>(
          this as FollowingVodResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingVodResponse &&
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
    return 'FollowingVodResponse(size: $size, page: $page, data: $data)';
  }
}

/// @nodoc
abstract mixin class $FollowingVodResponseCopyWith<$Res> {
  factory $FollowingVodResponseCopyWith(FollowingVodResponse value,
          $Res Function(FollowingVodResponse) _then) =
      _$FollowingVodResponseCopyWithImpl;
  @useResult
  $Res call({int size, FollowingVodPage? page, List<Vod> data});
}

/// @nodoc
class _$FollowingVodResponseCopyWithImpl<$Res>
    implements $FollowingVodResponseCopyWith<$Res> {
  _$FollowingVodResponseCopyWithImpl(this._self, this._then);

  final FollowingVodResponse _self;
  final $Res Function(FollowingVodResponse) _then;

  /// Create a copy of FollowingVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(FollowingVodResponse(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as FollowingVodPage?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ));
  }
}

/// @nodoc
mixin _$FollowingVodPage {
  FollowingVodNext? get next;

  /// Create a copy of FollowingVodPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingVodPageCopyWith<FollowingVodPage> get copyWith =>
      _$FollowingVodPageCopyWithImpl<FollowingVodPage>(
          this as FollowingVodPage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingVodPage &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'FollowingVodPage(next: $next)';
  }
}

/// @nodoc
abstract mixin class $FollowingVodPageCopyWith<$Res> {
  factory $FollowingVodPageCopyWith(
          FollowingVodPage value, $Res Function(FollowingVodPage) _then) =
      _$FollowingVodPageCopyWithImpl;
  @useResult
  $Res call({FollowingVodNext? next});
}

/// @nodoc
class _$FollowingVodPageCopyWithImpl<$Res>
    implements $FollowingVodPageCopyWith<$Res> {
  _$FollowingVodPageCopyWithImpl(this._self, this._then);

  final FollowingVodPage _self;
  final $Res Function(FollowingVodPage) _then;

  /// Create a copy of FollowingVodPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(FollowingVodPage(
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as FollowingVodNext?,
    ));
  }
}

/// @nodoc
mixin _$FollowingVodNext {
  String? get nextNo;

  /// Create a copy of FollowingVodNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingVodNextCopyWith<FollowingVodNext> get copyWith =>
      _$FollowingVodNextCopyWithImpl<FollowingVodNext>(
          this as FollowingVodNext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingVodNext &&
            (identical(other.nextNo, nextNo) || other.nextNo == nextNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nextNo);

  @override
  String toString() {
    return 'FollowingVodNext(nextNo: $nextNo)';
  }
}

/// @nodoc
abstract mixin class $FollowingVodNextCopyWith<$Res> {
  factory $FollowingVodNextCopyWith(
          FollowingVodNext value, $Res Function(FollowingVodNext) _then) =
      _$FollowingVodNextCopyWithImpl;
  @useResult
  $Res call({String? nextNo});
}

/// @nodoc
class _$FollowingVodNextCopyWithImpl<$Res>
    implements $FollowingVodNextCopyWith<$Res> {
  _$FollowingVodNextCopyWithImpl(this._self, this._then);

  final FollowingVodNext _self;
  final $Res Function(FollowingVodNext) _then;

  /// Create a copy of FollowingVodNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextNo = freezed,
  }) {
    return _then(FollowingVodNext(
      nextNo: freezed == nextNo
          ? _self.nextNo
          : nextNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$CategoryVodResponse {
  int get size;
  CategoryVodPage? get page;
  List<Vod> get data;

  /// Create a copy of CategoryVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryVodResponseCopyWith<CategoryVodResponse> get copyWith =>
      _$CategoryVodResponseCopyWithImpl<CategoryVodResponse>(
          this as CategoryVodResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryVodResponse &&
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
    return 'CategoryVodResponse(size: $size, page: $page, data: $data)';
  }
}

/// @nodoc
abstract mixin class $CategoryVodResponseCopyWith<$Res> {
  factory $CategoryVodResponseCopyWith(
          CategoryVodResponse value, $Res Function(CategoryVodResponse) _then) =
      _$CategoryVodResponseCopyWithImpl;
  @useResult
  $Res call({int size, CategoryVodPage? page, List<Vod> data});
}

/// @nodoc
class _$CategoryVodResponseCopyWithImpl<$Res>
    implements $CategoryVodResponseCopyWith<$Res> {
  _$CategoryVodResponseCopyWithImpl(this._self, this._then);

  final CategoryVodResponse _self;
  final $Res Function(CategoryVodResponse) _then;

  /// Create a copy of CategoryVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(CategoryVodResponse(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as CategoryVodPage?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ));
  }
}

/// @nodoc
mixin _$CategoryVodPage {
  CategoryVodNext? get next;

  /// Create a copy of CategoryVodPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryVodPageCopyWith<CategoryVodPage> get copyWith =>
      _$CategoryVodPageCopyWithImpl<CategoryVodPage>(
          this as CategoryVodPage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryVodPage &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'CategoryVodPage(next: $next)';
  }
}

/// @nodoc
abstract mixin class $CategoryVodPageCopyWith<$Res> {
  factory $CategoryVodPageCopyWith(
          CategoryVodPage value, $Res Function(CategoryVodPage) _then) =
      _$CategoryVodPageCopyWithImpl;
  @useResult
  $Res call({CategoryVodNext? next});
}

/// @nodoc
class _$CategoryVodPageCopyWithImpl<$Res>
    implements $CategoryVodPageCopyWith<$Res> {
  _$CategoryVodPageCopyWithImpl(this._self, this._then);

  final CategoryVodPage _self;
  final $Res Function(CategoryVodPage) _then;

  /// Create a copy of CategoryVodPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(CategoryVodPage(
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as CategoryVodNext?,
    ));
  }
}

/// @nodoc
mixin _$CategoryVodNext {
  int? get publishDateAt;
  int? get readCount;

  /// Create a copy of CategoryVodNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryVodNextCopyWith<CategoryVodNext> get copyWith =>
      _$CategoryVodNextCopyWithImpl<CategoryVodNext>(
          this as CategoryVodNext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryVodNext &&
            (identical(other.publishDateAt, publishDateAt) ||
                other.publishDateAt == publishDateAt) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, publishDateAt, readCount);

  @override
  String toString() {
    return 'CategoryVodNext(publishDateAt: $publishDateAt, readCount: $readCount)';
  }
}

/// @nodoc
abstract mixin class $CategoryVodNextCopyWith<$Res> {
  factory $CategoryVodNextCopyWith(
          CategoryVodNext value, $Res Function(CategoryVodNext) _then) =
      _$CategoryVodNextCopyWithImpl;
  @useResult
  $Res call({int? publishDateAt, int? readCount});
}

/// @nodoc
class _$CategoryVodNextCopyWithImpl<$Res>
    implements $CategoryVodNextCopyWith<$Res> {
  _$CategoryVodNextCopyWithImpl(this._self, this._then);

  final CategoryVodNext _self;
  final $Res Function(CategoryVodNext) _then;

  /// Create a copy of CategoryVodNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishDateAt = freezed,
    Object? readCount = freezed,
  }) {
    return _then(CategoryVodNext(
      publishDateAt: freezed == publishDateAt
          ? _self.publishDateAt
          : publishDateAt // ignore: cast_nullable_to_non_nullable
              as int?,
      readCount: freezed == readCount
          ? _self.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
