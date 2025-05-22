// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_complete_tag_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoCompleteTagResponse _$AutoCompleteTagResponseFromJson(
        Map<String, dynamic> json) =>
    AutoCompleteTagResponse(
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AutoCompleteTagResponseToJson(
        AutoCompleteTagResponse instance) =>
    <String, dynamic>{
      'keywords': instance.keywords,
    };
