// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchResponseImpl _$$SearchResponseImplFromJson(Map<String, dynamic> json) =>
    _$SearchResponseImpl(
      size: (json['size'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => SearchChannelData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchResponseImplToJson(
        _$SearchResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'data': instance.data,
    };

_$SearchChannelDataImpl _$$SearchChannelDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchChannelDataImpl(
      channel: Channel.fromJson(json['channel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchChannelDataImplToJson(
        _$SearchChannelDataImpl instance) =>
    <String, dynamic>{
      'channel': instance.channel,
    };
