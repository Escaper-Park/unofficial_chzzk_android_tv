// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiResponseDto<T> _$ApiResponseDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _ApiResponseDto<T>(
  code: (json['code'] as num?)?.toInt(),
  message: json['message'] as String?,
  content: _$nullableGenericFromJson(json['content'], fromJsonT),
);

Map<String, dynamic> _$ApiResponseDtoToJson<T>(
  _ApiResponseDto<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'content': _$nullableGenericToJson(instance.content, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
