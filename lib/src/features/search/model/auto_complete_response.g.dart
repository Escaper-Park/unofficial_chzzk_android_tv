// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_complete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoCompleteSearchChannelResponse _$AutoCompleteSearchChannelResponseFromJson(
        Map<String, dynamic> json) =>
    AutoCompleteSearchChannelResponse(
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AutoCompleteSearchChannelResponseToJson(
        AutoCompleteSearchChannelResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

AutoCompleteSearchCategoryResponse _$AutoCompleteSearchCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    AutoCompleteSearchCategoryResponse(
      paging: json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
      totalCount: (json['totalCount'] as num).toInt(),
      data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AutoCompleteSearchCategoryResponseToJson(
        AutoCompleteSearchCategoryResponse instance) =>
    <String, dynamic>{
      'paging': instance.paging,
      'totalCount': instance.totalCount,
      'data': instance.data,
    };

Paging _$PagingFromJson(Map<String, dynamic> json) => Paging(
      pagingType: json['pagingType'] as String,
      currentPageNo: (json['currentPageNo'] as num).toInt(),
      lastPage: json['lastPage'] as bool,
    );

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'pagingType': instance.pagingType,
      'currentPageNo': instance.currentPageNo,
      'lastPage': instance.lastPage,
    };
