// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PopularClipResponse _$PopularClipResponseFromJson(Map<String, dynamic> json) {
  return _PopularClipResponse.fromJson(json);
}

/// @nodoc
mixin _$PopularClipResponse {
  int get size => throw _privateConstructorUsedError;
  PopularClipPage? get page => throw _privateConstructorUsedError;
  List<NaverClip> get data => throw _privateConstructorUsedError;

  /// Serializes this PopularClipResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PopularClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PopularClipResponseCopyWith<PopularClipResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularClipResponseCopyWith<$Res> {
  factory $PopularClipResponseCopyWith(
          PopularClipResponse value, $Res Function(PopularClipResponse) then) =
      _$PopularClipResponseCopyWithImpl<$Res, PopularClipResponse>;
  @useResult
  $Res call({int size, PopularClipPage? page, List<NaverClip> data});

  $PopularClipPageCopyWith<$Res>? get page;
}

/// @nodoc
class _$PopularClipResponseCopyWithImpl<$Res, $Val extends PopularClipResponse>
    implements $PopularClipResponseCopyWith<$Res> {
  _$PopularClipResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PopularClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as PopularClipPage?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NaverClip>,
    ) as $Val);
  }

  /// Create a copy of PopularClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PopularClipPageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $PopularClipPageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PopularClipResponseImplCopyWith<$Res>
    implements $PopularClipResponseCopyWith<$Res> {
  factory _$$PopularClipResponseImplCopyWith(_$PopularClipResponseImpl value,
          $Res Function(_$PopularClipResponseImpl) then) =
      __$$PopularClipResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int size, PopularClipPage? page, List<NaverClip> data});

  @override
  $PopularClipPageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$PopularClipResponseImplCopyWithImpl<$Res>
    extends _$PopularClipResponseCopyWithImpl<$Res, _$PopularClipResponseImpl>
    implements _$$PopularClipResponseImplCopyWith<$Res> {
  __$$PopularClipResponseImplCopyWithImpl(_$PopularClipResponseImpl _value,
      $Res Function(_$PopularClipResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PopularClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_$PopularClipResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as PopularClipPage?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NaverClip>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopularClipResponseImpl implements _PopularClipResponse {
  const _$PopularClipResponseImpl(
      {required this.size, this.page, required final List<NaverClip> data})
      : _data = data;

  factory _$PopularClipResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopularClipResponseImplFromJson(json);

  @override
  final int size;
  @override
  final PopularClipPage? page;
  final List<NaverClip> _data;
  @override
  List<NaverClip> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PopularClipResponse(size: $size, page: $page, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularClipResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(_data));

  /// Create a copy of PopularClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularClipResponseImplCopyWith<_$PopularClipResponseImpl> get copyWith =>
      __$$PopularClipResponseImplCopyWithImpl<_$PopularClipResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularClipResponseImplToJson(
      this,
    );
  }
}

abstract class _PopularClipResponse implements PopularClipResponse {
  const factory _PopularClipResponse(
      {required final int size,
      final PopularClipPage? page,
      required final List<NaverClip> data}) = _$PopularClipResponseImpl;

  factory _PopularClipResponse.fromJson(Map<String, dynamic> json) =
      _$PopularClipResponseImpl.fromJson;

  @override
  int get size;
  @override
  PopularClipPage? get page;
  @override
  List<NaverClip> get data;

  /// Create a copy of PopularClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PopularClipResponseImplCopyWith<_$PopularClipResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PopularClipPage _$PopularClipPageFromJson(Map<String, dynamic> json) {
  return _PopularClipPage.fromJson(json);
}

/// @nodoc
mixin _$PopularClipPage {
  PopularClipNext? get next => throw _privateConstructorUsedError;

  /// Serializes this PopularClipPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PopularClipPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PopularClipPageCopyWith<PopularClipPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularClipPageCopyWith<$Res> {
  factory $PopularClipPageCopyWith(
          PopularClipPage value, $Res Function(PopularClipPage) then) =
      _$PopularClipPageCopyWithImpl<$Res, PopularClipPage>;
  @useResult
  $Res call({PopularClipNext? next});

  $PopularClipNextCopyWith<$Res>? get next;
}

/// @nodoc
class _$PopularClipPageCopyWithImpl<$Res, $Val extends PopularClipPage>
    implements $PopularClipPageCopyWith<$Res> {
  _$PopularClipPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PopularClipPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as PopularClipNext?,
    ) as $Val);
  }

  /// Create a copy of PopularClipPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PopularClipNextCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $PopularClipNextCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PopularClipPageImplCopyWith<$Res>
    implements $PopularClipPageCopyWith<$Res> {
  factory _$$PopularClipPageImplCopyWith(_$PopularClipPageImpl value,
          $Res Function(_$PopularClipPageImpl) then) =
      __$$PopularClipPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PopularClipNext? next});

  @override
  $PopularClipNextCopyWith<$Res>? get next;
}

/// @nodoc
class __$$PopularClipPageImplCopyWithImpl<$Res>
    extends _$PopularClipPageCopyWithImpl<$Res, _$PopularClipPageImpl>
    implements _$$PopularClipPageImplCopyWith<$Res> {
  __$$PopularClipPageImplCopyWithImpl(
      _$PopularClipPageImpl _value, $Res Function(_$PopularClipPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of PopularClipPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$PopularClipPageImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as PopularClipNext?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopularClipPageImpl implements _PopularClipPage {
  const _$PopularClipPageImpl({this.next});

  factory _$PopularClipPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopularClipPageImplFromJson(json);

  @override
  final PopularClipNext? next;

  @override
  String toString() {
    return 'PopularClipPage(next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularClipPageImpl &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  /// Create a copy of PopularClipPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularClipPageImplCopyWith<_$PopularClipPageImpl> get copyWith =>
      __$$PopularClipPageImplCopyWithImpl<_$PopularClipPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularClipPageImplToJson(
      this,
    );
  }
}

abstract class _PopularClipPage implements PopularClipPage {
  const factory _PopularClipPage({final PopularClipNext? next}) =
      _$PopularClipPageImpl;

  factory _PopularClipPage.fromJson(Map<String, dynamic> json) =
      _$PopularClipPageImpl.fromJson;

  @override
  PopularClipNext? get next;

  /// Create a copy of PopularClipPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PopularClipPageImplCopyWith<_$PopularClipPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PopularClipNext _$PopularClipNextFromJson(Map<String, dynamic> json) {
  return _PopularClipNext.fromJson(json);
}

/// @nodoc
mixin _$PopularClipNext {
  String? get next => throw _privateConstructorUsedError;

  /// Serializes this PopularClipNext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PopularClipNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PopularClipNextCopyWith<PopularClipNext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularClipNextCopyWith<$Res> {
  factory $PopularClipNextCopyWith(
          PopularClipNext value, $Res Function(PopularClipNext) then) =
      _$PopularClipNextCopyWithImpl<$Res, PopularClipNext>;
  @useResult
  $Res call({String? next});
}

/// @nodoc
class _$PopularClipNextCopyWithImpl<$Res, $Val extends PopularClipNext>
    implements $PopularClipNextCopyWith<$Res> {
  _$PopularClipNextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PopularClipNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopularClipNextImplCopyWith<$Res>
    implements $PopularClipNextCopyWith<$Res> {
  factory _$$PopularClipNextImplCopyWith(_$PopularClipNextImpl value,
          $Res Function(_$PopularClipNextImpl) then) =
      __$$PopularClipNextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? next});
}

/// @nodoc
class __$$PopularClipNextImplCopyWithImpl<$Res>
    extends _$PopularClipNextCopyWithImpl<$Res, _$PopularClipNextImpl>
    implements _$$PopularClipNextImplCopyWith<$Res> {
  __$$PopularClipNextImplCopyWithImpl(
      _$PopularClipNextImpl _value, $Res Function(_$PopularClipNextImpl) _then)
      : super(_value, _then);

  /// Create a copy of PopularClipNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$PopularClipNextImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopularClipNextImpl implements _PopularClipNext {
  const _$PopularClipNextImpl({this.next});

  factory _$PopularClipNextImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopularClipNextImplFromJson(json);

  @override
  final String? next;

  @override
  String toString() {
    return 'PopularClipNext(next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularClipNextImpl &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  /// Create a copy of PopularClipNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularClipNextImplCopyWith<_$PopularClipNextImpl> get copyWith =>
      __$$PopularClipNextImplCopyWithImpl<_$PopularClipNextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularClipNextImplToJson(
      this,
    );
  }
}

abstract class _PopularClipNext implements PopularClipNext {
  const factory _PopularClipNext({final String? next}) = _$PopularClipNextImpl;

  factory _PopularClipNext.fromJson(Map<String, dynamic> json) =
      _$PopularClipNextImpl.fromJson;

  @override
  String? get next;

  /// Create a copy of PopularClipNext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PopularClipNextImplCopyWith<_$PopularClipNextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryClipResponse _$CategoryClipResponseFromJson(Map<String, dynamic> json) {
  return _CategoryClipResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryClipResponse {
  int get size => throw _privateConstructorUsedError;
  CategoryClipPage? get page => throw _privateConstructorUsedError;
  List<NaverClip> get data => throw _privateConstructorUsedError;

  /// Serializes this CategoryClipResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryClipResponseCopyWith<CategoryClipResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryClipResponseCopyWith<$Res> {
  factory $CategoryClipResponseCopyWith(CategoryClipResponse value,
          $Res Function(CategoryClipResponse) then) =
      _$CategoryClipResponseCopyWithImpl<$Res, CategoryClipResponse>;
  @useResult
  $Res call({int size, CategoryClipPage? page, List<NaverClip> data});

  $CategoryClipPageCopyWith<$Res>? get page;
}

/// @nodoc
class _$CategoryClipResponseCopyWithImpl<$Res,
        $Val extends CategoryClipResponse>
    implements $CategoryClipResponseCopyWith<$Res> {
  _$CategoryClipResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as CategoryClipPage?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NaverClip>,
    ) as $Val);
  }

  /// Create a copy of CategoryClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryClipPageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $CategoryClipPageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryClipResponseImplCopyWith<$Res>
    implements $CategoryClipResponseCopyWith<$Res> {
  factory _$$CategoryClipResponseImplCopyWith(_$CategoryClipResponseImpl value,
          $Res Function(_$CategoryClipResponseImpl) then) =
      __$$CategoryClipResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int size, CategoryClipPage? page, List<NaverClip> data});

  @override
  $CategoryClipPageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$CategoryClipResponseImplCopyWithImpl<$Res>
    extends _$CategoryClipResponseCopyWithImpl<$Res, _$CategoryClipResponseImpl>
    implements _$$CategoryClipResponseImplCopyWith<$Res> {
  __$$CategoryClipResponseImplCopyWithImpl(_$CategoryClipResponseImpl _value,
      $Res Function(_$CategoryClipResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(_$CategoryClipResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as CategoryClipPage?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NaverClip>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryClipResponseImpl implements _CategoryClipResponse {
  const _$CategoryClipResponseImpl(
      {required this.size, this.page, required final List<NaverClip> data})
      : _data = data;

  factory _$CategoryClipResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryClipResponseImplFromJson(json);

  @override
  final int size;
  @override
  final CategoryClipPage? page;
  final List<NaverClip> _data;
  @override
  List<NaverClip> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CategoryClipResponse(size: $size, page: $page, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryClipResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(_data));

  /// Create a copy of CategoryClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryClipResponseImplCopyWith<_$CategoryClipResponseImpl>
      get copyWith =>
          __$$CategoryClipResponseImplCopyWithImpl<_$CategoryClipResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryClipResponseImplToJson(
      this,
    );
  }
}

abstract class _CategoryClipResponse implements CategoryClipResponse {
  const factory _CategoryClipResponse(
      {required final int size,
      final CategoryClipPage? page,
      required final List<NaverClip> data}) = _$CategoryClipResponseImpl;

  factory _CategoryClipResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryClipResponseImpl.fromJson;

  @override
  int get size;
  @override
  CategoryClipPage? get page;
  @override
  List<NaverClip> get data;

  /// Create a copy of CategoryClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryClipResponseImplCopyWith<_$CategoryClipResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CategoryClipPage _$CategoryClipPageFromJson(Map<String, dynamic> json) {
  return _CategoryClipPage.fromJson(json);
}

/// @nodoc
mixin _$CategoryClipPage {
  CategoryClipNext? get next => throw _privateConstructorUsedError;

  /// Serializes this CategoryClipPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryClipPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryClipPageCopyWith<CategoryClipPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryClipPageCopyWith<$Res> {
  factory $CategoryClipPageCopyWith(
          CategoryClipPage value, $Res Function(CategoryClipPage) then) =
      _$CategoryClipPageCopyWithImpl<$Res, CategoryClipPage>;
  @useResult
  $Res call({CategoryClipNext? next});

  $CategoryClipNextCopyWith<$Res>? get next;
}

/// @nodoc
class _$CategoryClipPageCopyWithImpl<$Res, $Val extends CategoryClipPage>
    implements $CategoryClipPageCopyWith<$Res> {
  _$CategoryClipPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryClipPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as CategoryClipNext?,
    ) as $Val);
  }

  /// Create a copy of CategoryClipPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryClipNextCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $CategoryClipNextCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryClipPageImplCopyWith<$Res>
    implements $CategoryClipPageCopyWith<$Res> {
  factory _$$CategoryClipPageImplCopyWith(_$CategoryClipPageImpl value,
          $Res Function(_$CategoryClipPageImpl) then) =
      __$$CategoryClipPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CategoryClipNext? next});

  @override
  $CategoryClipNextCopyWith<$Res>? get next;
}

/// @nodoc
class __$$CategoryClipPageImplCopyWithImpl<$Res>
    extends _$CategoryClipPageCopyWithImpl<$Res, _$CategoryClipPageImpl>
    implements _$$CategoryClipPageImplCopyWith<$Res> {
  __$$CategoryClipPageImplCopyWithImpl(_$CategoryClipPageImpl _value,
      $Res Function(_$CategoryClipPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryClipPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$CategoryClipPageImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as CategoryClipNext?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryClipPageImpl implements _CategoryClipPage {
  const _$CategoryClipPageImpl({this.next});

  factory _$CategoryClipPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryClipPageImplFromJson(json);

  @override
  final CategoryClipNext? next;

  @override
  String toString() {
    return 'CategoryClipPage(next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryClipPageImpl &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  /// Create a copy of CategoryClipPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryClipPageImplCopyWith<_$CategoryClipPageImpl> get copyWith =>
      __$$CategoryClipPageImplCopyWithImpl<_$CategoryClipPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryClipPageImplToJson(
      this,
    );
  }
}

abstract class _CategoryClipPage implements CategoryClipPage {
  const factory _CategoryClipPage({final CategoryClipNext? next}) =
      _$CategoryClipPageImpl;

  factory _CategoryClipPage.fromJson(Map<String, dynamic> json) =
      _$CategoryClipPageImpl.fromJson;

  @override
  CategoryClipNext? get next;

  /// Create a copy of CategoryClipPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryClipPageImplCopyWith<_$CategoryClipPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryClipNext _$CategoryClipNextFromJson(Map<String, dynamic> json) {
  return _CategoryClipNext.fromJson(json);
}

/// @nodoc
mixin _$CategoryClipNext {
  String? get clipUID => throw _privateConstructorUsedError;
  int? get readCount => throw _privateConstructorUsedError;

  /// Serializes this CategoryClipNext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryClipNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryClipNextCopyWith<CategoryClipNext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryClipNextCopyWith<$Res> {
  factory $CategoryClipNextCopyWith(
          CategoryClipNext value, $Res Function(CategoryClipNext) then) =
      _$CategoryClipNextCopyWithImpl<$Res, CategoryClipNext>;
  @useResult
  $Res call({String? clipUID, int? readCount});
}

/// @nodoc
class _$CategoryClipNextCopyWithImpl<$Res, $Val extends CategoryClipNext>
    implements $CategoryClipNextCopyWith<$Res> {
  _$CategoryClipNextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryClipNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clipUID = freezed,
    Object? readCount = freezed,
  }) {
    return _then(_value.copyWith(
      clipUID: freezed == clipUID
          ? _value.clipUID
          : clipUID // ignore: cast_nullable_to_non_nullable
              as String?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryClipNextImplCopyWith<$Res>
    implements $CategoryClipNextCopyWith<$Res> {
  factory _$$CategoryClipNextImplCopyWith(_$CategoryClipNextImpl value,
          $Res Function(_$CategoryClipNextImpl) then) =
      __$$CategoryClipNextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? clipUID, int? readCount});
}

/// @nodoc
class __$$CategoryClipNextImplCopyWithImpl<$Res>
    extends _$CategoryClipNextCopyWithImpl<$Res, _$CategoryClipNextImpl>
    implements _$$CategoryClipNextImplCopyWith<$Res> {
  __$$CategoryClipNextImplCopyWithImpl(_$CategoryClipNextImpl _value,
      $Res Function(_$CategoryClipNextImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryClipNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clipUID = freezed,
    Object? readCount = freezed,
  }) {
    return _then(_$CategoryClipNextImpl(
      clipUID: freezed == clipUID
          ? _value.clipUID
          : clipUID // ignore: cast_nullable_to_non_nullable
              as String?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryClipNextImpl implements _CategoryClipNext {
  const _$CategoryClipNextImpl({this.clipUID, this.readCount});

  factory _$CategoryClipNextImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryClipNextImplFromJson(json);

  @override
  final String? clipUID;
  @override
  final int? readCount;

  @override
  String toString() {
    return 'CategoryClipNext(clipUID: $clipUID, readCount: $readCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryClipNextImpl &&
            (identical(other.clipUID, clipUID) || other.clipUID == clipUID) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clipUID, readCount);

  /// Create a copy of CategoryClipNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryClipNextImplCopyWith<_$CategoryClipNextImpl> get copyWith =>
      __$$CategoryClipNextImplCopyWithImpl<_$CategoryClipNextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryClipNextImplToJson(
      this,
    );
  }
}

abstract class _CategoryClipNext implements CategoryClipNext {
  const factory _CategoryClipNext(
      {final String? clipUID, final int? readCount}) = _$CategoryClipNextImpl;

  factory _CategoryClipNext.fromJson(Map<String, dynamic> json) =
      _$CategoryClipNextImpl.fromJson;

  @override
  String? get clipUID;
  @override
  int? get readCount;

  /// Create a copy of CategoryClipNext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryClipNextImplCopyWith<_$CategoryClipNextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChannelClipResponse _$ChannelClipResponseFromJson(Map<String, dynamic> json) {
  return _ChannelClipResponse.fromJson(json);
}

/// @nodoc
mixin _$ChannelClipResponse {
  int get size => throw _privateConstructorUsedError;
  ChannelClipPage? get page => throw _privateConstructorUsedError;
  List<NaverClip> get data => throw _privateConstructorUsedError;
  bool? get hasStreamerClips => throw _privateConstructorUsedError;

  /// Serializes this ChannelClipResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChannelClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelClipResponseCopyWith<ChannelClipResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelClipResponseCopyWith<$Res> {
  factory $ChannelClipResponseCopyWith(
          ChannelClipResponse value, $Res Function(ChannelClipResponse) then) =
      _$ChannelClipResponseCopyWithImpl<$Res, ChannelClipResponse>;
  @useResult
  $Res call(
      {int size,
      ChannelClipPage? page,
      List<NaverClip> data,
      bool? hasStreamerClips});

  $ChannelClipPageCopyWith<$Res>? get page;
}

/// @nodoc
class _$ChannelClipResponseCopyWithImpl<$Res, $Val extends ChannelClipResponse>
    implements $ChannelClipResponseCopyWith<$Res> {
  _$ChannelClipResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as ChannelClipPage?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NaverClip>,
      hasStreamerClips: freezed == hasStreamerClips
          ? _value.hasStreamerClips
          : hasStreamerClips // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of ChannelClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelClipPageCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $ChannelClipPageCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChannelClipResponseImplCopyWith<$Res>
    implements $ChannelClipResponseCopyWith<$Res> {
  factory _$$ChannelClipResponseImplCopyWith(_$ChannelClipResponseImpl value,
          $Res Function(_$ChannelClipResponseImpl) then) =
      __$$ChannelClipResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int size,
      ChannelClipPage? page,
      List<NaverClip> data,
      bool? hasStreamerClips});

  @override
  $ChannelClipPageCopyWith<$Res>? get page;
}

/// @nodoc
class __$$ChannelClipResponseImplCopyWithImpl<$Res>
    extends _$ChannelClipResponseCopyWithImpl<$Res, _$ChannelClipResponseImpl>
    implements _$$ChannelClipResponseImplCopyWith<$Res> {
  __$$ChannelClipResponseImplCopyWithImpl(_$ChannelClipResponseImpl _value,
      $Res Function(_$ChannelClipResponseImpl) _then)
      : super(_value, _then);

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
    return _then(_$ChannelClipResponseImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as ChannelClipPage?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NaverClip>,
      hasStreamerClips: freezed == hasStreamerClips
          ? _value.hasStreamerClips
          : hasStreamerClips // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelClipResponseImpl implements _ChannelClipResponse {
  const _$ChannelClipResponseImpl(
      {required this.size,
      this.page,
      required final List<NaverClip> data,
      this.hasStreamerClips})
      : _data = data;

  factory _$ChannelClipResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelClipResponseImplFromJson(json);

  @override
  final int size;
  @override
  final ChannelClipPage? page;
  final List<NaverClip> _data;
  @override
  List<NaverClip> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final bool? hasStreamerClips;

  @override
  String toString() {
    return 'ChannelClipResponse(size: $size, page: $page, data: $data, hasStreamerClips: $hasStreamerClips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelClipResponseImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.hasStreamerClips, hasStreamerClips) ||
                other.hasStreamerClips == hasStreamerClips));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, size, page,
      const DeepCollectionEquality().hash(_data), hasStreamerClips);

  /// Create a copy of ChannelClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelClipResponseImplCopyWith<_$ChannelClipResponseImpl> get copyWith =>
      __$$ChannelClipResponseImplCopyWithImpl<_$ChannelClipResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelClipResponseImplToJson(
      this,
    );
  }
}

abstract class _ChannelClipResponse implements ChannelClipResponse {
  const factory _ChannelClipResponse(
      {required final int size,
      final ChannelClipPage? page,
      required final List<NaverClip> data,
      final bool? hasStreamerClips}) = _$ChannelClipResponseImpl;

  factory _ChannelClipResponse.fromJson(Map<String, dynamic> json) =
      _$ChannelClipResponseImpl.fromJson;

  @override
  int get size;
  @override
  ChannelClipPage? get page;
  @override
  List<NaverClip> get data;
  @override
  bool? get hasStreamerClips;

  /// Create a copy of ChannelClipResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelClipResponseImplCopyWith<_$ChannelClipResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChannelClipPage _$ChannelClipPageFromJson(Map<String, dynamic> json) {
  return _ChannelClipPage.fromJson(json);
}

/// @nodoc
mixin _$ChannelClipPage {
  ChannelClipNext? get next => throw _privateConstructorUsedError;

  /// Serializes this ChannelClipPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChannelClipPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelClipPageCopyWith<ChannelClipPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelClipPageCopyWith<$Res> {
  factory $ChannelClipPageCopyWith(
          ChannelClipPage value, $Res Function(ChannelClipPage) then) =
      _$ChannelClipPageCopyWithImpl<$Res, ChannelClipPage>;
  @useResult
  $Res call({ChannelClipNext? next});

  $ChannelClipNextCopyWith<$Res>? get next;
}

/// @nodoc
class _$ChannelClipPageCopyWithImpl<$Res, $Val extends ChannelClipPage>
    implements $ChannelClipPageCopyWith<$Res> {
  _$ChannelClipPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChannelClipPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as ChannelClipNext?,
    ) as $Val);
  }

  /// Create a copy of ChannelClipPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelClipNextCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $ChannelClipNextCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChannelClipPageImplCopyWith<$Res>
    implements $ChannelClipPageCopyWith<$Res> {
  factory _$$ChannelClipPageImplCopyWith(_$ChannelClipPageImpl value,
          $Res Function(_$ChannelClipPageImpl) then) =
      __$$ChannelClipPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChannelClipNext? next});

  @override
  $ChannelClipNextCopyWith<$Res>? get next;
}

/// @nodoc
class __$$ChannelClipPageImplCopyWithImpl<$Res>
    extends _$ChannelClipPageCopyWithImpl<$Res, _$ChannelClipPageImpl>
    implements _$$ChannelClipPageImplCopyWith<$Res> {
  __$$ChannelClipPageImplCopyWithImpl(
      _$ChannelClipPageImpl _value, $Res Function(_$ChannelClipPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelClipPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$ChannelClipPageImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as ChannelClipNext?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelClipPageImpl implements _ChannelClipPage {
  const _$ChannelClipPageImpl({this.next});

  factory _$ChannelClipPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelClipPageImplFromJson(json);

  @override
  final ChannelClipNext? next;

  @override
  String toString() {
    return 'ChannelClipPage(next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelClipPageImpl &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  /// Create a copy of ChannelClipPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelClipPageImplCopyWith<_$ChannelClipPageImpl> get copyWith =>
      __$$ChannelClipPageImplCopyWithImpl<_$ChannelClipPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelClipPageImplToJson(
      this,
    );
  }
}

abstract class _ChannelClipPage implements ChannelClipPage {
  const factory _ChannelClipPage({final ChannelClipNext? next}) =
      _$ChannelClipPageImpl;

  factory _ChannelClipPage.fromJson(Map<String, dynamic> json) =
      _$ChannelClipPageImpl.fromJson;

  @override
  ChannelClipNext? get next;

  /// Create a copy of ChannelClipPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelClipPageImplCopyWith<_$ChannelClipPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChannelClipNext _$ChannelClipNextFromJson(Map<String, dynamic> json) {
  return _ChannelClipNext.fromJson(json);
}

/// @nodoc
mixin _$ChannelClipNext {
  String? get clipUID => throw _privateConstructorUsedError;
  int? get readCount => throw _privateConstructorUsedError;

  /// Serializes this ChannelClipNext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChannelClipNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelClipNextCopyWith<ChannelClipNext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelClipNextCopyWith<$Res> {
  factory $ChannelClipNextCopyWith(
          ChannelClipNext value, $Res Function(ChannelClipNext) then) =
      _$ChannelClipNextCopyWithImpl<$Res, ChannelClipNext>;
  @useResult
  $Res call({String? clipUID, int? readCount});
}

/// @nodoc
class _$ChannelClipNextCopyWithImpl<$Res, $Val extends ChannelClipNext>
    implements $ChannelClipNextCopyWith<$Res> {
  _$ChannelClipNextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChannelClipNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clipUID = freezed,
    Object? readCount = freezed,
  }) {
    return _then(_value.copyWith(
      clipUID: freezed == clipUID
          ? _value.clipUID
          : clipUID // ignore: cast_nullable_to_non_nullable
              as String?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelClipNextImplCopyWith<$Res>
    implements $ChannelClipNextCopyWith<$Res> {
  factory _$$ChannelClipNextImplCopyWith(_$ChannelClipNextImpl value,
          $Res Function(_$ChannelClipNextImpl) then) =
      __$$ChannelClipNextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? clipUID, int? readCount});
}

/// @nodoc
class __$$ChannelClipNextImplCopyWithImpl<$Res>
    extends _$ChannelClipNextCopyWithImpl<$Res, _$ChannelClipNextImpl>
    implements _$$ChannelClipNextImplCopyWith<$Res> {
  __$$ChannelClipNextImplCopyWithImpl(
      _$ChannelClipNextImpl _value, $Res Function(_$ChannelClipNextImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelClipNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clipUID = freezed,
    Object? readCount = freezed,
  }) {
    return _then(_$ChannelClipNextImpl(
      clipUID: freezed == clipUID
          ? _value.clipUID
          : clipUID // ignore: cast_nullable_to_non_nullable
              as String?,
      readCount: freezed == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelClipNextImpl implements _ChannelClipNext {
  const _$ChannelClipNextImpl({this.clipUID, this.readCount});

  factory _$ChannelClipNextImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelClipNextImplFromJson(json);

  @override
  final String? clipUID;
  @override
  final int? readCount;

  @override
  String toString() {
    return 'ChannelClipNext(clipUID: $clipUID, readCount: $readCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelClipNextImpl &&
            (identical(other.clipUID, clipUID) || other.clipUID == clipUID) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clipUID, readCount);

  /// Create a copy of ChannelClipNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelClipNextImplCopyWith<_$ChannelClipNextImpl> get copyWith =>
      __$$ChannelClipNextImplCopyWithImpl<_$ChannelClipNextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelClipNextImplToJson(
      this,
    );
  }
}

abstract class _ChannelClipNext implements ChannelClipNext {
  const factory _ChannelClipNext(
      {final String? clipUID, final int? readCount}) = _$ChannelClipNextImpl;

  factory _ChannelClipNext.fromJson(Map<String, dynamic> json) =
      _$ChannelClipNextImpl.fromJson;

  @override
  String? get clipUID;
  @override
  int? get readCount;

  /// Create a copy of ChannelClipNext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelClipNextImplCopyWith<_$ChannelClipNextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
