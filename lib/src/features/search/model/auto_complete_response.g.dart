// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_complete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AutoCompleteSearchChannelResponseImpl
    _$$AutoCompleteSearchChannelResponseImplFromJson(
            Map<String, dynamic> json) =>
        _$AutoCompleteSearchChannelResponseImpl(
          page: (json['page'] as num).toInt(),
          size: (json['size'] as num).toInt(),
          totalCount: (json['totalCount'] as num).toInt(),
          totalPages: (json['totalPages'] as num).toInt(),
          data:
              (json['data'] as List<dynamic>).map((e) => e as String).toList(),
        );

Map<String, dynamic> _$$AutoCompleteSearchChannelResponseImplToJson(
        _$AutoCompleteSearchChannelResponseImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

_$AutoCompleteSearchCategoryResponseImpl
    _$$AutoCompleteSearchCategoryResponseImplFromJson(
            Map<String, dynamic> json) =>
        _$AutoCompleteSearchCategoryResponseImpl(
          paging: json['paging'] == null
              ? null
              : Paging.fromJson(json['paging'] as Map<String, dynamic>),
          totalCount: (json['totalCount'] as num).toInt(),
          data:
              (json['data'] as List<dynamic>).map((e) => e as String).toList(),
        );

Map<String, dynamic> _$$AutoCompleteSearchCategoryResponseImplToJson(
        _$AutoCompleteSearchCategoryResponseImpl instance) =>
    <String, dynamic>{
      'paging': instance.paging,
      'totalCount': instance.totalCount,
      'data': instance.data,
    };

_$PagingImpl _$$PagingImplFromJson(Map<String, dynamic> json) => _$PagingImpl(
      pagingType: json['pagingType'] as String,
      currentPageNo: (json['currentPageNo'] as num).toInt(),
      lastPage: json['lastPage'] as bool,
    );

Map<String, dynamic> _$$PagingImplToJson(_$PagingImpl instance) =>
    <String, dynamic>{
      'pagingType': instance.pagingType,
      'currentPageNo': instance.currentPageNo,
      'lastPage': instance.lastPage,
    };
