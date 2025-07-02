// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auto_complete_tag_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AutoCompleteTagResponse _$AutoCompleteTagResponseFromJson(
    Map<String, dynamic> json) {
  return _AutoCompleteTagResponse.fromJson(json);
}

/// @nodoc
mixin _$AutoCompleteTagResponse {
  List<String> get keywords => throw _privateConstructorUsedError;

  /// Serializes this AutoCompleteTagResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AutoCompleteTagResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AutoCompleteTagResponseCopyWith<AutoCompleteTagResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoCompleteTagResponseCopyWith<$Res> {
  factory $AutoCompleteTagResponseCopyWith(AutoCompleteTagResponse value,
          $Res Function(AutoCompleteTagResponse) then) =
      _$AutoCompleteTagResponseCopyWithImpl<$Res, AutoCompleteTagResponse>;
  @useResult
  $Res call({List<String> keywords});
}

/// @nodoc
class _$AutoCompleteTagResponseCopyWithImpl<$Res,
        $Val extends AutoCompleteTagResponse>
    implements $AutoCompleteTagResponseCopyWith<$Res> {
  _$AutoCompleteTagResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AutoCompleteTagResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keywords = null,
  }) {
    return _then(_value.copyWith(
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AutoCompleteTagResponseImplCopyWith<$Res>
    implements $AutoCompleteTagResponseCopyWith<$Res> {
  factory _$$AutoCompleteTagResponseImplCopyWith(
          _$AutoCompleteTagResponseImpl value,
          $Res Function(_$AutoCompleteTagResponseImpl) then) =
      __$$AutoCompleteTagResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> keywords});
}

/// @nodoc
class __$$AutoCompleteTagResponseImplCopyWithImpl<$Res>
    extends _$AutoCompleteTagResponseCopyWithImpl<$Res,
        _$AutoCompleteTagResponseImpl>
    implements _$$AutoCompleteTagResponseImplCopyWith<$Res> {
  __$$AutoCompleteTagResponseImplCopyWithImpl(
      _$AutoCompleteTagResponseImpl _value,
      $Res Function(_$AutoCompleteTagResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AutoCompleteTagResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keywords = null,
  }) {
    return _then(_$AutoCompleteTagResponseImpl(
      keywords: null == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AutoCompleteTagResponseImpl implements _AutoCompleteTagResponse {
  const _$AutoCompleteTagResponseImpl({required final List<String> keywords})
      : _keywords = keywords;

  factory _$AutoCompleteTagResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AutoCompleteTagResponseImplFromJson(json);

  final List<String> _keywords;
  @override
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  String toString() {
    return 'AutoCompleteTagResponse(keywords: $keywords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoCompleteTagResponseImpl &&
            const DeepCollectionEquality().equals(other._keywords, _keywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_keywords));

  /// Create a copy of AutoCompleteTagResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoCompleteTagResponseImplCopyWith<_$AutoCompleteTagResponseImpl>
      get copyWith => __$$AutoCompleteTagResponseImplCopyWithImpl<
          _$AutoCompleteTagResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutoCompleteTagResponseImplToJson(
      this,
    );
  }
}

abstract class _AutoCompleteTagResponse implements AutoCompleteTagResponse {
  const factory _AutoCompleteTagResponse(
      {required final List<String> keywords}) = _$AutoCompleteTagResponseImpl;

  factory _AutoCompleteTagResponse.fromJson(Map<String, dynamic> json) =
      _$AutoCompleteTagResponseImpl.fromJson;

  @override
  List<String> get keywords;

  /// Create a copy of AutoCompleteTagResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutoCompleteTagResponseImplCopyWith<_$AutoCompleteTagResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
