// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auto_complete_tag_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AutoCompleteTagResponse {
  List<String> get keywords;

  /// Create a copy of AutoCompleteTagResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AutoCompleteTagResponseCopyWith<AutoCompleteTagResponse> get copyWith =>
      _$AutoCompleteTagResponseCopyWithImpl<AutoCompleteTagResponse>(
          this as AutoCompleteTagResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AutoCompleteTagResponse &&
            const DeepCollectionEquality().equals(other.keywords, keywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(keywords));

  @override
  String toString() {
    return 'AutoCompleteTagResponse(keywords: $keywords)';
  }
}

/// @nodoc
abstract mixin class $AutoCompleteTagResponseCopyWith<$Res> {
  factory $AutoCompleteTagResponseCopyWith(AutoCompleteTagResponse value,
          $Res Function(AutoCompleteTagResponse) _then) =
      _$AutoCompleteTagResponseCopyWithImpl;
  @useResult
  $Res call({List<String> keywords});
}

/// @nodoc
class _$AutoCompleteTagResponseCopyWithImpl<$Res>
    implements $AutoCompleteTagResponseCopyWith<$Res> {
  _$AutoCompleteTagResponseCopyWithImpl(this._self, this._then);

  final AutoCompleteTagResponse _self;
  final $Res Function(AutoCompleteTagResponse) _then;

  /// Create a copy of AutoCompleteTagResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keywords = null,
  }) {
    return _then(AutoCompleteTagResponse(
      keywords: null == keywords
          ? _self.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
