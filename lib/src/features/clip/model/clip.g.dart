// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NaverClipImpl _$$NaverClipImplFromJson(Map<String, dynamic> json) =>
    _$NaverClipImpl(
      clipUID: json['clipUID'] as String,
      videoId: json['videoId'] as String?,
      clipTitle: json['clipTitle'] as String,
      ownerChannelId: json['ownerChannelId'] as String,
      ownerChannel: json['ownerChannel'] == null
          ? null
          : OwnerChannel.fromJson(json['ownerChannel'] as Map<String, dynamic>),
      thumbnailImageUrl: json['thumbnailImageUrl'] as String?,
      duration: (json['duration'] as num).toInt(),
      adult: json['adult'] as bool,
      blindType: json['blindType'] as String?,
      categoryType: json['categoryType'] as String?,
      clipCategory: json['clipCategory'] as String?,
      categoryValue: json['categoryValue'] as String?,
      createdDate: json['createdDate'] as String,
      readCount: (json['readCount'] as num).toInt(),
      recId: _$JsonConverterFromJson<String, RecId>(
          json['recId'], const RecIdConverter().fromJson),
      contentLineage: _$JsonConverterFromJson<String, ContentLineage>(
          json['contentLineage'], const ContentLineageConverter().fromJson),
      privateUserBlock: json['privateUserBlock'] as bool?,
    );

Map<String, dynamic> _$$NaverClipImplToJson(_$NaverClipImpl instance) =>
    <String, dynamic>{
      'clipUID': instance.clipUID,
      'videoId': instance.videoId,
      'clipTitle': instance.clipTitle,
      'ownerChannelId': instance.ownerChannelId,
      'ownerChannel': instance.ownerChannel,
      'thumbnailImageUrl': instance.thumbnailImageUrl,
      'duration': instance.duration,
      'adult': instance.adult,
      'blindType': instance.blindType,
      'categoryType': instance.categoryType,
      'clipCategory': instance.clipCategory,
      'categoryValue': instance.categoryValue,
      'createdDate': instance.createdDate,
      'readCount': instance.readCount,
      'recId': _$JsonConverterToJson<String, RecId>(
          instance.recId, const RecIdConverter().toJson),
      'contentLineage': _$JsonConverterToJson<String, ContentLineage>(
          instance.contentLineage, const ContentLineageConverter().toJson),
      'privateUserBlock': instance.privateUserBlock,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$OwnerChannelImpl _$$OwnerChannelImplFromJson(Map<String, dynamic> json) =>
    _$OwnerChannelImpl(
      channelId: json['channelId'] as String,
      channelName: json['channelName'] as String,
      channelImageUrl: json['channelImageUrl'] as String?,
      verifiedMark: json['verifiedMark'] as bool,
    );

Map<String, dynamic> _$$OwnerChannelImplToJson(_$OwnerChannelImpl instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelImageUrl': instance.channelImageUrl,
      'verifiedMark': instance.verifiedMark,
    };

_$RecIdImpl _$$RecIdImplFromJson(Map<String, dynamic> json) => _$RecIdImpl(
      seedClipUID: json['seedClipUID'] as String?,
      fromType: json['fromType'] as String?,
      listType: json['listType'] as String?,
      orderType: json['orderType'] as String?,
      filterType: json['filterType'] as String?,
      recommendRecId: json['recommendRecId'] as String?,
    );

Map<String, dynamic> _$$RecIdImplToJson(_$RecIdImpl instance) =>
    <String, dynamic>{
      'seedClipUID': instance.seedClipUID,
      'fromType': instance.fromType,
      'listType': instance.listType,
      'orderType': instance.orderType,
      'filterType': instance.filterType,
      'recommendRecId': instance.recommendRecId,
    };

_$ContentLineageImpl _$$ContentLineageImplFromJson(Map<String, dynamic> json) =>
    _$ContentLineageImpl(
      contentSource: json['contentSource'] as String?,
      contentType: json['contentType'] as String?,
      contentTag: json['contentTag'] == null
          ? null
          : ContentTag.fromJson(json['contentTag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContentLineageImplToJson(
        _$ContentLineageImpl instance) =>
    <String, dynamic>{
      'contentSource': instance.contentSource,
      'contentType': instance.contentType,
      'contentTag': instance.contentTag,
    };

_$ContentTagImpl _$$ContentTagImplFromJson(Map<String, dynamic> json) =>
    _$ContentTagImpl(
      internal: json['internal'] as String?,
      externalTag: json['external'] == null
          ? null
          : External.fromJson(json['external'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContentTagImplToJson(_$ContentTagImpl instance) =>
    <String, dynamic>{
      'internal': instance.internal,
      'external': instance.externalTag,
    };

_$ExternalImpl _$$ExternalImplFromJson(Map<String, dynamic> json) =>
    _$ExternalImpl(
      rqt: json['rqt'] as String?,
      apiRequestKey: json['apiRequestKey'] as String?,
    );

Map<String, dynamic> _$$ExternalImplToJson(_$ExternalImpl instance) =>
    <String, dynamic>{
      'rqt': instance.rqt,
      'apiRequestKey': instance.apiRequestKey,
    };
