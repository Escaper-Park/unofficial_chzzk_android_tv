// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchAutoCompleteListDto _$SearchAutoCompleteListDtoFromJson(
  Map<String, dynamic> json,
) => _SearchAutoCompleteListDto(
  data:
      (json['data'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  size: (json['size'] as num?)?.toInt() ?? 0,
  totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$SearchAutoCompleteListDtoToJson(
  _SearchAutoCompleteListDto instance,
) => <String, dynamic>{
  'data': instance.data,
  'size': instance.size,
  'totalCount': instance.totalCount,
  'totalPages': instance.totalPages,
};

_SearchTagAutoCompleteDto _$SearchTagAutoCompleteDtoFromJson(
  Map<String, dynamic> json,
) => _SearchTagAutoCompleteDto(
  keywords:
      (json['keywords'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$SearchTagAutoCompleteDtoToJson(
  _SearchTagAutoCompleteDto instance,
) => <String, dynamic>{'keywords': instance.keywords};
