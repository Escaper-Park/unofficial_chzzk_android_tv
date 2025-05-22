// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchChannelResponse _$SearchChannelResponseFromJson(
        Map<String, dynamic> json) =>
    SearchChannelResponse(
      size: (json['size'] as num).toInt(),
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$SearchChannelResponseToJson(
        SearchChannelResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'data': instance.data,
    };

SearchVodResponse _$SearchVodResponseFromJson(Map<String, dynamic> json) =>
    SearchVodResponse(
      size: (json['size'] as num).toInt(),
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$SearchVodResponseToJson(SearchVodResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'data': instance.data,
    };

SearchLiveResponse _$SearchLiveResponseFromJson(Map<String, dynamic> json) =>
    SearchLiveResponse(
      size: (json['size'] as num).toInt(),
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$SearchLiveResponseToJson(SearchLiveResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'data': instance.data,
    };
